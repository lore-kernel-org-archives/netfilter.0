From: "Lesley Kimmel" <ljkimmel99@hotmail.com>
Subject: Private IP getting past IPTables NAT
Date: Thu, 1 Mar 2012 21:53:05 -0600
Message-ID: <SNT143-ds16D3D97D04EB6A5DC9E540C26D0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

I apologize if this is a duplicate email.  I have sent several times as I 
was having issues with the spam filter.

All;

We have a Linux virtual server which we use as a NAT/Router (running 
IPTables 1.2.11) to front-end a set of virtual machines on a private 
(192.168.0.x) network.  In this private network are two web servers and a 
few other application servers.  Our intent is to utilize two public IP 
addresses on the NAT server to NAT to each back-end web server:

External Interfaces:
eth1 = abc.abc.abc.1 => 192.168.0.1 (webserver #1)
eth1:0 = abc.abc.abc.2 => 192.168.0.2 (webserver #2)
Internal Interface:
eth0 = 192.168.0.3

We had accomplished this with the following IPTables configuration
Table: nat
Chain PREROUTING (policy DROP)
target    prot    in    out    source        destination
DNAT        tcp    eth1    any    anywhere        abc.abc.abc.1 
to:192.168.0.1
DNAT        tcp    eth1    any    anywhere        abc.abc.abc.2 
to:192.168.0.2
ACCEPT    all    eth0    any    192.168.0.0/24    anywhere    #(to allow all 
outgoing traffic)

Chain POSTROUTING (policy DROP)
target    prot    in    out    source        destination
SNAT        all    any    eth1    192.168.0.1    anywhere 
to:abc.abc.abc.1
SNAT        all    any    eth1    192.168.0.2    anywhere 
to:abc.abc.abc.2
SNAT        all    any    eth1    192.168.0.0/24    anywhere 
to:abc.abc.abc.1   #SNAT all other traffic to ip #1

Chain OUTPUT (policy ACCEPT)

Table: filter
Chain Input (policy ACCEPT)
target    prot    in    out    source        destination

Chain FORWARD (policy ACCEPT)
target    prot    in    out    source        destination

Chain OUTPUT (policy ACCEPT)
target    prot    in    out    source        destination

Everything APPEARS to work correctly with this configuration.  However, 
several times a day network monitoring tools on the public side of the NAT 
server see packets with source addresses from the private network (e.g. 
192.168.0.4).  In order to troubleshoot we minimized our configuration to 
try to isolate the problem.  We took out the NATing for the second IP:

Table: nat
Chain PREROUTING (policy DROP)
target    prot    in    out    source        destination
DNAT        tcp    eth1    any    anywhere        abc.abc.abc.1 
to:192.168.0.1
ACCEPT    all    eth0    any    192.168.0.0/24    anywhere    #(to allow all 
outgoing traffic)

Chain POSTROUTING (policy DROP)
target    prot    in    out    source        destination
SNAT        all    any    eth1    192.168.0.1    anywhere 
to:abc.abc.abc.1

Chain OUTPUT (policy ACCEPT)

Table: filter
Chain Input (policy ACCEPT)
target    prot    in    out    source        destination

Chain FORWARD (policy ACCEPT)
target    prot    in    out    source        destination

Chain OUTPUT (policy ACCEPT)
target    prot    in    out    source        destination

With this configuration the 'leaking' of the private IP addresses seems to 
stop.  However, we need to have the functionality of the second IP address. 
Any insight into why the 'leak' is happening and how we can add the second 
IP back in?

Also, I have monitored the traffic across the NAT box with tcpdump.  The 
majority of traffic is NAT'd as expected.  Only occasionally do packets 
'escape'.  These packets have always been either FIN or RST packets. 

