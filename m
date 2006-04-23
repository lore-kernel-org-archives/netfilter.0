From: lukas@tank.eu.org
Subject: Not NATed packets
Date: Sun, 23 Apr 2006 17:04:34 +0200 (CEST)
Message-ID: <Pine.LNX.4.64N.0604231700330.6204@tank.eu.org>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hi there
I have strange problem with NAT.
I have kernel 2.6.14.7-5 and iptables-1.3.3-6@2.6.14.7_5 and I use nat to 
share my home network on one public ip.
NAT configuration is simple but some packets are not NATed - on my public 
interface packets with source address of my internal (NATed) network 
appears and i have no clue what is wrong.

I tryed:
- to use SNAT instead of MASQUERADE
- diferent network cards
- diferent PC
- diferent kernel
- many diferent iptables configuration

Is anyone have a idea what can be wrong ?

tcpdump -i eth0 -n -vvv |grep 10.10.10
16:30:39.015880 IP (tos 0x0, ttl 127, id 28594, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.104.3689 > 83.29.48.50.6881: F, cksum 
0x1623 (correct), 3885889894:3885889894(0) ack 3151418643 win 65535
16:32:14.987691 IP (tos 0x0, ttl 127, id 55701, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.104.3689 > 83.29.48.50.6881: F, cksum 
0x1623 (correct), 0:0(0) ack 1 win 65535
16:34:14.996658 IP (tos 0x0, ttl 127, id 6582, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.104.3689 > 83.29.48.50.6881: F, cksum 
0x1623 (correct), 0:0(0) ack 1 win 65535
16:36:50.209347 IP (tos 0x0, ttl 127, id 29938, offset 0, flags [DF], 
proto: TCP (6), length: 612) 10.10.10.104.3779 > 62.195.80.212.6881: FP 
4211640358:4211640930(572) ack 4076174940 win 65467
16:41:02.531491 IP (tos 0x0, ttl 127, id 12374, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.106.1224 > 217.96.89.139.80: R, cksum 
0x7e36 (correct), 1532046053:1532046053(0) ack 3047309971 win 0
17:03:00.361901 IP (tos 0x0, ttl 127, id 28252, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.106.1044 > 64.152.73.140.80: R, cksum 
0x6dba (correct), 2101015522:2101015522(0) ack 3552965504 win 0
17:08:21.299312 IP (tos 0x0, ttl 127, id 23907, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.104.4201 > 62.43.9.255.8601: F, cksum 
0x13b8 (correct), 3283228993:3283228993(0) ack 1610246617 win 65535
17:23:05.771272 IP (tos 0x0, ttl 127, id 54404, offset 0, flags [DF], 
proto: TCP (6), length: 612) 10.10.10.104.4388 > 80.224.86.144.11510: FP 
2712689086:2712689658(572) ack 3966653462 win 65467
17:41:30.080404 IP (tos 0x0, ttl 127, id 35623, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.104.4593 > 83.20.178.58.6881: F, 
cksum 0x8e61 (correct), 545571229:545571229(0) ack 4264072226 win 65467
17:43:30.086802 IP (tos 0x0, ttl 127, id 40899, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.104.4593 > 83.20.178.58.6881: F, 
cksum 0x8e61 (correct), 0:0(0) ack 1 win 65467
17:57:20.784291 IP (tos 0x0, ttl 127, id 12161, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.104.4836 > 81.232.66.10.27015: F, 
cksum 0x0f8a (correct), 1396937025:1396937025(0) ack 1135013016 win 65535
18:31:54.537480 IP (tos 0x0, ttl 127, id 39418, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.104.1324 > 81.232.66.10.27015: F, 
cksum 0xd48a (correct), 1916158042:1916158042(0) ack 1661945819 win 65535
18:51:11.680846 IP (tos 0x0, ttl 127, id 4651, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.112.1035 > 208.174.60.61.80: R, cksum 
0xec56 (correct), 877644103:877644103(0) win 0
18:51:11.680908 IP (tos 0x0, ttl 127, id 4652, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.112.1036 > 208.175.188.61.80: R, 
cksum 0xef09 (correct), 885278103:885278103(0) win 0
18:53:16.394703 IP (tos 0x0, ttl 127, id 33468, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.104.1566 > 80.224.86.144.11510: F, 
cksum 0x99b3 (correct), 3140707125:3140707125(0) ack 2527136685 win 65467
19:32:18.666316 IP (tos 0x0, ttl 127, id 13515, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.104.2041 > 84.77.24.199.4663: F, 
cksum 0xf208 (correct), 248022218:248022218(0) ack 2303565438 win 65535
19:33:33.908501 IP (tos 0x0, ttl 127, id 17092, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.104.2041 > 84.77.24.199.4663: F, 
cksum 0xf208 (correct), 0:0(0) ack 1 win 65535
03:54:45.613606 IP (tos 0x0, ttl  63, id 23506, offset 0, flags [DF], 
proto: TCP (6), length: 52) 10.10.10.2.2770 > 217.149.246.5.21: R, cksum 
0xe969 (correct), 3284961714:3284961714(0) ack 4025764409 win 1989 
<nop,nop,timestamp 155860672 485114788>
03:54:45.614335 IP (tos 0x0, ttl  63, id 27118, offset 0, flags [DF], 
proto: TCP (6), length: 52) 10.10.10.2.2208 > 217.153.11.26.2121: R, cksum 
0x1c13 (correct), 2275106033:2275106033(0) ack 1233749439 win 1728 
<nop,nop,timestamp 155860672 1617725243>
10:57:22.429824 IP (tos 0x0, ttl 127, id 2151, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.110.1180 > 212.191.130.194.80: R, 
cksum 0x1aad (correct), 4150758452:4150758452(0) ack 3914748052 win 0
11:08:30.449915 IP (tos 0x0, ttl 127, id 3167, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.110.1223 > 213.251.163.98.80: R, 
cksum 0xf015 (correct), 3114778154:3114778154(0) ack 666642057 win 0
11:08:30.450689 IP (tos 0x0, ttl 127, id 3168, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.110.1257 > 213.251.163.213.80: R, 
cksum 0x2dd7 (correct), 769668751:769668751(0) ack 3053022552 win 0
11:08:30.469383 IP (tos 0x0, ttl 127, id 3169, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.110.1222 > 213.251.163.213.80: R, 
cksum 0x0c96 (correct), 1485272056:1485272056(0) ack 3014076670 win 0
11:08:30.470110 IP (tos 0x0, ttl 127, id 3170, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.110.1224 > 213.251.163.213.80: R, 
cksum 0x3d03 (correct), 2078528536:2078528536(0) ack 3018683596 win 0
11:08:30.470767 IP (tos 0x0, ttl 127, id 3171, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.110.1226 > 213.251.163.213.80: R, 
cksum 0x6073 (correct), 4121342605:4121342605(0) ack 3017472308 win 0
11:08:30.471835 IP (tos 0x0, ttl 127, id 3172, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.110.1220 > 213.251.134.64.80: R, 
cksum 0x2fcf (correct), 2946854746:2946854746(0) ack 1919357468 win 0
11:08:30.472480 IP (tos 0x0, ttl 127, id 3173, offset 0, flags [DF], 
proto: TCP (6), length: 40) 10.10.10.110.1225 > 213.251.134.64.80: R, 
cksum 0xed5c (correct), 1448158471:1448158471(0) ack 1917843528 win 0


Network conf
ip r
10.10.10.0/24 dev eth1  proto kernel  scope link  src 10.10.10.1
200.200.200.0/24 dev eth0  proto kernel  scope link  src 200.200.200.200
default via 200.200.200.10 dev eth0 onlink


my iptables configuration is :
iptables -F
iptables -X
iptables -Z

iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

iptables -A INPUT -p tcp -j ACCEPT -m state --state ESTABLISHED,RELATED
iptables -A INPUT -p udp -j ACCEPT -m state --state ESTABLISHED,RELATED
iptables -A INPUT -p icmp -j ACCEPT -m state --state ESTABLISHED,RELATED

iptables -t nat -F
iptables -t nat -X
iptables -t nat -Z

modprobe ipt_state
modprobe iptable_nat
modprobe ip_conntrack_ftp
modprobe ip_nat_ftp

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth0 -s 10.10.10.0/24 -j DROP

iptables -A INPUT -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT
iptables -A INPUT -p tcp --dport 20 -i eth0 -d 200.200.200.200 -j ACCEPT
iptables -A INPUT -p tcp --dport 21 -i eth0 -d 200.200.200.200 -j ACCEPT
iptables -A INPUT -p udp --dport 21 -i eth0 -d 200.200.200.200 -j ACCEPT
iptables -A INPUT -p tcp --dport 88 -i eth0 -d 200.200.200.200 -j ACCEPT
iptables -A INPUT -p tcp --dport 88 -i eth1 -s 10.10.10.2 -j ACCEPT
iptables -A INPUT -p tcp --dport 2222 -i eth0 -d 200.200.200.200 -j ACCEPT
iptables -A INPUT -p tcp --dport 25 -i eth0 -d 200.200.200.200 -j ACCEPT
iptables -A INPUT -p udp --dport 25 -i eth0 -d 200.200.200.200 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -i eth0 -d 200.200.200.200 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -i eth0 -d 200.200.200.200 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -i eth0 -d 200.200.200.200 -j ACCEPT
iptables -A INPUT -p tcp --dport 110 -i eth0 -d 200.200.200.200 -j ACCEPT
iptables -A INPUT -p icmp -i eth0 -d 200.200.200.200 -j ACCEPT

iptables -A INPUT -p tcp --dport 2222 -i eth1 -d 10.10.10.1 -j ACCEPT
iptables -A INPUT -p tcp --dport 25 -i eth1 -d 10.10.10.1 -j ACCEPT
iptables -A INPUT -p udp --dport 25 -i eth1 -d 10.10.10.1 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -i eth1 -d 10.10.10.1 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -i eth1 -d 10.10.10.1 -j ACCEPT
iptables -A INPUT -p tcp --dport 110 -i eth1 -d 10.10.10.1 -j ACCEPT
iptables -A INPUT -p udp --dport 110 -i eth1 -d 10.10.10.1 -j ACCEPT
iptables -A INPUT -p icmp -i eth1 -d 10.10.10.1 -j ACCEPT

iptables -A FORWARD -s 10.10.10.2 -j ACCEPT
iptables -A FORWARD -s 10.10.10.103 -j ACCEPT
iptables -A FORWARD -s 10.10.10.104 -m mac --mac-source 00:04:00:b3:3d:b2 
-j ACCEPT
iptables -A FORWARD -s 10.10.10.105 -m mac --mac-source 00:40:00:8e:2c:8c 
-j ACCEPT
iptables -A FORWARD -s 10.10.10.106 -m mac --mac-source 00:0a:00:04:c2:bc 
-j ACCEPT
iptables -A FORWARD -s 10.10.10.107 -m mac --mac-source 00:4f:00:13:70:7a 
-j ACCEPT
iptables -A FORWARD -s 10.10.10.108 -m mac --mac-source 00:40:00:6d:ea:34 
-j ACCEPT
iptables -A FORWARD -s 10.10.10.109 -m mac --mac-source 00:40:00:cf:16:9c 
-j ACCEPT
iptables -A FORWARD -s 10.10.10.110 -m mac --mac-source 00:4F:00:60:72:4E 
-j ACCEPT
iptables -A FORWARD -s 10.10.10.111  -j ACCEPT
iptables -A FORWARD -s 10.10.10.112 -m mac --mac-source 00:10:00:A2:98:1F 
-j ACCEPT

iptables -A FORWARD -d 10.10.10.2 -j ACCEPT
iptables -A FORWARD -d 10.10.10.103 -j ACCEPT
iptables -A FORWARD -d 10.10.10.104 -j ACCEPT
iptables -A FORWARD -d 10.10.10.105 -j ACCEPT
iptables -A FORWARD -d 10.10.10.106 -j ACCEPT
iptables -A FORWARD -d 10.10.10.107 -j ACCEPT
iptables -A FORWARD -d 10.10.10.108 -j ACCEPT
iptables -A FORWARD -d 10.10.10.109 -j ACCEPT
iptables -A FORWARD -d 10.10.10.110 -j ACCEPT
iptables -A FORWARD -d 10.10.10.111 -j ACCEPT
iptables -A FORWARD -d 10.10.10.112 -j ACCEPT


Please Help
Lukas


