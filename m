From: "Eric Estes" <Eric_Estes@aspensquare.com>
Subject: Bandwidth Management - By MAC Address
Date: Fri, 21 Mar 2008 12:24:20 -0400
Message-ID: <665B03CFBE2C1346A66B0CB9A9A0EE3801C7EC44@ASM220.aspen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm hoping someone could shed some light on this.

I'm trying to throttle a specific MAC Address to 200Kbits but it only
seems to work for outgoing traffic. Can anyone see anything wrong with
the code below?

/sbin/tc qdisc add dev eth1 handle 1: root htb default 1
/sbin/iptables -t mangle -N ms-all
/sbin/iptables -t mangle -N ms-all-chains
/sbin/iptables -t mangle -N ms-prerouting
/sbin/iptables -t mangle -A PREROUTING -j ms-prerouting
/sbin/iptables -t mangle -A ms-prerouting -j CONNMARK --restore-mark
/sbin/iptables -t mangle -A ms-prerouting -m physdev --physdev-in eth0
-j ms-all
/sbin/iptables -t mangle -A POSTROUTING -m physdev --physdev-out eth1 -j
ms-all-chains
/sbin/tc class add dev eth1 parent 1: classid 1:1 htb rate 15888Kbit
/sbin/tc filter add dev eth1 parent 1:0 protocol all u32 match u32 0 0
classid 1:1
######### Incoming Rules
######### chain 0019.b96c.57e1
/sbin/tc class add dev eth1 parent 1:1 classid 1:11 htb rate 200Kbit
prio 5 quantum 1532
/sbin/iptables -t mangle -N ms-chain-eth1-1:11
/sbin/iptables -t mangle -A ms-all-chains -m connmark --mark 0x78512774
-j ms-chain-eth1-1:11
/sbin/iptables -t mangle -A ms-all -m physdev --physdev-in eth0 -m mac
--mac-source 00:19:b9:6c:57:e1 -j MARK --set-mark 0x78512774
/sbin/iptables -t mangle -A ms-all -m physdev --physdev-in eth0 -m mac
--mac-source 00:19:b9:6c:57:e1 -j RETURN
######### generating pipes for 0019.b96c.57e1
/sbin/tc class add dev eth1 parent 1:11 classid 1:199 htb rate 200Kbit
prio 5 quantum 1532
/sbin/tc qdisc add dev eth1 handle 199: parent 1:199 sfq
/sbin/iptables -t mangle -A ms-chain-eth1-1:11 -j CLASSIFY --set-class
1:199
/sbin/iptables -t mangle -A ms-chain-eth1-1:11 -j RETURN
######### chain 10.3.162.0/24
/sbin/tc class add dev eth1 parent 1:1 classid 1:21 htb rate 1000Kbit
prio 2 quantum 1532
/sbin/iptables -t mangle -N ms-chain-eth1-1:21
/sbin/iptables -t mangle -A ms-all-chains -m connmark --mark 0x537c74b1
-j ms-chain-eth1-1:21
/sbin/iptables -t mangle -A ms-all -m physdev --physdev-in eth0 -d
10.3.162.0/24 -j MARK --set-mark 0x537c74b1
/sbin/iptables -t mangle -A ms-all -m physdev --physdev-in eth0 -d
10.3.162.0/24 -j RETURN
######### generating pipes for 10.3.162.0/24
/sbin/tc class add dev eth1 parent 1:21 classid 1:299 htb rate 1000Kbit
prio 2 quantum 1532
/sbin/tc qdisc add dev eth1 handle 299: parent 1:299 sfq
/sbin/iptables -t mangle -A ms-chain-eth1-1:21 -j CLASSIFY --set-class
1:299
/sbin/iptables -t mangle -A ms-chain-eth1-1:21 -j RETURN



/sbin/tc qdisc add dev eth0 handle 1: root htb default 1
/sbin/iptables -t mangle -A ms-prerouting -m physdev --physdev-in eth1
-j ms-all
/sbin/iptables -t mangle -A POSTROUTING -m physdev --physdev-out eth0 -j
ms-all-chains
/sbin/tc class add dev eth0 parent 1: classid 1:1 htb rate 5320Kbit
/sbin/tc filter add dev eth0 parent 1:0 protocol all u32 match u32 0 0
classid 1:1
######### Outgoing Rules
######### chain 0019.b96c.57e1
/sbin/tc class add dev eth0 parent 1:1 classid 1:11 htb rate 200Kbit
prio 5 quantum 1532
/sbin/iptables -t mangle -N ms-chain-eth0-1:11
/sbin/iptables -t mangle -A ms-all-chains -m connmark --mark 0xc0ed4017
-j ms-chain-eth0-1:11
/sbin/iptables -t mangle -A ms-all -m physdev --physdev-in eth1 -m mac
--mac-source 00:19:b9:6c:57:e1 -j MARK --set-mark 0xc0ed4017
/sbin/iptables -t mangle -A ms-all -m physdev --physdev-in eth1 -m mac
--mac-source 00:19:b9:6c:57:e1 -j RETURN
######### generating pipes for 0019.b96c.57e1
/sbin/tc class add dev eth0 parent 1:11 classid 1:199 htb rate 200Kbit
prio 5 quantum 1532
/sbin/tc qdisc add dev eth0 handle 199: parent 1:199 sfq
/sbin/iptables -t mangle -A ms-chain-eth0-1:11 -j CLASSIFY --set-class
1:199
/sbin/iptables -t mangle -A ms-chain-eth0-1:11 -j RETURN
######### chain 10.3.162.0/24
/sbin/tc class add dev eth0 parent 1:1 classid 1:21 htb rate 1000Kbit
prio 2 quantum 1532
/sbin/iptables -t mangle -N ms-chain-eth0-1:21
/sbin/iptables -t mangle -A ms-all-chains -m connmark --mark 0xebc013d6
-j ms-chain-eth0-1:21
/sbin/iptables -t mangle -A ms-all -m physdev --physdev-in eth1 -s
10.3.162.0/24 -j MARK --set-mark 0xebc013d6
/sbin/iptables -t mangle -A ms-all -m physdev --physdev-in eth1 -s
10.3.162.0/24 -j RETURN
######### generating pipes for 10.3.162.0/24
/sbin/tc class add dev eth0 parent 1:21 classid 1:299 htb rate 1000Kbit
prio 2 quantum 1532
/sbin/tc qdisc add dev eth0 handle 299: parent 1:299 sfq
/sbin/iptables -t mangle -A ms-chain-eth0-1:21 -j CLASSIFY --set-class
1:299
/sbin/iptables -t mangle -A ms-chain-eth0-1:21 -j RETURN
/sbin/iptables -t mangle -A ms-prerouting -j CONNMARK --save-mark



Thank You,
Eric
