From: Pawel Zawora <pzawora@interia.pl>
Subject: IPSEC ping
Date: Thu, 24 Aug 2006 13:18:39 +0200
Message-ID: <44ED8B0F.2070009@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Hello,

I ve a vpn tunnel (native 2.6, openswan)

I have the ipsec tunnel:

host_A [IP_A]<-->[router IP_router]-----------host_B [IP_B]  host_C [ip_C]


left IP_A
right IP_B
rightsubnet IP_C

On host A:
ip xfrm policy show

src IP_A/32 dst IP_C/32
        dir out priority 2080
        tmpl src IP_A dst  IP_C
                proto esp reqid 16385 mode tunnel

openswans add routing
IP_C via IP_router dev eth1


tested with
iptables -A FORWARD/INPUT -s IP_C -j ACCEPT
iptables -A FORWAD/INPUT -d IP_C -j ACCEPT

and without any rules.


On host A:

ping -I IP_A IP_C  give me no repspose...

When I try to use tcpdump I discover strange information

tcpdump -i eth1 -n src or dst IP_C

IP IP_C>  IP_A: ICMP echo reply,
IP IP_C > IP_A: ICMP echo reply,
....

I cant see echo request!

but.......

tcpdump -i eth1 -n src or dst IP_B

IP IP_A > IP_B: ESP(spi....
IP IP_B > IP_A: ESP(spi....
IP IP_A > IP_B: ESP(spi....
IP IP_B > IP_A: ESP(spi....
.....

What is wrong?
What ping cannot see ICMP reply?
Why tcpdump do not show me ICMP request?

Thanks for any help

Pawel



















----------------------------------------------------------------------
Zostan Chlopakiem Lata! >>> http://link.interia.pl/f1998


