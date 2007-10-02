From: Florin Andrei <florin@andrei.myip.org>
Subject: conntrack is bad during DDoS?
Date: Tue, 02 Oct 2007 14:53:15 -0700
Message-ID: <4702BDCB.3060102@andrei.myip.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Test case:
Several web servers on private IP addresses behind a Linux firewall.
Firewall FORWARD rules for the test are simple: allow inbound HTTP and a 
handful of other protocols, allow a few inbound ICMP types. Outbound 
everything is allowed.
Each server is NATed 1:1 on its own public IP address residing on the 
outside interface of the firewall (DNAT for inbound packets, SNAT for 
outbound packets).

The config excerpts below use 10.123.0/24 as the "public" network (fake 
public, it's a test switch on my desk) and 10.123.1/24 as the private 
network.
eth0 is the outside interface of the firewall, eth1 is the inside interface.
.253 is the last byte in the address of the test web server.

########################################
# iptables -L -n -v -t filter
[...]
Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source
destination
  110M  159G ACCEPT     all  --  eth1   *       10.123.1.0/24
0.0.0.0/0
   29M 1518M ACCEPT     tcp  --  eth0   *       0.0.0.0/0
10.123.1.253        tcp dpt:80
   544 43144 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
10.123.1.253        tcp dpt:22
     0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
10.123.1.253        tcp dpt:21
     0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0
10.123.1.253        tcp spt:80
   849 39054 ACCEPT     udp  --  eth0   *       0.0.0.0/0
10.123.1.253        udp spt:53
   16M   12G ACCEPT     udp  --  eth0   *       0.0.0.0/0
10.123.1.253        udp dpt:12345
     0     0 ACCEPT     icmp --  eth0   *       0.0.0.0/0
10.123.1.0/24       icmp type 8
     0     0 ACCEPT     icmp --  eth0   *       0.0.0.0/0
10.123.1.0/24       icmp type 0
     0     0 ACCEPT     icmp --  eth0   *       0.0.0.0/0
10.123.1.0/24       icmp type 3
     0     0 ACCEPT     icmp --  eth0   *       0.0.0.0/0
10.123.1.0/24       icmp type 11
     0     0 ACCEPT     icmp --  eth0   *       0.0.0.0/0
10.123.1.0/24       icmp type 12
   61M 3402M DROP       all  --  *      *       0.0.0.0/0
0.0.0.0/0

Chain OUTPUT (policy ACCEPT 117 packets, 23273 bytes)
  pkts bytes target     prot opt in     out     source
destination


# iptables -L -n -v -t nat
Chain PREROUTING (policy ACCEPT 5 packets, 2298 bytes)
  pkts bytes target     prot opt in     out     source
destination
   83M 4506M DNAT       all  --  eth0   *       0.0.0.0/0
10.123.0.253        to:10.123.1.253

Chain POSTROUTING (policy ACCEPT 5404K packets, 249M bytes)
  pkts bytes target     prot opt in     out     source
destination
     1  1498 SNAT       all  --  *      eth0    10.123.1.253
0.0.0.0/0           to:10.123.0.253

Chain OUTPUT (policy ACCEPT 3 packets, 413 bytes)
  pkts bytes target     prot opt in     out     source
destination
########################################

To let the firewall reply to ARP requests for the NATed public address, 
I had to create an IP alias on the outside interface, with the same IP 
address like the public IP address of the test web server:

ip address add 10.123.0.253 dev eth0


I am testing the firewall with pktgen, running on another machine. It's 
pretty much a DDoS test, random source IP, random source UDP port, small 
packets.

pgset "add_device eth3"
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
pgset "dst_mac XXXXXXXXXXXXXX"
pgset "count 0"

While pktgen is blasting the firewall, I am downloading a 2GB file
through the firewall in an infinite loop.

The problem: pretty soon after starting pktgen, the HTTP download stops. 
  It appears to happen only when using random source IP addresses for 
the DoS. If all UDP packets have the same source IP, the firewall works 
fine.

I suspect it might be related to conntrack. Is there a way to disable 
that module while still having that set of rules loaded up?

I don't need stateful filtering, all I need to do is:
- 1:1 NAT for each server behind the firewall (each server gets its own 
public IP on the outside interface of the firewall)
- allow HTTP inbound, a few ICMP types, and that's pretty much it
A stateless firewall could handle those requirements very well.

I remember reading that conntrack is loaded automatically if iptables 
does NAT - is that true and, if yes, what is the reason?

-- 
Florin Andrei

http://florin.myip.org/
