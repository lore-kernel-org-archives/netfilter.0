From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: IP Tables: starting slowly..
Date: 16 Jun 2003 19:21:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055805673.19438.236.camel@alpha.newkirk.us>
References: <20030616161137.GA7125@tweedle.finchhaven.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030616161137.GA7125@tweedle.finchhaven.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: John Sage <jsage@finchhaven.com>
Cc: netfilter@lists.netfilter.org

On Mon, 2003-06-16 at 12:11, John Sage wrote:
> hmm..  iptables itself isn't starting slowly, I'm slowly starting to
> implement iptables.
> 
> I'm (finally..) migrating from ipchains, and would appreciate some
> comment on my overall approach.

Keep in mind that FORWARD traffic goes only through the FORWARD filter
chain, never INPUT or OUTPUT.  Those two are strictly for the iptables
box itself.  (#1 confusion source it seems for ipchains emigrees)

> Context: dialup, ppp, source NAT/masquerading various boxen behind the
> firewall/router, KRUD Linux 2.4-18.5 
> 
> 1) I'm writing a minimal set of rules to account for every packet within
> a specific chain, and not let any fall through to the default policy
> -- which at the moment is ACCEPT -- after I'm certain there aren't any
> packets dropping through to the policies, the default policies will
> become DROP.
> 
> Good idea? Bad idea?

Not necessarily bad, but cautious is always safer.  If you log
everything as the last rule in the chain, then the DROP policy takes
effect, you may have communications problems occasionally, but a quick
look at the log will usually tell you what was dropped, so you can craft
a rule to deal with it.  BTW, policy is an attribute of the chain
itself, not a rule at the end. just:

iptables -P FORWARD DROP

> Example:
> 
> # OUTPUT:
> /sbin/iptables -t filter -A OUTPUT \
>  -o lo -j ACCEPT
> /sbin/iptables -t filter -A OUTPUT \
>  -o eth0 -j ACCEPT
> /sbin/iptables -t filter -A OUTPUT \
>  -o ppp0 -j ACCEPT


Well, this pretty much lets anything out from the firewall box itself...

> 2) Is a default DROP rule (a rule that will catch any/everthing)
> irrelevant on the FORWARD chain?

Far from it - most people treat a DROP rule on FORWARD and INPUT chains
as the basic starting point.  Set a DROP policy on INPUT and FORWARD and
then add rules to ACCEPT the desired traffic - INPUT for traffic to the
firewall box, FORWARD for traffic from/to the machines behind it. 
OUTPUT is less of a concern to most people, but for myself I've set a
DROP policy there as well, and set up a dozen or so rules for the
connections that the firewall itself needs to initiate.

> 3) Can someone point me to a quick lesson on logging? At the moment
> I've got the following:

http://iptables-tutorial.frozentux.net is the best tutorial around on
iptables.  The quick and dirty:

iptables -A FORWARD -i eth0 -j LOG --log-prefix "FORWARDLogs:"

The log prefix is any string you want (within reason) and helps you find
the log entries from a particular LOG rule with grep, among other uses. 


> Module                  Size  Used by    Not tainted
> ipt_MASQUERADE          2368   1  (autoclean)
> ipt_state               1440   4  (autoclean)
> iptable_filter          2656   1  (autoclean)
> iptable_mangle          3040   0  (autoclean) (unused)
> ipt_LOG                 4544   0  (unused)
> iptable_nat            20948   1  [ipt_MASQUERADE]
> ip_conntrack           21484   2  [ipt_MASQUERADE ipt_state iptable_nat]
> ip_tables              14176   8  [ipt_MASQUERADE ipt_state iptable_filter iptable_mangle ipt_LOG iptable_nat]
> <snip>
> 
> so I think I've got a start, but have no clue as to the rules needed.

First suggestion - DROP policy on INPUT and FORWARD.

Second suggestion:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

these two rules will allow replies and related traffic (like FTP data
related to FTP control).

Third suggestion - set up basic ACCEPT rules for the ports you know you
need to allow and a LOG rule at the end of INPUT and FORWARD chains to
let you see what is being discarded, until you get all the ports you
need opened.

j


> TIA..
> 
> 
> - John


