From: Michael Schwartzkopff <ms@sys4.de>
Subject: Re: OpenDPI and Netfilter
Date: Fri, 06 Nov 2015 11:06:09 +0100
Message-ID: <2014689.3xT72VEutp@nb003>
References: <563B9B63.4060303@wvnet.at>
Reply-To: ms@sys4.de
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2160171.Chd5rb7YDe"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sys4.de;
	s=ms-sys4-de-201501; t=1446804372;
	bh=2yjVNmUTSXwHcdu8If1OyD+Olp7H36goXTR/hiFjUqo=;
	h=From:To:Reply-To:Subject:Date:In-Reply-To:References;
	b=I1S9cJAA/ZKqFCcHEXqGF5qoyo1CvrrzJTuMlDiyBLQLF1lBnE3udQ24dxHRoPQkb
	 ntFNkqiNEDZjqBrMEVb9+dEmhCR6flsB5NEqcCth0RbCJTkA67l+OTI0dBBn697thL
	 rtiyz4/FQu+ISzLiwOpes4xxXIB8Ym+wKUoawQvYOx5ag2fwGdEtEDY9GjO8wiE1y7
	 wvbRlw7hN4cdIfd92YNf5C0F6BkenR1lKF7RxzdlU8qMqJQQcpB/hqK0yQl4jnHwE6
	 Usg5VLkhFPWt1/dnTKSAMIk3bppeP7h1AyCus1/qlIKBWX7ad5znhO0Y26ZgOPxPGg
	 8PAm2LPYd/l+Q==
In-Reply-To: <563B9B63.4060303@wvnet.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--nextPart2160171.Chd5rb7YDe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Donnerstag, 5. November 2015, 19:09:39 schrieben Sie:
> Hi,
>=20
> have a look at this:
>=20
> -> https://github.com/betolj/ndpi-netfilter
>=20
> It seems to be one of the most recent / active netfilter-ndpi
> implementations and as far as I see does not require patching of the
> Kernel for using it...at least in my tests it worked without patching=

> the Kernel on a Debian Jessie box if I remember correctly.

Yes. That is the one we were using. Luca Deri from ntop-ng is behind th=
is one.=20
We needed to patch it if we wanted to check for a specific audio codec =
in RDP.

Mit freundlichen Gr=FC=DFen,

Michael Schwartzkopff

=2D-=20
[*] sys4 AG

http://sys4.de, +49 (89) 30 90 46 64, +49 (162) 165 0044
Franziskanerstra=DFe 15, 81669 M=FCnchen

Sitz der Gesellschaft: M=FCnchen, Amtsgericht M=FCnchen: HRB 199263
Vorstand: Patrick Ben Koetter, Marc Schiffbauer
Aufsichtsratsvorsitzender: Florian Kirstein
--nextPart2160171.Chd5rb7YDe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EABEIAAYFAlY8e5QACgkQsmtesqLuBDTtuQD+Ih2I4yPCQpfG+uiHp+URImc8
yo9qqpL1m3HP+xWtRpMBAMefxTAJ7OvJ4mx7ZuL1Y3GCFdXHB1p4s+aKCUGWhK5M
=4c0o
-----END PGP SIGNATURE-----

--nextPart2160171.Chd5rb7YDe--

