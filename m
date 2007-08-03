From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Iptables rules processing
Date: Fri, 3 Aug 2007 19:34:39 +0200
Message-ID: <001b01c7d5f4$91781110$0101000a@tanjian>
References: <20070803161302.GB7815@sid.toystory.lan><46B3566E.1010407@rchq.co.za>
	<20070803170735.GC7815@sid.toystory.lan>
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070803170735.GC7815@sid.toystory.lan>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter <netfilter@lists.netfilter.org>

> I meant, there can't be no such processing  ?
>
> 1/
> -> ...
> -> match for the source address 192.168.10.14
>     |-> match for destination port 80 -> ACCEPT
>     |-> match for the destination port 443 -> ACCEPT -> ...

Yes, this is possible using a user defined chain.

$ipt -N WEBCHECK
$ipt -A WEBCHECK -p tcp --dport 80 -j ACCEPT
$ipt -A WEBCHECK -p tcp --dport 443 -j ACCEPT

$ipt -A INPUT -s 192.168.10.14 [-p tcp] -j WEBCHECK

First you create a user defined chain (-N), for example, called
WEBCHECK.
You populate the chain with rules that only match port 80 or port 443
and ACCEPT when matched.
You add a rule to the default INPUT chain matching source IP
192.168.10.14 and redirect the packet to the WEBCHECK.
If no rule in WEBCHECK matched, the packet will continue traversing the
INPUT chain until a match or do what the chain policy says should happen
(ACCEPT or DROP).

The "-p tcp" in the INPUT rule is optional, but since you're only
checking tcp packets in the WEBCHECK chain, it might make sense to only
send tcp packets to that chain. This would IMHO only be of real use if
you have lots of rules and you want to narrow down the number of rules
to be matched. In this case you won't notice the difference.


Grts,
Rob



