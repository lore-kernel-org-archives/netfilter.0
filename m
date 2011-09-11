From: Mike <ipso@snappymail.ca>
Subject: v2.6.16 to v2.6.38 breaks routing?
Date: Sun, 11 Sep 2011 16:06:41 -0700
Message-ID: <4E6D3F01.4060807@snappymail.ca>
Reply-To: ipso@snappymail.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I'm in the process of upgrading an older Linux router from Mandriva 
running kernel v2.6.16 to Ubuntu running v2.6.38 kernel, however my 
moderately complex firewall/routing script doesn't quite work the same 
way on the newer system. The basic idea is that I have three routes to 
three different ISPs, and one to the internal network. I then mark 
packets to go out a specific ISP depending on the type of traffic. This 
all works fine if the packets are initiated from the router itself or 
from a computer on the intenral network with packets destined out the 
default ISP, but it fails completely if the packets are initiated from a 
computer on the internal network destined out an non-default route.

What I don't understand is I diff'd the routing tables and all iptables 
commands they are virtually identical between the two servers, yet the 
newer server doesn't work as expected.

Linux server 2.6.38-10-server #44-Ubuntu SMP Thu Jun 2 21:49:30 UTC 2011 
x86_64 x86_64 x86_64 GNU/Linux

eth0 = ISP1
eth1 = Local network
eth2 = ISP2
tun0 = VPN to ISP3

root@server:/etc# ip route show | sort
10.8.0.0/24 dev tun0  proto kernel  scope link  src 10.8.0.2
174.4.4.74 dev eth0  scope link  src 174.4.4.74
174.4.4.0/22 dev eth0  proto kernel  scope link  src 174.4.4.74  metric 10
192.168.1.0/24 dev eth1  proto kernel  scope link  src 192.168.1.1  
metric 10
50.92.224.0/19 dev eth2  proto kernel  scope link  src 50.92.247.211  
metric 10
50.92.247.211 dev eth2  scope link  src 50.92.247.211
63.211.239.14 via 50.92.224.1 dev eth2
8.3.252.23 via 50.92.224.1 dev eth2
default via 174.4.4.1 dev eth0

root@server:~# ip rule show
0:      from all lookup local
32760:  from all fwmark 0x3 lookup VPN1
32761:  from all fwmark 0x2 lookup ISP2
32762:  from all fwmark 0x1 lookup ISP1
32763:  from 10.8.0.2 lookup VPN1
32764:  from 50.92.247.211 lookup ISP2
32765:  from 174.4.4.74 lookup ISP1
32766:  from all lookup main
32767:  from all lookup default

root@server:~# iptables -S
-P INPUT ACCEPT
-P FORWARD ACCEPT
-P OUTPUT ACCEPT
-A INPUT -s 207.150.193.134/32 -p tcp -m tcp --dport 5060:5061 -j ACCEPT
-A INPUT -s 64.34.96.201/32 -p tcp -m tcp --dport 5060:5061 -j ACCEPT
-A INPUT -s 64.34.96.202/32 -p tcp -m tcp --dport 5060:5061 -j ACCEPT
-A INPUT -s 8.3.252.23/32 -p tcp -m tcp --dport 5060:5061 -j ACCEPT
-A INPUT -s 63.211.239.14/32 -p tcp -m tcp --dport 5060:5061 -j ACCEPT
-A INPUT -s 207.150.193.134/32 -p udp -m udp --dport 5060:5061 -j ACCEPT
-A INPUT -s 64.34.96.201/32 -p udp -m udp --dport 5060:5061 -j ACCEPT
-A INPUT -s 64.34.96.202/32 -p udp -m udp --dport 5060:5061 -j ACCEPT
-A INPUT -s 8.3.252.23/32 -p udp -m udp --dport 5060:5061 -j ACCEPT
-A INPUT -s 63.211.239.14/32 -p udp -m udp --dport 5060:5061 -j ACCEPT
-A INPUT -i eth0 -p tcp -m tcp --dport 5060:5061 -j DROP
-A INPUT -i eth2 -p tcp -m tcp --dport 5060:5061 -j DROP
-A INPUT -i eth0 -p udp -m udp --dport 5060:5061 -j DROP
-A INPUT -i eth2 -p udp -m udp --dport 5060:5061 -j DROP
-A INPUT -s 68.75.86.8/32 -j DROP
-A INPUT -s 174.133.3.178/32 -j DROP

root@server:~# iptables -S -t nat
-P PREROUTING ACCEPT
-P INPUT ACCEPT
-P OUTPUT ACCEPT
-P POSTROUTING ACCEPT
-A PREROUTING -i eth0 -p tcp -m tcp --dport 88 -j DNAT --to-destination 
192.168.1.19
-A PREROUTING -i eth0 -p tcp -m tcp --dport 3074 -j DNAT 
--to-destination 192.168.1.19
-A PREROUTING -i eth2 -p tcp -m tcp --dport 88 -j DNAT --to-destination 
192.168.1.19
-A PREROUTING -i eth2 -p tcp -m tcp --dport 3074 -j DNAT 
--to-destination 192.168.1.19
-A PREROUTING -i eth0 -p tcp -m tcp --dport 8080 -j DNAT 
--to-destination 192.168.1.9:80
-A PREROUTING -i eth0 -p tcp -m tcp --dport 443 -j DNAT --to-destination 
192.168.1.9:443
-A PREROUTING -i eth0 -p tcp -m tcp --dport 4343 -j DNAT 
--to-destination 192.168.1.9:443
-A PREROUTING -i eth0 -p tcp -m tcp --dport 69 -j DNAT --to-destination 
192.168.1.9:69
-A PREROUTING -i eth0 -p udp -m udp --dport 69 -j DNAT --to-destination 
192.168.1.9:69
-A PREROUTING -i eth0 -p tcp -m tcp --dport 22 -j DNAT --to-destination 
192.168.1.9:22
-A PREROUTING -i eth0 -p tcp -m tcp --dport 2323 -j DNAT 
--to-destination 192.168.1.201:23
-A PREROUTING -i eth0 -p tcp -m tcp --dport 2380 -j DNAT 
--to-destination 192.168.1.201:80
-A PREROUTING -i eth0 -p tcp -m tcp --dport 5501 -j DNAT 
--to-destination 192.168.1.98:5501
-A PREROUTING -i eth0 -p tcp -m tcp --dport 5800 -j DNAT 
--to-destination 192.168.1.98:5800
-A PREROUTING -i eth0 -p tcp -m tcp --dport 5900 -j DNAT 
--to-destination 192.168.1.98:5900
-A PREROUTING -i eth0 -p tcp -m tcp --dport 5901 -j DNAT 
--to-destination 192.168.1.98:5901
-A PREROUTING -i eth0 -p tcp -m tcp --dport 5902 -j DNAT 
--to-destination 192.168.1.98:5902
-A PREROUTING -i eth0 -p tcp -m tcp --dport 5903 -j DNAT 
--to-destination 192.168.1.98:5903
-A PREROUTING -i eth0 -p tcp -m tcp --dport 5904 -j DNAT 
--to-destination 192.168.1.98:5904
-A PREROUTING -i eth0 -p tcp -m tcp --dport 5910 -j DNAT 
--to-destination 192.168.1.9:5900
-A PREROUTING -i eth0 -p tcp -m tcp --dport 40696 -j DNAT 
--to-destination 192.168.1.99:40696
-A PREROUTING -i eth0 -p tcp -m tcp --dport 50263 -j DNAT 
--to-destination 192.168.1.9:50263
-A PREROUTING -i eth0 -p udp -m udp --dport 4444 -j DNAT 
--to-destination 192.168.1.9:4444
-A PREROUTING -i eth0 -p udp -m udp --dport 6881 -j DNAT 
--to-destination 192.168.1.9:6881
-A PREROUTING -i eth0 -p tcp -m tcp --dport 6881 -j DNAT 
--to-destination 192.168.1.9:6881
-A PREROUTING -i eth0 -p udp -m udp --dport 1200 -j DNAT 
--to-destination 192.168.1.98:1200
-A PREROUTING -i eth0 -p udp -m udp --dport 27000:27015 -j DNAT 
--to-destination 192.168.1.98
-A PREROUTING -i eth0 -p tcp -m tcp --dport 27030:27039 -j DNAT 
--to-destination 192.168.1.98
-A POSTROUTING -o tun0 -j SNAT --to-source 10.8.0.2
-A POSTROUTING -o eth2 -j SNAT --to-source 50.92.247.211
-A POSTROUTING -o eth0 -j SNAT --to-source 174.4.4.74

root@server:~# iptables -S -t mangle
-P PREROUTING ACCEPT
-P INPUT ACCEPT
-P FORWARD ACCEPT
-P OUTPUT ACCEPT
-P POSTROUTING ACCEPT
-A PREROUTING -i eth1 -p udp -m udp --dport 4569 -j MARK --set-xmark 
0x2/0xffffffff
-A PREROUTING -p udp -m udp --dport 5060:5061 -j MARK --set-xmark 
0x2/0xffffffff
-A PREROUTING -p udp -m udp --dport 10000:20000 -j MARK --set-xmark 
0x2/0xffffffff
-A PREROUTING -s 192.168.1.19/32 -i eth1 -j MARK --set-xmark 0x3/0xffffffff
-A PREROUTING -d 69.53.236.17/32 -i eth1 -p tcp -m tcp --dport 80 -j 
MARK --set-xmark 0x3/0xffffffff
-A PREROUTING -d 69.53.236.17/32 -i eth1 -p tcp -m tcp --dport 443 -j 
MARK --set-xmark 0x3/0xffffffff
-A PREROUTING -d 24.244.52.99/32 -i eth1 -p tcp -m tcp --dport 80 -j 
MARK --set-xmark 0x3/0xffffffff
-A PREROUTING -d 24.244.52.81/32 -i eth1 -p tcp -m tcp --dport 80 -j 
MARK --set-xmark 0x3/0xffffffff
-A PREROUTING -d 24.244.52.104/32 -i eth1 -p tcp -m tcp --dport 80 -j 
MARK --set-xmark 0x3/0xffffffff
-A PREROUTING -d 24.244.52.83/32 -i eth1 -p tcp -m tcp --dport 80 -j 
MARK --set-xmark 0x3/0xffffffff
-A PREROUTING -d 24.244.52.104/32 -i eth1 -p tcp -m tcp --dport 443 -j 
MARK --set-xmark 0x3/0xffffffff
-A PREROUTING -d 24.244.52.83/32 -i eth1 -p tcp -m tcp --dport 443 -j 
MARK --set-xmark 0x3/0xffffffff
-A PREROUTING -d 64.59.168.13/32 -i eth1 -j MARK --set-xmark 0x1/0xffffffff
-A PREROUTING -d 64.59.168.15/32 -i eth1 -j MARK --set-xmark 0x1/0xffffffff
-A PREROUTING -d 154.11.128.187/32 -i eth1 -j MARK --set-xmark 
0x2/0xffffffff
-A PREROUTING -d 154.11.128.59/32 -i eth1 -j MARK --set-xmark 0x2/0xffffffff
-A PREROUTING -p tcp -m tcp --sport 80 -j TOS --set-tos 0x10/0x3f
-A PREROUTING -p tcp -m tcp --sport 22 -j TOS --set-tos 0x10/0x3f
-A PREROUTING -p tcp -m tcp --sport 4569 -j TOS --set-tos 0x10/0x3f
-A PREROUTING -p tcp -m tcp --sport 21 -j TOS --set-tos 0x10/0x3f
-A PREROUTING -p tcp -m tcp --sport 20 -j TOS --set-tos 0x08/0x3f
-A PREROUTING -p icmp -m icmp --icmp-type 8 -j TOS --set-tos 0x10/0x3f
-A PREROUTING -p udp -j TOS --set-tos 0x10/0x3f
-A OUTPUT -p tcp -m tcp --dport 80 -j TOS --set-tos 0x10/0x3f
-A OUTPUT -p tcp -m tcp --dport 22 -j TOS --set-tos 0x10/0x3f
-A OUTPUT -p tcp -m tcp --dport 4569 -j TOS --set-tos 0x10/0x3f
-A OUTPUT -p tcp -m tcp --dport 21 -j TOS --set-tos 0x10/0x3f
-A OUTPUT -p tcp -m tcp --dport 20 -j TOS --set-tos 0x08/0x3f
-A OUTPUT -p icmp -m icmp --icmp-type 8 -j TOS --set-tos 0x10/0x3f
-A OUTPUT -p udp -j TOS --set-tos 0x10/0x3f

root@server:~# iptables -S -t raw
-P PREROUTING ACCEPT
-P OUTPUT ACCEPT

I enabled logging on each table/chain to try and diagnose where the 
issue is, below is the output of several single packet ping tests. The 
lines starting with "a" are logging at the first rule in each 
table/chain and lines starting with "z" are the last rule.

SUCCESS: Ping from router (with marking enabled)
Sep 10 15:36:47 server kernel: [11147.602519] aMANGLE:OUTPUT: IN= 
OUT=tun0 SRC=10.8.0.2 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 
DF PROTO=ICMP TYPE=8 CODE=0 ID=22025 SEQ=1 UID=0 GID=0 MARK=0x3
Sep 10 15:36:47 server kernel: [11147.602530] zMANGLE:OUTPUT: IN= 
OUT=tun0 SRC=10.8.0.2 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=64 ID=0 
DF PROTO=ICMP TYPE=8 CODE=0 ID=22025 SEQ=1 UID=0 GID=0 MARK=0x3
Sep 10 15:36:47 server kernel: [11147.602543] aNAT:OUTPUT: IN= OUT=tun0 
SRC=10.8.0.2 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=64 ID=0 DF 
PROTO=ICMP TYPE=8 CODE=0 ID=22025 SEQ=1 UID=0 GID=0 MARK=0x3
Sep 10 15:36:47 server kernel: [11147.602550] zNAT:OUTPUT: IN= OUT=tun0 
SRC=10.8.0.2 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=64 ID=0 DF 
PROTO=ICMP TYPE=8 CODE=0 ID=22025 SEQ=1 UID=0 GID=0 MARK=0x3
Sep 10 15:36:47 server kernel: [11147.602560] aFILTER:OUTPUT: IN= 
OUT=tun0 SRC=10.8.0.2 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=64 ID=0 
DF PROTO=ICMP TYPE=8 CODE=0 ID=22025 SEQ=1 UID=0 GID=0 MARK=0x3
Sep 10 15:36:47 server kernel: [11147.602567] zFILTER:OUTPUT: IN= 
OUT=tun0 SRC=10.8.0.2 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=64 ID=0 
DF PROTO=ICMP TYPE=8 CODE=0 ID=22025 SEQ=1 UID=0 GID=0 MARK=0x3
Sep 10 15:36:47 server kernel: [11147.602575] aMANGLE:POSTROUTING: IN= 
OUT=tun0 SRC=10.8.0.2 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=64 ID=0 
DF PROTO=ICMP TYPE=8 CODE=0 ID=22025 SEQ=1 UID=0 GID=0 MARK=0x3
Sep 10 15:36:47 server kernel: [11147.602583] zMANGLE:POSTROUTING: IN= 
OUT=tun0 SRC=10.8.0.2 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=64 ID=0 
DF PROTO=ICMP TYPE=8 CODE=0 ID=22025 SEQ=1 UID=0 GID=0 MARK=0x3
Sep 10 15:36:47 server kernel: [11147.734585] aMANGLE:PREROUTING: 
IN=tun0 OUT= MAC= SRC=8.8.8.8 DST=10.8.0.2 LEN=84 TOS=0x00 PREC=0x00 
TTL=52 ID=64821 PROTO=ICMP TYPE=0 CODE=0 ID=22025 SEQ=1
Sep 10 15:36:47 server kernel: [11147.734594] zMANGLE:PREROUTING: 
IN=tun0 OUT= MAC= SRC=8.8.8.8 DST=10.8.0.2 LEN=84 TOS=0x00 PREC=0x00 
TTL=52 ID=64821 PROTO=ICMP TYPE=0 CODE=0 ID=22025 SEQ=1
Sep 10 15:36:47 server kernel: [11147.734602] aMANGLE:INPUT: IN=tun0 
OUT= MAC= SRC=8.8.8.8 DST=10.8.0.2 LEN=84 TOS=0x00 PREC=0x00 TTL=52 
ID=64821 PROTO=ICMP TYPE=0 CODE=0 ID=22025 SEQ=1
Sep 10 15:36:47 server kernel: [11147.734608] zMANGLE:INPUT: IN=tun0 
OUT= MAC= SRC=8.8.8.8 DST=10.8.0.2 LEN=84 TOS=0x00 PREC=0x00 TTL=52 
ID=64821 PROTO=ICMP TYPE=0 CODE=0 ID=22025 SEQ=1
Sep 10 15:36:47 server kernel: [11147.734614] aFILTER:INPUT: IN=tun0 
OUT= MAC= SRC=8.8.8.8 DST=10.8.0.2 LEN=84 TOS=0x00 PREC=0x00 TTL=52 
ID=64821 PROTO=ICMP TYPE=0 CODE=0 ID=22025 SEQ=1
Sep 10 15:36:47 server kernel: [11147.734621] zFILTER:INPUT: IN=tun0 
OUT= MAC= SRC=8.8.8.8 DST=10.8.0.2 LEN=84 TOS=0x00 PREC=0x00 TTL=52 
ID=64821 PROTO=ICMP TYPE=0 CODE=0 ID=22025 SEQ=1

FAILS: Ping from Client (with marking enabled 0x3)
Sep 10 15:37:21 server kernel: [11181.508668] aMANGLE:PREROUTING: 
IN=eth1 OUT= MAC=f4:6d:04:9a:15:2d:00:1f:f3:d5:2d:78:08:00 
SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=56590 
PROTO=ICMP TYPE=8 CODE=0 ID=62237 SEQ=0
Sep 10 15:37:21 server kernel: [11181.508682] zMANGLE:PREROUTING: 
IN=eth1 OUT= MAC=f4:6d:04:9a:15:2d:00:1f:f3:d5:2d:78:08:00 
SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=64 ID=56590 
PROTO=ICMP TYPE=8 CODE=0 ID=62237 SEQ=0 MARK=0x3
Sep 10 15:37:21 server kernel: [11181.508694] aNAT:PREROUTING: IN=eth1 
OUT= MAC=f4:6d:04:9a:15:2d:00:1f:f3:d5:2d:78:08:00 SRC=192.168.1.236 
DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=64 ID=56590 PROTO=ICMP TYPE=8 
CODE=0 ID=62237 SEQ=0 MARK=0x3
Sep 10 15:37:21 server kernel: [11181.508704] zNAT:PREROUTING: IN=eth1 
OUT= MAC=f4:6d:04:9a:15:2d:00:1f:f3:d5:2d:78:08:00 SRC=192.168.1.236 
DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=64 ID=56590 PROTO=ICMP TYPE=8 
CODE=0 ID=62237 SEQ=0 MARK=0x3
Sep 10 15:37:21 server kernel: [11181.508758] aMANGLE:FORWARD: IN=eth1 
OUT=tun0 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=63 
ID=56590 PROTO=ICMP TYPE=8 CODE=0 ID=62237 SEQ=0 MARK=0x3
Sep 10 15:37:21 server kernel: [11181.508765] zMANGLE:FORWARD: IN=eth1 
OUT=tun0 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=63 
ID=56590 PROTO=ICMP TYPE=8 CODE=0 ID=62237 SEQ=0 MARK=0x3
Sep 10 15:37:21 server kernel: [11181.508773] aFILTER:FORWARD: IN=eth1 
OUT=tun0 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=63 
ID=56590 PROTO=ICMP TYPE=8 CODE=0 ID=62237 SEQ=0 MARK=0x3
Sep 10 15:37:21 server kernel: [11181.508779] zFILTER:FORWARD: IN=eth1 
OUT=tun0 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=63 
ID=56590 PROTO=ICMP TYPE=8 CODE=0 ID=62237 SEQ=0 MARK=0x3
Sep 10 15:37:21 server kernel: [11181.508787] aMANGLE:POSTROUTING: IN= 
OUT=tun0 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=63 
ID=56590 PROTO=ICMP TYPE=8 CODE=0 ID=62237 SEQ=0 MARK=0x3
Sep 10 15:37:21 server kernel: [11181.508793] zMANGLE:POSTROUTING: IN= 
OUT=tun0 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=63 
ID=56590 PROTO=ICMP TYPE=8 CODE=0 ID=62237 SEQ=0 MARK=0x3
Sep 10 15:37:21 server kernel: [11181.642875] aMANGLE:PREROUTING: 
IN=tun0 OUT= MAC= SRC=8.8.8.8 DST=10.8.0.2 LEN=84 TOS=0x00 PREC=0x00 
TTL=52 ID=64822 PROTO=ICMP TYPE=0 CODE=0 ID=62237 SEQ=0
Sep 10 15:37:21 server kernel: [11181.642885] zMANGLE:PREROUTING: 
IN=tun0 OUT= MAC= SRC=8.8.8.8 DST=10.8.0.2 LEN=84 TOS=0x00 PREC=0x00 
TTL=52 ID=64822 PROTO=ICMP TYPE=0 CODE=0 ID=62237 SEQ=0

FAILS: Ping from Client (with marking enabled: 0x2)
Sep 11 10:09:19 server kernel: [77836.447776] aMANGLE:PREROUTING: 
IN=eth1 OUT= MAC=f4:6d:04:9a:15:2d:00:1f:f3:d5:2d:78:08:00 
SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=13133 
PROTO=ICMP TYPE=8 CODE=0 ID=812 SEQ=0
Sep 11 10:09:19 server kernel: [77836.447789] zMANGLE:PREROUTING: 
IN=eth1 OUT= MAC=f4:6d:04:9a:15:2d:00:1f:f3:d5:2d:78:08:00 
SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=13133 
PROTO=ICMP TYPE=8 CODE=0 ID=812 SEQ=0 MARK=0x2
Sep 11 10:09:19 server kernel: [77836.447801] aNAT:PREROUTING: IN=eth1 
OUT= MAC=f4:6d:04:9a:15:2d:00:1f:f3:d5:2d:78:08:00 SRC=192.168.1.236 
DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=13133 PROTO=ICMP TYPE=8 
CODE=0 ID=812 SEQ=0 MARK=0x2
Sep 11 10:09:19 server kernel: [77836.447811] zNAT:PREROUTING: IN=eth1 
OUT= MAC=f4:6d:04:9a:15:2d:00:1f:f3:d5:2d:78:08:00 SRC=192.168.1.236 
DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=13133 PROTO=ICMP TYPE=8 
CODE=0 ID=812 SEQ=0 MARK=0x2
Sep 11 10:09:19 server kernel: [77836.447843] aMANGLE:FORWARD: IN=eth1 
OUT=eth2 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=63 
ID=13133 PROTO=ICMP TYPE=8 CODE=0 ID=812 SEQ=0 MARK=0x2
Sep 11 10:09:19 server kernel: [77836.447850] zMANGLE:FORWARD: IN=eth1 
OUT=eth2 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=63 
ID=13133 PROTO=ICMP TYPE=8 CODE=0 ID=812 SEQ=0 MARK=0x2
Sep 11 10:09:19 server kernel: [77836.447857] aFILTER:FORWARD: IN=eth1 
OUT=eth2 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=63 
ID=13133 PROTO=ICMP TYPE=8 CODE=0 ID=812 SEQ=0 MARK=0x2
Sep 11 10:09:19 server kernel: [77836.447863] zFILTER:FORWARD: IN=eth1 
OUT=eth2 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=63 
ID=13133 PROTO=ICMP TYPE=8 CODE=0 ID=812 SEQ=0 MARK=0x2
Sep 11 10:09:19 server kernel: [77836.447870] aMANGLE:POSTROUTING: IN= 
OUT=eth2 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=63 
ID=13133 PROTO=ICMP TYPE=8 CODE=0 ID=812 SEQ=0 MARK=0x2
Sep 11 10:09:19 server kernel: [77836.447877] zMANGLE:POSTROUTING: IN= 
OUT=eth2 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=63 
ID=13133 PROTO=ICMP TYPE=8 CODE=0 ID=812 SEQ=0 MARK=0x2
Sep 11 10:09:19 server kernel: [77836.501409] aMANGLE:PREROUTING: 
IN=eth2 OUT= MAC=00:1b:21:8c:07:34:00:90:1a:a0:7c:04:08:00 SRC=8.8.8.8 
DST=50.92.247.211 LEN=84 TOS=0x00 PREC=0x00 TTL=54 ID=5396 PROTO=ICMP 
TYPE=0 CODE=0 ID=812 SEQ=0
Sep 11 10:09:19 server kernel: [77836.501421] zMANGLE:PREROUTING: 
IN=eth2 OUT= MAC=00:1b:21:8c:07:34:00:90:1a:a0:7c:04:08:00 SRC=8.8.8.8 
DST=50.92.247.211 LEN=84 TOS=0x00 PREC=0x00 TTL=54 ID=5396 PROTO=ICMP 
TYPE=0 CODE=0 ID=812 SEQ=0

SUCCESS: Ping from client (with marking enabled: 0x1 [default ISP1])
Sep 11 15:50:24 server kernel: [19600.171454] aMANGLE:PREROUTING: 
IN=eth1 OUT= MAC=f4:6d:04:9a:15:2d:00:1f:f3:d5:2d:78:08:00 
SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=17642 
PROTO=ICMP TYPE=8 CODE=0 ID=16944 SEQ=0
Sep 11 15:50:24 server kernel: [19600.171467] zMANGLE:PREROUTING: 
IN=eth1 OUT= MAC=f4:6d:04:9a:15:2d:00:1f:f3:d5:2d:78:08:00 
SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=17642 
PROTO=ICMP TYPE=8 CODE=0 ID=16944 SEQ=0 MARK=0x1
Sep 11 15:50:24 server kernel: [19600.171479] aNAT:PREROUTING: IN=eth1 
OUT= MAC=f4:6d:04:9a:15:2d:00:1f:f3:d5:2d:78:08:00 SRC=192.168.1.236 
DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=17642 PROTO=ICMP TYPE=8 
CODE=0 ID=16944 SEQ=0 MARK=0x1
Sep 11 15:50:24 server kernel: [19600.171489] zNAT:PREROUTING: IN=eth1 
OUT= MAC=f4:6d:04:9a:15:2d:00:1f:f3:d5:2d:78:08:00 SRC=192.168.1.236 
DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=17642 PROTO=ICMP TYPE=8 
CODE=0 ID=16944 SEQ=0 MARK=0x1
Sep 11 15:50:24 server kernel: [19600.171500] aMANGLE:FORWARD: IN=eth1 
OUT=eth0 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=63 
ID=17642 PROTO=ICMP TYPE=8 CODE=0 ID=16944 SEQ=0 MARK=0x1
Sep 11 15:50:24 server kernel: [19600.171506] zMANGLE:FORWARD: IN=eth1 
OUT=eth0 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=63 
ID=17642 PROTO=ICMP TYPE=8 CODE=0 ID=16944 SEQ=0 MARK=0x1
Sep 11 15:50:24 server kernel: [19600.171513] aFILTER:FORWARD: IN=eth1 
OUT=eth0 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=63 
ID=17642 PROTO=ICMP TYPE=8 CODE=0 ID=16944 SEQ=0 MARK=0x1
Sep 11 15:50:24 server kernel: [19600.171520] zFILTER:FORWARD: IN=eth1 
OUT=eth0 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=63 
ID=17642 PROTO=ICMP TYPE=8 CODE=0 ID=16944 SEQ=0 MARK=0x1
Sep 11 15:50:24 server kernel: [19600.171527] aMANGLE:POSTROUTING: IN= 
OUT=eth0 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=63 
ID=17642 PROTO=ICMP TYPE=8 CODE=0 ID=16944 SEQ=0 MARK=0x1
Sep 11 15:50:24 server kernel: [19600.171534] zMANGLE:POSTROUTING: IN= 
OUT=eth0 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=63 
ID=17642 PROTO=ICMP TYPE=8 CODE=0 ID=16944 SEQ=0 MARK=0x1
Sep 11 15:50:24 server kernel: [19600.214666] aMANGLE:PREROUTING: 
IN=eth0 OUT= MAC=f4:6d:04:9a:07:bd:00:30:b8:c9:5c:90:08:00 SRC=8.8.8.8 
DST=174.4.4.74 LEN=84 TOS=0x00 PREC=0x00 TTL=54 ID=59275 PROTO=ICMP 
TYPE=0 CODE=0 ID=16944 SEQ=0
Sep 11 15:50:24 server kernel: [19600.214678] zMANGLE:PREROUTING: 
IN=eth0 OUT= MAC=f4:6d:04:9a:07:bd:00:30:b8:c9:5c:90:08:00 SRC=8.8.8.8 
DST=174.4.4.74 LEN=84 TOS=0x00 PREC=0x00 TTL=54 ID=59275 PROTO=ICMP 
TYPE=0 CODE=0 ID=16944 SEQ=0
Sep 11 15:50:24 server kernel: [19600.214690] aMANGLE:FORWARD: IN=eth0 
OUT=eth1 SRC=8.8.8.8 DST=192.168.1.236 LEN=84 TOS=0x00 PREC=0x00 TTL=53 
ID=59275 PROTO=ICMP TYPE=0 CODE=0 ID=16944 SEQ=0
Sep 11 15:50:24 server kernel: [19600.214696] zMANGLE:FORWARD: IN=eth0 
OUT=eth1 SRC=8.8.8.8 DST=192.168.1.236 LEN=84 TOS=0x00 PREC=0x00 TTL=53 
ID=59275 PROTO=ICMP TYPE=0 CODE=0 ID=16944 SEQ=0
Sep 11 15:50:24 server kernel: [19600.214702] aFILTER:FORWARD: IN=eth0 
OUT=eth1 SRC=8.8.8.8 DST=192.168.1.236 LEN=84 TOS=0x00 PREC=0x00 TTL=53 
ID=59275 PROTO=ICMP TYPE=0 CODE=0 ID=16944 SEQ=0
Sep 11 15:50:24 server kernel: [19600.214709] zFILTER:FORWARD: IN=eth0 
OUT=eth1 SRC=8.8.8.8 DST=192.168.1.236 LEN=84 TOS=0x00 PREC=0x00 TTL=53 
ID=59275 PROTO=ICMP TYPE=0 CODE=0 ID=16944 SEQ=0
Sep 11 15:50:24 server kernel: [19600.214715] aMANGLE:POSTROUTING: IN= 
OUT=eth1 SRC=8.8.8.8 DST=192.168.1.236 LEN=84 TOS=0x00 PREC=0x00 TTL=53 
ID=59275 PROTO=ICMP TYPE=0 CODE=0 ID=16944 SEQ=0
Sep 11 15:50:24 server kernel: [19600.214721] zMANGLE:POSTROUTING: IN= 
OUT=eth1 SRC=8.8.8.8 DST=192.168.1.236 LEN=84 TOS=0x00 PREC=0x00 TTL=53 
ID=59275 PROTO=ICMP TYPE=0 CODE=0 ID=16944 SEQ=0

SUCCESS: Ping from client (WITHOUT marking)
Sep 10 15:44:21 server kernel: [11601.127159] aMANGLE:PREROUTING: 
IN=eth1 OUT= MAC=f4:6d:04:9a:15:2d:00:1f:f3:d5:2d:78:08:00 
SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=31275 
PROTO=ICMP TYPE=8 CODE=0 ID=3358 SEQ=0
Sep 10 15:44:21 server kernel: [11601.127173] zMANGLE:PREROUTING: 
IN=eth1 OUT= MAC=f4:6d:04:9a:15:2d:00:1f:f3:d5:2d:78:08:00 
SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=64 ID=31275 
PROTO=ICMP TYPE=8 CODE=0 ID=3358 SEQ=0
Sep 10 15:44:21 server kernel: [11601.127185] aNAT:PREROUTING: IN=eth1 
OUT= MAC=f4:6d:04:9a:15:2d:00:1f:f3:d5:2d:78:08:00 SRC=192.168.1.236 
DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=64 ID=31275 PROTO=ICMP TYPE=8 
CODE=0 ID=3358 SEQ=0
Sep 10 15:44:21 server kernel: [11601.127194] zNAT:PREROUTING: IN=eth1 
OUT= MAC=f4:6d:04:9a:15:2d:00:1f:f3:d5:2d:78:08:00 SRC=192.168.1.236 
DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=64 ID=31275 PROTO=ICMP TYPE=8 
CODE=0 ID=3358 SEQ=0
Sep 10 15:44:21 server kernel: [11601.127207] aMANGLE:FORWARD: IN=eth1 
OUT=eth0 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=63 
ID=31275 PROTO=ICMP TYPE=8 CODE=0 ID=3358 SEQ=0
Sep 10 15:44:21 server kernel: [11601.127213] zMANGLE:FORWARD: IN=eth1 
OUT=eth0 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=63 
ID=31275 PROTO=ICMP TYPE=8 CODE=0 ID=3358 SEQ=0
Sep 10 15:44:21 server kernel: [11601.127220] aFILTER:FORWARD: IN=eth1 
OUT=eth0 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=63 
ID=31275 PROTO=ICMP TYPE=8 CODE=0 ID=3358 SEQ=0
Sep 10 15:44:21 server kernel: [11601.127226] zFILTER:FORWARD: IN=eth1 
OUT=eth0 SRC=192.168.1.236 DST=8.8.8.8 LEN=84 TOS=0x10 PREC=0x00 TTL=63 
ID=31275 PROTO=ICMP TYPE=8 CODE=0 ID=3358 SEQ=0
Sep 10 15:44:21 server kernel: [11601.169794] aMANGLE:FORWARD: IN=eth0 
OUT=eth1 SRC=8.8.8.8 DST=192.168.1.236 LEN=84 TOS=0x00 PREC=0x00 TTL=53 
ID=37282 PROTO=ICMP TYPE=0 CODE=0 ID=3358 SEQ=0
Sep 10 15:44:21 server kernel: [11601.169804] zMANGLE:FORWARD: IN=eth0 
OUT=eth1 SRC=8.8.8.8 DST=192.168.1.236 LEN=84 TOS=0x00 PREC=0x00 TTL=53 
ID=37282 PROTO=ICMP TYPE=0 CODE=0 ID=3358 SEQ=0
Sep 10 15:44:21 server kernel: [11601.169811] aFILTER:FORWARD: IN=eth0 
OUT=eth1 SRC=8.8.8.8 DST=192.168.1.236 LEN=84 TOS=0x00 PREC=0x00 TTL=53 
ID=37282 PROTO=ICMP TYPE=0 CODE=0 ID=3358 SEQ=0
Sep 10 15:44:21 server kernel: [11601.169818] zFILTER:FORWARD: IN=eth0 
OUT=eth1 SRC=8.8.8.8 DST=192.168.1.236 LEN=84 TOS=0x00 PREC=0x00 TTL=53 
ID=37282 PROTO=ICMP TYPE=0 CODE=0 ID=3358 SEQ=0

Whenever marking is enabled for anything other than the default ISP and 
the packet originates from a internal computer, the packets get out and 
upon return they seem to get dropped at the router after the mangle 
prerouting chain.

I know it has to be something simple, but I'm all out of ideas at this 
point, especially since the comparison between the two servers is a 
match as far as I can tell. You can see the same output from the old 
server and new server for a comparison here:

http://pastebin.com/EvmzfCe1
http://pastebin.com/xNSt60D9

Any help would be greatly appreciated.

-- 
Mike

