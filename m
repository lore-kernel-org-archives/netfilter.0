From: Dimitri Yioulos <dyioulos@onpointfc.com>
Subject: Dual WAN setup redux
Date: Fri, 27 Jan 2012 18:03:18 -0500
Message-ID: <201201271803.19071.dyioulos@onpointfc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi, folks.

Well, here I am, again, asking for help setting up a dual WAN.  With a kind nod 
to Lloyd and Andy, I'm simply not getting this to work.  And, my deadline for 
getting to good is now.  So, even though this is a bit off-topic, I'm 
appealing, once again, for your help.

Let me see if I can provide all of the information you might need to assist me:

LAN: 192.168.100.0/24
DMZ: 192.168.1.0/24
WAN1 (up and working for a long time): 65.x.x.160/27, gw 65.x.x.161
WAN2 (new connection): 75.x.x.24/29, gw 75.x.x.30

eth0 - WAN1: 65.x.x.162
eth0:0-eth0:6: 65.x.x.163, 164, etc.
eth1 - LAN: 192.168.100.1
eth2 - DMZ: 192.168.1.1
eth3 - WAN2: 75.x.x.25
eth3:0-eth3:1: 75.x.x.26, 27

SNAT current DMZ hosts WAN1 addresses

I want to use WAN2 for a new Web server and test server living in the DMZ.

I created a new routing table called WAN2.  Here's the output of "ip route show 
table WAN2":

75.x.x.24/29 dev eth3  scope link  src 75.x.x.25
default via 75.x.x.30 dev eth3

Netstat -ar produces the following ourput:

75.x.x.24   *               255.255.255.248 U         0 0          0 eth3
65.x.x.160  *               255.255.255.224 U         0 0          0 eth0
10.8.0.0        vpn.mydomain.c 255.255.255.0   UG        0 0          0 eth2
192.168.1.0     *               255.255.255.0   U         0 0          0 eth2
192.168.100.0   *               255.255.252.0   U         0 0          0 eth1
default         65.x.x.161. 0.0.0.0                UG        0 0          0 eth0

The following are probably stupid noob questions, but here goes:

I can ping the WAN2 gateway address from our firewall/router, but not from any 
other network device (I can ping the gateway address of WAN1 just fine).  Don't 
I have to be able to do that first?

I'm not sure what internal ip addresses to give the new Web server and test 
server (192.100.1.x, or 75.x.x.26-29.

I'm thinking that once I can get the above straight, iptables rules will be 
relatively simple to set up(I'll probably regret having said that :-) ).

Thanks.

Dimitri


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

