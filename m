From: Aymeric Moizard <jack@atosc.org>
Subject: udp connection moved from ASSURED to UNREPLIED
Date: Sat, 26 Apr 2008 16:07:24 +0200 (CEST)
Message-ID: <Pine.LNX.4.63.0804261543110.6453@sip2>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


I've got a linux debian running 2.6.24-1-amd64 and iptables v1.4.0
It's my NAT box and is connected to a dsl box using DHCP from which I
get a public IP on eth0 and my LAN is connected using eth1.

I got established UDP connection initiated from LAN to a public
server:

ipv4     2 udp      17 178 src=192.168.2.50 dst=212.27.XX.X sport=6010 
dport=5060 packets=48 bytes=4074 src=212.27.XX.X dst=88.171.XX.XX 
sport=5060 dport=6010 packets=379 bytes=24499 [ASSURED] mark=0 secmark=0 
use=1

This connection was initiated by 192.168.2.50, but most packets are coming 
from 212.27.XX.X: those packets are meant to be "keep-alive" packets to
hold the UDP binding opened for a VoIP application.

Each 30minutes, the box is sengind an ARP request and suddenly, the 
incoming packets from 212.27.XX.X gets rejected with icmp "port 
unreachable" as if the conntrack was deleted upon receiving the arp 
request from the dsl box.

Right after this packet was refused, the conntrack for the entrie
dissapear and gets back to a new one [UNREPLIED] as soon as a packet
from server is received:

ipv4     2 udp      17 28 src=212.27.52.5 dst=88.171.117.238 sport=5060 
dport=6010 packets=1 bytes=60 [UNREPLIED] src=88.171.117.238 
dst=212.27.52.5 sport=6010 dport=5060 packets=0 bytes=0 mark=0 secmark=0 
use=1

As you can see conntrack does not remember any more that I was sending
UDP packets before: in the above case, the last outgoing UDP packet
was sent less than 20 seconds before this happen.

It looks to me that arp doesn't affect any existing TCP connection: 
however UDP connection gets destroyed.

I'm searching for help to avoid the removal of my UDP conntrack entry.

tks,
Aymeric MOIZARD / ANTISIP amsip - http://www.antisip.com
osip2 - http://www.osip.org
eXosip2 - http://savannah.nongnu.org/projects/exosip/

