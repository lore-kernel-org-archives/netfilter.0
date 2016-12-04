From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: DNAT working for one host but not another
Date: Sun, 04 Dec 2016 14:01:41 -0500
Message-ID: <1480878101.19944.29.camel@interlinx.bc.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-68uZvaOBorOqTCdneYNY"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-68uZvaOBorOqTCdneYNY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have a DNAT rule on a host who's purpose is to redirect traffic that
is destined for port 23768 to port 5060 on that host:

Chain PREROUTING (policy ACCEPT 7340K packets, 362M bytes)
=C2=A0pkts bytes target=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0prot opt in=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0out=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0source=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
destination
    9  3878 DNAT       udp  --  enp1s7 *       0.0.0.0/0            0.0.0.0=
/0            udp dpt:23768 to::5060

That rule seems to be working for one host but not another.  This is
what I end up with in the conntrack table:

udp      17 29 src=3D10.75.22.8 dst=3D10.75.23.212 sport=3D5060 dport=3D606=
0 [UNREPLIED] src=3D10.75.23.212 dst=3D10.75.22.8 sport=3D6060 dport=3D5060=
 mark=3D0 secctx=3Dsystem_u:object_r:unlabeled_t:s0 use=3D1
udp      17 175 src=3D10.75.22.200 dst=3D10.75.22.8 sport=3D6060 dport=3D23=
768 src=3D10.75.22.8 dst=3D10.75.22.200 sport=3D5060 dport=3D6060 [ASSURED]=
 mark=3D0 secctx=3Dsystem_u:object_r:unlabeled_t:s0 use=3D1
udp      17 29 src=3D10.75.23.212 dst=3D10.75.22.8 sport=3D6060 dport=3D237=
68 [UNREPLIED] src=3D10.75.22.8 dst=3D10.75.23.212 sport=3D5060 dport=3D102=
4 mark=3D0 secctx=3Dsystem_u:object_r:unlabeled_t:s0 use=3D1

So as you can see, 10.75.22.200 seems to be properly natted and moves
to the ASSURED state but the natting for 10.75.23.212 seems to get
confused and we end up with two of UNREPLIED entries.

Any idea what I'm doing wrong, or what is going wrong?

Cheers,
b.

--=-68uZvaOBorOqTCdneYNY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJYRGgWAAoJENrB0DQWy8igrAYH+gLCcfOjNGSXnGab9DttYtIi
qOR4lf67Ye59XLIG0xNCqQcyLsWHer5sX9kgTNjEFLDAfG8Ih+5dngCUeqmZfAEc
1FS4pyn6oIDPtyu2FBJzMb9lYI+L8UsKH4nBYo2uS1ENfQhLYHyOlOXttv/7p7UB
40JKXpKoMjQBWTrrhkOrdXGiWwswouR1v2MaxA/C9PfcIwrbZdlCJIj52xzdCqRN
zUVBmF3l9cl2CIccKSzX74zop0LUCQQlouUkla3w7rofaEbPW/8TC7xHGA4Z/ecG
ss4BGgHhiqNzWeooNEL+BMTMVtb1ytBsKY6pV05H7G+j0ASITaSXzhK+ey/g5vM=
=fh4e
-----END PGP SIGNATURE-----

--=-68uZvaOBorOqTCdneYNY--


