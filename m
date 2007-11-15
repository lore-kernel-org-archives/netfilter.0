From: Julien VEHENT <julien@linuxwall.info>
Subject: libnetfilter conntrack: problem in nfct_callback_register
Date: Thu, 15 Nov 2007 12:35:48 -0500
Message-ID: <200711151235.52842.julien@linuxwall.info>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1332248.bx3ZaqgHqF";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--nextPart1332248.bx3ZaqgHqF
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi All,

I'm coding with the libnetfilter-conntrack in C and, for some unexpected=20
reasons, my program use to crash (could be after a few minutes or a few=20
hours) with the following message:

> api.c:137: nfct_callback_register: Assertion `h !=3D ((void *)0)' failed.

AFAIK, "h" is the library handler defined by nfct_open(CONNTRACK, 0) and us=
ed=20
in nfct_callback_register, nfct_query and nfct_close.

But I have no idea how to debug that....

I'm using the following libs on Debian Lenny:
>libnetfilter-conntrack-dev =A0 =A00.0.50-1
>libnetfilter-conntrack1 =A0 =A0 =A0 0.0.50-1

I pasted my code here: http://rafb.net/p/nz33XI27.html

This drives me crazy... It's probably just a stupid mistake but I don't see=
=20
it...

Thanks for your help,

Julien

--nextPart1332248.bx3ZaqgHqF
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iQEVAwUARzyDeGRQkOZDZ3N7AQLWVgf8CyFp2/72HBQxCRQ12rUbdQzu5Gk5Lxrw
1AHsl2HsX6xEue3967Q1CIQvbv5ZktudYMG9/GLknB86HwMgIHBGzbgtvszvYNv8
u6jjUfHMBGKU7Bkx6P36/tGUDl6i0t2OtUXso1U2NvtUmR8UY6X3oFDV/7PugckD
9ZIcm0/B0lxuQQbaw44jVmHtzf5/QEeJCLaS2c626DQ6JWemhe4rA0SQwoMSTHfK
mBNRhBevr48ppxtNWPASixQmWWlniHU0cI6Er2K7rs48mXLzRiFw0HCWu2qoyzxT
iv39GOklpCPDgZ3OsWVYoD07tYBvzOyg/4zhpysPIeGhq//nRyA6tQ==
=vqoE
-----END PGP SIGNATURE-----

--nextPart1332248.bx3ZaqgHqF--
