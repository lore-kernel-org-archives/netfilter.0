From: Fabien LE BLEVEC <fleblevec@nerim.net>
Subject: Conntrack  & ICMP host unreachable bug ??
Date: Tue, 30 Dec 2003 19:28:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FF1C3C7.4000401@nerim.net>
Reply-To: fleblevec@nerim.net
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello !

I want to have your point of view about this log :

Dec 30 17:20:52 fw kernel: fw_net
IN= OUT=ppp0 SRC=62.xx.xx.xx DST=207.46.106.115
LEN=68 TOS=0x00 PREC=0xC0 TTL=3 ID=2336
PROTO=ICMP TYPE=3 CODE=1
[SRC=207.46.106.115 DST=192.168.0.10
LEN=40 TOS=0x00 PREC=0x00 TTL=54 ID=6714
PROTO=TCP SPT=1863 DPT=1033
SEQ=258256682 ACK=3649636442 WINDOW=16805 RES=0x00 ACK FIN URGP=0 ]


The firewall box wanted to transmit this packet (ICMP host unreachble) 
because I changed the IP address of the computer 192.168.0.10 to 
192.168.0.34. During this change, there was an entry in the ip_conntrack 
table for this connection... and so it is normal that the firewall 
wanted to do this !
But, If you see the data in the ICMP messages, you can see that he 
didn't translate the source address ...

He have the behavior of a router but not a "NAT router", I think he 
should not reply to this problem, and just remove the entry on the 
conntrack tables whithout sending anythings !


Of course I have this rules (and others):
iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to 62.xx.xx.xx

Can it be a bug like the ICMP DNAT (2002-05-08) ?



Best regard.

Fabien



