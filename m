From: Robert Sander <r.sander@heinlein-support.de>
Subject: nftables iifname and currently unknown interfaces
Date: Fri, 16 Oct 2020 12:37:58 +0200
Message-ID: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="QMh4zRtbCPODBCKVVWEOdeaAHXLKhgf3y"
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QMh4zRtbCPODBCKVVWEOdeaAHXLKhgf3y
Content-Type: multipart/mixed; boundary="pB7TL3dhnZyK9LB2jHaqNxRfG014jzMIn"

--pB7TL3dhnZyK9LB2jHaqNxRfG014jzMIn
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Hi.

with iptables it was possible to specify "-i ifacename" even when the
interface was currently not available.

nft bails out with an error:

=2E/nft:225:1-75: Error: Could not process rule: No such file or director=
y
add rule ip filter FORWARD iifname bond0.16 oifname bond0.42 accept

We are generating a single firewall configuration for a number of
firewalls with different interfaces. How do we migrate to nftables?

Regards
--=20
Robert Sander
Heinlein Support GmbH
Schwedter Str. 8/9b, 10119 Berlin

http://www.heinlein-support.de

Tel: 030 / 405051-43
Fax: 030 / 405051-19

Zwangsangaben lt. =C2=A735a GmbHG:
HRB 93818 B / Amtsgericht Berlin-Charlottenburg,
Gesch=C3=A4ftsf=C3=BChrer: Peer Heinlein -- Sitz: Berlin


--pB7TL3dhnZyK9LB2jHaqNxRfG014jzMIn--

--QMh4zRtbCPODBCKVVWEOdeaAHXLKhgf3y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhVXmaPzvl7l1erVE8LuRWCPeWygFAl+JeAYACgkQ8LuRWCPe
WyjJzA//U9Bkjip3RcM7waV693nrjAjc2KmjYSEZHN9bA+Sy/ng7H95c467C7xki
S9QfTN93QYY+pKEIGC+hiw+vPvJiKy6UJYkR8O5XYz8m2lbFZOg0Mjawi5oazVgO
mN7dXYcORfHqdpDuF9G3kVzf77JGeSFSjpG0PstofIkzdNuZCgIxBIYMfbGVMIaH
a7h5GMrT/JXIt4GbJDcPKzVn+wIcXE7Wvoqkt5/dzlwIcrP4AX9Ul6KDwGjhl/on
ItBcsHuyby9uOi3eb3C7eO3d2dV1fiCMhsqcXYVLwEGNWj96Z5uY7Z5g/e6AglUv
iipsuvMaLrLJ7X+nv8UoFEgg+dFvnCYBAogJS4N2woV4S3rQdP6fz4kfJ0X4aMpO
FNPOjn27AUvqHa48Fj5peTMYL/xy4Bv+/JOfCqzOlBVOi62nYuyRpJXFRNthcdgp
SBs8oVmmC7yUd45S3cCNv1arhbSFKfvjN7uQrjh/53OzzzlELtdHRRb4jP2qajkt
x4eg+Qp60Ekqj/9ppnErABBzlhwInattgAxUvHn+dTHhVXWAyXFtA29I2Ovw/srv
vv3E7TTTp3JhQJSkaO2mS+06kO3vz+SR7der91u108FmcZ1iDoM3DT0KjGEqZYd5
svj1xpzT1MXsWePNVhxdfb/ls318KY55tYEqGOk1kcMoOm/wOB8=
=+8ej
-----END PGP SIGNATURE-----

--QMh4zRtbCPODBCKVVWEOdeaAHXLKhgf3y--
