From: "ISC Jorge Ceron Galvan" <jorgec@acerlandslp.com.mx>
Subject: Re: Odd issue with two SNATed Firewalls and Wireless router
Date: Thu, 25 Aug 2005 11:50:40 -0500
Message-ID: <WorldClient-F200508251150.AA50400018@acerlandslp.com.mx>
References: <1124886644.9968.186.camel@andrew.iface.lan>
	<WorldClient-F200508241343.AA43070008@acerlandslp.com.mx>
	<200508241547.18164.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508241547.18164.rob0@gmx.co.uk>
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
To: /dev/rob0 <rob0@gmx.co.uk>, netfilter@lists.netfilter.org
Cc: sandrac@acerlandslp.com.mx


No, that's not my real net.

let's say my real net is 1.2.3.0/24, so I have this

cisco sync0    5.6.7.9/30    (internet)
cisco eth0     1.2.3.1/24
linux eth0     1.2.3.10/24   gw 1.2.3.1

linux eth1     1.2.3.129/27
remote router  1.2.3.130/27  gw 1.2.3.129

as I understood I should be doing something like this

cisco sync0    5.6.7.9/30    (internet)
cisco eth0     1.2.3.1/27
linux eth0     1.2.3.10/27   gw 1.2.3.1

linux eth1     1.2.3.129/27
remote router  1.2.3.130/27  gw 1.2.3.129

I told you I was not using iptables because I didn't think it was part of t=
he problem but,=20
as a matter of fact, I do. I'm doing nat on eth0 using (again) 1.2.3.17/24 =
so linux eth0 was

linux eth0     1.2.3.10/24
linux eth0     1.2.3.17/24 secondary

and as I you say, this worst things, thouhgt; finally the right configurati=
on would be:

cisco sync0    5.6.7.8/30    (internet)
cisco eth0     1.2.3.1/27
linux eth0     1.2.3.10/27   gw 1.2.3.1
linux eth0     1.2.3.17/27   secondary

linux eth1     1.2.3.129/27
remote router  1.2.3.130/27  gw 1.2.3.129

iptables -t nat -A POSTROUTING -o eth0 -s 10.10.2.0/24 -j SNAT --to 1.2.3.17


right? is this simplier? do you think using /24 at eth0 could be affecting =
the smtp?

the main problem is at 1.2.3.130 : this is a small router doing nat using 1=
.2.3.130, but the=20
pc's behind it could=B4t reach an internet mail server


thx !!!!


-----Original Message-----
From: /dev/rob0 <rob0@gmx.co.uk>
To: netfilter@lists.netfilter.org
Date: Wed, 24 Aug 2005 15:47:18 -0500
Subject: Re: Odd issue with two SNATed Firewalls and Wireless router

> On Wednesday 2005-August-24 13:43, ISC Jorge Ceron Galvan wrote:
> > I'm not doing nat because I want a real IP at my wireless client.
> >
> > cisco eth0  200.0.0.1/24
>=20
> What a great netblock that is! Uh, this *is* your real IP, or did you
> munge it for posting? It's not the same as what appears in your mail=20
> headers.
>=20
> If you're going to munge IP addresses, you should not use a live=20
> netblock. Pick something from RFC 1918 or an unassigned (bogon)
> range.
>=20
> > linux eth0  200.0.0.10/24  gw 200.0.0.1/24
>=20
> /24 covers 200.0.0.0 (the network address) through 200.0.0.255 (the=20
> broadcast address.)
>=20
> > linux eth1  200.0.0.129/27
>=20
> And this is included in the eth0 network. Perhaps you should use /25=20
> netmask or greater on eth0.
>=20
> > remote fortinet router eth0 200.0.0.130/27   gw 200.0.0.129
>=20
> I don't know what this means.
>=20
> > I thougth it could be a routing problem because I'm using subnet 0
> at
> > eth0, and at eth1 I set up a subnet from eth0.
>=20
> Yes, that is a part of the problem, I would think.
>=20
> > It's not an iptables=20
> > issue because I'm not using it at all. The configuration is quite
>=20
> This is the netfilter list, so you're off topic here.
>=20
> > simple, but I don't know whether you can subnet a class C net this
>=20
> I don't know either. I generally find that doing things the right way
> works better. ;)
>=20
> > way. The mail server we are trying to reach is somewhere in the
> > internet.
> >
> > I'm using a wireless AP at my side and a wireless bridge at the
> other
> > side; the bridge is connected directly to the fortinet router.
> Could
> > it be a protocol bridge problem?
>=20
> 1. Check the routing
> 2. Check the routing
> 3. Check the routing
> 4. Look at packet counters, is eth1 being used at all?
>=20
> replying to the OP as well:
> > -----Original Message-----
> > From: Andrew Gargan <andrew@iface.co.za>
> snip
> > > Has anyone experienced similar issues using a shared NATed
> > > mywireless ....
> > >
> > > most of the mail comes down .... it seems to break when
> > > transmissions are over +-600 KB)
> > >
> > > I was told that changing the MTU for the ppp0 device to 1300
> would
> > > help but no luck there.
>=20
> It does sound like a possible router MTU issue. It does not sound
> like=20
> iptables/netfilter is involved.
>=20
> > > eth1      Link encap:Ethernet  HWaddr 00:03:47:71:7B:37
> > >           inet addr:10.0.7.2  Bcast:10.255.255.255=20
> Mask:255.0.0.0
> > >           inet6 addr: fe80::203:47ff:fe71:7b37/64 Scope:Link
> > >           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
> > >           RX packets:27333550 errors:0 dropped:0 overruns:0
> frame:0
> > >           TX packets:28013971 errors:1 dropped:0 overruns:0
> > > carrier:1 collisions:614337 txqueuelen:1000
>=20
> That is a lot of collisions. It might not indicate a problem, but=20
> likewise, it might.
>=20
> > > and iptables -L:
>=20
> ... is utterly useless. "iptables -vL" is better, but
> iptables-save(8)=20
> is greatly preferred.
>=20
> That said, nothing indicates the likelihood of a problem with your=20
> iptables rules.
>=20
> > > I am using rp-pppoe I think ...
>=20
> You think?
> --=20
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header


