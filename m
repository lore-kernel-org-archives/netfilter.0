From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: Why isn't DNAT happening for host-originated packets?
Date: Fri, 4 Dec 2015 01:31:48 +0100
Message-ID: <5660DEF4.20901@familie-kuntze.de>
References: <CAKmUPx5kE+v03OGAjF32rOGyVQfOLbSmyTEOOK9uApANeWbU1A@mail.gmail.com>
 <5660CCD1.60807@familie-kuntze.de>
 <CAKmUPx44yvsz21jRE9BoxK0D4R+gGjJdk9De5QQHUBzj6o9r6Q@mail.gmail.com>
 <5660D6D3.8040205@familie-kuntze.de>
 <CAKmUPx4jX4wyK10jR9Qr0DEPveRG5kOoLnuScpLgWE78DRXtyw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKmUPx4jX4wyK10jR9Qr0DEPveRG5kOoLnuScpLgWE78DRXtyw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Scott Bronson <bronson@rinspin.com>
Cc: netfilter@vger.kernel.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

That's not needed.
Just create a custom chain in the nat table and redirect the traffic fr=
om
OUTPUT and POSTROUTING into it.
- --=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
=46ingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWYN7yAAoJEDg5KY9j7GZY8tcP/03sCHLogLqbGOgh338JCSPX
BpbhuYyBb+NyrnpuOM97ZIQmOFAeT1mS5paEvPdF4lDp7eZuyQuvAjafKt9ypjXH
kGDzE9vsvcDPtU5Db9Kf9qYnAOnm7mEE64oWNXzaOO+Ul+SdTFz19N3yjFjhXLsm
Mxn8HdYyc4dapuhKu/WYyUuvbOzawE6mtZHzAEYa5EK2nLYY/K2hCB+QSLnoI69p
vtSVUsL2DXcfqbhAwfm0KCZjkQEwvtfuWwsfCVCI0YA4TuVv9qSLUNIUu5qGJRkA
=46kuCniVG6YjI7agcxUrURdnAQFEwoo82EfteXJYjJzLsQuIRhhjjxYIUt8FKk31o
MApnmEWPi3cUH0twfFyukzlOUsdObDI5+xqAq1cpokema/Ttf06wpko9wduK5zEm
iZWnmaBTsz7iOn/j/PZOziH3UZh8VEKOfihPqDsm4YKxUApStEcev70WVBSLUem2
Vy0Nlp2Ys6gR3YC4XuHAgKg9f8xcAPGSvseA6wOAI2sW4FQIOM8RZtpOdKzl6Std
OMTxtEt2M3jroksc+E5uz3eZ1yiHuRvpVT0apJzuzbtaRaa6OL+L38dmucFusbi9
L0q589Yfm7MnncsnstiAcvxpdbgPoeF5GQbAhdpAcHPTJT+LAPO1L6BIB0CR5YJC
4KIF52rBiC885loxEUgD
=3D+CR2
-----END PGP SIGNATURE-----

