From: Carol Anne Ogdin <caogdin@deepwoods.com>
Subject: Re:  eth0, ppp0 & ppp1
Date: Fri, 6 Jun 2003 16:22:30 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF302FFB4C.F7623848-ON88256D3D.007BF360-88256D3D.00806763@deepwoods.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Miller <iptabler@voltar-confed.org>
Cc: Netfilter <netfilter@lists.netfilter.org>

It appears to me that you may need to be using rules (ip rule <stuff> table
<name>) and separate routing tables for each connection.  That's how I've
managed (after a long, long time) to get all responses back out on the same
connection they from at all times.

First, read the iptables tutorial
(http://iptables-tutorial.frozentux.net/), Linux Advanced Routing
(http://lartc.org/howto/) and Guide to IP Layer Network Admin
(http://linux-ip.net/html/linux-ip.html).

The trick is to keep every incoming connection on a separate path into your
network and back out again.  That is implemented through tables with names
that are unique to each connection.

To implement this kind of solution, you will need to create four sets of
rules (one each for eth0, ppp0, ppp1 and the "main"; actually, you can do
it with three, if you make one of them synonymous with "main," but I prefer
to keep them separated for clear modularity.  Then, you create three sets
of rules and three associated (i.e., same table name) sets of routes, and a
fourth routing table for everything else (the "main" table, which is what
gets used for outbound and internal traffic).

Here's a prototype for two WAN connections and a LAN, as reported with the
appropriate 'ip' commands.  The work of creating the script of commands,
and extending it to your three external connections is up to you,

My configuration:
      WAN1 is 111.111.111.0/29 (with 111.111.111.1 as gateway) on eth1
      WAN2 is 222.222.222.0/29 (with 222.222.222.1 as gateway) on eth2
      LAN is 192.168.1.0/24 on eth0

      111.111.111.2 is DNAT'd to 192.168.1.12  (one NIC on webserver A)
      111.111.111.3 is DNAT'd to 192.168.1.54  (one NIC on webserver B)
      222.222.222.2 is DNAT'd to 192.168.1.13  ('nuther NIC on webserver A)
      222.222.222.3 is DNAT'd to 192.168.1.55  ('nuther NIC on webserver B)

      Server A (accessed as 111.111.111.2 or 222.222.222.2)
                  has two NICs (192.168.1.12 and 192.168.1.13)
      Server B (accessed as 111.111.111.3 or 222.222.222.3)
                  has two NICs (192.168.1.54 and 192.168.1.55)

>ip rule list
         0: from all lookup local

     32754: from 192.168.1.55 lookup WAN2
     32755: from all to 192.168.1.55 lookup WAN2   # Server A behind DNAT
     32756: from 192.168.1.13 lookup WAN2
     32757: from all to 192.168.1.13 lookup WAN2   # Server B behind DNAT
     32758: from all to 222.222.222.24/29 lookup WAN2
     32759: from 222.222.222.24/29 lookup WAN2

     32760: from 192.168.1.54 lookup WAN1
     32761: from all to 192.168.1.54 lookup WAN1   # Server A behind DNAT
     32762: from 192.168.1.12 lookup WAN1
     32763: from all to 192.168.1.12 lookup WAN1   # Server B behind DNAT
     32764: from all to 111.111.111.0/29 lookup WAN1
     32765: from 111.111.111.0/29 lookup WAN1

     32766: from all lookup main
     32767: from all lookup default

This says, in essence, "if you're to or from 192.168.1.55 or to or from
192.168.1.13 or from 22.222.222.24/29, use routing table WAN2."  If the
rule fails, or there's no route found in the routing table that matches,
then repeat the process for WAN1.  If both those fail, try the "main"
table.

Now, here're the routing tables for WAN1, WAN2, and "main":

>ip route list table WAN1
     111.111.111.0/29 dev eth1  scope link
     192.168.1.0/24 dev eth0  scope link
     127.0.0.0/8 dev lo  scope link
     default via 111.111.111.1 dev eth1

>ip route list table WAN2
     222.222.222.24/29 dev eth2  scope link
     192.168.1.0/24 dev eth0  scope link
     127.0.0.0/8 dev lo  scope link
     default via 222.222.222.1 dev eth2

>ip route list
     192.168.1.0/24 dev eth0  scope link
     127.0.0.0/8 dev lo  scope link
     default
      nexthop via 111.111.111.1 dev eth1 weight 1
      nexthop via 222.222.222.1 dev eth2 weight 1

The last three lines allow outbound connections to go over either of the
two available connections.

There're more to it, but the hard bit was figuring out (with the help of
many folks in this list) how to structure the individual routing tables for
each physical connection.  This solution is probably overkill, but it's a
practical example you can use to undertand the relationship between rules
and routes.

This is the bare outline.  I hope it points you in the right direction to
solve the problem of keeping responses going back out in the connection
they arrived from.

--Carol Anne



