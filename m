From: Bernhard Rosenkraenzer <bero@linux.cd>
Subject: Weird NAT problem
Date: Sat, 1 Nov 2008 23:07:18 +0100
Message-ID: <200811012307.18305.bero@linux.cd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
I've set up a basic masquerading NAT box to share a PPPoE connection between 
various boxes.

I've done the same thing the same way before without running into trouble - 
but this time, clients have no problem keeping an existing transfer going, 
but initiating connections seems to be troublesome.

The basic setup: The line comes in to my eth0; I'm using rp-pppoe 3.10 and ppp 
2.4.4 (with kernel mode PPPoE enabled) on Linux 2.6.27.2, iptables userland 
1.4.1.1 (also tried 1.4.2-rc1, same results).
eth0 doesn't have an IP address assigned (but ppp0 on top of eth0 does).

eth1 uses IP address 192.168.1.1/255.255.255.0, and connects to the other 
boxes through a switch.

I'm doing

echo 1 >/proc/sys/net/ipv4/ip_forward
echo 1 >/proc/sys/net/ipv4/conf/all/forwarding
iptables -P INPUT ACCEPT
iptables -F INPUT
iptables -P OUTPUT ACCEPT
iptables -F OUTPUT
iptables -P FORWARD DROP
iptables -F FORWARD
iptables -A FORWARD -i ppp0 -o eth1 -m state --state ESTABLISHED,RELATED -j 
ACCEPT
iptables -A FORWARD -i eth1 -o ppp0 -j ACCEPT
iptables -t nat -F
iptables -t nat -A POSTROUTING -s 192.168.2.0/255.255.255.0 -o ppp0 -j 
MASQUERADE

There are several public IPs on the PPPoE connection, so I use

iptables -t nat -A PREROUTING -d XXX.XXX.XXX.XXX -j DNAT --to-destination 
192.168.2.2
iptables -t nat -A POSTROUTING -s 192.168.2.2 -j SNAT --to-source 
XXX.XXX.XXX.XXX

to make 192.168.2.2 reachable from the outside world (but the troubles start 
before doing that).


On 192.168.2.2, a lot of things work:

$ ping ftp.ch.kernel.org
PING ftp.ch.kernel.org (212.40.5.79): 56 data bytes
64 bytes from 212.40.5.79: icmp_seq=0 ttl=61 time=11.645 ms
[...]
$ traceroute ftp.ch.kernel.org
traceroute to ftp.ch.kernel.org (212.40.5.79), 64 hops max, 40 byte packets
 1  192.168.2.1 (192.168.2.1)  0.551 ms  0.258 ms  0.231 ms
 2  bas-flu-as-10-01-lb-1.vtxnet.net (212.254.136.1)  10.988 ms  11.018 ms  
10.728 ms
 3  bas-flu-cr-76-02-ge-2-3.vtxnet.net (212.147.63.190)  11.476 ms  11.367 ms  
11.479 ms
 4  ftp.datacomm.ch (212.40.5.79)  10.739 ms  11.558 ms  10.972 ms

BUT

$ curl -o kernel.tar.bz2 
http://ftp.ch.kernel.org/pub/linux/kernel/v2.6/linux-2.6.27.tar.bz2

hangs without getting any data.


There is no problem with the line itself, because I can use everything on the 
router just fine, and I can even scp huge files from the outside to the 
public IP of 192.168.2.2 without running into the slightest problems.

I've tried doing some bad stuff like

iptables -P FORWARD ACCEPT

to make sure my rules are ok, and it didn't change anything.

192.168.2.2 is an OSX box - an OS I happen to know next to nothing about 
(Linux purist here...), 192.168.2.3 behaves the same way as 192.168.2.2, and 
is a Linux box running on 192.168.2.2 inside Parallels Server.

Any idea what's going wrong there? Is there anything I'm overlooking with my 
routing setup, or do I need to look for the problem on the OSX side?

Thanks
Bernhard
