From: "Ruslan Kazansky" <rsllst2@kursknet.ru>
Subject: iptables -m state & New !SYN (conntrack problem)
Date: Wed, 23 Oct 2002 12:30:15 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00d901c27a6e$69db5bd0$fe01a8c0@upr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi!

I am use linux, kernel 2.4.18, frontend - iptables v1.2.6a.

1)

iptables consist the following rules:

====begin============
iptables -t filter -A bad_pkt -p TCP -m state --state ! NEW -j ACCEPT

iptables -t filter -A bad_pkt -p TCP -m state --state NEW --tcp-flags
SYN,ACK,FIN,RST SYN -j ACCEPT

iptables -t filter -A bad_pkt -p TCP -j LOG --log-prefix "New !SYN: "

====end============

In log i see packets, which conntrack is mark "NEW", but it flags is
equivalent to:

--tcp-flags SYN,ACK,FIN,RST ACK,FIN

--tcp-flags SYN,ACK,FIN,RST ACK

--tcp-flags SYN,ACK,FIN,RST ACK,RST

The ports number say, that is not portscan, it's normal connection packets.

Also, view "netstat -neoA inet" is not eqiv "cat /proc/net/ip_conntrack".

I.e ip_conntrack state is not corresponding REAL TCP-state !!!

Is that normal or kernel (ipfilter) bug ???

2)

/proc/net/ip_conntrack consist very long (till 5 days) hanging record, AFAIR
corresponded:

(linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c):

      5 DAYS,     /*      TCP_CONNTRACK_ESTABLISHED,      */

Some people recommended decrease TCP_CONNTRACK_ESTABLISHED to 2 hour.

However, in kernel source (2.4.19, patch-2.4.20-pre11) maintainers is not
confirm this correction, why... ???

What is the way against possible DOS-attack to ip_conntrack, where, IMHO,
to:

  ip_conntrack: maximum limit of XXX entries exceeded ?

Also, view "netstat -neoA inet" is not consist "hanging" connection, it show
only in

/proc/net/ip_conntrack...

3)

Why timeout for ip_conntrack in

linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c

is different from TCP-timeout ?

Or it's only for UDP & ICMP protocols ?

______________________________
Ruslan Kazansky,
Network Administrator,
ISP Joint Stock Company
"Electrosvyaz - Kursk Region",
Kursk, Russia, http://www.kursknet.ru





