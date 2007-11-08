From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: NAT for multiple non-directly connected subnets
Date: Thu, 08 Nov 2007 16:04:55 -0600
Message-ID: <1194559495.19115.105.camel@grateful.d.umn.edu>
References: <e97f32c10711081353t5602912fr560386581cd39c7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-4ZJfu+RwsQ0cZ5TO731L"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e97f32c10711081353t5602912fr560386581cd39c7@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Bradley Kite <bradley.kite@gmail.com>
Cc: netfilter@vger.kernel.org


--=-4ZJfu+RwsQ0cZ5TO731L
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


On Thu, 2007-11-08 at 21:53 +0000, Bradley Kite wrote:
> Hi all,
>=20
> I've been using NAT for my home network (a single /24 RFC1918 address
> range) and it has been working well, however I've recently tried
> NATing a more complex environment environment as follows:
>=20
>  Linux Machine:
> Internal Interface: 192.168.1.50/30 -> 192.168.1.49/30

What does the previous line mean? Better explanation please.

> External Interface: 81.179.30.111/24

I assume that this is eth0.

> Now, connected off the internal interface is a whole network
> consisting of several subnets all linked off each other - ie they are
> not directly connected to the linux machine.
>=20
> The problem I have is that the NAT on the linux box is only actually
> nating traffic that comes directly from  192.168.1.49 - the first
> upstream router. Any traffic from, for example, 192.168.2.0/24 wont
> get natted to  81.179.30.111  as expected. I can see this with tcpdump
> - traffic from the directly connected router gets natted, other
> traffic is seen (so its not a routing issue) its just not being
> natted.

Perhaps do some logging (-j LOG) or check the counters on the various
chains.

# iptables -t nat -L -v -n

[...]

> Is there any thing I am missing with this configuration? Is there some
> limitation with doing NAT that only allows directly connected subnets
> to be natted?

I am not an expert, but SNAT applies on the way out (as you know), so
the box shouldn't care what the ip ranges are. All traffic (local and
forwarded) should be "equal" in the POSTROUTING chain.

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-4ZJfu+RwsQ0cZ5TO731L
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHM4gHU+eIf4TiLaIRAm9fAJsEQIsjqP+S0om12IvL/ZhWFfYxrQCeKKDX
CZMrVQZ593geEANqy0q+SYo=
=0cJD
-----END PGP SIGNATURE-----

--=-4ZJfu+RwsQ0cZ5TO731L--

