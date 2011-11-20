From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: trouble setting default route for load-balancing routing tables
Date: Sat, 19 Nov 2011 20:11:31 -0600
Message-ID: <op.v4721hs0x1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org

Hi Everyone,

I'm configuring a load-balancing netfilter router.  It does round-robin load balancing over 2 external interfaces, eth0 and eth1.  The natted LAN is on eth4.  eth0 is attached to table T0, and eth1 uses table T1.

I am unable to add default routes to the routing tables T0 and T1.  Here is the output from my bash script that sets up the router:

+ ip route flush table T0
+ ip route add 192.168.100.0/24 dev eth0 src 192.168.100.10 table T0
+ ip route add default via 192.168.100.11 table T0
RTNETLINK answers: No such process

Even with the lack of default route for T0 and T1, the router appears to properly load-balance over the 2 outgoing interfaces (!)  However, it ignores my rules which should direct certain traffic over a particular interface.

After setting up the router, here is table main:

root@debiandesk2:/home/lloyd/data/traffic_shaping# ip route show table main
192.168.100.0/24 dev eth0  scope link  src 192.168.100.10
192.168.50.0/24 dev eth4  scope link  src 192.168.50.1
192.168.90.0/24 dev eth1  scope link  src 192.168.90.10
default
	nexthop via 192.168.100.11  dev eth0 weight 92
	nexthop via 192.168.90.1  dev eth1 weight 7


And here is table T0, devoid of a default route:

root@debiandesk2:/home/lloyd/data/traffic_shaping# ip route show table T0
192.168.100.0/24 dev eth0  scope link  src 192.168.100.10
192.168.50.0/24 dev eth4  scope link
127.0.0.0/8 dev lo  scope link

Let me know if any more info is needed to debug this.

Regards,
Lloyd
