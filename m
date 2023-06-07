From: Marek =?UTF-8?B?S8O8dGhl?= <m-k-mailling-list@mk16.de>
Subject: IPv4 Evil Bit
Date: Wed, 7 Jun 2023 13:17:43 +0200
Message-ID: <20230607131743.309d5aff@parrot>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bEI2sSdRztU9Dm9+qoFkCpm";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mk16.de; s=key2;
        t=1686136578; bh=AN50NzyaWQVwiegfbV1AgWb7Uh8ShHmzbAhVSBnyYMw=;
        h=Date:From:To:Subject:From;
        b=ICc/HLFqT3mHe1/8UCkzOSGVgd+kWrPwzhnd5UNf/jQod+TuKzxIBDE2H2EXp8Oto
         lFMGLDzaalfCQod0EwYjcgNkI8NB0nOkQN/P1TjwWq2Ps6R/dlyY1KS7YTETtbyCyf
         vcLsEADOXMjHNlCdyuoi7tBuTnDSnReY1Cw5lAi/LmzFGe9LRN6rDl6N7titZYwFJL
         QgVDVJc0DnUY6rOw/h3iKvbEOkWb1r4PJcqck/dPAxoUw2BMVaIALfa5XYsJ986lQk
         M4DqAkfuVUP8E874EXdWCs6aeZ2XBPGHBYR5kGEN1/Jqvf2p2gcB0ecX0Br128pDZv
         sY+1Fha/ZYO9A==
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--Sig_/bEI2sSdRztU9Dm9+qoFkCpm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

I hope I am in the right place. I have two questions about nftables:

1) Is it possible to perform OR operations in nftables? For example
`ip6 saddr ::/128 OR ip saddr 127.0.0.1/8 accept;` As far as I
understand it, everything else is concatenated with AND.

2) I want to see how many IPv4 packets I can get with the Evil Bit
(RFC3514). Since there seems to be no native function for this in
nftables, I seem to have to use raw payload expression. So I have
set up the following:

@th,6,1 & 0x80 =3D 0x80 \
    log prefix "[nftables] Evil bit: " counter reject;

However, `Error: syntax error, unexpected '=3D'` appears. What is the
reason for this? How can I formulate this expression correctly?

I would really appreciate your answers!

Greetings
Marek K=C3=BCthe

--=20
Marek K=C3=BCthe
m.k@mk16.de
er/ihm he/him

--Sig_/bEI2sSdRztU9Dm9+qoFkCpm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEmqKBWfzrPNg7whIBfoaRRmmRCMcFAmSAZ1cACgkQfoaRRmmR
CMd7HQ/8DdFoWGix/Xb2anZ+EPy8cZaC9T6EIc9BoZQDn5oFxgMCJv2K11dHDIeP
LsMEOAdhD8cHb2CPxRjPtgAIFk/Bn/65GpD3dn0XF2ZdfNztsCpzdGMrUuKHkaf2
nYwN2TVj7ZtNQRtZeD1usoX707pILkPquZPpVyBG4GKLKjSAvg9p32LDH3O+xOOW
v7gBt6z09iABnLY7PpXoKwprvt73pSgay4tJKPmLixYZmfYZmp+ObAXMPxp0OGS0
2pNd4+oD5R2sH7XeY2TS4CS9bm1LNG4C0d+MzGpg0k3s0PDOYHFJMLMW4RDTzPTT
XfHTODc8VJqnMkbDDwW2y4L8Uk0n3bbbEhBQGx9YXDgQceaIC/PDPgFp9REezNX8
B5PBS84lKCi8g31G1/53scdpL4iTI+e19NkW8f4Aw0gBJDZQjpgIn6HAEO62Sywv
4Swoo6741oSj3CNhZCtmP8bfCmtlyHnJQTmXTTYnu/f0ojsPjuxLXMmr1fOWFeR6
exmqrfBd7iJb3uA657j385LH/h28+fivRndN/yaOmutH6w2dgCA/DL9uNEyPoaYF
7I+W8H1KpZm55yl7QpOMIXNy1RAvItV3QNAoykEnx3+DdxmszvbdMMFOMA/LQhjr
UQKfFhL6X/NWvWGHyhqQj3hPz/w0w3Ih+0HY7HMzN3MFJksTv50=
=mRBa
-----END PGP SIGNATURE-----

--Sig_/bEI2sSdRztU9Dm9+qoFkCpm--
