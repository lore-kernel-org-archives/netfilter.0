From: Robert Sander <r.sander@heinlein-support.de>
Subject: Re: nftables iifname and currently unknown interfaces
Date: Fri, 16 Oct 2020 13:10:21 +0200
Message-ID: <68b4fcb6-f6cc-d1f0-c194-b0d479386ea3@heinlein-support.de>
References: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
 <20201016105612.GH16895@breakpoint.cc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="PEA2ARjTzx9Bi2bn5X30spVHxB5IBmbF4"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20201016105612.GH16895@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PEA2ARjTzx9Bi2bn5X30spVHxB5IBmbF4
Content-Type: multipart/mixed; boundary="T8kw57loif3OR4U9TQo7LTSaGkN5Q9WWb"

--T8kw57loif3OR4U9TQo7LTSaGkN5Q9WWb
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Am 16.10.20 um 12:56 schrieb Florian Westphal:

> nft add rule inet filter forwad iifname bond0.16 oifname bond0.42 accep=
t
> Error: Could not process rule: No such file or directory
> add rule inet filter forwad iifname bond0.16 oifname bond0.42 accept
>                      ^^^^^^
> (typo in chain name).

Oh, how embarrassing. :)

The rule originally contained a jump to a chain that wa slater declared
in the nft commands. Bummer. Sorry for the noise.

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


--T8kw57loif3OR4U9TQo7LTSaGkN5Q9WWb--

--PEA2ARjTzx9Bi2bn5X30spVHxB5IBmbF4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhVXmaPzvl7l1erVE8LuRWCPeWygFAl+Jf50ACgkQ8LuRWCPe
WyhV+Q/8CSxQH0EZWWFHmJmt2thJNJnzXXumSII0pp2ZUmBXzau5xlcbD/2OIKgP
uOUaPMHA9HYoH3qpedMKszzNkr/4S94Ps7wjrRecfSgvPu0njHwWRzCSC6S+mt6s
NlNvuhIkzJ0eOJhB/nC3zDG/H0jLbXNZnLAzQhJp1QxZ53YjJvS2SvQvg/YXkqQk
+6FYkqa2WhIK28x94zkhD8WHRnxvo3GdPcR6BaHq0l9W/lLfiue+ZShNKOZGmLT6
SToiL9R9B8VR4PU9defWmV4xpgKSGl+albLXti1TMRE14m7Q0whrJmoHwgK5DjID
rt9Gpwi3cP8Y5KrAiJlfjjOsE6WaSr8irtVhulOwCBNFzFG3R8ZNK7T5WEPBNFMw
5vcZiane+6qOb54FRiYhY/jkECXSdIWMjPrPW8YnuDP4bebAB4yVJppxj+KgYa3d
2HVPDKBtdNG0TRm86M7N9Tk6JizV8D0mEnU3qfaCynh800y2LIMaxSqnn+ANHA2o
KvwVPlhJGSBJF/Exv9UmnlbtTq45AVG39iTwkebqVa+L5R7M9iAje9aJv+VzesJl
gFue88CA8rKCytgeTVyOx9eUnGxORq7aoZZDOcce7HGdrv8nMwVsARhb/qTnwMP5
Aw7zLinUh3GFk8Y/OGx37BQSLJ/EjEXGVyJ0GXD1SnmOyzP+ihI=
=L96b
-----END PGP SIGNATURE-----

--PEA2ARjTzx9Bi2bn5X30spVHxB5IBmbF4--
