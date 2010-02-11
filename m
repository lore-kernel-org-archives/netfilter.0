From: Eric Leblond <eric@inl.fr>
Subject: Re: performance testing iptables...
Date: Thu, 11 Feb 2010 09:15:34 +0100
Message-ID: <1265876134.22782.10.camel@khasse.inl.fr>
References: <f08c15d11002102346n6dade2dgd00185620dc373e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-oWXTTnVb3RFYK0rUE85h"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <f08c15d11002102346n6dade2dgd00185620dc373e@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Payam Chychi <pchychi@gmail.com>
Cc: netfilter@vger.kernel.org


--=-oWXTTnVb3RFYK0rUE85h
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 10 f=C3=A9vrier 2010 =C3=A0 23:46 -0800, Payam Chychi a =C3=A9c=
rit :
> Hi Guys,
>=20
> Ive been reading all over the web on performance tests done against
> iptables and its ability to perform both state and non-state
> filtering. I am setting up a pretty decent server for some testing and
> I was wondering if you guys could give me some ideas on how to fully
> push iptables to its limits (different type of traffic, different
> usage, string matching/u32 module and such...)
>=20
> Server consists of:
> Quad Cor Intel(R) Xeon(R) CPU           E5420  @ 2.50GHz
> 32gig Ram
> 220gig Sata (not worried about this as im trying to keep most things in r=
am)
> Intel Gig nics
>=20
> Running:
> Debian 5.0 + grsec
>=20
> I will later post results and poc online for others to view
> Any/All ideas are welcome =3D)

There is some interesting read about the topic:
http://people.netfilter.org/kadlec/nftest.pdf
http://nfws.inl.fr/nfws_userday/Jesper-Brouer_Large-iptables-rulesets.pdf

Google on "Netfilter performance" seems to bring some other information
sources.

BR,
--=20
=C3=89ric Leblond <eric@inl.fr>
EdenWall, http://www.edenwall.com/
NuFW, http://www.nufw.org

--=-oWXTTnVb3RFYK0rUE85h
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAktzvKIACgkQnxA7CdMWjzJvgwCfZqAiAvTuyqx9ynaJDjLFHfS4
XmEAmwSSjXXStFoYFOB8n15eDTffdzpN
=W3RE
-----END PGP SIGNATURE-----

--=-oWXTTnVb3RFYK0rUE85h--

