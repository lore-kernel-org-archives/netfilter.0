From: Eric Leblond <eric@regit.org>
Subject: Re: Bad Argument `lo'
Date: Thu, 04 Oct 2012 21:23:57 +0200
Message-ID: <1349378637.4593.29.camel@tiger.regit.org>
References: <506DE015.2090606@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-gBrj0GnR7vlAaxISteOL"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <506DE015.2090606@gmx.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Markus Feldmann <feldmann_markus@gmx.de>
Cc: netfilter@vger.kernel.org


--=-gBrj0GnR7vlAaxISteOL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 04 octobre 2012 =C3=A0 21:14 +0200, Markus Feldmann a =C3=A9crit :
> Hi All,
>=20
> i using iptables (version 1.4.14) on a LMDE(Debian like) with kernel=20
> 3.5.3. Some days before i watched my logs after several weeks again. :-)=
=20
> And i spotted the error message:
>=20
> Bad argument `lo'
>=20
> So i searched at google to get a solution and i got one. Some user told=
=20
> to put the <lo> into ticks, like this
>=20
> '!lo'

Nope the solution is given in the man page:
   [!] -i, --in-interface name

So you need
	iptables -A INPUT ! -i lo -s 127.0.0.1 -j DROP

BR,
>=20
> My iptables-rules regarding on this problem were looking so,
>=20
> ...
> iptables -A INPUT -i ! lo -s 127.0.0.1 -j DROP
> ...
>=20
> and i changed this line to,
>=20
> ...
> iptables -A INPUT -i '!lo' -s 127.0.0.1 -j DROP
> ...
>=20
> Now i am not sure, if this works correctly. <iptables -L> shows me the=
=20
> device "!lo",
>=20
> ######################################################################
> Chain INPUT (policy DROP 0 packets, 0 bytes)
>   pkts bytes target     prot opt in     out     source destination
>      0     0 LOG        all  --  !lo    any     localhost anywhere=20
>         limit: avg 3/sec burst 5 LOG level warning prefix "Loopback=20
> gespooft: "
>      0     0 DROP       all  --  !lo    any     localhost anywhere
> ######################################################################
>=20
> but i am not sure if this works correctly. Does somebody knows if this=
=20
> trick works correctly?
>=20
> regards Markus
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Eric Leblond=20
Blog: http://home.regit.org/ - Portfolio: http://regit.500px.com/

--=-gBrj0GnR7vlAaxISteOL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAlBt4k0ACgkQnxA7CdMWjzKnOQCfaCY/v6psHInVKtI4rgH0DVTs
4PUAoIJ2I9IfBbULRdQ9Onqzmb9Av+xN
=zgbK
-----END PGP SIGNATURE-----

--=-gBrj0GnR7vlAaxISteOL--

