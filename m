From: Eric Leblond <eric@inl.fr>
Subject: Re: libnetfilter_queue ---- set_mode function not returning .
Date: Mon, 10 Aug 2009 23:56:08 +0200
Message-ID: <1249941368.17184.17.camel@ice-age>
References: <cfeab66d0908100126g54834d7au51f7444d6edcefcb@mail.gmail.com>
	 <1249899383.7133.13.camel@khasse.inl.fr>
	 <cfeab66d0908100357v1b3e6718l3299a390982ac8ca@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-lbiiRvvhF/rv4czPrQeG"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d0908100357v1b3e6718l3299a390982ac8ca@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org


--=-lbiiRvvhF/rv4czPrQeG
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 10 ao=FBt 2009 =E0 16:27 +0530, ratheesh k a =E9crit :
> Eric ,
>=20
>   I am running this program on 2.6.25 kernel on qemu emulation . But
> if i run this on my     fedora linux desktop computer , i am not
> facing this problem .
>=20
>  I dont know  whether call is reaching till sendmsg of netlink socket
> in af_netlink.c ??? is there any other tool or s/w to test netlink
> socket is working fine ???

You could give a try to conntrack-tools (conntrack binary in
particular). They also use libnfnetlink.

By the way what happen if you only try to get the first bytes :

	if (nfq_set_mode(qh, NFQNL_COPY_PACKET, 0xff) < 0) {


> i already posted a program ( this i got from internet ) to check
> nwtlink socket is working fine .
> http://marc.info/?l=3Dnetfilter&m=3D124937098723617&w=3D2
> but this program is not working on my fedora 9 linux desktop also ......

Your code (after some minor unrelated fix, like cb missing in what you
send) is correct. It is working correctly on my computer. Further more,
the logic is the same as the one used in NuFW which is know to work fine
in most (if not all) setup.

BR,
--=20
Eric Leblond <eric@inl.fr>
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/

--=-lbiiRvvhF/rv4czPrQeG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Ceci est une partie de message
 =?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iD8DBQBKgJd0nxA7CdMWjzIRAoWAAJ9GUhoHkm2j61Z5KlyPjXgJxvE5QwCfTx+y
VgyseTdrXOJ5Q6DPaC056Jw=
=+u2w
-----END PGP SIGNATURE-----

--=-lbiiRvvhF/rv4czPrQeG--

