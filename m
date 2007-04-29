From: <sneak@ipnoc.co.za>
Subject: NATing Not wotking
Date: Sun, 29 Apr 2007 14:14:49 +0200
Message-ID: <000d01c78a57$fbe2ef90$648045ac@Sneak>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi,

as shown below Ive got 3 machines, i try ping machine 3 (IP 172.15.0.1) from 
Machine 1 (IP 10.22.200.25)
which has a route pointing to NAT server (IP 10.22.200.1), in hope that it 
would be natted to (172.15.0.15)
and machine3 would be able to speak to machine1. Now this is not the case. 
the TCP dump Below Indicates that
the Natting is happening, And I have enabled Ipforwading in /etc/sysctl.conf 
.. On that nat server im running Centos5 kernel 2.6.18-8

But I dont get any reply from Machine3 and when I do a tcpdump on machine3 I 
get ping requests
from 10.22.200.25 and not its natted address 172.15.0.15.


Is there something im missing in my iptables commands?
or kernel modules?


 +---------+          +---------+         +---------+
 |                |          |CentOS 5 |          |                |
 |machine 1 |          |   NAT     |          |machine 3 |
 |                |          |kernel       |          |                |
 |                |          |2.6.18-8   |          |                |
 +---------+          +---------+          +---------+
           a.|              b.|eth0 c.|eth1           d.|
  +--------------------------------------------------------------+
  | 
|
  | Switch 
|
  +--------------------------------------------------------------+

a.10.22.200.25 (natted address 172.15.0.15)
b.10.22.200.1
c.172.15.0.5
d.172.15.0.1



Machine 1 Routing table
=======================



[root@mach1 ~]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use 
Iface
10.22.200.0     0.0.0.0         255.255.255.128 U     0      0        0 eth1
172.69.128.0    0.0.0.0         255.255.255.128 U     0      0        0 eth0
172.15.0.0      10.22.200.1     255.255.255.0   UG    0      0        0 eth1
169.254.0.0     0.0.0.0         255.255.0.0     U     0      0        0 eth1
0.0.0.0         172.69.128.1    0.0.0.0         UG    0      0        0 eth0



Nat rules on Nat server
=======================
iptables -t nat -A POSTROUTING -o eth1 -s 10.22.200.25   -j SNAT --to 
172.15.0.15
iptables -t nat -A PREROUTING -i eth1 -d 172.15.0.15   -j DNAT --to 
10.22.200.25






-------

[root@mach1 ~]# ping 172.15.0.1
PING 172.15.0.1 (172.15.0.1) 56(84) bytes of data.

--- 172.15.0.1 ping statistics ---
25 packets transmitted, 0 received, 100% packet loss, time 23997ms


--------

[root@nat ~]# tcpdump -i eth1
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth1, link-type EN10MB (Ethernet), capture size 96 bytes



14:12:16.329663 arp who-has 172.15.0.1 tell 172.15.0.5
14:12:16.329718 arp reply 172.15.0.1 is-at 00:11:25:6e:05:4f (oui Unknown)
14:12:16.329725 IP 172.15.0.15 > 172.15.0.1: ICMP echo request, id 58439, 
seq 0, length 64
14:12:17.328748 IP 172.15.0.15 > 172.15.0.1: ICMP echo request, id 58439, 
seq 1, length 64
14:12:18.328540 IP 172.15.0.15 > 172.15.0.1: ICMP echo request, id 58439, 
seq 2, length 64
14:12:19.328356 IP 172.15.0.15 > 172.15.0.1: ICMP echo request, id 58439, 
seq 3, length 64
14:12:20.328139 IP 172.15.0.15 > 172.15.0.1: ICMP echo request, id 58439, 
seq 4, length 64
14:12:21.327945 IP 172.15.0.15 > 172.15.0.1: ICMP echo request, id 58439, 
seq 5, length 64
14:12:22.327752 IP 172.15.0.15 > 172.15.0.1: ICMP echo request, id 58439, 
seq 6, length 64
14:12:22.370038 arp who-has 172.15.0.15 tell 172.15.0.1
14:12:23.328546 IP 172.15.0.15 > 172.15.0.1: ICMP echo request, id 58439, 
seq 7, length 64
14:12:24.328346 IP 172.15.0.15 > 172.15.0.1: ICMP echo request, id 58439, 
seq 8, length 64
14:12:25.328148 IP 172.15.0.15 > 172.15.0.1: ICMP echo request, id 58439, 
seq 9, length 64
14:12:26.327939 IP 172.15.0.15 > 172.15.0.1: ICMP echo request, id 58439, 
seq 10, length 64
14:12:27.327745 IP 172.15.0.15 > 172.15.0.1: ICMP echo request, id 58439, 
seq 11, length 64
14:12:28.327537 IP 172.15.0.15 > 172.15.0.1: ICMP echo request, id 58439, 
seq 12, length 64




















