From: Jason Opperisano <opie@817west.com>
Subject: Re: 2 Questions--state (est, rel) and tuning
Date: Fri, 3 Jun 2005 11:40:28 -0400
Message-ID: <20050603154028.GA17190@bender.817west.com>
References: <B80488675062364A909EE60F4A66603807840D05@usilms23.ca.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <B80488675062364A909EE60F4A66603807840D05@usilms23.ca.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Jun 03, 2005 at 08:59:06AM -0400, Ginter, Jeff A wrote:
> I understand the state concepts, however, I keep seeing example iptable
> scripts with the first rule in each chain being something like....ACCEPT
> related and established packets.  
> 
> My first question is...Is that really needed?

yes.

> In my other experiences
> with stateful firewalls this rule is not needed because the firewall
> remembers the outgoing packet and the rule is implied...or do I have
> this very wrong?

iptables behaves differently than every other stateful firewall i can
think of (check point, pix, ipf, pf) in that they all behave this way:

1 - check state table for matching connection, if found--pass packet.
2 - if packet not found in state table--traverse filter rules

both check point and pix actually have additional checks and
restrictions, but that's a simplistic explanation to get the point
across.

the way iptables works is that as soon as the ip_conntrack module is
loaded, the conntrack table (state table) begins to be populated by
connections passing through the machine.  if you want to load filter
rules, you have an interface into the connections in the state table via
-m state--thus to pass connections that are fully established in the
state table:

  -A ${CHAIN} -m state --state ESTABLISHED -j ACCEPT

as the first rule basically emulates the basic behavior of other
firewalls.  in the simplistic case--this adds more work for the novice
user that is accustomed to stateful tracking "just magically working,"
but in the advanced case, it gives a nice level of flexibility to
actually bypass or override what's in the state table.  the spirit of
linux:  maximum flexibility.

> My second question, which may not be totally applicable for this list
> is...I have my netfilter/iptables set up on a Redhat 4 Ent WS box...are
> the following parameters for hardening still useful and applicable with
> the current kernel and distro?
> 
> net.ipv4.tcp_syncookies = 1
> net.ipv4.conf.all.accept_source_route = 0
> net.ipv4.conf.all.accept_redirects = 0
> net.ipv4.conf.all.rp_filter = 1
> net.ipv4.icmp_echo_ignore_all = 1 = 1
> net.ipv4.icmp_echo_ignore_broadcasts = 1
> net.ipv4.icmp_ignore_bogus_error_responses = 1
> net.ipv4.conf.all.log_martians = 1

other than net.ipv4.icmp_echo_ignore_all, yes.  but i'm one of those
weirdos that does not believe ICMP is some fountain of evil and the
source of everything bad on the Internet.  you'd have more flexibility
blocking/allowing specific ICMP packets in your iptables filter rules
than using sysctl to do it.

-j

--
"Stewie: It rubs the lotion on its skin or else it gets the hose again."
        --Family Guy

