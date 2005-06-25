From: "curby ." <curby.public@gmail.com>
Subject: SSH Brute force attacks - Script version 1.0
Date: Sat, 25 Jun 2005 12:58:37 -0600
Message-ID: <5d2f379105062511588033857@mail.gmail.com>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Pardon my inability to reply to the original post, but I just
subscribed.  Here is the version of the script I am considering, but
have questions about.

iptables -A INPUT -p tcp --dport 22 -s ! $My_Home_Firewall_IP -m state
--state NEW -m recent --name SSH --set --rsource -j SSH_BF
iptables -A SSH_BF -m recent ! --rcheck --seconds 60 --hitcount 3
--name SSH --rsource -j RETURN
iptables -A SSH_BF -j LOG --log-prefix "SSH Brute Force Attempt:  "
iptables -A SSH_BF -p tcp -j TARPIT



(1) First of all, why should there be a -p tcp in the TARPIT line?=20
Somewhere in the original thread I think there was mention of nonTCP
packets that would get into the script and that such packets shouldn't
get dropped, but the rule that jumps to our SSH_BF script only matches
TCP packets anyway.  Looks like something's wrong if nonTCP packets
get to the chain at all.



(2) Next, people interested in implementing this sort of protection
might consider changing the duration and number of matches.  For
example, the current 60:3 settings allow a total of 180 attempts in an
hour but only in bursts of three per minute.  We can consider two
classes of people attempting to connect to the server: brute force
attackers and legitimate scripts and human users.  In the former case,
attempts per unit time as time goes to infinity is what they are
concerned about.  In the latter case, access is usually bursty.=20
Consider allowing 50 matches every hour, as in

iptables -A SSH_Brute_Force -m recent ! --rcheck --seconds 3600
--hitcount 50 --name SSH --rsource -j RETURN

Now attackers have fewer than a third of the attacks per hour they can
mount on the system, but chatty backup scripts or admins are allowed
the bursty access (like opening 5 shells/scp streams at once) that
they might sometimes need or like to use.  (Whether this legitimate
but potentially disruptive behavior should be allowed is another
thing.)



(3) Also, is this the only position for the negation that makes the
rule work as intended?  It seems to say "Allow/return packets where it
isn't the case that we've seen more than or equal to three connection
attempts in the last 60 seconds."  To me, the following is more
intuitive:

iptables -A SSH_Brute_Force -m recent --rcheck --seconds 60 !
--hitcount 3 --name SSH --rsource -j RETURN

which reads "Allow/return packets from sources that have attempted
connections less than three times in the past 60 seconds."  This is
totally a subjective preference, but in the interest of learning how
the recent match really works and avoiding stupid mistakes, I want to
verify that this revised rule would have the same effect in the
context of this chain.

Thanks!

