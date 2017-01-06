From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: Iptables Reject with TCP Reset
Date: Fri, 6 Jan 2017 17:09:16 +0100
Message-ID: <d991fbe7-ca57-6045-8bfe-88e590ed2f65@familie-kuntze.de>
References: <HK2PR0201MB21296E195C755C65E4110DDCE8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3xgcaHDn3eh9vBuj9xXgs44R6a4xxq0FU"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <HK2PR0201MB21296E195C755C65E4110DDCE8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Matt Killock <matt.killock@praemium.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3xgcaHDn3eh9vBuj9xXgs44R6a4xxq0FU
Content-Type: multipart/mixed; boundary="kDd4oBLFtCjwnStrPNWmejGjJCK3J62SD";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: Matt Killock <matt.killock@praemium.com>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-ID: <d991fbe7-ca57-6045-8bfe-88e590ed2f65@familie-kuntze.de>
Subject: Re: Iptables Reject with TCP Reset
References: <HK2PR0201MB21296E195C755C65E4110DDCE8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
In-Reply-To: <HK2PR0201MB21296E195C755C65E4110DDCE8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>

--kDd4oBLFtCjwnStrPNWmejGjJCK3J62SD
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06.01.2017 16:19, Matt Killock wrote:
> The following line does not do this - does this no longer work?
>=20
> iptables -A FORWARD -s 192.168.40.0/24 -d 0/0 -p tcp --dport 80 -j REJE=
CT --reject-with tcp-reset
Depends on your rule set. Check and fix it. The target usually works.

--=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658



--kDd4oBLFtCjwnStrPNWmejGjJCK3J62SD--

--3xgcaHDn3eh9vBuj9xXgs44R6a4xxq0FU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJLBAEBCAA1FiEEI8q7YCFGBedyeGWSODkpj2PsZlgFAlhvwSwXHG5vZWxAZmFt
aWxpZS1rdW50emUuZGUACgkQODkpj2PsZliBIg//eoG5o+eacJlpFp0YXfVKXNIL
byPVcoA7/xDHNO4X3bFEmZt8gZoWW8m0Y3bzIxQP1myqdFy4ABAnat/ybtX6+dGv
NQnkHU199l/UT7Yt2vZre0UdNQm7FcBgXzGmCSmeAyfSQr8CFol+lkHeISfW+RZI
/ulJDEV93jchNgCMeKti4P1raD0GBf+Un4y0YsOlVbEkYRjB3EkCj+PopR+5ztse
fm/GEecwK2rzosBfRWDS8GqgbExqXqkgssjeXg6fW2luUPRB9UT7nzaJBXsMlV87
ioOrpGffgqkIcxbbQAoRer5h9Jd2m3VnkGN4Qwv01ZFsRjD5SeA+8q8fGcLACiK1
yEd7gPI0r9mq+kW5LI+STPe7JZyZpaNeGcod9JjW2dFPHx8+/ewvtShiq41RKGEv
KNlbehz1NFYtdgnX1jPDlDOMDzP5Y0F1yw2Ip0t09QYtt3AZfL9xE/Z1GhZfHphy
sK2GNFLIvnv5qNCLxesI5KXAXXcUSv+MI6Xovlh2lKdJ4knpAUkRzBtbLKC86IAP
lr2li91kpet+ITvnIlkFCBGkFQEPEJBDOxV9KP+kT/hM7lvP1bEBODo1FfWSubHF
udxsngkjUKbarlQlffkp+nScKG8Uz3pZ79SehlvJblyie/3WDyfh6KAsKNY+DX6Q
BJUOiA0Tomqhls22roM=
=F58C
-----END PGP SIGNATURE-----

--3xgcaHDn3eh9vBuj9xXgs44R6a4xxq0FU--
