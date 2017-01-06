From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: Iptables Reject with TCP Reset
Date: Fri, 6 Jan 2017 17:35:10 +0100
Message-ID: <19ab6efe-7891-3950-e468-11dd59e71246@familie-kuntze.de>
References: <HK2PR0201MB21296E195C755C65E4110DDCE8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
 <d991fbe7-ca57-6045-8bfe-88e590ed2f65@familie-kuntze.de>
 <HK2PR0201MB2129ABDBC46F8805B3757387E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rP7bHVOxL7ec35PWhQt9oDVKr5pi7BRBp"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <HK2PR0201MB2129ABDBC46F8805B3757387E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Matt Killock <matt.killock@praemium.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rP7bHVOxL7ec35PWhQt9oDVKr5pi7BRBp
Content-Type: multipart/mixed; boundary="chUqDnU4Qjo1bgrupOMEL50WuOWx9hmBp";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: Matt Killock <matt.killock@praemium.com>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-ID: <19ab6efe-7891-3950-e468-11dd59e71246@familie-kuntze.de>
Subject: Re: Iptables Reject with TCP Reset
References: <HK2PR0201MB21296E195C755C65E4110DDCE8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
 <d991fbe7-ca57-6045-8bfe-88e590ed2f65@familie-kuntze.de>
 <HK2PR0201MB2129ABDBC46F8805B3757387E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
In-Reply-To: <HK2PR0201MB2129ABDBC46F8805B3757387E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>

--chUqDnU4Qjo1bgrupOMEL50WuOWx9hmBp
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06.01.2017 17:28, Matt Killock wrote:
> 'iptables -n -L' output:
Please use and show the output of `iptables-save -c`.


> If this does usually work then could you give me a clue on what ruleset=
 it does work with?
Generally in any. If it doesn't work and your rule set is not to blame, y=
ou've got another problem.

--=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658



--chUqDnU4Qjo1bgrupOMEL50WuOWx9hmBp--

--rP7bHVOxL7ec35PWhQt9oDVKr5pi7BRBp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJLBAEBCAA1FiEEI8q7YCFGBedyeGWSODkpj2PsZlgFAlhvxz4XHG5vZWxAZmFt
aWxpZS1rdW50emUuZGUACgkQODkpj2PsZlj3jxAAlTL34LqSW496O8g6Xy81yg4f
AZ2RvM6kcVrKB1SPAzQv0oujYH9OgRBEgZUGF3DpVPtpOuFlY9jtAeRFMRtB2Nv4
/k1NJ/a2GqXoLm0upbiLFskIJyOGFdXMvCVrHaML57UbvwGl6Fbrc0MmqwzhFEmP
S7kts3d4si3nIB/aimiGaBSkNUbqgfrNGf/yFCz2WOLT74+uQ7r4gAi8N/IFSaSu
rSuPrRu39n55VouPObBpMKXRacB+g4T9Ya3ScsjJ0RV4fOI1i6ZV0FCtbJP6B5XE
L2LKpC35Mi1SFcGreI3Y9IIL1XHeVFtz5h0n9EWenI0sHZ/OoNKv9t/Wq+YhjmuG
J8WF2sDQKkoGWJlFl/YbxLmlRyufK3c2CMcrRYAXRhSIW3BTj9kFnOQlE0leN6eY
V/eWpbGfFX7xEaZZUZzRwl4tcU64u4N4COhSYLXWnmN+nheGiGEry+OPGxOyjl6p
vAhO6/kbU/r2ek0rlmudDHk0AWDOeB8QMn9Wl+a6EmMbUukCslR0BfBqZKArhqhY
LvlBTtqzl+mJmQKnxRLrQ5GPMjM/sQIBRXcGExFn/1vXCqQd3gPXJMBPxJcd7e8D
sRfo4XIgreZWt9DwNHUwpRB24SpOnX1PhGmIziY0jz48D/Twf2syTpLcw9+QFBPX
1K8gNljOyxXNrN/6Jzc=
=Gva5
-----END PGP SIGNATURE-----

--rP7bHVOxL7ec35PWhQt9oDVKr5pi7BRBp--
