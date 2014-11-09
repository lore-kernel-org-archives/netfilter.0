From: Michael Schwartzkopff <ms@sys4.de>
Subject: Re: Hardware benchmark list (was: Recommended hardware for iptables based firewall/router)
Date: Sun, 09 Nov 2014 22:08:52 +0100
Message-ID: <44240553.NhkgktUa2l@nb003>
References: <CAH_OBic9zg25y16HKhkHqBCvujrHXoGhb8E4tY+Z99CO0WrEAw@mail.gmail.com>
Reply-To: ms@sys4.de
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2940935.K3VKWKjXrW"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sys4.de; h=
	content-type:content-type:mime-version:references:in-reply-to
	:user-agent:organization:message-id:date:date:subject:subject
	:reply-to:from:from; s=mail201310; t=1415567336; x=1417381737;
	 bh=oHY1iAOzjDVznXW2FlibPFpTGdhRhkblVxbud5tYOpI=; b=IvD3NA56wOM7
	sqPCyLFL6Y2gU89cCUohG0wROnRUMAL0FeMBgO6cLovBkVlRy8kGvafSYrgZUdqy
	a+nHqlXwAfmKV5YnJ4oR4fAcETSfylnWnCc1gJp7VmKPuQwQmTv42Vl5GndV3rus
	iNuGc6mg4AbKpeD+x5so/QpCbHukC8HoEfruh3vzxE/ND2daUMOFBEijZzv4JRHn
	9xnrKWnfjFIxQ+TR9pnKRvt9ReRk9yZGIFY/mTgn6attXHifSiJEfojFzsxlfLmB
	srlPR+QOoyeUhYLzbKU8M6mnhRkqllWfcS+DGggxAEIlhb6OA23y9fNtHZu10Ftr
	PK8lMIiQzA==
In-Reply-To: <CAH_OBic9zg25y16HKhkHqBCvujrHXoGhb8E4tY+Z99CO0WrEAw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: shawn wilson <ag4ve.us@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


--nextPart2940935.K3VKWKjXrW
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Sonntag, 9. November 2014, 15:39:35 schrieb shawn wilson:
> (I include the original email subjec to show what spawned this)
>=20
> What would be cool is to have a hardware benchmark list for network
> cards and processors (similar to JTR's list for hashes per second
> [1]).
>=20
> What I've been thinking for a while is how to benchmark network
> hardware. Obviously there's issues with doing this and in order for
> this to work everyone would need to be on the same page (or there'd
> need to be a link showing settings used that someone could revise if
> they found something that was off).
>=20
> I think the biggest issue with this idea is figuring out affordable
> hardware to test cards with. I'm unsure if this is possible so just
> figured I'd throw this out there. Though since most machines have two=

> stacked interfaces, a decent benchmark might just be to plug one
> interface into the other as that should shoe hardware noise issues,
> PCI bus limitations (on that board), and driver issue.
>=20
> 1. http://openwall.info/wiki/john/benchmarks

Cool idea. Anyway some work to do:

1) You (we) would have to define some standard tests (paket size, size=20=

distribution, ...), some defined testbed, ...

2) Write a bunch of scripts that conduct the standardtized tests.

3) Have a website that people can deliver results to.

4) Add tests for IPsec encryption. I did some tests for VIA Eden proces=
sor:=09

https://sys4.de/en/blog/2013/09/21/openssl-performance-eden-padlock/
https://sys4.de/en/blog/2013/09/21/ipsec-performance-eden-padlock/



Mit freundlichen Gr=FC=DFen,

Michael Schwartzkopff

--=20
[*] sys4 AG

http://sys4.de, +49 (89) 30 90 46 64, +49 (162) 165 0044
Franziskanerstra=DFe 15, 81669 M=FCnchen

Sitz der Gesellschaft: M=FCnchen, Amtsgericht M=FCnchen: HRB 199263
Vorstand: Patrick Ben Koetter, Marc Schiffbauer
Aufsichtsratsvorsitzender: Florian Kirstein
--nextPart2940935.K3VKWKjXrW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iF4EABEIAAYFAlRf1+QACgkQsmtesqLuBDSZ/QEArfmOEMnbPLqfvMx2b5u8bnzq
QIcGVmvMa/pGR2MKO/UA/RLOlrkBntAQGRrtQEzLnWDTQJA9pfBdFKn7wirahWcH
=ia6f
-----END PGP SIGNATURE-----

--nextPart2940935.K3VKWKjXrW--

