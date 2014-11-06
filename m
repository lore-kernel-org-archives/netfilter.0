From: Robert Sander <r.sander@heinlein-support.de>
Subject: Re: Linux Firewall Active/Active
Date: Thu, 06 Nov 2014 13:43:36 +0100
Message-ID: <545B6CF8.9040603@heinlein-support.de>
References: <CADuigkVbB2nt5P6y-JCaW_bh6v_GhjL9BRBiHRyvA_yH81v4RA@mail.gmail.com> <CAOkSjBgMu_wdy0_oJ=yQqtYHeRz0yiTy1C-LO-qO3xiE0gPDCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="xI9PxhtI7m0rawV11QeB6utsL3XsTJxB4"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAOkSjBgMu_wdy0_oJ=yQqtYHeRz0yiTy1C-LO-qO3xiE0gPDCg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xI9PxhtI7m0rawV11QeB6utsL3XsTJxB4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05.11.2014 21:40, Arturo Borrero Gonzalez wrote:
>=20
> I would recommend Debian, corosync + pacemaker.

Keepalived easily outperforms corosync + pacemaker if all you need are
managed IP addresses and routes in your firewall cluster.

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


--xI9PxhtI7m0rawV11QeB6utsL3XsTJxB4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUW2z4AAoJEPC7kVgj3lsoYncQAJM/wmedbND4M6Plw6SlNhED
AXWZjKS7ekDEFmfCgy4wxp92Pla4aMeMU70mivK68NXajBbXiBPeegLz0AZSJyNB
VFO0l/iExc3NaT6W+tnqQ3oUJmi6iqCq5yC4fwf4LXTw7V542T7MqXNiqpmKbAbg
Tv4FbaKXCMv0bSAw/icGzHwUuWUNAHJzLqAymTn6aGYI7TWCSDmQwSX6MAxMNFP6
FhPqRMtaWXq8fIEoYn2vy0mIcHgTJql/6RIvxewOPU+F9TYdKpusEb9TVlt2xz/2
01ZMDD/KWRwnPQPdNN1vpi5sbbtu7p/Hl9A6RYIt1Fggy7FlC7aolaoz+/KBSuvP
L6TjpyLJbfgxk1gAkWDqqWUoA1sD0JSE6WYAgyPr81y0biL/VDIAHOizy2AYvFyP
SXoIadJ/gucfhZ6p6iacuv8bQ/zoAXf2g5r2J2uFArFv/vCnIyuvbd46Z04qh1Hp
oQRqLPKpN20XnI0a07LDfWyD2RXzp8qEVqild7zIzDbtfadenhvVBzZ5KxBTGQXu
8uqVjET4Kdmfnkh6xrXQaSq5oAVmjl8IzKA9hulDp6YNfsOfYaQEkZpYTTNGIhS8
8st8VNiXTLqzQVtQNqd7TITeIq7HHfS3fe8v0epQ1nv5+5wOKfeDLbS30LTp9MOG
lJ+VmvGEr2H12h4EL6sz
=tN1D
-----END PGP SIGNATURE-----

--xI9PxhtI7m0rawV11QeB6utsL3XsTJxB4--
