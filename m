From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: semi OT: default route
Date: Wed, 20 Oct 2004 11:08:15 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E388@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Payal Rathod <payal-netfilter@scriptkitchen.com>, Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

> routed might help here. Right?
> Can anyone with 2 ISP setup please check the load balance thing?
> I vaguely remember seeing something about multiple default routes
> in early chapters of TCP/IP Illustrated Vol. 1 (I am not at all sure).

It is all possible. Since I assume you're using more than a single ISP
and BGP is too costly, I'm assuming you just want to perform single
sided balancing. You can't control the inbound return routes, so all you
can manipulate is the outgoing traffic. If you want to do inbound load
balancing, there's always DNS round-robbin. You can use the ip route
'equalize' keyword, but I can't say if that parameter conntrack's tcp
sessions. For outgoing connections, I use multiple IP ROUTE tables to
define default gateways then use IP RULES to point to each interface,
then in iptables I use any matching that desire to redirect routing
decisions.

Eg.
I have 2 proxy servers on one of my firewalls, one goes out of ppp0 and
the other one goes out of ppp1.
iptables -t mangle -A OUTPUT -m mark ! --mark 0 -j ACCEPT
iptables -t mangle -A OUTPUT -m mark --mark 0 -m owner --uid-owner
squid1 -j MARK --set-mark 0x1
iptables -t mangle -A OUTPUT -m mark --mark 0 -m owner --uid-owner
squid2 -j MARK --set-mark 0x2
iptables -t mangle -A OUTPUT -j CONNMARK --save-mark

I could have both proxy servers use both lines equalized using TCP
round-robbin
iptables -t mangle -A OUTPUT -m mark ! --mark 0 -j ACCEPT
iptables -t mangle -A OUTPUT -m mark --mark 0 -m multiport --dports
80,443 -m nth --every 2 --packet 0 -j MARK --set-mark 0x1
iptables -t mangle -A OUTPUT -m mark --mark 0 -m multiport --dports
80,443 -m nth --every 2 --packet 1 -j MARK --set-mark 0x2
iptables -t mangle -A OUTPUT -j CONNMARK --save-mark

Most people fall apart when I start talking about iproute2 since its
quite different from iptables. I'll describe it from the beginning to
help elaborate. When the kernel wants to look up a route, it looks up
the rule table to find what routing table to use. Here's a default one:
#ip rule show
0:      from all lookup local=20
32766:  from all lookup main=20
32767:  from all lookup default

The local entry is destined for this machine, the main route table is
where 'normal' routing entries go into. If you use ip route add.. you
are putting them into the main routing table by default. The trick is
that you can add new rules to the rule table to change what routing
table you decide to use. For instance, I want two new routing tables for
my specialized dual WAN firewall. I would create the rules as such:

ip rule add fwmark 1 table 1
ip rule add fwmark 2 table 2

So, if iptables MARKed the packet as 1, then I'd use table 1. What is
table 1? Well right now its blank. We need to populate it with data.

# Clean out that table
ip route flush table 1
# Add every routing entry from the main table BUT the default route
ip route show table main | grep -Ev ^default | while read ROUTE ; do
         ip route add table 1 $ROUTE
      done;
# Add the default route for that network interface (_table_gateway), and
the source address to use when sending the packet out (_table_source).
ip route add table 1 default via ${_table_gateway} src ${_table_source};


Conclussion
I've used this routing behavior because its powerful and doesn't break
any expected behaviours in the system, unlike the ROUTE target built
into netfilter.

