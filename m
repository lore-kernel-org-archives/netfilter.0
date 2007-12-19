From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: iptables - Couldn't load target error
Date: Wed, 19 Dec 2007 07:48:51 -0500
Message-ID: <200712190748.52635.vapier@gentoo.org>
References: <200712191221.58597.schane@osmozis.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1822725.zMAWCljGzW";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200712191221.58597.schane@osmozis.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: busybox@busybox.net
Cc: Saravanan Chanemouganandam <schane@osmozis.com>, netfilter@vger.kernel.org, linux-arm@lists.arm.linux.org.uk

--nextPart1822725.zMAWCljGzW
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 19 December 2007, Saravanan Chanemouganandam wrote:
> I have some problem with iptables (v1.3.8) and extension supports librari=
es
> installed to the buildroot's root filesystem (/lib/iptables) running on
> Xscale pxa270.

this isnt a busybox issue.  please dont mass cc us next time.

> iptables with MASQUERADE support throws Couldn't load target error. The
> following strace shows that it tries to open libraries in the /lib and in
> the /usr/lib instead of /lib/iptables.

your iptables was compiled incorrectly.  the library path is irrelevant as =
the=20
iptables compile should select the runtime path correctly.  complain to=20
whoever build your iptables.

you can clearly see it here:
> open("/home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/lib/ip=
ta
>bles/libipt_MASQUERADE.so",)

guess you should complain to the buildroot list
=2Dmike

--nextPart1822725.zMAWCljGzW
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iQIVAwUAR2kTNEFjO5/oN/WBAQLn4A//YkILL/IjQMhLglxT+2+TZWHcjhVpCuxo
1TT46gtW5bYGzI+6racZ8YIX1Z9ij+yONXJmZeOdb79TgBi11ygdvScS5fXA+CAs
B0zThjJlBC1zyzk/swvcmCerHO8Yn1+YrCcHFBseIdSVOJAL16NV2wkmRSVeecC9
1qOWrMrAQUOdZ+snnZSMmwm63q+bTnlt2N9qIuji15UJV4Ql/06hwf+3tkn9RHoq
z4Ls5P2tU+8VEn7yyhrFfwxpYRgYCELOJpRyWBN3q9C6TjDlUIO2QhLp0AUCS2d3
vWIN4uAkz38Rrdrq+Y7MtPVTtr/ibS/8Mz0NFq8GDqP0ZZeJxjBGxEW7jfy8uNLB
5cwgKiMCho0K9JDv7v1UZ+TCsZf2JDnb1C2GSW5vr1ENTKadCqyAIeff5RF9ZuVG
hXiHBplxDJojdCXs3+L2CdyFnO75DwIAfFLdF2Aj+ztudeMr7XAyxEq1jNKvJ1NG
+6DbWXSvWGA4xS59/j+vg0XfUVirgCyCmdDBoecEJQveykNzpt/O6tdb5rXZVNCV
9w5WMH27CsIrCq1I4lBb2fBgK38xOVl5tip8LuduphyM+rlPle9TcrKMYzFHsfUW
0sD/8SNrL/EQm/SMKW7WhL1HUKLqLTX/xQlZYbumHBszqtyLxel8u0W+xgBP4CMS
F6X0CyquqMc=
=oZ5q
-----END PGP SIGNATURE-----

--nextPart1822725.zMAWCljGzW--
