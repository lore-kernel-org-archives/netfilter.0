From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: Why isn't DNAT happening for host-originated packets?
Date: Fri, 4 Dec 2015 01:45:14 +0100
Message-ID: <5660E21A.7050808@familie-kuntze.de>
References: <CAKmUPx5kE+v03OGAjF32rOGyVQfOLbSmyTEOOK9uApANeWbU1A@mail.gmail.com>
 <5660CCD1.60807@familie-kuntze.de>
 <CAKmUPx44yvsz21jRE9BoxK0D4R+gGjJdk9De5QQHUBzj6o9r6Q@mail.gmail.com>
 <5660D6D3.8040205@familie-kuntze.de>
 <CAKmUPx4jX4wyK10jR9Qr0DEPveRG5kOoLnuScpLgWE78DRXtyw@mail.gmail.com>
 <CAKmUPx6yaQdb1OE6CSf0TQ=eZYV=eX7Kmdzg-x6nVPtxtMpLEA@mail.gmail.com>
 <5660DFC7.9040206@familie-kuntze.de>
 <CAKmUPx5751FXOkBBhcxUKPBwq2cQrBSkoYX4JGJfy-UZE9+Vmw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKmUPx5751FXOkBBhcxUKPBwq2cQrBSkoYX4JGJfy-UZE9+Vmw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Scott Bronson <bronson@rinspin.com>
Cc: netfilter@vger.kernel.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Well, traffic from yourself to yourself always goes over loopback.
Look at the output of `ip route get <your IP>`.
Don't bother editing the graphic. There's a bunch of missing stuff.
There'll be something in the pipe to fix the graphic soon.

- --=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
=46ingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWYOIaAAoJEDg5KY9j7GZYlP4P/064e7c32AKHxrpi/RnQBN3H
HDJgpkVaVLpiU0pAca1d9O9srNgcX6+U4aMqp3f57MwDPrP4dY7QLumYZEcgqyH2
2Ousj5raMaRhKHhzqq3WlqTp7T/8W/SwTYxzO2HngqFGA5QGPSzsOIN/Ms+38fNT
obZYOJ9NzTKVuBrfjfN1H5R2n/1vyKNBz9PelM6ZCHMUwabkTo+y5UKa6X2Rz1GC
=46uKoDtpCAQnvolO/7Tv/NTc2zUQIGTySF/mASde47nfbAPRQ7YCWgtJV6hxhEnYv
Z01nTsLD1m8iqu0bHwNC6EjrVJu/QOc3V2yhK8l0ZzhpbhGoFVOQk6oWOaByYJQ9
mGaYTM6OIdj/FCh7FqaOqWsR3p0/QYXmtBCoTwOerLtEJazlX1UF+ve4Q7GhoXnI
2areMnZ5etvgWJDVfVBS8ogh25mgkdIMq0SpkkE8MjOqKU4Uyjlw5ns91m8YYdCi
8LC5i3F+WTs/g8tFAiE2FR03ZtXv7uuHdLyf1yZ7rUH8SdOr0wBZ4V0TFTfRDrfU
m5n66tULf0djY4tiQy671rYXdTFyJqIZrX81ksy1sJvaQslp1vYp/Oa1U1pNQtef
dcQ9PgXALgWm3dOPkHUWg1VbBDmxAGtsBKCktBOacEIWontqHMonaT88G5zMuaFF
VnCBiSQAu2yxL755iGHl
=3DLl34
-----END PGP SIGNATURE-----

