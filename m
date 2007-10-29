From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: multiple NIC traffic =?UTF-8?Q?forwarding=E2=80=8F?=
Date: Mon, 29 Oct 2007 08:31:46 -0500
Message-ID: <1193664706.18366.6.camel@grateful.d.umn.edu>
References: <BAY119-W5D1A138C2C78AB9C1390CE9910@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-vbIT61Efyke3U5SfSWgV"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY119-W5D1A138C2C78AB9C1390CE9910@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Leigh Peterson <warpig369@hotmail.com>
Cc: netfilter@vger.kernel.org


--=-vbIT61Efyke3U5SfSWgV
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


On Mon, 2007-10-29 at 09:08 +0000, Leigh Peterson wrote:
> Hi All,
>=20
> I have a question regarding iptables traffic forwarding. I have a machine=
 with 2 NICs (which are on different subnets) and all inbound traffic is co=
ming in on eth0.
>=20
> I currently have some rules that accepts traffic on a port range and then=
 forwards that traffic to another host (like this one):
> -A FORWARD -d 192.168.18.3 -i eth0 -p tcp -m tcp --dport 6660:6669 -j ACC=
EPT
> as well as some rules that accept traffic for services on this host (like=
 this):
> -A RH-Firewall-1-INPUT -p tcp -m state --state NEW -m tcp --dport 1900 -j=
 ACCEPT
>=20
> My first question is, how can I force the traffic from these two types on=
 rules to respond via eth1?

I believe, though I have never done such a thing, you need to tweak your
routing tables. Check /sbin/route.

>=20
> I also have ProxyPass rules in Apache the traffic of which I would also l=
ike to forward to eth1.

What interfaces (addresses) is Apache listening to? This last statement
confuses me...=20

[...]

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-vbIT61Efyke3U5SfSWgV
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHJeDCU+eIf4TiLaIRApJ/AKC7vUUfnT9ViEZlKDh+opYXikcsCACgjHH3
4bd81CsmfSNx4EHyx/KErd0=
=WXhe
-----END PGP SIGNATURE-----

--=-vbIT61Efyke3U5SfSWgV--

