From: Josh Nerius <jnerius@gmail.com>
Subject: Re: use of the limiting options
Date: Sun, 30 Jan 2005 21:44:48 -0600
Message-ID: <4f3930a7050130194460efd21a@mail.gmail.com>
References: <Pine.LNX.4.53.0501251248340.24829@altaica>
Reply-To: Josh Nerius <jnerius@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0501251248340.24829@altaica>
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
To: Tib <tib@tigerknight.org>
Cc: netfilter@lists.netfilter.org

Hello, 

A few thoughts/comments on your situation.  

1. You are correct, limit does not keep track of source. You may find
the 'recent' module useful if you wish to do this.

2. You may want to simplify things by easing up on the limit. Doing
something like 1/minute with a burst of 3 would still prevent
bruteforcing (or your password ir *really* insecure ;-) ) but at the
same time, give you a little more protection from DoS.

3. In the setup you mention, the limit would *not* reset itself every
10 minutes. limit basically says, "ok, he said 6 in an hour, so if I
see 6 in the first 5 seconds,  that's it for the rest of this hour..."
(and the burst is just the number of packets it has to see in the
given time increment before it'll start counting off hits)

4. As Mark mentioned, you definitely want to add a rule to accept
packets that are related to an already established ssh connection.
Otherwise, as he mentioned, once your connection is established, it'd
use up all the packets alloted in limit and then your ssh session
would die. A rule like `iptables -I INPUT -i eth0 -p tcp --dport 22 -m
state --state ESTABLISHED -j ACCEPT` would do this quite nicely.
Notice the -I INPUT...this can be changed to -A but the -I will put it
at the top of your chain. This rule needs to be above the limit rule
in order to function properly.

5. Don't let Jason get to you :-P

Hope this information proves to be helpful :-)

Josh Nerius



-- 
Math problems? Call 1-800-[(10x)(13i)^2]-[sin(xy)/2.362x]


On Tue, 25 Jan 2005 12:54:54 -0600 (CST), Tib <tib@tigerknight.org> wrote:
> 
> I'd like to use the --limit and --limit-burst options to protect my sshd
> from dictionary password attacks. Considering the userbase and activity
> level I'd say that something like this would suit me just fine.
> 
> --limit 6/hour
> --limit-burst 2
> 
> This would limit it to two connect/login attempts at first, and then one
> more every 10 minutes.. correct?
> 
> Would this be the proper command to use? I'm trying to just limit
> connections from the outside world, not from the local network, hence the
> address as a destination:
> 
> iptables -A INPUT --d 66.80.174.210 --dport 22   \
>    --limit 6/hour --limit-burst 2
> 
> <EOL>
> Tib
> 
>

