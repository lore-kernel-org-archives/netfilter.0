From: "dravya" <dravya@magma.ca>
Subject: Change of ip addresses continues.... :(
Date: Thu, 26 Aug 2004 17:10:33 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200408262110.i7QLAX0V026111@webmail1.magma.ca>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@lists.netfilter.org>, dchemko@smgtec.com


Hi people/Daniel,

I have been trying various set of rules in various table in order to have packets go over
the right link. ie. packet's src add should match outgoing link's ip address. YET, there
are some packets that always tend to go over the wrong link and thus causing ip address
change. They mostly seem to be ICMP Destination Unreacheable messages or DNS queries.

I tried out the rules that Daniel Chemko so generously had provided me with...and they
don't seem to work. I am probably not doing something right. I just tried the following
rules with no luck:

iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
iptables -t mangle -A PREROUTING -m mark ! --mark 0 -j ACCEPT
iptables -t mangle -A PREROUTING -m mark ! --mark 0 -p icmp -j MARK --set-mark 1
iptables -t mangle -A PREROUTING -m mark ! --mark 0 -j MARK --set-mark 2
iptables -t mangle -A PREROUTING -j CONNMARK --save-mark
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
ptables -t nat -A POSTROUTING -o ppp1 -j MASQUERADE

Are these rules supposed to create 2 routing tables???? If they do, I don't seem them? 
This is what I see:

[ ]# ip rule list
0:      from all lookup local
32766:  from all lookup main
32767:  from all lookup 253

I even tried the ROUTE rule separately with no luck (still ip changes):

iptables -A POSTROUTING -t mangle -p icmp -j ROUTE --oif ppp0

Not to mention I initially tried MASQUERADING and that is when Daniel told me that there
were a few problems with Masquerading. 

I am to the point of pulling my hair.... thus... any help whatsoever would be appreciated.
Thanks guys,

Dravya

