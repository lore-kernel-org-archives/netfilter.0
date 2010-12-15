From: "Alec Matusis" <matusis@matusis.com>
Subject: PREROUTING DNAT *inconsistent* behavior
Date: Tue, 14 Dec 2010 20:42:31 -0800
Message-ID: <032601cb9c12$7d1a4890$774ed9b0$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

We are operating large TCP chat servers: 8 servers per machine, about 70,000
outbound pps per machine. On each machine, all servers are listening on port
5228, and each server is listening on its own IP address. All IP addresses
are assigned to the same physical WAN interface, with virtual interfaces
eth0:*. 
The clients connect to an IP address of the server on port 443, and we have
the following port-forwarding rule in the NAT table:
*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 5228
 

In the FILTER table, we have:
*filter
:INPUT DROP [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]

-A INPUT -d x.x.x.x/22 -p tcp -m multiport --dports 443,5228 -j ACCEPT

When we look at tcpdump, we mostly see the traffic between the port 443 on
the servers and various IPs of the clients, as expected.
The problem is that there is some very odd *rare* packets that tcpdump
shows, between the port 5228 on the server, and the clients. This is NOT
expected, since 5228 is forwarded to 443. The rate of this unexpected
traffic is about 2pps, or about 0.003% of the total number of packets. Most
of these packets (about 95% of them) are from the server to the client, with
NOTHING from the client to the server. 
#tcpdump  -n -ieth0 'port 5228'
20:22:34.657672 IP server.ip.5228 > client1.ip.49892: P
3242847898:3242847907(9) ack 3767768131 win 5840
20:22:36.308379 IP server.ip.5228 > client2.ip.57065: P
3305194993:3305195001(8) ack 579435130 win 46 <nop,nop,timestamp 2680337205
794384040>
20:22:37.237683 IP server.ip.5228 > client3.34992: F
2841447925:2841447925(0) ack 691623366 win 5840
20:22:37.794555 IP server.ip.87.5228 > client5.52491: F
3958524831:3958524831(0) ack 1914557806 win 46
These look like some martian packets, as if the firewall port-forwarding
rule has been ignored for them.
 
Typically, when we take a client IP that is a target of these martian
packets (e.g. client1.ip), and do
#tcpdump  -n -ieth0 'host client1.ip'
We discover that this client also participates in the normal connection to
the server port 443:
20:28:25.622835 IP client1.ip.2646 > server.ip.443: . ack 2789704759 win
64664
20:28:25.622853 IP server.ip.443 > client1.ip.2646: P 1:116(115) ack 0 win
5840
20:28:26.414852 IP client1.ip.2646 > server.ip.443: . ack 116 win 64549
20:28:26.414868 IP server.ip.443 > client1.ip.2646: P 116:124(8) ack 0 win
5840
20:28:27.142808 IP client1.ip.2646 > server.ip.443: . ack 124 win 64541

The ephemeral port on the client for the normal connection is always
different from the ephemeral port that receives those martian packets.
We cannot reproduce this on a staging or development machines, since these
odd packets appear only above a certain high overall packet rate.
Does this look like some kind of a race condition in netfilter, so that for
some outbound packets, the port-forwarding rules are ignored? 


This behavior appears on several different kernels between 2.6.18 and 2.6.32
and iptables between v1.3.6 and v1.4.4.



 

