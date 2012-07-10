From: Nikolai Lusan <nikolai@lusan.id.au>
Subject: Re: iptables and vlan tagging
Date: Tue, 10 Jul 2012 21:46:04 +1000
Message-ID: <1341920764.5850.36.camel@donetsk.home.lusan.id.au>
References: <1341903855.5850.20.camel@donetsk.home.lusan.id.au>
	 <20120710101314.GB5772@tosh.sltosis.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-GhHglbGlyCDvW4voYlni"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120710101314.GB5772@tosh.sltosis.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-GhHglbGlyCDvW4voYlni
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-07-10 at 12:13 +0200, SamLT wrote:=20
> On Tue, Jul 10, 2012 at 05:04:15PM +1000, Nikolai Lusan wrote:
> > Hi,
> > I have a 2 vlans, 1 untagged with private IP's (vlan1) and 1 tagged
> > (vlan2) with non-private IP addresses, and I want to remove the vlan
> > tags before sending vlan2 packets out over my internet link and add the=
m
> > back before sending packets from the internet to vlan2. Should this be
> > done in the iptbales mangle table? or do I need to use ebtables? And
> > exactly how should I go doing this?
>=20
> I'm not really sure to understand your question.=20

My main concern is that I have packets that will end up in the forward
chain and exit out my ADSL link onto the internet with their vlan
tagging in place.


> Viewing the commands
> you used to set this up would certainly help.

The config (on the server/firewall) is done in the
Debian /etc/network/interfaces file:

auto dsl-provider
iface dsl-provider inet ppp
   pre-up /sbin/ifconfig eth0 up
   provider dsl-provider

auto
iface bond0 inet static
   address 10.XXX.XXX.XXX
   netmask 255.255.255.0
   broadcast 10.XXX.XXX.255
   bond-slaves eth1 eth2 eth3
   bond-mode 4
   bond-miimon 100
   bond-lacp-rate 1
   mtu 9000
   bond-primary eth1 eth2 eth3
  =20

auto vlan2
iface vlan2 inet static
   vlan-raw-device bond0
   address 150.XXX.XXX.XXX
   netmask 255.255.255.248
   broadcast 150.XXX.XXX.XXX


A similar method is used on the clients, so all the instances of the
"vlan2" interface on machines are tagged vlans on the 150.XXX.XXX.XXX/29
subnet.


> anyway, assuming you configured this with iproute: eg:
> ip link add link eth0 eth0.10 type vlan id 10
> Then the tagging depends on your routing:
>    * If it has to go out from eth0.10 -> tagging
>    * If it has to go out from eth0 -> no tagging
>=20

The routing table looks like this on the firewall:

# ip route list
default dev ppp0  scope link=20
10.XX.XX.0/24 dev bond0  proto kernel  scope link  src 10.XX.XX.XX=20
150.XX.XX.XX dev ppp0 proto kernel scope link src 59.XX.XX.XX=20
150.XX.XX.XX/29 dev vlan2 proto kernel scope link src 150.XX.XX.XX=20
192.168.XX.0/24 dev eth0  proto kernel  scope link  src 192.168.XX.XX=20


on the network hosts that need to be routed it looks like this

# ip route list
default via 10.XX.XX.XX dev eth0=20
10.XX.XX.0/24 dev eth0  proto kernel  scope link  src 10.XX.XX.XX=20
150.XX.XX.XX/29 dev vlan2 proto kernel scope link src 150.XX.XX.XX=20


So, I guess the question is twofold:=20
1) Do I need to worry about tagged packets leaking onto the internet?
2) If so how do I use the netfilter toolset to stop this from happening?

Thanks
--=20
Nikolai Lusan

Email:     nikolai@lusan.id.au
Phone(H):  (07) 3136 3065
Phone(M):  0425 661 620

--=-GhHglbGlyCDvW4voYlni
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABCgAGBQJP/BX8AAoJEJOjmtAqHQSLORwP/0Frrk/zsUNL03oeGj7gCYUw
IG6sWbP8APnyymunyyACSjXCXLrR4KZv1Ugtf8s3QaH8wdLSGCeybCLejt/Zu51G
7C2vdeSeJINcUGFPOZN8fv/2VG+z7fehBDLp3Jp0y/92cGk0ao9DQUxKNKuXxtdF
xKjrRqLKWWt+ryRooQCkR1IJC6h2GaFaLXCshGBwBnMDGr5fjRZw07tyneejyL+/
CqcDdVfGyfUvikLkzwF1cFNQvaXE5iF8DLjxra2r6TMvEa9jCvD9U3HtDVVj6pC7
Pamci5BqFdjD3CVCGfN2jAbEj2P3zshZ+yKpbuxjMkWHpd5S7B5aiBS4VvX88aqw
7mgGH5z/l91Rc4wqzCIUQyG7RgZLtllB7qU1T1Zr4RQyAEWwPTIAtnIOvg4heDO3
sk8Xd/CilbyC+f7EZU3DjG67C/xr+ThbCZh8R0KpXyGxfvRQdm94RT5VNYZDEM41
rUSjSWV2AVwhCJ4I/LQ/YWvZq41P8dkork5lEvdk84jHTTSzzPhwOt3AN+t6wGf7
9oIm84KMopV2GOf7idE0LAbxKVgHbXMxIIR7FJfJotL5lEOgvTrC7/Oz0qLFxecn
TpqrYGXs8UGhnHID0uQAXcRe3c0pOoaGWwKmLKZ4PTROqEAJ0Hom3CvpGlX7bivI
u/DZW8ckRzVM18HkPkvI
=KEHJ
-----END PGP SIGNATURE-----

--=-GhHglbGlyCDvW4voYlni--

