From: LeRoy DeVries <dutch@rvfulltimer.com>
Subject: Need help with IPTABLES
Date: Wed, 07 Nov 2007 09:52:41 -0700
Message-ID: <1194454362.5589.18.camel@DVA1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@vger.kernel.org>

I am trying to drop all port 80 traffic from going from source 10.1.0.1
to 192.168.0.1

My routing table in the router is as follows:


Routing Table  

Destination  Gateway   Netmask         Interface

192.168.1.0  0.0.0.0   255.255.255.0    vlan0

192.168.0.0  0.0.0.0    255.255.255.0   vlan1

10.1.0.0     0.0.0.0    255.255.255.0   tun0

0.0.0.0    192.168.0.1   0.0.0.0        vlan1

I tried to using the following;

iptables -I FORWARD 1 -s 10.1.0.0/24 -d 192.168.0.1 -p tcp --dport 80 -j
DROP

however, the traffic still goes through on tun0

I tried 

iptables -I FORWARD 1 -d 192.168.0.1 -p tcp --dport 80 -j DROP

and the vlan traffic gets block but not the tun0

any ideas what I'm doing wrong?

thanks in advance for any help...


