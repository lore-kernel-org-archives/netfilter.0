From: "Dhyanesh Ramaiya" <dhyanesh.ramaiya@satconet.com>
Subject: FIN packets not getting NAT-ed
Date: Tue, 20 Oct 2009 12:42:29 +0300
Message-ID: <200910200942.n9K9gTUS030470@dsmstclfw01.stcl.com.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Greetings,

I have setup a Linux firewall on the edge of the network and doing SNAT for
internal IPs. When I sniff on external interface for internal source IPs,I
am seeing FIN packets from internal IPs going out without being NAT-ed.
Below is an extract of my sniffer capture:

[root@edge01 ~]# tcpdump -i eth0 -fne net 192.168.0.0 mask 255.255.0.0 or
net 172.16.0.0 mask 255.240.0.0

12:30:35.222174 00:18:8b:f7:b4:05 > 00:21:d7:ae:9c:c8, ethertype IPv4
(0x0800), length 54: 172.16.122.182.tht-treasure > 64.59.88.178.http: F
0:0(0) ack 1 win 31557
12:30:35.336943 00:18:8b:f7:b4:05 > 00:21:d7:ae:9c:c8, ethertype IPv4
(0x0800), length 54: 192.168.125.67.63623 > 67.215.65.132.http: F 0:0(0) ack
1 win 65305
12:30:35.885919 00:18:8b:f7:b4:05 > 00:21:d7:ae:9c:c8, ethertype IPv4
(0x0800), length 54: 172.16.128.165.netmagic > 67.195.183.4.http: F 0:0(0)
ack 1 win 16862
12:30:37.182876 00:18:8b:f7:b4:05 > 00:21:d7:ae:9c:c8, ethertype IPv4
(0x0800), length 54: 172.16.123.18.miva-mqs > 213.215.116.226.http: R 0:0(0)
win 0

1900 packets captured
1928 packets received by filter
0 packets dropped by kernel

Below are the SNAT rules that I have setup on iptables (actual --to-source
IP has been changed to dummy IP):
-A POSTROUTING -s 192.168.0.0/16 -o eth0 -j SNAT  --to-source 1.2.3.4
-A POSTROUTING -s 172.16.0.0/12 -o eth0 -j SNAT  --to-source 1.2.3.5
-A POSTROUTING -s 10.0.0.0/8 -o eth0 -j SNAT  --to-source 1.2.3.6

I have also added the rules to block traffic sourced from my internal
network destined to RFC1918 IP subnets as below:
-A Blocked -p all -o eth0 --destination 10.0.0.0/8 -j DROP
-A Blocked -p all -o eth0 --destination 172.16.0.0/12 -j DROP
-A Blocked -p all -o eth0 --destination 192.168.0.0/16 -j DROP

Please assist to identify the source of this problem whereby FIN packets are
going out without being NAT-ed.

Thank you.

Dhyanesh Ramaiya
dhyanesh.ramaiya@satconet.com

Satcom Networks Africa Ltd.
Tel.: +255 22 2183961
Cel.: +255 784 514623

