From: "federico.disante" <federico.disante@duet.it>
Subject: LOG natted packet.
Date: Tue, 14 May 2013 17:37:17 +0200
Message-ID: <0c9a093fffc283dd8d4ea216e32a6763@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm the admin of a linux based router/firewall, that protects a LAN.

I would like to log the path follwed by a response packet of a
source-natted connection.

In the interfarce (eth1) connected to the ADSL modem, connected to
internet, the box does source nat, with the following rule

iptables -t nat -I POSTROUTING 1 -o eth1 -j SNAT --to-source 192.168.1.128

To log the packets back flow from the internet (from the host whose ip is
4.5.6.7) to the LAN, I write the following rules:

iptables -t mangle -I PREROUTING 1 -p tcp -s 4.5.6.7 -j LOG --log-prefix
"Packet_back_in_pre_mangle"

iptables -t nat -I PREROUTING 1 -p tcp -s 4.5.6.7 -j LOG --log-prefix
"Packet_back_in_pre_nat"
         
iptables -t mangle -I FORWARD 1 -p tcp -s 4.5.6.7 -j LOG --log-prefix
"Packet_back_in_forw_mangle"

The problem I have is that the LOG in the PREROUTING chain does not output
nothing. From the syslog I get the following

May 14 17:14:25 LinuxBasedFirewall kernel: [3651139.713796]
Packet_back_in_pre_mangle IN=eth1 OUT=
MAC=00:e0:18:b1:16:82:00:60:3b:29:f1:3f:08:00 SRC=4.5.6.7 DST=192.168.1.128
LEN=44 TOS=0x00 PREC=0x00 TTL=54 ID=0 DF PROTO=TCP SPT=443 DPT=1263
WINDOW=14600 RES=0x00 ACK SYN URGP=0

May 14 17:14:25 LinuxBasedFirewall kernel: [3651139.713892]
Packet_back_in_forw_mangle IN=eth1 OUT=eth1 SRC=4.5.6.7 DST=192.168.10.192
LEN=44 TOS=0x00 PREC=0x00 TTL=53 ID=0 DF PROTO=TCP SPT=443 DPT=1263
WINDOW=14600 RES=0x00 ACK SYN URGP=0 MARK=0x1e

The log clearly show the back translation of the source natted packet
(from the natted ip 192.168.1.128 to the original source ip
192.168.10.192).

My question is: why I do not get the log from the nat table in the
PREROUTING chain? It seems the packet disappears in the nat table in the
PREROUTING chain and reappears in the mangle table in the FORWARD chain!
Any suggestions?

Thank you,
Federico
