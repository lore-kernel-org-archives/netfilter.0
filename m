From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: DNAT to 127 fails
Date: Fri, 5 Aug 2005 11:44:54 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508051141020.31142@yvahk01.tjqt.qr>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter User Mailing List <netfilter@lists.netfilter.org>

Hi,


Connection from anywhere-on-the-internet (dsl0) to alphagate:80 only does not 
work when --to-dest is 127.0.0.1. It works with 192.168.44.1.
(It's not a bridge problem, that for sure!)
Why? Some routing problem?


iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-dest 127.0.0.1:8000

11:40 alphagate:/etc # route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
213.23.208.1    0.0.0.0         255.255.255.255 UH    0      0        0 dsl0
192.168.44.0    0.0.0.0         255.255.255.0   U     0      0        0 br0
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
0.0.0.0         213.23.208.1    0.0.0.0         UG    0      0        0 dsl0

11:42 alphagate:/etc # ip a l
1: lo: <LOOPBACK,UP> mtu 16436 qdisc noqueue
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
6: br0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue
    link/ether 00:40:f4:79:b3:85 brd ff:ff:ff:ff:ff:ff
    inet 192.168.44.1/24 brd 192.168.44.255 scope global br0
19: dsl0: <POINTOPOINT,MULTICAST,NOARP,UP> mtu 1492 qdisc pfifo_fast qlen 3
    link/ppp
    inet 213.23.218.138 peer 213.23.208.1/32 scope global dsl0



Jan Engelhardt
-- 

