From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: NAT with unique egress port
Date: Thu, 27 Oct 2016 21:14:26 +0200
Message-ID: <7118f027-0f54-7878-6d83-f304beed5430@familie-kuntze.de>
References: <CAJxU1QN4c+5KOBgakYAgRXnR3jRh_s72BKyqT3F5g+oReQp3QQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kgTdNjb95tV2Mb3wjS1AtmL7P2DS4FKTF"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJxU1QN4c+5KOBgakYAgRXnR3jRh_s72BKyqT3F5g+oReQp3QQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Rui Santos <rsantos@ruisantos.com>, netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kgTdNjb95tV2Mb3wjS1AtmL7P2DS4FKTF
Content-Type: multipart/mixed; boundary="qVk0viKqe29KUxvmE1ouIvMibOIp7SSX8";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: Rui Santos <rsantos@ruisantos.com>, netfilter@vger.kernel.org
Message-ID: <7118f027-0f54-7878-6d83-f304beed5430@familie-kuntze.de>
Subject: Re: NAT with unique egress port
References: <CAJxU1QN4c+5KOBgakYAgRXnR3jRh_s72BKyqT3F5g+oReQp3QQ@mail.gmail.com>
In-Reply-To: <CAJxU1QN4c+5KOBgakYAgRXnR3jRh_s72BKyqT3F5g+oReQp3QQ@mail.gmail.com>

--qVk0viKqe29KUxvmE1ouIvMibOIp7SSX8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 27.10.2016 18:22, Rui Santos wrote:
> My goal is to force this behavior on all outgoing connections. This
> way I would get a unique egress port mapping to an internal IP:Port in
> a specific point in time:
> - if client1 connects to server1 using source port X, the NAT will be
> mapped: client1IP:SourcePortX -> server1IP:SourcePortX;
> - if client2 then connects to server2 using source port X, the NAT
> will be mapped: client2IP:SourcePortX -> server2IP:SourcePortY.
> SourcePortY will be an available (randomly generated?) ephemeral port.
>=20
> I am aware that this will imply a concurrent NAT connections limit,
> equal to the ephemeral port range, per egress IP.
>=20
> Is there any way I can accomplish this kind of behaviour?

The answer is on the man page (man iptables-extensions).
Read the text about the SNAT and MASQUERADE targets.

--=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658



--qVk0viKqe29KUxvmE1ouIvMibOIp7SSX8--

--kgTdNjb95tV2Mb3wjS1AtmL7P2DS4FKTF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQI0BAEBCAAeBQJYElISFxxub2VsQGZhbWlsaWUta3VudHplLmRlAAoJEDg5KY9j
7GZYodsP/3yUinpGjkxVutv/s+XnywaXOB5EXNjmDuBnyFqXVsUjhLEMNbU0j8FU
AB3djh2cRhZgjzUnUtfAvwwg7G/J5860fVqJTkAF8HL+/SXp/UmiFUF+6ZYNcRxu
C9zo9jf1iUISFDXabLKJCRHS51JP1tZKdznAqr1lV/i9PzhWXXtaVBlyCwETv6yq
oQx4ja3IOB08ZsqWUDF9g+steWeD8kpNfqg0bvMjuHVZmImSFZpla34PlISlQxKz
6+eolswnT16ejc4xN2cW+mU8A2T9NEM6PM6k3adGJZItb89w25FMzUX/3OwCh1JW
yZYsxMuc5PbIHJw4SiexvyLpMBu/FoFigTNQEZjkgsvGPSJ1wRlkyQqNzPcN4102
PecWAWOHgdv6o+kj/ttgc32suWMGQv390wXSnN3Gp8AuN9prww4DbDj1jr+m4Qo8
bzh5csN7QwK32spswY99FfLFJMjH31WotVlnhZsEI2Np1YHIQJz3lKX9cljsY5zF
1NaOn417MJn0ECIbvjljqKfhl0yvPW7zgwoFQFwxa0DM1x4qjPPc0yBaWjbE4OOf
igw2AA9jTgAkBv3/RYxz5lPM7ogorKjd0Y/Qd+hK2Zs8tJ+HFcZpUKq6I4ofVuC2
5MdSa2JwCHXg9f2TXis4LEqk/a/TW9GWWptvtxxcffXUbdKAYU7z
=ZuC+
-----END PGP SIGNATURE-----

--kgTdNjb95tV2Mb3wjS1AtmL7P2DS4FKTF--
