From: Eric Leblond <eric@inl.fr>
Subject: Re: How to make NFQUEUE ?
Date: Thu, 20 Nov 2008 00:01:15 +0100
Message-ID: <1227135675.15799.17.camel@ice-age>
References: <1227122910.6445.14.camel@lya14-2-82-232-125-204.fbx.proxad.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-+hYvCsTjw+VZQJVBWCFk"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1227122910.6445.14.camel@lya14-2-82-232-125-204.fbx.proxad.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: sriliam <sriliam@free.fr>
Cc: netfilter@vger.kernel.org


--=-+hYvCsTjw+VZQJVBWCFk
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello,

Le mercredi 19 novembre 2008 =E0 20:28 +0100, sriliam a =E9crit :
> Hi all,
>=20
> Some days ago, I present a question and I been oriented to NFQUEUE.
> Ok ... but how does it work ?
> I said : "~# iptables -I INPUT -j NFQUEUE".
>=20
> So, I suppose that I will have all packets of INPUT filter table playing
> with NFQUEUE : am I wrong ?

No.

>=20
> Next, I rely this to some example programs in order to ACCEPT the
> packet, like from net-perl-bindings : I made a network mirror like.
>=20

You can give a try to some high level binding if you want:
http://software.inl.fr/trac/wiki/nfqueue-bindings

>=20
> Questions :
>=20
> First, not all packets get through NFQUEUE : with perl and more
> dramaticaly with C too.

It looks like a problem in your program, a project like snort-inline is
able to handle all traffic.


> Second, not all packets get the policy ACCEPT, so my browser don't get
> images ... but only text, perfectly indeed. Is there a way to get ACCEPT
> on an handler that have no lenght ?

Same remark. Do you use a call like:
	nfq_set_verdict(hndl, PACKETID, DECISION, 0 , NULL)

> If someone know about this, I would happy to read an HowTo.

The libnetfilter_queue.c has recently been documented:
http://git.netfilter.org/cgi-bin/gitweb.cgi?p=3Dlibnetfilter_queue.git;a=3D=
blob;f=3Dsrc/libnetfilter_queue.c
This is with nufw or snort-inline code, the only doc I know.

BR,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-+hYvCsTjw+VZQJVBWCFk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Ceci est une partie de message
 =?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iD8DBQBJJJq4nxA7CdMWjzIRAvk0AJ9+ykcpt3zQ4+sHybIJtfYcRzlZPACeKcUU
/Utess1ekdgqwawHEqUPVVU=
=o0Nw
-----END PGP SIGNATURE-----

--=-+hYvCsTjw+VZQJVBWCFk--

