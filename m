From: bruce <bruce@gajshield.com>
Subject: iptables-- problem in loadbalancing(ROUTE) with bandwidth management
Date: Tue, 5 Oct 2004 19:02:00 +0530
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410051335.i95DZR001904@securegate.mailserver.gajshield.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I am involving in firewall development. I have one problem with bandwidth 
management (filtering by "fw" option)  and loadbalancing(using ROUTE patch) 
coming together.

Configuration is linux redhat kernal 2.4.27  and iptables v1.2.11

Testing  set up is follows

192.168.2.12 (source)------->
192.168.2.182(FW on eth0)
[aliases 192.168.8.1(eth1),192.168.9.1(eth2)]
------->192.168.9.2(Router)[aliases 192.168.8.2, 202.54.1.4] 
------------>202.54.1.5(destination)


Rules
==========
#nat rule for natting on external interface of firewall
/sbin/iptables -t nat -A POSTROUTING -o eth2 -p tcp -s 192.168.2.0/24 --sport 
1024:65535 -d 202.54.1.5 --dport 80 -j SNAT --to-source 192.168.9.1

# marking rule for packets
/sbin/iptables -A POSTROUTING -t mangle -o eth0 -p tcp -s 202.54.1.5 --sport 
80 -d 192.168.2.0/24 --dport 1024:65535 -j MARK --set-mark 0x41
/sbin/iptables -A POSTROUTING -t mangle -o eth2 -p tcp -s 192.168.2.0/24 
--sport 1024:65535 -d 202.54.1.5 --dport 80 -j MARK --set-mark 0x40

# loadbalancing rules
/sbin/iptables  -A POSTROUTING -t mangle  -p tcp -s 192.168.2.0/24 --sport 
1024:65535 -d 202.54.1.5 --dport 80 -m random --average 50 -j ROUTE --oif eth2
/sbin/iptables  -A POSTROUTING -t mangle  -p tcp -s 192.168.2.0/24 --sport 
1024:65535 -d 202.54.1.5 --dport 80 -j ROUTE --oif eth1


# filtering rules
/sbin/iptables -A FORWARD -p tcp -s 192.168.2.0/24 --sport 1024:65535 -d 
202.54.1.5 --dport 80 -j ACCEPT
/sbin/iptables -A FORWARD -p tcp -s 202.54.1.5 --sport 80 -d 192.168.2.0/24 
--dport 1024:65535 -j ACCEPT

# delete all existing qdisc 
/sbin/tc qdisc del dev eth0 root 2>/dev/null
/sbin/tc qdisc del dev eth1 root 2>/dev/null
/sbin/tc qdisc del dev eth2 root 2>/dev/null

# create parent qdisc 
/sbin/tc qdisc add dev eth1 root handle 2:0 cbq bandwidth 10mbps avpkt 1000 
cell 8
/sbin/tc qdisc add dev eth0 root handle 1:0 cbq bandwidth 10mbps avpkt 1000 
cell 8
/sbin/tc qdisc add dev eth2 root handle 3:0 cbq bandwidth 10mbps avpkt 1000 
cell 8

#class for eth2 
/sbin/tc class add dev eth2 parent 3:0 classid 3:1 cbq bandwidth 1000kbps 
rate 1000kbps allot 1514 cell 8 avpkt 1000
/sbin/tc qdisc  add dev eth2 parent 3:1 handle 100: sfq
/sbin/tc filter add dev eth2 protocol ip parent 3:0 handle 0x40 fw classid 3:1

#class for eth0
/sbin/tc class add dev eth0 parent 1:0 classid 1:1 cbq bandwidth 
1000kbps 
rate 1000kbps allot 1514 cell 8 avpkt 1000
/sbin/tc qdisc  add dev eth0 parent 1:1 handle 101: sfq
/sbin/tc filter add dev eth0 protocol ip parent 1:0 handle 0x41 fw classid 1:1

The firewall routing table is
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
192.168.2.0     0.0.0.0         255.255.255.0   U         0 0          0 eth0
192.168.9.0     0.0.0.0         255.255.255.0   U         0 0          0 eth2
192.168.8.0     0.0.0.0         255.255.255.0   U         0 0          0 eth1
169.254.0.0     0.0.0.0         255.255.0.0     U         0 0          0 eth2
127.0.0.0       0.0.0.0         255.0.0.0       U         0 0          0 lo
0.0.0.0         192.168.8.2     0.0.0.0         UG        0 0          0 eth1




The program is to get  http page from  202.54.1.5 , accessing from 
192.168.2.12. I am getting http page

But the problems are 
1.  natting is not working(ie on 202.54.1.5, it showing that the request came 
from 192.168.2.12)
2. The packets are not passing through the class(3:1) on eth2 device.
But it is passsing through eth0 

#/sbin/tc -s class show  dev eth2
class cbq 3: root rate 80Mbit (bounded,isolated) prio no-transmit
 Sent 1137 bytes 10 pkts (dropped 0, overlimits 0)
  borrowed 0 overactions 0 avgidle 77 undertime 0
class cbq 3:1 parent 3: leaf 100: rate 8000Kbit prio no-transmit
 Sent 0 bytes 0 pkts (dropped 0, overlimits 0)
  borrowed 0 overactions 0 avgidle 0 undertime 0

#/sbin/tc -s class show  dev eth0   THIS IS OK
class cbq 1: root rate 80Mbit (bounded,isolated) prio no-transmit
 Sent 13410 bytes 58 pkts (dropped 0, overlimits 0)
  borrowed 6 overactions 0 avgidle 77 undertime 0
class cbq 1:1 parent 1: leaf 101: rate 8000Kbit prio no-transmit
 Sent 7728 bytes 17 pkts (dropped 0, overlimits 0)
  borrowed 6 overactions 0 avgidle 77 undertime 0
 

Note: 
=========
SNAT with bandwith management is working properly. Also loadbalancing with 
SNAT is working properly. 

Doubts
========
I have doubts that any mismatching of target rules -j MARK and -j ROUTE 
in  mangle table?
Is there any importance of target rules order. ie. first MARK then ROUTE
 

		
if anybody have a solution please help me

THANKS IN ADVANCE
Bruce









