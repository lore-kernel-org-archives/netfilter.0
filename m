From: Markus Hochmann <lists4me@web.de>
Subject: iptables: log
Date: Tue, 10 Jun 2003 19:05:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E19Pmah-0001Ae-00@smtp.web.de>
Reply-To: lists4me@web.de
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello,

I am new here and hope I dont make a mistake :)

I have a router (to access the internet, DSL) from which I forwarded two 
ports (3456 tcp and udp) to 192.168.1.2 (the machine where I configure this 
fw).

Works fine, but today I have added a log, for all packets that should be 
droped. And I found some entries I cant explain. The first is this one:

Jun  10 18:31:44 tux kernel: Trash-Packet! Infos: IN=eth0 OUT= 
MAC=00:e0:7d:c5:e4:f3:00:50:ba:b8:a3:05:08:00 SRC=192.168.1.1 DST=192.168.1.2 
LEN=81 TOS=0x00 PREC=0xC0 TTL=255 ID=9997 PROTO=ICMP TYPE=5 CODE=1 
GATEWAY=192.168.1.2 [SRC=192.168.1.2 DST=192.168.1.2 LEN=53 TOS=0x00 
PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=3456 DPT=3456 LEN=33 ]

It always comes four times and then is a break of about 2.20h. Do I need this 
icmp-redirect message? And why only for the udp-port?
And the MAC is mine (00:e0:7d:c5:e4:f3), the routers (00:50:ba:b8:a3:05) and  
08:00. What is this 08:00 for? Its there to when there is a connection in the 
LAN (without the router).

And then I get multiple of these entries (I used overnet at that point, 
something like edonkey or emule => I connected to them and then getting some 
rejected ACK-RST and ACK-SYN):

Jun  10 18:41:05 tux kernel: Trash-Packet! Infos: IN=eth0 OUT= 
MAC=00:e0:7d:c5:e4:f3:00:50:ba:b8:a3:05:08:00 SRC=80.139.182.236        
DST=192.168.1.2 LEN=40 TOS=0x00 PREC=0x00 TTL=123 ID=11282 PROTO=TCP SPT=4662 
DPT=4038 WINDOW=0 RES=0x00 ACK RST URGP=0
Jun  7 18:43:13 tux kernel: Trash-Packet! Infos: IN=eth0 OUT= 
MAC=00:e0:7d:c5:e4:f3:00:50:ba:b8:a3:05:08:00 SRC=80.130.125.169        
DST=192.168.1.2 LEN=64 TOS=0x00 PREC=0x00 TTL=123 ID=58278 DF PROTO=TCP 
SPT=4662 DPT=4223 WINDOW=16944 RES=0x00 ACK SYN URGP=0

This is only when I use overnet! And it is always only port 4662, 4663, 8080 
and _never_ 25, 80, 110, 443, 6667, ...

Hopefully you can explain me these masseges, coz I dont want to block some 
important packets.

Greets,
Markus

This my fw-script up to now:
#!/bin/sh

#unload unneeded modules and load needed
{
  rmmod ipfwadm
  rmmod ipchains
  modprobe ip_tables
  modprobe ip_conntrack
} > /dev/null 2>&1

#clear the fw-table
iptables -F
iptables -X

#set general policy
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

#accept everything from interface lo
iptables -A INPUT -i lo -j ACCEPT

#allow conections to tcp/3456 (overnet)
iptables -A INPUT -p tcp --destination-port 3456 -j ACCEPT

#allow packets to udp/3456 (overnet)
iptables -A INPUT -p udp --destination-port 3456 -j ACCEPT

#allow some other essential msg
iptables -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT
iptables -A INPUT -p icmp --icmp-type source-quench -j ACCEPT
iptables -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
iptables -A INPUT -p icmp --icmp-type parameter-problem -j ACCEPT

#This is the msg from the router, dunno if nessesary
#iptables -A INPUT -p icmp --icmp-type redirect -j ACCEPT

#allow incomming ping-pong
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT

#let connection-packets pass Is this not enough?
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#drop packets which are regulary send out to everybody (windows SMB)
iptables -A INPUT -p udp --destination-port 137 -j DROP
iptables -A INPUT -p udp --destination-port 138 -j DROP
iptables -A INPUT -p udp --destination-port 520 -j DROP

#Log all packets which would be droped, only to see what is dropped
#will be removed in the final version
iptables -A INPUT -j LOG --log-level 0 --log-prefix "Trash-Packet! Infos: "

