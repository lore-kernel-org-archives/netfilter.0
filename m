From: "Philipp Stader" <me@ph1l.de>
Subject: openvpn & Masquerading/Nat troubles
Date: Sat, 14 Feb 2004 16:48:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1As227-0003dq-Ox@vishnu.netfilter.org>
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

Hello List,

i ran into trouble using Openvpn to connect two small LANs.
Each Lan has a server, running Debian Woody with selfmade 2.4.24 Kernel
(directly from kernel.org. no patches. ECN not enabled)

Corporate HQ Debian Box is 192.168.200.253 and is default gateway and dns
server for all Clients (Windows Workstations and a Windows 2003 Server). It
has a ADSL Internet Connection (1.5mbit downstream, 384kbit up). We get a
new IP at least once within 24h.

ip-up.d has some iptables stuff to enable masq/nat for the lan and
forwarding pptp connections to the windows 2003 server.

#!/bin/bash
iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 1723 -j DNAT
--to-destination 192.168.200.99
iptables -A FORWARD -i ppp0 -m state --state NEW -p tcp -d 192.168.200.99
--dport 1723 -j ACCEPT

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

the branch office's server has adsl connection too (dynamic ip at least once
in 24h. speed is different = 512/512). This Servers private Ip is
192.168.0.50. It is default gateway and dns server for the 192.168.0.0
network.

ip-up.d only executes one iptables command:

#!/bin/bash
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

Connecting the two servers with openvpn works fine. After the openvpn tunnel
is up each side adds a new route.

route add -net 192.168.0.0 netmask 255.255.255.0 gw $5

$5 gets translated to tun0

and route add -net 192.168.200.0 netmask 255.255.255.0 gw $5 

on the other box.

After this i'm able to ping from any box on one lan any other box on the
other lan . e.g. ping from 192.168.0.2 to 192.168.200.99.

Transfering files directly between the two routers work without error at
maximum possible speed (ftp 192.168.0.50 to/from 192.168.200.253). 

When i download something from the Windows 2003 Webserver through the tunnel
the connection gets reset at some time. (http request from 192.168.150 to
192.168.200.99) I also mounted a Share from the Windows Server and got very
bad throughput. Openvpn shows sometimes messages like write UDPv4 []: No
buffer space available (code=105). which originate from the tun device
afaik. I could get rid of these message through setting a outgoing
speedlimit somewhat below maximum line speed in openvpn. The connection gets
reset though. Copying Files of the share is still very very slow.

I allready asked about this problem on openvpn user mailinglist. Since
everything is ok when transfering files directly between the gateways i
suspect it's something interacting with iptables which causes this
behaviour.

The openvpn assigns 10.4.0.1 to the tun0 device in the HQ and 10.4.0.2 to
tun0 on the branch office's server. 

This is the routing table before starting the tunnel on 192.168.200.253:

peterstader:~# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
217.5.98.84     *               255.255.255.255 UH    0      0        0 ppp0
192.168.200.0   *               255.255.255.0   U     0      0        0 eth0
default         217.5.98.84     0.0.0.0         UG    0      0        0 ppp0

this is with openvpn tunnel running

peterstader:~# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
10.1.0.2        *               255.255.255.255 UH    0      0        0 tun0
217.5.98.84     *               255.255.255.255 UH    0      0        0 ppp0
localnet        10.1.0.2        255.255.255.0   UG    0      0        0 tun0
192.168.200.0   *               255.255.255.0   U     0      0        0 eth0
default         217.5.98.84     0.0.0.0         UG    0      0        0 ppp0

I got no clue what to do next to troubleshot this problem. I captured
packets with tethereal but i have no clue what to look for in the log file.
Or even which device i should capture (tun0, eth0, ppp0 (eth1)).

All help and suggestions highly appreciated.

Kind regards

Phil




