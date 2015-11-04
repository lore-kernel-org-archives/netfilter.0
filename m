From: Michael Schwartzkopff <ms@sys4.de>
Subject: Re: OpenDPI and Netfilter
Date: Wed, 04 Nov 2015 11:06:19 +0100
Message-ID: <1734097.89bsIlettF@nb003>
References: <5639CF92.9080007@qmail.re>
Reply-To: ms@sys4.de
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1482292.OfYhX9mBZf"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sys4.de;
	s=ms-sys4-de-201501; t=1446631583;
	bh=t3tU95oh/g19R4sC1Vsu5Esp4jZeDCIxOonHnAK8M5A=;
	h=From:To:Reply-To:Subject:Date:In-Reply-To:References;
	b=kMU9a8wWbPJT6Yc6DJ9vqaOWXypmLnjT2/pIqOOQIKj2kz9K7h1OTFxA/q+HTAxSh
	 VaBHqCtKVFRXUQXPnG9M9UlI38Nzo5iOqSKWsdAiU0qeYdz+We+J5DR03A+hD1KtP4
	 y8mLigQYvyOqsKkUQFWQyKT6p48F86wgCXITWfTsyQ8d4UW3EQAH7IBVXIu9grRp2l
	 EaCMN/FtJO+8cU+smwQG6csDV8ng6wFzrTb9xIuvqVAoa6fedir0CVJ4h23upy2S3C
	 y43wX+xoaEbu96OTBLHet9qoA+hjPHptyPGMWjicP3me4g93SLVjraOwTLHOlurktL
	 JVwd5sEszhVJw==
In-Reply-To: <5639CF92.9080007@qmail.re>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--nextPart1482292.OfYhX9mBZf
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Mittwoch, 4. November 2015, 10:27:46 schrieb Laurent B.:
> Dear all,
>=20
> is there a way to connect netfilter/iptables with opendpi ? something=

> like -m ndpi --dpi-protocol p2p -j DROP ?
>=20
> I saw the opendpi-netfilter project which seems to be no longer
> maintened and which do not compile with recent kernel.
>=20
> An idea ? If nothing is existing, do you think it can be useful to
> (re)develop such a connector ?
>=20
> Thank you,
>=20
> Laurent

Hi,

do not know exactly about opendpi, but about a year ago we tested the D=
PI=20
libraries of ntop-ng.

With some patching it works quite good with netfilter / traffic control=
. We wrote=20
down our finding in the German journal iX (https://shop.heise.de/katalo=
g/tiefe-einsichten, sorry paywalled)

It works quite good.

Please mail me if you need more info.

Mit freundlichen Gr=FC=DFen,

Michael Schwartzkopff

=2D-=20
[*] sys4 AG

http://sys4.de, +49 (89) 30 90 46 64, +49 (162) 165 0044
Franziskanerstra=DFe 15, 81669 M=FCnchen

Sitz der Gesellschaft: M=FCnchen, Amtsgericht M=FCnchen: HRB 199263
Vorstand: Patrick Ben Koetter, Marc Schiffbauer
Aufsichtsratsvorsitzender: Florian Kirstein
--nextPart1482292.OfYhX9mBZf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EABEIAAYFAlY52J4ACgkQsmtesqLuBDSm0wD/VyAg9D+6U7Okh1zKMpx3W/32
INm144jBYggW5L8aPmwBAI67HB8Y3nxt+5C9VZRG3ldSn2B/dI6y/qbslf+ATQq1
=e/8P
-----END PGP SIGNATURE-----

--nextPart1482292.OfYhX9mBZf--

