From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: how to set multiHOP gw rules for forward table?
Date: Sat, 03 Aug 2013 15:36:10 +0300
Message-ID: <51FCF93A.6080002@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter user mailing list <netfilter@vger.kernel.org>

My network is like that:

GW+DHCP 192.168.1.1, eth0:192.168.100.1 eth1:192.168.168.1.1
HOST1+DHCP 192.168.1.100, eth0:192.168.1.100 eth1:192.168.2.1
CLIENT1 192.168.2.100
There is a double NAT here at both GW and HOST1
The DHCP from GW is only towards the eth1 network and subnet.
The DHCP from HOST1 is only towards eth1.
in GW there is a masquerade rule which works fine and allows all
forwarded packets.

I do not want packets from clients in the CLIENT1 side of the network to
get access using the nat to the local network resources but that they
will have access to the internet using GW.
So basically I want to allow all forwarded traffic from the
192.168.2.0/24 network to be allowed to all networks but not the
localnet and the local GW resources.

I am a bit in a conflict in it since the next rules should work or at
least should do the trick..:
------
-A FORWARD -s 192.168.2.0/24 -i eth1 -p tcp -m state --state ESTABLISHED
-j ACCEPT
-A FORWARD -i eth1 -p icmp -j ACCEPT
-A FORWARD -s 192.168.2.0/24 -i eth1 -p tcp -m multiport --dports
53,443,80,21,22,23,110,25,143,995,993,3128,8080 -j ACCEPT
-A FORWARD ! -i eth1 -m state --state NEW -j DROP
-A FORWARD -o eth1 -j ACCEPT
-A FORWARD -d 192.168.1.0/24 -j DROP
------
Before I press the "save" button I would like for someone else to take a
small look at it.

Eliezer
