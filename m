From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: Why isn't DNAT happening for host-originated packets?
Date: Fri, 4 Dec 2015 00:14:25 +0100
Message-ID: <5660CCD1.60807@familie-kuntze.de>
References: <CAKmUPx5kE+v03OGAjF32rOGyVQfOLbSmyTEOOK9uApANeWbU1A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKmUPx5kE+v03OGAjF32rOGyVQfOLbSmyTEOOK9uApANeWbU1A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Scott Bronson <bronson@rinspin.com>, netfilter@vger.kernel.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Look at the packet flow graph. That's fairly up to date (but is missing=
 the new *nat INPUT chain).
http://inai.de/images/nf-packet-flow.png

- --=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
=46ingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWYMzPAAoJEDg5KY9j7GZYKPsP/189soz785huEAVPb2vpaSEA
QOGGJ0N2+amRccHSiMmDE/fnI4MRCUUWbiDS0PBJBSC0aKjhDkA7JRej8oWJaJYx
Mjw6VhGmpwRHG5x1bWPcrj+Zx3EXYNOkVhZwu/SPgnagnUMtcN7y2SYtNwlArlAA
twZhoKaVwB75NLqMzcOPNe68kyCyoE7wQNZcczR1HDURs6lWqQh7IyaRKQbX98aa
J1oC6I5e4fqET90PcK2OC1txTRmdyPCCrLqU0yrceV1nO0QEQx+GSIsg+sz5dl9f
Beno5AxzNEaeb0Bifq/PbmwKdTY2jC7QM+4/efwt4jXq/kkiV+VHu91LBbwEFPuM
0JLu9FVpSkXO+e8yVO2KoURYWBN0vKPKvs1qxf5Q37fFiDXmpKlrDS24ZE32xyja
suBREsiAfz7z97NED/0pDQhU1Cf3TJBXHp0kWJSPRZAg7GYI1lnEkMutkD61wVj+
/pNCO7MlLZ2ls8qZZpn7BJW8KoNt5N50DmJ/37zCD3kRHiHlG5OCX4vj2EcssRdz
aQ+HW76S0Bqg+svikkPmBXQvLemh99/izt0DZyJKfC8JpVJhDDj0BallpD4JuZTi
5J2+9dmdgY7js+ATAEvSjT0zj/l3M8sxuqi+NSIWan8eHzWxRm8SRCIl5uQdK8f3
rL/oXXhfJCy8ZRzNSp2T
=3Djtdy
-----END PGP SIGNATURE-----

