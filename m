From: Christian Fassina Costa <atros@atros.org>
Subject: Re: nat throught different gateways
Date: Tue, 26 Oct 2004 06:20:50 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098782449.4899.25.camel@localhost>
References: <1098757668.4899.17.camel@localhost>
	<1098762218.5877.10.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-h+BxUxtum4fo7GaLr00I"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1098762218.5877.10.camel@hubcap.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--=-h+BxUxtum4fo7GaLr00I
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


	Well, first of all thanks for the reply. Unfortunately it didn't work
:( Let me explain it better, my default route (eth0) gets its ip address
via dhcp spoofing.=20
	My routing table looks like this

200.96.103.0    0.0.0.0         255.255.255.0   U     0      0        0
eth0
10.0.0.0        200.96.103.38   255.255.255.0   UG    0      0        0
eth0
10.1.0.0        0.0.0.0         255.255.255.0   U     0      0        0
eth1
0.0.0.0         10.0.0.138      0.0.0.0         UG    0      0        0
eth0

I even tried setting the nat interface as ppp0 unsuccessfully... I don't
know if there is some issue related to the fact that ppp0 is
encapsulated into eth0 and all the strange stuff I had to do to get my
dhcp spoofing working (route add -net 10.0.0.0/24 gw 200.96.103.38;
route add default gw 10.0.0.138 after getting the ip address via dhcp).

The procedure in the reply should work in my opinion but there must be
another problem.. I'll keep on trying, if anyone else could enlight I'd
appreciate :)


Regards,

Christian


On Tue, 2004-10-26 at 00:43, Jason Opperisano wrote:
> On Mon, 2004-10-25 at 22:27, Christian Fassina Costa wrote:
> > Hi ppl,
> >=20
> > I have the following scenario:
> >=20
> > A internal network 10.1.0.0/24
> > A gateway with 3 interfaces
> > eth0 adsl provided ip address
> > eth1 10.1.0.1 (internal network)
> > ppp0 192.168.0.234 (vpn to a foreign computer)
> > The host in the other end is doing NAT with iptables for all addresses.
> >=20
> > What I'd like to do:
> >=20
> > Since I have several computer in my LAN I'd like one of them to use ppp=
0
> > as output interface. I added a route to my internal network in the othe=
r
> > end of my vpn (route add -net 10.1.0.0/24 gw 192.168.0.234).=20
> > If I add a static route, for instance: route add -host www.google.com g=
w
> > 192.168.0.1, it works fine.
> >=20
> > I tried adding an iptables rule as it follows:
> > iptables -t nat -A POSTROUTING -s 10.1.0.0/24 -o ppp0 -j MASQUERADE
> >=20
> > I can successfully ping 192.168.0.1 but I figured out that the NAT is
> > not working as I expected (traffic going out via ppp0).
> >=20
> > I even tried setting up an alias for my eth1 with a different network
> > 10.2.0.1
> >=20
> > then I set up my computer with the address 10.1.0.2 with default gw
> > 10.2.0.1.
> >=20
> > If I use the following rule:
> >=20
> > iptables -t nat -A POSTROUTING -s 0/0 -o eth0 -j MASQUERADE
> >=20
> > it works fine for me and the other computers in the 10.1.0.0 network.
> >=20
> > Then I tried
> > iptables -t nat -A POSTROUTING -s 10.1.0.0/24 -o eth0 -j MASQUERADE
> > iptables -t nat -A POSTROUTING -s 10.2.0.0/24 -o ppp0 -j MASQUERADE
> >=20
> >=20
> > I worked fine for the 10.1.0.0 network but no for the 10.2.0.0 network.
> >=20
> > Does anyone know how to solve this issue? I also read some ip route
> > documentation but did not find anything suitable to solve this problem.
>=20
> is it safe to assume that the default gateway of your netfilter machine
> is the ADSL router?
>=20
> if so--follow the instructions at:
>         http://lartc.org/howto/lartc.netfilter.html
> to setup an alternate default route for the "special case."
>=20
> something like this:
>=20
> # create an alternate route lookup table
> echo 201 ppp0.out >> /etc/iproute2/rt_tables
>=20
> # add a routing rule based on a netfilter mark
> ip rule add fwmark 1 table ppp0.out
>=20
> # add a default route to the alternate table
> ip route add default via 192.168.0.1 dev ppp0 table ppp0.out
>=20
> # mark the packets from the special source machine to be routed over ppp0
> iptables -t mangle -A PREROUTING -i eth1 -s $SPECIAL_MACHINE -j MARK --se=
t-mark 1
>=20
> # make sure our MASQ rules use the IP of the exit interface
> iptables -t nat -A POSTROUTING -s -o eth0 -j MASQUERADE
> iptables -t nat -A POSTROUTING -s -o ppp0 -j MASQUERADE
>=20
> -j
--=20

--=-h+BxUxtum4fo7GaLr00I
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBfhbxIjrDWFm+WG8RAnrLAJ0cXyG7AFYiL69mrMdS2dStYLUrJACglQWP
QsyKz50CrrZPEoocuoK85qA=
=lsr7
-----END PGP SIGNATURE-----

--=-h+BxUxtum4fo7GaLr00I--


