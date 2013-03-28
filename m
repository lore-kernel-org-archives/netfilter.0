From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: SNAT for routing
Date: Wed, 27 Mar 2013 18:47:51 -0700
Message-ID: <assp.079945ea11.5153A147.3050401@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=amfes.com;
	h=Message-ID:From:Subject:To:MIME-Version:Content-Type; s=sep2012.mail;
	bh=blHKZqfT/B9DldsX5q+1wa9Kgqo=; b=1F/BgZJjFD1CXWoZN/dLfOwMfs2EF2DxB7DNuAWF0nPP86GACX11lR+sbI4cOSAHmlCOpPO3qcgN9ngGbtYINLzXaAfAEZK9uh1hk7T2FWoR4ZV/+gPYOyqEVtRq3j50oyE9Jqm7RcUp4nzv7BejhL4PpoEnbzxsjtfusrH2cB0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter-Users <netfilter@vger.kernel.org>

Every time I THINK I understand - it just slips away.

I want to be able to connect hosts from different networks with a 
minimum of configuration.  I know there's a magic combination of routing 
and NAT that makes this work - because it used to - but I can't 
replicate it now.

Start with a multi-homed server.  This server has addresses and reaches 
networks:
192.168.21.2/24 - various clients on this network
192.168.20.1/24 - various other clients on this network
172.27.0.10 - OpenVPN routed VPN address

Now have a central VPN server.  This server has addresses and reaches 
networks:
192.168.0.2/24 - NIC 1 connection to LAN
192.168.0.3/24 - Bridged NIC 2 / VPN connection to LAN
172.27.0.1 - OpenVPN routed VPN address

Now add a workstation.  Happens to be Windoze 7 VPN at the moment - but 
should apply to any 192.168.0.x location.
192.168.0.60 - OpenVPN bridged VPN address

Alright, those are the players.  Now - routing tables.

Remote server - ip route
default via 192.168.21.1 dev eth0  metric 100
172.27.0.1 via 172.27.0.9 dev tun0
172.27.0.9 dev tun0  proto kernel  scope link  src 172.27.0.10
192.168.20.0/24 dev eth0  proto kernel  scope link  src 192.168.20.1
192.168.21.0/24 dev eth0  proto kernel  scope link  src 192.168.21.2

The central server - ip route
default via 192.168.0.1 dev eth0  metric 1
172.27.0.0/16 via 172.27.0.2 dev tun0
172.27.0.2 dev tun0  proto kernel  scope link  src 172.27.0.1
192.168.0.0/24 dev eth0  proto kernel  scope link  src 192.168.0.2
192.168.0.0/24 dev br1  proto kernel  scope link  src 192.168.0.3
192.168.0.91 dev br1  scope link

The windoze workstation - route print
Active Routes:
Network Destination        Netmask          Gateway       Interface Metric
           0.0.0.0          0.0.0.0      192.168.5.1 192.168.5.10     20
         127.0.0.0        255.0.0.0         On-link 127.0.0.1    306
         127.0.0.1  255.255.255.255         On-link 127.0.0.1    306
   127.255.255.255  255.255.255.255         On-link 127.0.0.1    306
        172.27.0.0      255.255.0.0      192.168.0.3 192.168.0.91     31
       192.168.0.0    255.255.255.0         On-link 192.168.0.91    286
      192.168.0.91  255.255.255.255         On-link 192.168.0.91    286
     192.168.0.255  255.255.255.255         On-link 192.168.0.91    286
       192.168.5.0    255.255.255.0         On-link 192.168.5.10    276
      192.168.5.10  255.255.255.255         On-link 192.168.5.10    276
     192.168.5.255  255.255.255.255         On-link 192.168.5.10    276
         224.0.0.0        240.0.0.0         On-link 127.0.0.1    306
         224.0.0.0        240.0.0.0         On-link 192.168.5.10    276
         224.0.0.0        240.0.0.0         On-link 192.168.0.91    286
   255.255.255.255  255.255.255.255         On-link 127.0.0.1    306
   255.255.255.255  255.255.255.255         On-link 192.168.5.10    276
   255.255.255.255  255.255.255.255         On-link 192.168.0.91    286

The central VPN currently can communicate with 172.27.0.10, and if I add 
routing entries can also reach 192.168.21.2 - but no other 192.168.21.x 
clients.  The workstation can reach 172.27.0.1 - but not 172.27.0.10.  
My goal is for the workstation to be able to reach the 192.168.21.x and 
192.168.20.x networks - so based on my connections I assume the first 
step is getting the workstation to communicate with 172.27.0.10.  Which 
it's not.

My first attempt was to add SNAT on the central VPN with -
iptables -t nat -A POSTROUTING -d 172.27.0.0/16 -s 192.168.0.0/24 -p tcp 
-o tun0 -j SNAT --to-source 172.27.0.1

But that does not appear to be sufficient.

-- 
Daniel

