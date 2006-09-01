From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: I need some clarification about multiple ISPs...
Date: Fri, 1 Sep 2006 08:55:15 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024E85B@pxtbenexd01.pxt.primeexalia.com>
References: <882A4B7A51024043B9E5EA13382DF211FFFEFC@PA-EXCH03.vmware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <882A4B7A51024043B9E5EA13382DF211FFFEFC@PA-EXCH03.vmware.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Darryl Romano <dromano@vmware.com>, "Taylor, Grant" <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@lists.netfilter.org>

Sorry, I wasn't watching this thread earlier.  There is a way to do this
and it seems to work for us.  We have to load balance two DSL lines for
some of our clients.

Here are the files used for doing this.  The key is tweaking '/sbin/ip
route add default table 250...' to suite your need.  All of the servers
have two IP's.  One natted IP from one line and one from the other.  For
example, Server A has 10.94.64.11 and .16.  This is mapped  if a user
comes in on 55.130 it goes to .11 and back out.  If a user goes to
55.242 it goes to .16 and back out.  This might seem odd but it works.
You might get away with marking the packets and using one IP but this
didn't work reliably for us.

YMMV

####### /etc/rc.d/rc.local
# DSL 1
/sbin/ip addr add 88.44.55.130/29 dev eth0
/sbin/ip addr add 88.44.55.131/29 dev eth0
/sbin/ip addr add 88.44.55.132/29 dev eth0
/sbin/ip addr add 88.44.55.133/29 dev eth0

# DSL 2 (don't let the range fool you, it's a /29=20
# so they are indeed seperate.  By blind luck it=20
# was on a close range.)
/sbin/ip addr add 88.44.55.242/29 dev eth1
/sbin/ip addr add 88.44.55.243/29 dev eth1
/sbin/ip addr add 88.44.55.244/29 dev eth1
/sbin/ip addr add 88.44.55.245/29 dev eth1


/etc/rc.d/rc.local


####### /etc/rc.d/loadbalancing.sh
#!/bin/sh

# LAN
LAN_IF=3Deth2
LAN_IP=3D10.94.64.254
LAN_NET=3D10.94.64.0/24

# NET 1 (DSL 1)
INET1_IF=3Deth0
INET1_IP=3D88.44.55.129
INET1_NET=3D88.44.55.138/29
INET1_GW=3D88.44.55.134

# NET 2 (DSL 2)
INET2_IF=3Deth1
INET2_IP=3D88.44.55.241
INET2_NET=3D88.44.55.240/29
INET2_GW=3D88.44.55.246


/sbin/ip rule del prio 50 table main
/sbin/ip rule add prio 50 table main
/sbin/ip route del default table main

/sbin/ip rule del prio 201 from $INET1_NET table 201
/sbin/ip rule add prio 201 from $INET1_NET table 201
/sbin/ip route add default via $INET1_GW dev $INET1_IF \
            src $INET1_IP proto static table 201
/sbin/ip route append prohibit default table 201 metric 1 proto static

/sbin/ip rule del prio 202 from $INET2_NET table 202
/sbin/ip rule add prio 202 from $INET2_NET table 202
/sbin/ip route add default via $INET2_GW dev $INET2_IF \
            src $INET2_IP proto static table 202
/sbin/ip route append prohibit default table 202 metric 1 proto static


# Match outgoing packets to their source interface
/sbin/ip rule del prio 221 fwmark 4 table 201
/sbin/ip rule add prio 221 fwmark 4 table 201
/sbin/ip rule del prio 222 fwmark 8 table 202
/sbin/ip rule add prio 222 fwmark 8 table 202

/sbin/ip rule del prio 250 table 250
/sbin/ip rule add prio 250 table 250

#TWEAK THIS FOR YOUR PARTICULAR USE
# Net 2 will be the default route, Net 1 is for incoming DSL
#/sbin/ip route add default table 250 proto static \
#            nexthop via $INET1_GW dev $INET1_IF \
#            nexthop via $INET2_GW dev $INET2_IF

# DEFAULT ACTIVE/ACTIVE
/sbin/ip route add default table 250 proto static \
            nexthop via $INET1_GW dev $INET1_IF \
            nexthop via $INET2_GW dev $INET2_IF

####### iptables-save
-A PREROUTING -i eth0 -j MARK --set-mark 0x4=20
-A PREROUTING -i eth1 -j MARK --set-mark 0x8=20

-A PREROUTING -d 88.44.55.130 -j DNAT --to-destination 10.94.64.11=20
-A PREROUTING -d 88.44.55.131 -j DNAT --to-destination 10.94.64.12=20
-A PREROUTING -d 88.44.55.132 -j DNAT --to-destination 10.94.64.13=20
-A PREROUTING -d 88.44.55.133 -j DNAT --to-destination 10.94.64.14=20

-A PREROUTING -d 88.44.55.242 -j DNAT --to-destination 10.94.64.16=20
-A PREROUTING -d 88.44.55.243 -j DNAT --to-destination 10.94.64.17=20
-A PREROUTING -d 88.44.55.244 -j DNAT --to-destination 10.94.64.18=20
-A PREROUTING -d 88.44.55.245 -j DNAT --to-destination 10.94.64.19=20

-A POSTROUTING -s 10.94.64.11 -o eth0 -j SNAT --to-source 88.44.55.130=20
-A POSTROUTING -s 10.94.64.12 -o eth0 -j SNAT --to-source 88.44.55.131=20
-A POSTROUTING -s 10.94.64.13 -o eth0 -j SNAT --to-source 88.44.55.132=20
-A POSTROUTING -s 10.94.64.14 -o eth0 -j SNAT --to-source 88.44.55.133=20

-A POSTROUTING -s 10.94.64.16 -o eth1 -j SNAT --to-source 88.44.55.242=20
-A POSTROUTING -s 10.94.64.17 -o eth1 -j SNAT --to-source 88.44.55.243=20
-A POSTROUTING -s 10.94.64.18 -o eth1 -j SNAT --to-source 88.44.55.244=20
-A POSTROUTING -s 10.94.64.19 -o eth1 -j SNAT --to-source 88.44.55.245=20

-A POSTROUTING -s 10.94.64.0/255.255.255.0 -d 10.94.64.11 -j SNAT
--to-source 88.44.55.130=20
-A POSTROUTING -s 10.94.64.0/255.255.255.0 -d 10.94.64.12 -j SNAT
--to-source 88.44.55.131=20
-A POSTROUTING -s 10.94.64.0/255.255.255.0 -d 10.94.64.13 -j SNAT
--to-source 88.44.55.132=20
-A POSTROUTING -s 10.94.64.0/255.255.255.0 -d 10.94.64.14 -j SNAT
--to-source 88.44.55.133=20

-A POSTROUTING -s 10.94.64.0/255.255.255.0 -d 10.94.64.16 -j SNAT
--to-source 88.44.55.242=20
-A POSTROUTING -s 10.94.64.0/255.255.255.0 -d 10.94.64.17 -j SNAT
--to-source 88.44.55.243=20
-A POSTROUTING -s 10.94.64.0/255.255.255.0 -d 10.94.64.18 -j SNAT
--to-source 88.44.55.244=20
-A POSTROUTING -s 10.94.64.0/255.255.255.0 -d 10.94.64.19 -j SNAT
--to-source 88.44.55.245=20
-A POSTROUTING -o eth0 -j SNAT --to-source 88.44.55.129=20
-A POSTROUTING -o eth1 -j SNAT --to-source 88.44.55.241=20

-A OUTPUT -d 88.44.55.130 -j DNAT --to-destination 10.94.64.11=20
-A OUTPUT -d 88.44.55.131 -j DNAT --to-destination 10.94.64.12=20
-A OUTPUT -d 88.44.55.132 -j DNAT --to-destination 10.94.64.13=20
-A OUTPUT -d 88.44.55.133 -j DNAT --to-destination 10.94.64.14=20

-A OUTPUT -d 88.44.55.242 -j DNAT --to-destination 10.94.64.16=20
-A OUTPUT -d 88.44.55.243 -j DNAT --to-destination 10.94.64.17=20
-A OUTPUT -d 88.44.55.244 -j DNAT --to-destination 10.94.64.18=20
-A OUTPUT -d 88.44.55.245 -j DNAT --to-destination 10.94.64.19


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Darryl Romano
> Sent: Friday, September 01, 2006 8:32 AM
> To: Taylor, Grant; Mail List - Netfilter
> Subject: RE: I need some clarification about multiple ISPs...
>=20
> This is an exact scenario I had a while back.  I did not find a
resolution
> unfortunately.  I would love to find an answer to this.
>=20
> >From my experiences, the traffic going back out will always try to go
out
> the
> default route, and since its destination is waiting for the ISP2 ip
and
> not
> the ISP ip, it will reject the packet breaking the connection.
>=20
> I love computers.
>=20
> Darryl Romano, VCP, RHCE
> VMware Technical Support
>=20
> 1-877-4-VMWARE
> 1-877-486-9273
>=20
> Use our Knowledge Base to search for
> Troubleshooting information:
> http://www.vmware.com/kb
>=20
>  VMware Community Access:
> http://www.vmware.com/community/index.jspa
>=20
>=20
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Taylor,
Grant
> Sent: Friday, September 01, 2006 11:06 AM
> To: Mail List - Netfilter
> Subject: I need some clarification about multiple ISPs...
>=20
> Hello, a colleague and I are at a minor disagreement that I believe
> NetFilter
> Mailing List subscribers will be able to clarify.
>=20
> The situation is I have a client who has (will once they are
activated)
> two
> internet connections through two different providers.  Either
connection
> will
> work just fine by it's self.  I also believe that I can use both
> connections
> simultaneously with client initiated traffic just fine.  What I
perceive
> as a
> problem will be if someone (myself) initiates an inbound connection
(SSH)
> to
> either of the connections.  If the system is configured to use ISP 1
as
> the
> default and the connection is targeted at the IP for the ISP 2
interface,
> where will the connections traffic go back out from?  I am of the
opinion
> that I will need to mark the traffic that comes in on at least one of
the
> interfaces to make sure that said marked traffic goes back out the
correct
> interface.
>=20
> More specifically I suspect that  will have two (sub) routing tables
in
> addition to the main routing table.  Have the system use the main
routing
> table for all client side initiated out bound (and related) traffic.
Mark
> traffic that comes in the interface for ISP 1 such that the returning
> outbound traffic will be directed to use the ISP 1 routing table.
Mark
> traffic that comes in the interface for ISP 2 such that the returning
> outbound traffic will be directed to use the ISP 2 routing table.
>=20
> Any thought(s) / opinion(s) / suggestion(s) are welcomed and
appreciated.
>=20
>=20
>=20
> Grant. . . .
>=20


