From: Patrick Chemla <patrick.chemla@perfaction.net>
Subject: I can't make forwarding
Date: Tue, 16 Feb 2010 13:19:21 +0200
Message-ID: <4B7A7F39.5090808@perfaction.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I have problems to setup a NAT router using iptables.

My NAT Router is running Fedora 11.

I have 2 interfaces, eth0 10.0.0.1 is internal, eth1 172.25.2.2 is external.

I have 10 external public addresses coming to the interface eth1 that I 
want to forward to 10 internal computers on eth0.

When I try to ping or access an external web server from the NAT server 
itself, it works very fine. I see on the remote server the external 
address of the NAT router itself.
When I try to ping or wget an external web server from an internal 
10.0.0.151 computer,  using TCPDUMP both on the foreign server interface 
and on the eth1 of the NAT router, I see  that packets reach the 
external server with the right IP 192.114.84.144, I see that the 
external server send back something, but I can't get it back on the eth1 
tcpdump.

Here is my iptables:
============
iptables -n  -L -v
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source               
destination
  1664  208K ACCEPT     all  --    *       *       0.0.0.0/0             
0.0.0.0/0           state NEW,RELATED,ESTABLISHED
     0     0 ACCEPT           icmp --  *       *       
0.0.0.0/0             0.0.0.0/0
     0     0 ACCEPT            all  --   lo      *       
0.0.0.0/0             0.0.0.0/0
     0     0 ACCEPT             tcp  --  *       *       
0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:22

Chain FORWARD (policy ACCEPT 3499 packets, 213K bytes)
  pkts bytes target     prot opt in     out         source               
destination
     0     0 ACCEPT         all  --    eth0   eth1    
10.0.0.151           192.114.84.144      state NEW,RELATED,ESTABLISHED
     0     0 ACCEPT         all  --    eth1   eth0    
192.114.84.144       10.0.0.151          state NEW,RELATED,ESTABLISHED

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target      prot opt in     out     source               
destination
   466 71467 ACCEPT     all     --  *        *       
0.0.0.0/0            0.0.0.0/0           state NEW,RELATED,ESTABLISHED
     0     0       ACCEPT     icmp --   *        *       
0.0.0.0/0            0.0.0.0/0

Here is my NAT table:
=============
iptables -n -t nat -L -v
Chain PREROUTING (policy ACCEPT 915 packets, 129K bytes)
  pkts bytes target     prot opt in     out     source               
destination
     0     0        DNAT      tcp    --  eth1   *       
192.114.84.144       0.0.0.0/0           to:10.0.0.151

Chain POSTROUTING (policy ACCEPT 75 packets, 6372 bytes)
  pkts bytes target     prot opt in      out     source               
destination
    16   960     SNAT       all     --    *      eth1    
10.0.0.151           0.0.0.0/0           to:192.114.84.144

Chain OUTPUT (policy ACCEPT 36 packets, 3998 bytes)
  pkts bytes target     prot opt in     out     source               
destination


I think I ACCEPT and FORWARD all, I have both SNAT and DNAT, but I 
missed something.

Help will be welcome.

Patrick



