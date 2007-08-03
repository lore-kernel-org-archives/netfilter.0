From: "Stefan Sabolowitsch" <Stefan.Sabolowitsch@feltengmbh.de>
Subject: Problems with iptables and bridge
Date: Fri, 3 Aug 2007 12:08:42 +0200
Message-ID: <F6E5B5A51C09F94F8F95DAD4D60E351163AA70@sfe01.felten.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=feltengmbh.de;
	s=feltengmbh_de; l=10645; t=1186135772; x=1186740572; q=dns/txt;
	h=DomainKey-Signature:Received:Content-class:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Subject:Date:Message-ID:
	Thread-Topic:Thread-Index:From:To; bh=XqUqs/mGX8zYscvtw82bnO5mzE
	9g7quJWD3GrC0kTJk=; b=cnZNOLeSwoaFAB6Z0wIvH8pruq7Pi7aSocOa0QOtEx
	FPL5IS6GDYYX+lRR5at16MJpw65t/WnnNotQezXrQ86A58B04t6/7u3YX6iYDE9e
	17gnMZFEP1AKMKU7a3hco9l03FKXcU8WOB7iF5fcKrpNgrSWE/0/SbD9hEYdDP1d
	A=
Content-class: urn:content-classes:message
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

Hi List,

I provided myself the following rule with mastershaper.
With load the rules all connections are blocked.=20

Kernel 2.6.19
Iptables 1.3.8
l7-filter
ip2route
ipp2p

All kernelmodule is loaded

Why?=20

Thank you for each assistance

Stefan

=20

Chain PREROUTING (policy ACCEPT 2922 packets, 883K bytes)
pkts bytes target     prot opt in     out     source
destination        =20
1257  101K ms-prerouting  all  --  *      *       0.0.0.0/0
0.0.0.0/0          =20

Chain INPUT (policy ACCEPT 1851 packets, 708K bytes)
pkts bytes target     prot opt in     out     source
destination        =20

Chain FORWARD (policy ACCEPT 2342 packets, 279K bytes)
pkts bytes target     prot opt in     out     source
destination        =20

Chain OUTPUT (policy ACCEPT 600 packets, 605K bytes)
pkts bytes target     prot opt in     out     source
destination        =20

Chain POSTROUTING (policy ACCEPT 2925 packets, 883K bytes)
pkts bytes target     prot opt in     out     source
destination        =20
1105 79454 ms-all-chains  all  --  *      *       0.0.0.0/0
0.0.0.0/0           PHYSDEV match --physdev-out eth1=20
146 16690 ms-all-chains  all  --  *      *       0.0.0.0/0
0.0.0.0/0           PHYSDEV match --physdev-out eth0=20

Chain ms-all (2 references)
pkts bytes target     prot opt in     out     source
destination        =20
0     0 MARK       all  --  *      *       0.0.0.0/0
192.168.100.0/24    PHYSDEV match --physdev-in eth0 MARK set 0x78512774=20
0     0 RETURN     all  --  *      *       0.0.0.0/0
192.168.100.0/24    PHYSDEV match --physdev-in eth0=20
1105 79454 MARK       all  --  *      *       0.0.0.0/0
0.0.0.0/0           PHYSDEV match --physdev-in eth0 MARK set 0x537c74b1=20
1105 79454 RETURN     all  --  *      *       0.0.0.0/0
0.0.0.0/0           PHYSDEV match --physdev-in eth0=20
0     0 MARK       all  --  *      *       192.168.100.0/24
0.0.0.0/0           PHYSDEV match --physdev-in eth1 MARK set 0xc0ed4017=20
0     0 RETURN     all  --  *      *       192.168.100.0/24
0.0.0.0/0           PHYSDEV match --physdev-in eth1=20
146 16690 MARK       all  --  *      *       0.0.0.0/0
0.0.0.0/0           PHYSDEV match --physdev-in eth1 MARK set 0xebc013d6=20
146 16690 RETURN     all  --  *      *       0.0.0.0/0
0.0.0.0/0           PHYSDEV match --physdev-in eth1=20

Chain ms-all-chains (2 references)
pkts bytes target     prot opt in     out     source
destination        =20
0     0 ms-chain-eth1-1:11  all  --  *      *       0.0.0.0/0
0.0.0.0/0           CONNMARK match 0x78512774=20
1105 79454 ms-chain-eth1-1:21  all  --  *      *       0.0.0.0/0
0.0.0.0/0           CONNMARK match 0x537c74b1=20
0     0 ms-chain-eth0-1:11  all  --  *      *       0.0.0.0/0
0.0.0.0/0           CONNMARK match 0xc0ed4017=20
146 16690 ms-chain-eth0-1:21  all  --  *      *       0.0.0.0/0
0.0.0.0/0           CONNMARK match 0xebc013d6=20

Chain ms-chain-eth0-1:11 (1 references)
pkts bytes target     prot opt in     out     source
destination        =20
Chain ms-chain-eth0-1:21 (1 references)
pkts bytes target     prot opt in     out     source
destination        =20
0     0 CLASSIFY   udp  --  *      *       0.0.0.0/0
0.0.0.0/0           multiport ports 5008,5009 CLASSIFY set 1:22=20
0     0 RETURN     udp  --  *      *       0.0.0.0/0
0.0.0.0/0           multiport ports 5008,5009=20
0     0 CLASSIFY   tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           multiport ports 20,21,80,443 CLASSIFY set 1:23=20
0     0 RETURN     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           multiport ports 20,21,80,443=20
146 16690 CLASSIFY   all  --  *      *       0.0.0.0/0
0.0.0.0/0           CLASSIFY set 1:299=20
146 16690 RETURN     all  --  *      *       0.0.0.0/0
0.0.0.0/0          =20

Chain ms-chain-eth1-1:11 (1 references)
pkts bytes target     prot opt in     out     source
destination        =20

Chain ms-chain-eth1-1:21 (1 references)
pkts bytes target     prot opt in     out     source
destination        =20
0     0 CLASSIFY   udp  --  *      *       0.0.0.0/0
0.0.0.0/0           multiport ports 5008,5009 CLASSIFY set 1:22=20
0     0 RETURN     udp  --  *      *       0.0.0.0/0
0.0.0.0/0           multiport ports 5008,5009=20
0     0 CLASSIFY   tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           multiport ports 20,21,80,443 CLASSIFY set 1:23=20
0     0 RETURN     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           multiport ports 20,21,80,443=20
1105 79454 CLASSIFY   all  --  *      *       0.0.0.0/0
0.0.0.0/0           CLASSIFY set 1:299=20
1105 79454 RETURN     all  --  *      *       0.0.0.0/0
0.0.0.0/0          =20

Chain ms-prerouting (1 references)
pkts bytes target     prot opt in     out     source
destination        =20
1257  101K CONNMARK   all  --  *      *       0.0.0.0/0
0.0.0.0/0           CONNMARK restore=20
1105 79454 ms-all     all  --  *      *       0.0.0.0/0
0.0.0.0/0           PHYSDEV match --physdev-in eth0=20
146 16690 ms-all     all  --  *      *       0.0.0.0/0
0.0.0.0/0           PHYSDEV match --physdev-in eth1=20
1257  101K CONNMARK   all  --  *      *       0.0.0.0/0
0.0.0.0/0           CONNMARK save=20

/sbin/tc qdisc add dev eth1 handle 1: root hfsc default 1
/sbin/iptables -t mangle -N ms-all
/sbin/iptables -t mangle -N ms-all-chains
/sbin/iptables -t mangle -N ms-prerouting
/sbin/iptables -t mangle -A PREROUTING -j ms-prerouting
/sbin/iptables -t mangle -A ms-prerouting -j CONNMARK --restore-mark
/sbin/iptables -t mangle -A ms-prerouting -m physdev --physdev-in eth0
-j ms-all
/sbin/iptables -t mangle -A POSTROUTING -m physdev --physdev-out eth1 -j
ms-all-chains
/sbin/tc class add dev eth1 parent 1: classid 1:1 hfsc sc rate
102400Kbit ul rate 102400Kbit
/sbin/tc filter add dev eth1 parent 1:0 protocol all u32 match u32 0 0
classid 1:1
######### Incoming Rules
######### chain DMZ-ignore
/sbin/iptables -t mangle -N ms-chain-eth1-1:11
/sbin/iptables -t mangle -A ms-all-chains -m connmark --mark 0x78512774
-j ms-chain-eth1-1:11
/sbin/iptables -t mangle -A ms-all -m physdev --physdev-in eth0 -d
192.168.100.0/24 -j MARK --set-mark 0x78512774
/sbin/iptables -t mangle -A ms-all -m physdev --physdev-in eth0 -d
192.168.100.0/24 -j RETURN
######### chain WAN
/sbin/tc class add dev eth1 parent 1:1 classid 1:21 hfsc sc rate
2048Kbit rt rate 2048Kbit
/sbin/iptables -t mangle -N ms-chain-eth1-1:21
/sbin/iptables -t mangle -A ms-all-chains -m connmark --mark 0x537c74b1
-j ms-chain-eth1-1:21
/sbin/iptables -t mangle -A ms-all -m physdev --physdev-in eth0 -j MARK
--set-mark 0x537c74b1
/sbin/iptables -t mangle -A ms-all -m physdev --physdev-in eth0 -j
RETURN
######### generating pipes for WAN
######### pipe VoIP-Traffic
/sbin/tc class add dev eth1 parent 1:21 classid 1:22 hfsc sc umax 1500b
dmax 100ms rate 368Kbit ul rate 760Kbit rt umax 1500b dmax 100ms rate
368Kbit ul rate 760Kbit
/sbin/tc qdisc add dev eth1 handle 22: parent 1:22 hfsc
/sbin/iptables -t mangle -A ms-chain-eth1-1:21 -p 17 -m multiport --port
5008,5009 -j CLASSIFY --set-class 1:22
/sbin/iptables -t mangle -A ms-chain-eth1-1:21 -p 17 -m multiport --port
5008,5009 -j RETURN
######### pipe Web-Traffic
/sbin/tc class add dev eth1 parent 1:21 classid 1:23 hfsc sc umax 1500b
dmax 250ms rate 128Kbit ul rate 256Kbit rt umax 1500b dmax 250ms rate
128Kbit ul rate 256Kbit
/sbin/tc qdisc add dev eth1 handle 23: parent 1:23 hfsc
/sbin/iptables -t mangle -A ms-chain-eth1-1:21 -p 6 -m multiport --port
20,21,80,443 -j CLASSIFY --set-class 1:23
/sbin/iptables -t mangle -A ms-chain-eth1-1:21 -p 6 -m multiport --port
20,21,80,443 -j RETURN
/sbin/tc class add dev eth1 parent 1:21 classid 1:299 hfsc sc rate
256Kbit ul rate 10240Kbit rt rate 256Kbit ul rate 10240Kbit
/sbin/tc qdisc add dev eth1 handle 299: parent 1:299 hfsc
/sbin/iptables -t mangle -A ms-chain-eth1-1:21 -j CLASSIFY --set-class
1:299
/sbin/iptables -t mangle -A ms-chain-eth1-1:21 -j RETURN



/sbin/tc qdisc add dev eth0 handle 1: root hfsc default 1
/sbin/iptables -t mangle -A ms-prerouting -m physdev --physdev-in eth1
-j ms-all
/sbin/iptables -t mangle -A POSTROUTING -m physdev --physdev-out eth0 -j
ms-all-chains
/sbin/tc class add dev eth0 parent 1: classid 1:1 hfsc sc rate
102400Kbit ul rate 102400Kbit
/sbin/tc filter add dev eth0 parent 1:0 protocol all u32 match u32 0 0
classid 1:1
######### Outgoing Rules
######### chain DMZ-ignore
/sbin/iptables -t mangle -N ms-chain-eth0-1:11
/sbin/iptables -t mangle -A ms-all-chains -m connmark --mark 0xc0ed4017
-j ms-chain-eth0-1:11
/sbin/iptables -t mangle -A ms-all -m physdev --physdev-in eth1 -s
192.168.100.0/24 -j MARK --set-mark 0xc0ed4017
/sbin/iptables -t mangle -A ms-all -m physdev --physdev-in eth1 -s
192.168.100.0/24 -j RETURN
######### chain WAN
/sbin/tc class add dev eth0 parent 1:1 classid 1:21 hfsc sc rate
2048Kbit rt rate 2048Kbit
/sbin/iptables -t mangle -N ms-chain-eth0-1:21
/sbin/iptables -t mangle -A ms-all-chains -m connmark --mark 0xebc013d6
-j ms-chain-eth0-1:21
/sbin/iptables -t mangle -A ms-all -m physdev --physdev-in eth1 -j MARK
--set-mark 0xebc013d6
/sbin/iptables -t mangle -A ms-all -m physdev --physdev-in eth1 -j
RETURN
######### generating pipes for WAN
######### pipe VoIP-Traffic
/sbin/tc class add dev eth0 parent 1:21 classid 1:22 hfsc sc umax 1500b
dmax 100ms rate 368Kbit ul rate 760Kbit rt umax 1500b dmax 100ms rate
368Kbit ul rate 760Kbit
/sbin/tc qdisc add dev eth0 handle 22: parent 1:22 hfsc
/sbin/iptables -t mangle -A ms-chain-eth0-1:21 -p 17 -m multiport --port
5008,5009 -j CLASSIFY --set-class 1:22
/sbin/iptables -t mangle -A ms-chain-eth0-1:21 -p 17 -m multiport --port
5008,5009 -j RETURN
######### pipe Web-Traffic
/sbin/tc class add dev eth0 parent 1:21 classid 1:23 hfsc sc umax 1500b
dmax 250ms rate 128Kbit ul rate 256Kbit rt umax 1500b dmax 250ms rate
128Kbit ul rate 256Kbit
/sbin/tc qdisc add dev eth0 handle 23: parent 1:23 hfsc
/sbin/iptables -t mangle -A ms-chain-eth0-1:21 -p 6 -m multiport --port
20,21,80,443 -j CLASSIFY --set-class 1:23
/sbin/iptables -t mangle -A ms-chain-eth0-1:21 -p 6 -m multiport --port
20,21,80,443 -j RETURN
/sbin/tc class add dev eth0 parent 1:21 classid 1:299 hfsc sc rate
256Kbit ul rate 10240Kbit rt rate 256Kbit ul rate 10240Kbit
/sbin/tc qdisc add dev eth0 handle 299: parent 1:299 hfsc
/sbin/iptables -t mangle -A ms-chain-eth0-1:21 -j CLASSIFY --set-class
1:299
/sbin/iptables -t mangle -A ms-chain-eth0-1:21 -j RETURN
/sbin/iptables -t mangle -A ms-prerouting -j CONNMARK --save-mark


