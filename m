From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: experimenting with 2 ISP's
Date: Mon, 15 Aug 2005 17:08:11 -0400
Message-ID: <65aa6af9050815140847213738@mail.gmail.com>
References: <4300EACB.2030400@eccotours.dyndns.org>
	<65aa6af90508151406d10894@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af90508151406d10894@mail.gmail.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

I mean.... you also have to define the default gateway as a multipath route=
.

On 8/15/05, Edmundo Carmona <eantoranz@gmail.com> wrote:
> That's not the right way to set the default GW.
>=20
> You have to use IP. Remove your default GWs. then:
>=20
> ip route add default netxhop via 196.36.10.114 dev eth0 nexthop via
> 196.168.10.100 dev eth2
> ip route flush cache.
>=20
> If you set the routing tables correctly, It should start working right aw=
ay.
>=20
> On 8/15/05, Brent Clark <bclark@eccotours.dyndns.org> wrote:
> > Hi list
> >
> > I have just a added a few rules to my routing table.
> >
> > Would someone be so kind as to see if my setup is correct.
> >
> > My setup is as so
> >
> > eth0
> > IP 196.36.10.114
> > GW 196.36.10.113 (my routers IP)
> >
> > eth1 192.168.111.10
> > PRIVATE LAN
> >
> > eth2
> > IP 192.168.10.200
> > GW 192.168.10.100 (my adsl modem)
> >
> > Please keep in mind that my router that is connected to eth0 has a stat=
ic ip, where as my adsl modem that is connected to eth2 is dynamically assi=
gned.
> >
> > echo 200 IS >> /etc/iproute2/rt_tables
> > echo 201 TELKOM >> /etc/iproute2/rt_tables
> >
> > /sbin/ip route add 196.36.10.0 dev eth0 src 196.36.10.114 table IS
> > /sbin/ip route add default via 196.36.10.113 table IS
> >
> > /sbin/ip route add 192.168.10.0 dev eth2 src 192.168.10.100 table TELKO=
M
> > /sbin/ip route add default via 192.168.10.100 table TELKOM
> >
> > /sbin/ip route add 196.36.10.0 dev eth0 src 196.36.10.114
> > /sbin/ip route add 192.168.10.0 dev eth2 src 192.168.10.100
> >
> > /sbin/ip route add default via 196.36.10.113
> >
> > /sbin/ip rule add from 196.36.10.114 table IS
> > /sbin/ip rule add from 192.168.10.100 table TELKOM
> >
> >  From my routing table all seem ok:
> > gate:~# route -n
> > Kernel IP routing table
> > Destination     Gateway         Genmask         Flags Metric Ref    Use=
 Iface
> > 196.36.10.0     0.0.0.0         255.255.255.255 UH    0      0        0=
 eth0
> > 192.168.10.0    0.0.0.0         255.255.255.255 UH    0      0        0=
 eth2
> > 196.36.10.112   0.0.0.0         255.255.255.248 U     0      0        0=
 eth0
> > 192.168.111.0   0.0.0.0         255.255.255.0   U     0      0        0=
 eth1
> > 192.168.10.0    0.0.0.0         255.255.255.0   U     0      0        0=
 eth2
> > 0.0.0.0         196.36.10.113   0.0.0.0         UG    0      0        0=
 eth0
> > gate:~#
> >
> > If anyone has any tips or advise they would care to add, it would be mo=
st appreciated.
> >
> > Kind Regards
> > Brent Clark
> >
> >
> >
>

