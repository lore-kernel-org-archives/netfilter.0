From: Martin Millnert <millnert@csbnet.se>
Subject: Re: mask 10 -> 29
Date: Wed, 15 Apr 2009 19:22:30 +0200
Message-ID: <1239816150.15363.38.camel@localhost.localdomain>
References: <49E6044F.5070305@lab.vectoris.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-1D8AB4/hjxQa3xHDcbPy"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49E6044F.5070305@lab.vectoris.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "Mihamina Rakotomandimby (R12y)" <mihamina@lab.vectoris.fr>
Cc: netfilter@vger.kernel.org


--=-1D8AB4/hjxQa3xHDcbPy
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2009-04-15 at 18:59 +0300, Mihamina Rakotomandimby (R12y) wrote:
> Hi,
> I have this kind of shell script in order to set something on a bunch of =
IP=20
> addresses:
>=20
> for ACCEPTED_MACHINE in \
>      192.168.0.10 \
>      192.168.0.11 \
>      192.168.0.12 \
>      192.168.0.13 \
>      192.168.0.14 \
>      192.168.0.15 \
>      192.168.0.16 \
>      192.168.0.17 \
>      192.168.0.18 \
>      192.168.0.19 \
>      192.168.0.20 \
>      192.168.0.21 \
>      192.168.0.22 \
>      192.168.0.23 \
>      192.168.0.24 \
>      192.168.0.25 \
>      192.168.0.26 \
>      192.168.0.27 \
>      192.168.0.28 \
>      192.168.0.29
> do
> $IPTABLES [...]
> done
>=20
>=20
> How could I use a mask such as 192.168.0.0/NN to exactly match the list?
> Thank you.
>=20

Hi Mihamina,

Possible exact solutions include either:
  aggregate - { ftp://ftp.isc.org/isc/aggregate/ |
http://packages.debian.org/aggregate }  - cidr aggregation
  or,
  iptables -m iprange  - non-cidr consecutive IP-ranges matching

Examples:

  aggregate

anticimex@natalie:/tmp$ awk '{print $1 "/32"}' << EOF | aggregate
> 192.168.0.10
> 192.168.0.11
> 192.168.0.12
> 192.168.0.13
> 192.168.0.14
> 192.168.0.15
> 192.168.0.16
> 192.168.0.17
> 192.168.0.18
> 192.168.0.19
> 192.168.0.20
> 192.168.0.21
> 192.168.0.22
> 192.168.0.23
> 192.168.0.24
> 192.168.0.25
> 192.168.0.26
> 192.168.0.27
> 192.168.0.28
> 192.168.0.29
> EOF
aggregate: maximum prefix length permitted will be 32
192.168.0.10/31
192.168.0.12/30
192.168.0.16/29
192.168.0.24/30
192.168.0.28/31
anticimex@natalie:/tmp$=20


  iptables -m iprange

natalie:~# iptables -A INPUT -i eth2 -m iprange --src-range 192.168.0.10-19=
2.168.0.29   =20
natalie:~# iptables -nvL INPUT=20
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion        =20
    0     0            all  --  eth2   *       0.0.0.0/0            0.0.0.0=
/0           source IP range 192.168.0.10-192.168.0.29=20
natalie:~#=20

anticimex@natalie:/tmp$ /sbin/iptables -m iprange -h
<snip>
iprange match options:
[!] --src-range ip-ip        Match source IP in the specified range
[!] --dst-range ip-ip        Match destination IP in the specified range


Hope this helps.

Regards,
--=20
Martin Millnert <millnert@csbnet.se>

--=-1D8AB4/hjxQa3xHDcbPy
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknmF9QACgkQApq14zkeZkwWIwCeLFzRyxudnzYHFMn6RCiBnM0d
0KYAoJxsqi4ojYXfkqnT5A3LaMCIMFJM
=aNCG
-----END PGP SIGNATURE-----

--=-1D8AB4/hjxQa3xHDcbPy--
