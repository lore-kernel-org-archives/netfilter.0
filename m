From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: Rule "labels"?
Date: Thu, 14 Apr 2005 13:48:27 -0700
Message-ID: <BAY106-F357CEE5BD3D8B2616C1AD6D6350@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

Is there a way to associate rules together across tables or chains, possibly 
with a label?

Note: As used here, a "policy" refers to an abstraction of one or more 
iptables rules (and possibly, but not germane here, routing rules).

The reason I am seeking this is so that I can tag all rules that are used to 
enforce a higher level policy such that, if that policy is later rescinded, 
I can identify all of its constituent iptables rules by their label and 
delete those rules.

Otherwise, I have to remember the exact contents of each rule or track their 
indices within each chain so that I can delete each rule on that basis.  
That's not hard to do if a human is managing the rule set directly, but is a 
bit cumbersome to code into a utility that abstracts rules into higher level 
(i.e. more end user friendly) "policies".

Here's a simple example which will hopefully help illustrate what I am 
trying to do.

Setting the stage:
1) The default is to drop packets in the FORWARD chain.
2) There is a private local network using a non-Internet subnet (e.g. 
192.168.168.0/24).
3) The public network interface, represented by variable $PUBLIC_IF, is 
connected to the Internet.
4) SNAT (or sometimes MASQUERADE) is used to NAT traffic that originates 
from the private network and is bound to the Internet.

The example policy:

The user enables a policy that is stated something along the lines of 
"Expose HTTP server at local host <local IP address> to the Internet" and 
specifies local IP address 192.168.168.23 for this policy.

This equates to the following 2 rules, one in the 'nat' table and the other 
in the 'filter' table:

iptables -t nat -A PREROUTING -i $PUBLIC_IF -p tcp --dport 80 -j DNAT --to 
192.168.168.23

iptables -t filter -A FORWARD -i $PUBLIC_IF -d 192.168.168.23 -p tcp --dport 
80 -j ACCEPT

Later, the user decides to disable the policy which means deleting both of 
the rules above.  Since I cannot rely on knowing the indices of each rule 
within its chain, I must delete them by passing the original arguments of 
each rule to the iptables delete command.

If I could label both rules with a common value and then do a chain by chain 
delete based on the label, my programmatic life would be simpler.  I'm 
envisioning something like the following:

1) Include '-label' argument with the add rule command, e.g.:

iptables -t filter -A FORWARD -label POLICY001 -i $PUBLIC_IF -d 
192.168.168.23 -p tcp --dport 80 -j ACCEPT

2) Support rule deletion based on -label, e.g.:

iptables -t filter -D FORWARD -label POLICY001

Ideally, the delete command would remove all rules in the specified chain 
with the specified label, or all rules within the specified table, or even 
across all chains in all tables, but I'm not that greedy...

Suggestions?

Thanks,

- Andrew

PS I guess such a label would be kind of like MARKing, but for rules instead 
of packets.

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today - it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/


