From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: cookies blocking
Date: Mon, 13 Mar 2017 17:41:04 +0100
Message-ID: <32248700-62fc-2aca-e17c-6468e88bb2e6@familie-kuntze.de>
References: <CAJ2oMhKcUmOnXfHjUv4htpasvNEPXp_SDddUSVPV7Jt_zunDNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tgiF5DfLiVSBen3g8IObW6c2KRmjTtMk2"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJ2oMhKcUmOnXfHjUv4htpasvNEPXp_SDddUSVPV7Jt_zunDNA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Ran Shalit <ranshalit@gmail.com>, netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tgiF5DfLiVSBen3g8IObW6c2KRmjTtMk2
Content-Type: multipart/mixed; boundary="QMB4AwGacQ1RFqKmtEgN3PjM4kgd5372q";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: Ran Shalit <ranshalit@gmail.com>, netfilter@vger.kernel.org
Message-ID: <32248700-62fc-2aca-e17c-6468e88bb2e6@familie-kuntze.de>
Subject: Re: cookies blocking
References: <CAJ2oMhKcUmOnXfHjUv4htpasvNEPXp_SDddUSVPV7Jt_zunDNA@mail.gmail.com>
In-Reply-To: <CAJ2oMhKcUmOnXfHjUv4htpasvNEPXp_SDddUSVPV7Jt_zunDNA@mail.gmail.com>

--QMB4AwGacQ1RFqKmtEgN3PjM4kgd5372q
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Not possible, because netfilter works only up to layer 4.
(Yes, there's the u32 and strings matches, but that's buggy, can be circu=
mvented
relatively easily and you can only accept or drop the packet, so it won't=
 help you).

On 13.03.2017 17:08, Ran Shalit wrote:
> Hello,
>=20
> Is it possible to filter/block cookies using netfilter/iptables ?
>=20
> I can't see how to do this.
>=20
> Thank you,
> Ran
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in=

> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658



--QMB4AwGacQ1RFqKmtEgN3PjM4kgd5372q--

--tgiF5DfLiVSBen3g8IObW6c2KRmjTtMk2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJLBAEBCAA1FiEEI8q7YCFGBedyeGWSODkpj2PsZlgFAljGy6AXHG5vZWxAZmFt
aWxpZS1rdW50emUuZGUACgkQODkpj2PsZlhvkQ/+Kj9VvCww/EOK8h0u5Ccay1sb
cB1ey+TrAQRn3OsuNj5GAXI8ZkbUUcjN07hO2mm0s9fiTjM0svo+xFM0hsdzvsi3
+VVskkSVOwgNA64bhrBfPPKqZeX05OQiQPv0dQvmGRj7e5m9UxhANRI6B/VZc9E7
04Pz/Ivcre9pfaA0Ya1CaFoS4YAC2Xr0rgVygSfvBw4U1XYY0ENmizLf9+Vkhdc9
vIFiRWdC5ywYzmaY+Jr9K6u+fa3yYoJtuv2olL6iz48wAxT5GF/c0nAEnyz/VWCy
rWGLwGA4zPMtLGcSBIL3A0dgXc2L/BlKMvklrgUXlJU5nKPYH8gB5JWQcUfpd/DB
8C/gd7OLKqWnGLKq29NEPsLOus3bGklfn7VI/F8ELWKLcNI9XeKdxLysYn3QMaHu
S6mLAii8oLOKuBqwM9Z+ilEiP+1K0CeSqrBnLOpIRI9SDcg3EWKiQqJfVNooG2go
cMxT25mGm2UFsbfzHAMP0R63iRoNC8IeXOr41gLynT17Y4oy6etjpltw5NeRTtP0
JKznxcpDjTa0mLbturFAd3yEnd02PgKvElSz6FX/1cPCiG90xWqziD0o/Sypue6y
xsSlDl8++21Nyb2+OWk9jLmXgfWbzO8td26qLYlSEJ+tcyctKvLnM9RA2An3luKS
dvaRDmNetYVS55l2irI=
=14g2
-----END PGP SIGNATURE-----

--tgiF5DfLiVSBen3g8IObW6c2KRmjTtMk2--
