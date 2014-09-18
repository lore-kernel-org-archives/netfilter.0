From: Michael Schwartzkopff <ms@sys4.de>
Subject: Re: Can IPTables check for a valid IP address
Date: Thu, 18 Sep 2014 17:31:16 +0200
Message-ID: <1888551.XEiLyKG9NI@nb003>
References: <D4669F1AE5CE3D4293C4658A698E502904B637068E4C@SELENIUM.amity.local> <541AF628.8090509@sterenborg.org>
Reply-To: ms@sys4.de
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3382312.LlyUf8Hsia"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sys4.de; h=
	content-type:content-type:mime-version:references:in-reply-to
	:user-agent:organization:message-id:date:date:subject:subject
	:reply-to:from:from; s=mail201310; t=1411054275; x=1412868676;
	 bh=OSOt53m+esLJ48uAxO66KOTuHDU6D5TWzz8qesrybK4=; b=fNvAIbHQg6li
	hcJoksSm+Jyj/4U4Nw2lNDyJta1KtzeQlt2u4FQ+foLn8vuFxMW6a49gRwyDL998
	UzTyyF6wquGcbOMpbLbb3l4921nToKpTE9qWBVjIrzoouIW2n/anUzg+1zcqIsrq
	jbrDUCA/1XoBpk0nqMrb3NiTjz6Psf6kpShGoFFlIub2xf+khSX9pNpKPUlgYuV5
	AZGw+blHZVe2waHac/bUW1PX9zgbbgIHYftLXcrOItFRJic3Olr50Jj2g1RhoI6K
	TqLr1RuQ1Im5SMxwpvfp1HNdcuI0z1XOR3VdNX9lcWpZEQfuhHPTh1qQwTh9wAFE
	yC3RLzoipg==
In-Reply-To: <541AF628.8090509@sterenborg.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--nextPart3382312.LlyUf8Hsia
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Donnerstag, 18. September 2014, 17:11:36 schrieb R. Sterenborg:
> On 09/18/2014 03:50 PM, Lars Dam wrote:
> > We suffer from DNS lookups with a response IP address which is not
> > existing.
> >=20
> > Can Iptables check on this?
>=20
> What is it you actually want iptables to do? Do you want it to check =
if
> the IP address that the DNS server responds with exists and is in use=
?
> Or..? Maybe the DNS server should be fixed instead of trying to go th=
is way.
>=20
> Iptables (well, Netfilter) is a packet filter. You can filter packets=

> that match a rule that you define. It can't validate your DNS server'=
s
> output

iptables cannot help you since the source IP address presumably varies.=
 If the=20
source address does not vary than iptables can help you.

Just google "iptables rate limit"


Anyway, it seems that you operate a open resolver on your server. Pleas=
e=20
google, why this is not a good idea. But if you really want to run a op=
en=20
resolver, than read the docs of your DNS server how to limit the reques=
t=20
rates. For bind, see:

http://ss.vix.su/~vjs/rl-arm.html
 .



Mit freundlichen Gr=FC=DFen,

Michael Schwartzkopff

--=20
[*] sys4 AG

http://sys4.de, +49 (89) 30 90 46 64, +49 (162) 165 0044
Franziskanerstra=DFe 15, 81669 M=FCnchen

Sitz der Gesellschaft: M=FCnchen, Amtsgericht M=FCnchen: HRB 199263
Vorstand: Patrick Ben Koetter, Marc Schiffbauer
Aufsichtsratsvorsitzender: Florian Kirstein
--nextPart3382312.LlyUf8Hsia
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iF4EABEIAAYFAlQa+sQACgkQsmtesqLuBDR0XQEA6UK3iQdKa2EXS1kU0kjUYiuD
zyFurBmNxxT3B3arKMsBAN485KTk0ryiXkRBO+ALieeRXcHAGz1bj+EDCBclvbI5
=oUlj
-----END PGP SIGNATURE-----

--nextPart3382312.LlyUf8Hsia--

