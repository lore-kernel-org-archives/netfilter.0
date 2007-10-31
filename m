From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: mangle table question
Date: Wed, 31 Oct 2007 13:21:08 -0500
Message-ID: <1193854868.18366.69.camel@grateful.d.umn.edu>
References: <65CCDBD675D4F545AF59400EBEFE479D014700@av-mail01.aspenview.org>
	 <47289DDC.6030707@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-YbkDKJIL8MaqjBiWvc8C"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47289DDC.6030707@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


--=-YbkDKJIL8MaqjBiWvc8C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Wed, 2007-10-31 at 16:23 +0100, Pascal Hambourg wrote:
> Hello,
>=20
> Jason Sigurdur a =C3=A9crit :
> >=20
> > If a specific rule is matched, does it not exit the chain?
>=20
> Only if the target is "terminal". ACCEPT, DROP, REJECT are terminal.=20
> NAT-specific targets such as SNAT and DNAT are terminal too. LOG is=20
> obviously not terminal. Most if not all mangle-specific targets such as=20
> DSCP are not terminal. Indeed one may want to alter several parts of a=20
> packet in the same chain.

Hence you could jump to a user defined chain like (create the chain
first):

iptables -t mangle -N AF31
iptables -t mangle -A AF31 -j DSCP --set-dscp-class af31
iptables -t mangle -A AF31 -j ACCEPT

iptables -t mangle -A FORWARD -o net+ -p tcp --dport 25 -j AF31

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-YbkDKJIL8MaqjBiWvc8C
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHKMeUU+eIf4TiLaIRAg3yAKCF7XTRnEEs2bvcCtN3ZzStEN50YgCgkOkX
de3nnBwETtSxt6+hQSeGa5I=
=reAE
-----END PGP SIGNATURE-----

--=-YbkDKJIL8MaqjBiWvc8C--

