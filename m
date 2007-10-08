From: Florin Andrei <florin@andrei.myip.org>
Subject: counter-intuitive TCP behavior under UDP flood
Date: Mon, 08 Oct 2007 15:35:58 -0700
Message-ID: <470AB0CE.4080803@andrei.myip.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dual-homed firewall, eth0 is the outside interface (public IP 
addresses), eth1 is the private interface (private IP addresses).
Web servers are on the private interface, firewall is doing 1:1 NAT for 
each web server to its own public address (alias) on the outside interface.
Kernel is 2.6.18. Machine is 2 x AMD64 dual core. Network card is Intel 
Pro/1000 PCI Express 4x dual gigabit port; driver is slightly tweaked 
via modprobe.conf options.
Allowed inbound protocols to the web servers: HTTP, SSH, a handful of 
ICMP types.
Full iptables rules quoted at the end of the message.

Test case:
While downloading a huge file over HTTP from a server in an infinite 
loop (start new download immediately after previous download has 
finished), flood the firewall with small UDP packets with random source 
IPs. The destination UDP address is the test web server, but the 
destination port is blocked by the firewall.
UDP flood generator is another Linux machine running pktgen. See pktgen 
options at the end.

Results:
Before the UDP flood has started, the HTTP download speed is 112 Mbyte / 
sec (gigabit ports are saturated) and quite stable. Two CPU cores on the 
firewall are at 30%si.
After starting the UDP flood, the HTTP download continues as if nothing 
happened (maybe a bit slower due to slightly reduced available bandwidth 
on the outside interface). One CPU core goes up to 100%si and 0%id, the 
other stays at 30%si.
But the next download doesn't start if UDP flood keeps going. Why is that?

Since the existing download continues unperturbed, I expected the next 
download to start. But it doesn't. Could that be related to connection 
tracking perhaps?
Sometimes the next HTTP download does start, but it's extremely slow and 
after a while it stops.
Anything in /proc I should try first, to see if I can somehow allow the 
next download to start?


#######################################
# iptables -L -n -v -t nat
Chain PREROUTING (policy ACCEPT 2 packets, 1560 bytes)
  pkts bytes target     prot opt in     out     source 
destination
7283K  335M DNAT       all  --  eth0   *       0.0.0.0/0 
10.123.0.253        to:10.123.1.253

Chain POSTROUTING (policy ACCEPT 31 packets, 1869 bytes)
  pkts bytes target     prot opt in     out     source 
destination
     1  1500 SNAT       all  --  *      eth0    10.123.1.253 
0.0.0.0/0           to:10.123.0.253

Chain OUTPUT (policy ACCEPT 1 packets, 69 bytes)
  pkts bytes target     prot opt in     out     source 
destination



# iptables -L -n -v -t filter
Chain INPUT (policy ACCEPT 1808 packets, 133K bytes)
  pkts bytes target     prot opt in     out     source 
destination

Chain FORWARD (policy DROP 6316K packets, 291M bytes)
  pkts bytes target     prot opt in     out     source 
destination
   44M   67G ACCEPT     all  --  eth1   *       10.123.1.0/24 
0.0.0.0/0
   15M  794M ACCEPT     tcp  --  eth0   *       0.0.0.0/0 
10.123.1.253        tcp dpt:80
     0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0 
10.123.1.253        tcp dpt:22
     0     0 ACCEPT     icmp --  eth0   *       0.0.0.0/0 
10.123.1.253        icmp type 0
     0     0 ACCEPT     icmp --  eth0   *       0.0.0.0/0 
10.123.1.253        icmp type 3
     0     0 ACCEPT     icmp --  eth0   *       0.0.0.0/0 
10.123.1.253        icmp type 8
     0     0 ACCEPT     icmp --  eth0   *       0.0.0.0/0 
10.123.1.253        icmp type 11
     0     0 ACCEPT     icmp --  eth0   *       0.0.0.0/0 
10.123.1.253        icmp type 12

Chain OUTPUT (policy ACCEPT 1301 packets, 887K bytes)
  pkts bytes target     prot opt in     out     source 
destination



# cat /etc/modprobe.conf
alias eth0 e1000
alias eth1 e1000
options eth0 FlowControl=3 RxDescriptors=4096 TxDescriptors=4096 
XsumRX=1 RxIntDelay=2
options eth1 FlowControl=3 RxDescriptors=4096 TxDescriptors=4096 
XsumRX=1 RxIntDelay=2
#######################################


###############################################
pgset "max_before_softirq 10000"
pgset "clone_skb 0"
pgset "pkt_size 60"
pgset "src_min 0.0.0.0"
pgset "src_max 255.255.255.255"
pgset "udp_src_min 1"
pgset "udp_src_max 65535"
pgset "udp_dst_min 1234"
pgset "udp_dst_max 1234"
pgset "flag IPSRC_RND"
pgset "flag UDPSRC_RND"
pgset "dst 10.123.0.253"
pgset "dst_mac 00:15:17:37:E9:FA"
pgset "count 0"
###############################################

-- 
Florin Andrei

http://florin.myip.org/
