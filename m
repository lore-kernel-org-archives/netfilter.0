From: Jorge Davila <isaac@nicaraguarealestate.com>
Subject: Re: Problem with nat table in iptables
Date: Thu, 27 May 2004 15:19:42 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40B65B6E.2050103@nicaraguarealestate.com>
References: <40B6322E.6050205@nicaraguarealestate.com> <200405272055.28159.Antony@Soft-Solutions.co.uk> <40B652F0.1070107@nicaraguarealestate.com> <200405272148.26466.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405272148.26466.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

The rule than I want add to the INPUT chain is:

iptables -I INPUT 2 -s 192.168.0.0/255.255.255.0 -d 64.152.73.182 -j DROP

When execute the above command and then
iptables-save

and restart iptables the nat table has disappeared

This the output of 

iptables -L -nvx; iptables -L -t nat -nvx


iptables -L -nvx; iptables -L -t nat -nvx
Chain INPUT (policy DROP 158 packets, 8534 bytes)
    pkts      bytes target     prot opt in     out     
source               destination
     179    12124 bad_tcp_packets  tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0
       0        0 ACCEPT     all  --  lo     *       
127.0.0.1            0.0.0.0/0
       2       88 ACCEPT     all  --  *      *       
192.168.0.0/24       0.0.0.0/0
       0        0 ACCEPT     all  --  eth1   *       
192.168.0.1          0.0.0.0/0
       0        0 ACCEPT     all  --  lo     *       
192.168.0.1          0.0.0.0/0
      24     2612 ACCEPT     all  --  lo     *       
216.6.48.95          0.0.0.0/0
       0        0 ACCEPT     udp  --  eth1   *       
0.0.0.0/0            0.0.0.0/0           udp spt:68 dpt:67
      22     1624 ACCEPT     all  --  *      *       
0.0.0.0/0            216.6.48.95         state RELATED,ESTABLISHED
     149     7980 tcp_packets  tcp  --  eth0   *       
0.0.0.0/0            0.0.0.0/0
      12      743 udp_packets  udp  --  eth0   *       
0.0.0.0/0            0.0.0.0/0
       0        0 icmp_packets  icmp --  eth0   *       
0.0.0.0/0            0.0.0.0/0
       0        0 DROP       all  --  eth0   *       
0.0.0.0/0            224.0.0.0/8
       6      300 LOG        all  --  *      *       
0.0.0.0/0            0.0.0.0/0           limit: avg 3/min burst 3 LOG 
flags 0 level 7 prefix `IPT INPUT packet died: '
 
Chain FORWARD (policy DROP 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     
source               destination
       0        0 bad_tcp_packets  tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0
       0        0 ACCEPT     all  --  eth0   *       
0.0.0.0/0            0.0.0.0/0
       0        0 ACCEPT     all  --  *      *       
0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
       0        0 LOG        all  --  *      *       
0.0.0.0/0            0.0.0.0/0           limit: avg 3/min burst 3 LOG 
flags 0 level 7 prefix `IPT FORWARD packet died: '
 
Chain OUTPUT (policy DROP 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     
source               destination
      49    18380 bad_tcp_packets  tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0
       0        0 ACCEPT     all  --  *      *       
127.0.0.1            0.0.0.0/0
       1       48 ACCEPT     all  --  *      *       
192.168.0.1          0.0.0.0/0
      51    17531 ACCEPT     all  --  *      *       
216.6.48.95          0.0.0.0/0
       0        0 LOG        all  --  *      *       
0.0.0.0/0            0.0.0.0/0           limit: avg 3/min burst 3 LOG 
flags 0 level 7 prefix `IPT OUTPUT packet died: '
 
Chain allowed (8 references)
    pkts      bytes target     prot opt in     out     
source               destination
       2      120 ACCEPT     tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0           tcp flags:0x16/0x02
       0        0 ACCEPT     tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
       0        0 DROP       tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0
 
Chain bad_tcp_packets (3 references)
    pkts      bytes target     prot opt in     out     
source               destination
       0        0 REJECT     tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0           tcp flags:0x12/0x12 state NEW 
reject-with tcp-reset
      44     7465 LOG        tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0           tcp flags:!0x16/0x02 state NEW 
LOG flags 0 level 4 prefix `Nuevo no syn: '
      44     7465 DROP       tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0           tcp flags:!0x16/0x02 state NEW
 
Chain icmp_packets (1 references)
    pkts      bytes target     prot opt in     out     
source               destination
       0        0 ACCEPT     icmp --  *      *       
0.0.0.0/0            0.0.0.0/0           icmp type 8
       0        0 ACCEPT     icmp --  *      *       
0.0.0.0/0            0.0.0.0/0           icmp type 11
 
Chain tcp_packets (1 references)
    pkts      bytes target     prot opt in     out     
source               destination
       0        0 allowed    tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0           tcp dpt:22
       0        0 allowed    tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0           tcp dpt:25
       2      120 allowed    tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0           tcp dpt:80
       0        0 allowed    tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0           tcp dpt:110
       0        0 allowed    tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0           tcp dpt:113
       0        0 allowed    tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0           tcp dpt:143
       0        0 allowed    tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0           tcp dpt:993
       0        0 allowed    tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0           tcp dpt:995
 
Chain udp_packets (1 references)
    pkts      bytes target     prot opt in     out     
source               destination
       1       69 ACCEPT     udp  --  *      *       
0.0.0.0/0            0.0.0.0/0           udp dpt:53
       0        0 ACCEPT     udp  --  *      *       
0.0.0.0/0            0.0.0.0/0           udp dpt:123
       0        0 ACCEPT     udp  --  *      *       
0.0.0.0/0            0.0.0.0/0           udp dpt:2074
       0        0 ACCEPT     udp  --  *      *       
0.0.0.0/0            0.0.0.0/0           udp dpt:4000
       0        0 DROP       udp  --  eth0   *       
0.0.0.0/0            216.6.48.255        udp dpts:135:139
       0        0 DROP       udp  --  eth0   *       
0.0.0.0/0            255.255.255.255     udp dpts:67:68
Chain PREROUTING (policy ACCEPT 181 packets, 12774 bytes)
    pkts      bytes target     prot opt in     out     
source               destination
       0        0 REDIRECT   tcp  --  eth1   *       
192.168.0.0/24       0.0.0.0/0           tcp dpt:80 redir ports 3128
 
Chain POSTROUTING (policy ACCEPT 1 packets, 68 bytes)
    pkts      bytes target     prot opt in     out     
source               destination
       2      147 SNAT       all  --  *      eth0    
0.0.0.0/0            0.0.0.0/0           to:216.6.48.95
 
Chain OUTPUT (policy ACCEPT 33 packets, 4472 bytes)
    pkts      bytes target     prot opt in     out     
source               destination



