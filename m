From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: iptables and performance
Date: Tue, 13 May 2008 10:29:48 -0500
Message-ID: <1210692588.545.119.camel@grateful.d.umn.edu>
References: <1210661080.5829.225.camel@localhost.localdomain>
	 <1210661965.5829.227.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ERorCknTV40b0Pvu3/Gg"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1210661965.5829.227.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: elhadad@cisco.com
Cc: netfilter@vger.kernel.org


--=-ERorCknTV40b0Pvu3/Gg
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-05-13 at 09:59 +0300, Eli Hadad wrote:
> Hi all,
>=20
> I am new to iptables and have few question I hope you can help with:
> 1. Is there a limit to the number of rules I can add to specific chain?
> I need to have around 20000 rules.
> 2. What is the performance implications of using this large number of
> rules? Is there any numbers people can share.
> 3. I also saw the HIPAC project which claim to have much better
> performance. Is there any work done to integrate same type of
> functionality into iptables?

Google: hipac ipset

Look at the first pdf link. It talks about performance and netfilter. It
also addresses HIPAC and ipset.

I would say that you want to look at ipset.

Cheers,

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-ERorCknTV40b0Pvu3/Gg
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBIKbPsU+eIf4TiLaIRAjm9AJ9jvgBlEEzejiggcW2vQZUZD4njtwCdGfmV
8UCki+g5xR9f+DAfwxo7vIs=
=awDs
-----END PGP SIGNATURE-----

--=-ERorCknTV40b0Pvu3/Gg--

