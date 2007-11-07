From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: packets not seen by iptables - SOLVED
Date: Wed, 07 Nov 2007 14:19:35 -0600
Message-ID: <1194466775.19115.83.camel@grateful.d.umn.edu>
References: <1193683986.18366.39.camel@grateful.d.umn.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-1k4R3jKOZW7XUG092uJS"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1193683986.18366.39.camel@grateful.d.umn.edu>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-1k4R3jKOZW7XUG092uJS
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Problem solved.

Short answer: PEBKAC.

Long answer:

My asymmetrical route map was sending traffic to the wrong address.

The internal (incoming traffic) network for the cluster is:

192.168.115.32/29

Virtual IP =3D 192.168.115.33
Real IP (primary server) =3D 192.168.115.34
Real IP (backup server) =3D 192.168.115.35

The route map was sending traffic to 192.168.115.34 instead of
192.168.115.33. *ugh*

I am still confused as to why the backup server would be "seeing" the
traffic via tcpdump, it is not as if I am using repeaters/hubs.

Mystery solved.

On Mon, 2007-10-29 at 13:53 -0500, Matt Zagrabelny wrote:
> Greetings,
>=20
> I am working on project that involves asymmetrical routing. I am using
> two Debian GNU/Linux boxes as a active passive firewall cluster.
>=20
>=20
>  Outgoing Traffic
>=20
> +--eth0---+   +--eth0---+
> |         |   |         |
> | primary |   | backup  |
> |         |   |         |
> +--eth1---+   +--eth1---+
>=20
>  Incoming Traffic
>=20
> On the primary node everything works as expected.
>=20
> I have done the following:
>=20
> # echo 1 > /proc/sys/net/ipv4/ip_forward
> # echo 0 > /proc/sys/net/ipv4/conf/eth1/rp_filter
>=20
> I can see the traffic "go through the box" with the following commands:
>=20
> # tcpdump -i eth1
> # tcpdump -i eth0
>=20
> and also
>=20
> # iptables -t mangle -L PREROUTING -v -n
> # iptables -t filter -L FORWARD -v -n
>=20
> So, with the tcpdump commands I see on stdout the traffic. With the
> iptables commands I see byte counts increasing on the FORWARD chain.
>=20
> Here lies the problem:
>=20
> When I shut off the primary node and configure the backup to perform the
> same functionality traffic does not seem to "go through" the tables.
>=20
> Running the same commands on the backup:
>=20
> # tcpdump -i eth1        <---- Output on stdout (good)
> # tcpdump -i eth0        <---- No output (bad)
>=20
> and also
>=20
> # iptables -t mangle -L PREROUTING -v -n  <- byte counts do not increase
> # iptables -t filter -L FORWARD -v -n     <- byte counts do not increase
>=20
> So then I also did:
>=20
> iptables -t mangle -A PREROUTING -j LOG --log-level ALERT
>=20
> Again, I see no evidence on any packets reaching iptables.
>=20
> So.... I have no idea where the packets are going after I seem them in
> tcpdump. They seem like they disappear.
>=20
> I have done an effective "diff" of /proc/sys/net/ between the two nodes
> and they are identical.
>=20
--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-1k4R3jKOZW7XUG092uJS
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD4DBQBHMh3XU+eIf4TiLaIRAqTWAJUev5r8Yqj+v96yaWRavUmF/qjJAJ9FjKFx
1rvzi8aAaqfxqy0oTskT9A==
=V3T2
-----END PGP SIGNATURE-----

--=-1k4R3jKOZW7XUG092uJS--

