From: Aldo Lagana <ALagana@p21.com>
Subject: RE: Download/upload speeds sluggish behind iptables firewall
Date: Fri, 7 May 2004 16:27:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0776B9DA384FFB4C94A6B73F7DC87A6003F35CA1@newman.p21.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'irie@networks.org'" <irie@networks.org>, netfilter@lists.netfilter.org


>the eth0:1 (192.168.0.3) is because Windows XP on 192.168.0.2 required a
secondary name server

I really dont know what you mean by that...but I bet that is part of your
slowdown...look UNIX and TCP/IP grew up at the same time - UNIX is as
efficient at TCP/IP as anything out there.

that being said whenever I see delays - they are always name resolution
issues - never packet forwarding/firewalling speed issues.


-----Original Message-----
From: Joe Riley [mailto:irie@networks.org]
Sent: Friday, May 07, 2004 4:13 PM
To: netfilter@lists.netfilter.org
Subject: Download/upload speeds sluggish behind iptables firewall


Dear mailing list,

I am having a problem with iptables. I have a very simple setup,
192.168.0.1 is the interface to the internet - receives speeds upward to
150kb/sec - and 192.168.0.2 is my windows xp computer, which is getting very
crippled speeds of about 10-50kb/sec 

i am asking what could be causing the problem here. i would like to make my
192.168.0.2's speed as fast as the firewall.

192.168.0.1 the server is fast, has no problem downloading files
and the 192.168.0.2 is slow, it is connected via crossover cable 100mbit  
and the connection from the wireless is shared.

here is a snipling from ifconfig / iwconfig  on the firewall displaying the
MTU size, etc
---
this is the internal lan:
eth0      Link encap:Ethernet  HWaddr 00:10:A4:01:B0:C7
          inet addr:192.168.0.1  Bcast:192.168.0.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:162037 errors:0 dropped:0 overruns:0 frame:0
          TX packets:138247 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:14620652 (13.9 Mb)  TX bytes:29320110 (27.9 Mb)
          Interrupt:3 Base address:0x300

eth0:1    Link encap:Ethernet  HWaddr 00:10:A4:01:B0:C7
          inet addr:192.168.0.3  Bcast:192.168.0.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          Interrupt:3 Base address:0x300

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:308 errors:0 dropped:0 overruns:0 frame:0
          TX packets:308 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:45106 (44.0 Kb)  TX bytes:45106 (44.0 Kb)
---
this is my internet connection:
wlan0     Link encap:Ethernet  HWaddr 00:07:50:XX:XX:B4
          inet addr:65.xx.17x.1xx  Bcast:65.xx.17x.255  Mask:255.255.255.0
          UP BROADCAST NOTRAILERS RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:328868 errors:0 dropped:0 overruns:0 frame:0
          TX packets:221065 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:201642105 (192.3 Mb)  TX bytes:23570375 (22.4 Mb)
          Interrupt:9 Base address:0x100
---
the eth0:1 (192.168.0.3) is because Windows XP on 192.168.0.2 required a
secondary name server


if this is still not enough information for you to pinpoint the problem,
maybe you can give me details of typical problems in the iptables
configuration that cause such reductions of download speed.

i know it has to be something very minor like a kernel configuration problem
or something. heres what i got in .config:
---
#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_MMAP is not set
# CONFIG_NETLINK_DEV is not set
CONFIG_NETFILTER=y
# CONFIG_NETFILTER_DEBUG is not set
# CONFIG_FILTER is not set
CONFIG_UNIX=y
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
# CONFIG_IP_MULTIPLE_TABLES is not set
# CONFIG_IP_ROUTE_MULTIPATH is not set
# CONFIG_IP_ROUTE_TOS is not set
# CONFIG_IP_ROUTE_VERBOSE is not set
# CONFIG_IP_PNP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE is not set
# CONFIG_IP_MROUTE is not set
# CONFIG_ARPD is not set
# CONFIG_INET_ECN is not set
# CONFIG_SYN_COOKIES is not set
#
#   IP: Netfilter Configuration
#
CONFIG_IP_NF_CONNTRACK=m
CONFIG_IP_NF_FTP=m
# CONFIG_IP_NF_AMANDA is not set
# CONFIG_IP_NF_TFTP is not set
CONFIG_IP_NF_IRC=m
# CONFIG_IP_NF_QUEUE is not set
CONFIG_IP_NF_IPTABLES=m
# CONFIG_IP_NF_MATCH_LIMIT is not set
# CONFIG_IP_NF_MATCH_MAC is not set
# CONFIG_IP_NF_MATCH_PKTTYPE is not set
# CONFIG_IP_NF_MATCH_MARK is not set
# CONFIG_IP_NF_MATCH_MULTIPORT is not set
# CONFIG_IP_NF_MATCH_TOS is not set
# CONFIG_IP_NF_MATCH_RECENT is not set
# CONFIG_IP_NF_MATCH_ECN is not set
# CONFIG_IP_NF_MATCH_DSCP is not set
# CONFIG_IP_NF_MATCH_AH_ESP is not set
# CONFIG_IP_NF_MATCH_LENGTH is not set
# CONFIG_IP_NF_MATCH_TTL is not set
# CONFIG_IP_NF_MATCH_TCPMSS is not set
# CONFIG_IP_NF_MATCH_HELPER is not set
# CONFIG_IP_NF_MATCH_STATE is not set
# CONFIG_IP_NF_MATCH_CONNTRACK is not set
# CONFIG_IP_NF_MATCH_UNCLEAN is not set
# CONFIG_IP_NF_MATCH_OWNER is not set
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_TARGET_MIRROR=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_NAT_NEEDED=y
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_REDIRECT=m
# CONFIG_IP_NF_NAT_LOCAL is not set
# CONFIG_IP_NF_NAT_SNMP_BASIC is not set
CONFIG_IP_NF_NAT_IRC=m
CONFIG_IP_NF_NAT_FTP=m
# CONFIG_IP_NF_MANGLE is not set
# CONFIG_IP_NF_TARGET_LOG is not set
# CONFIG_IP_NF_TARGET_ULOG is not set
# CONFIG_IP_NF_TARGET_TCPMSS is not set
# CONFIG_IP_NF_ARPTABLES is not set
# CONFIG_IP_NF_COMPAT_IPCHAINS is not set
# CONFIG_IP_NF_COMPAT_IPFWADM is not set

Here is output from iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
DROP       tcp  --  anywhere             anywhere            tcp
flags:FIN,SYN,RST,PSH,ACK,URG/NONE
DROP       tcp  --  anywhere             anywhere            tcp
flags:FIN,SYN/FIN,SYN
DROP       tcp  --  anywhere             anywhere            tcp
flags:SYN,RST/SYN,RST
DROP       tcp  --  anywhere             anywhere            tcp
flags:FIN,RST/FIN,RST
DROP       tcp  --  anywhere             anywhere            tcp
flags:FIN,ACK/FIN
DROP       tcp  --  anywhere             anywhere            tcp
flags:ACK,URG/URG

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
DROP       tcp  --  anywhere             antec.latitude.org  tcp
dpt:commplex-main
DROP       tcp  --  anywhere             antec.latitude.org  tcp
dpt:blackjack
DROP       tcp  --  anywhere             antec.latitude.org  tcp
dpt:microsoft-ds
DROP       tcp  --  anywhere             antec.latitude.org  tcp
dpt:netbios-ssn
DROP       tcp  --  anywhere             antec.latitude.org  tcp dpt:loc-srv
DROP       udp  --  anywhere             antec.latitude.org  udp dpt:ntp
DROP       udp  --  anywhere             antec.latitude.org  udp dpt:loc-srv
DROP       udp  --  anywhere             antec.latitude.org  udp
dpt:netbios-ns
DROP       udp  --  anywhere             antec.latitude.org  udp
dpt:netbios-dgm
DROP       udp  --  anywhere             antec.latitude.org  udp
dpt:microsoft-ds
DROP       udp  --  anywhere             antec.latitude.org  udp dpt:isakmp
DROP       udp  --  anywhere             antec.latitude.org  udp dpt:iad3
DROP       udp  --  anywhere             antec.latitude.org  udp dpt:1900

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

---
and lastly here is the iptables firewall script I use:
---
ifconfig eth0 inet 192.168.0.1 netmask 255.255.255.0 broadcast 192.168.0.255
modprobe ip_tables
modprobe iptable_filter
modprobe ip_conntrack
modprobe ip_conntrack_ftp
modprobe ip_conntrack_irc
modprobe iptable_nat
modprobe ip_nat_ftp
modprobe ip_nat_irc
echo 1 > /proc/sys/net/ipv4/ip_forward
/usr/sbin/iptables -t nat -A PREROUTING -d 65.77.170.112 -p tcp --dport
1:64999 -j DNAT --to 192.168.0.2
/usr/sbin/iptables -t nat -A PREROUTING -d 65.77.170.112 -p udp --dport
1:65535 -j DNAT --to 192.168.0.2
/usr/sbin/iptables -t nat -A POSTROUTING -o wlan0 -s 192.168.0.2 -j
MASQUERADE
/usr/sbin/iptables -t nat -P POSTROUTING ACCEPT
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 5000 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 1025 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 445 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 139 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 135 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p udp --dport 123 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p udp --dport 135 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p udp --dport 137 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p udp --dport 138 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p udp --dport 445 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p udp --dport 500 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p udp --dport 1032 -j DROP
/usr/sbin/iptables -A FORWARD -d 192.168.0.2 -p udp --dport 1900 -j DROP
/usr/sbin/iptables -A INPUT -i wlan0 -p tcp -m tcp --tcp-flags
FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
/usr/sbin/iptables -A INPUT -i wlan0 -p tcp -m tcp --tcp-flags SYN,FIN
SYN,FIN -j DROP
/usr/sbin/iptables -A INPUT -i wlan0 -p tcp -m tcp --tcp-flags SYN,RST
SYN,RST -j DROP
/usr/sbin/iptables -A INPUT -i wlan0 -p tcp -m tcp --tcp-flags FIN,RST
FIN,RST -j DROP
/usr/sbin/iptables -A INPUT -i wlan0 -p tcp -m tcp --tcp-flags ACK,FIN FIN
-j DROP
/usr/sbin/iptables -A INPUT -i wlan0 -p tcp -m tcp --tcp-flags ACK,URG URG
-j DROP


please give me some insightful ideas as to why this happening i have
provided all the information i possibly can
- joe

_____________________________________________________________
Proud member of United Networks Email, visit or report abuse at
http://networks.org/


Visit our website at http://www.p21.com/visit 
The information in this e-mail is confidential and may contain legally
privileged information.  It is intended solely for the person or entity to
which it is addressed.  Access to this e-mail by anyone else is
unauthorized. If you are not the intended recipient, any disclosure,
copying, distribution, action taken, or action omitted to be taken in
reliance on it, is prohibited and may be unlawful.  If you received this
e-mail in error, please contact the sender and delete the material from any
computer. 



