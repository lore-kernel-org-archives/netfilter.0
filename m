From: Marek =?UTF-8?B?S8O8dGhl?= <m-k-mailling-list@mk16.de>
Subject: Re: IPv4 Evil Bit
Date: Thu, 8 Jun 2023 09:51:38 +0200
Message-ID: <20230608095138.409d3303@parrot>
References: <20230607131743.309d5aff@parrot>
 <20230607143019.65e7f5ec1a21db391071a4d4@plushkava.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Yas7QZYBbIq8r5q/49kgap9";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mk16.de; s=key2;
        t=1686210603; bh=FBvEBSzk7EDqSe4e8FbFth8p+a8Pl2H++ibIXclG2nA=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=JaAk/eT/gLcJhZeAf2qLQPge4qRL+INQKuxdip8xZ6LE89fa/s0snHcwQoy0iZgQC
         Jnp+nXknCr0Bz8jc/uonUS464G7rTuDGmrXHF6wgvDfGWfIykvy4RMxrw/01YuwW3q
         dPACjna5HLbfeHJ7riLw/Hbd6aF9sS1Dh+2zu7dck6aUgUDy7MPT//unrArbgvg5JB
         PzKrv4u4yWZc2JszPoknaIOeKFsW2seQ5wSVQRP2va8mc7lgkj5UdwIQC+nl/p1olh
         YIkcp7rmFOCc3UAUawIj9OyxGiGvWONf/bX4pc80KkKekowxepRHgdsX8QBvJCj1iF
         OYdh6TXVD+DYw==
In-Reply-To: <20230607143019.65e7f5ec1a21db391071a4d4@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--Sig_/Yas7QZYBbIq8r5q/49kgap9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 7 Jun 2023 14:30:19 +0100
Kerin Millar <kfm@plushkava.net> wrote:

> On Wed, 7 Jun 2023 13:17:43 +0200
> Marek K=C3=BCthe <m-k-mailling-list@mk16.de> wrote:
>=20
> > Hello,
> >=20
> > I hope I am in the right place. I have two questions about nftables:
> >=20
> > 1) Is it possible to perform OR operations in nftables? For example
> > `ip6 saddr ::/128 OR ip saddr 127.0.0.1/8 accept;` As far as I
> > understand it, everything else is concatenated with AND. =20
>=20
> No. Nor would a set suffice, as ipv4_addr and ipv6_addr elements cannot b=
e mixed.

Too bad nftables doesn't have something like that.

>=20
> >=20
> > 2) I want to see how many IPv4 packets I can get with the Evil Bit
> > (RFC3514). Since there seems to be no native function for this in
> > nftables, I seem to have to use raw payload expression. So I have
> > set up the following:
> >=20
> > @th,6,1 & 0x80 =3D 0x80 \
> >     log prefix "[nftables] Evil bit: " counter reject;
> >=20
> > However, `Error: syntax error, unexpected '=3D'` appears. What is the
> > reason for this? How can I formulate this expression correctly? =20
>=20
> Try @nh,48,8 & 0x80 =3D=3D 0x80. The offset and length values are express=
ed in bits, not bytes.

Thanks a lot! This works.

>=20
> --=20
> Kerin Millar


--=20
Marek K=C3=BCthe
m.k@mk16.de
er/ihm he/him

--Sig_/Yas7QZYBbIq8r5q/49kgap9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEmqKBWfzrPNg7whIBfoaRRmmRCMcFAmSBiIoACgkQfoaRRmmR
CMeuDg/+Puz+7rbipEBZuDlsfZSQADbHtG3Brs6fdgmC3ep0tuFq/QFGA3llcSRJ
U0rouoTn4QUsdVUNTaGnmvnBne2SrCkBALz9Tb1TVOCYIZrhADZHt7JvCM1Fymjb
+sp17L/bKuHjkvHYEr42N/2otDk1rVhtScnf2T3GXJssROvknz3KshUjfjr+QYcV
F92xTqPHAUyDX7J9kYLlA4oGrk/PW+eXz4NKNjQnWPDWVOq/oyK43YeprCvkEK0O
kxRtU6wNRa0BZ41r5vSSKHys0jC7rd4RthdBdw9YEyfJKxAGxd62nNnxy+Q0oMto
yF5o2saWdzXHdRQ5Ph3OHJjVm5oBVetfn3SyBdOJ1+PyL1SXcytPTKnY2ManY7Xg
3AuFm0sPVo/zofLb+pwCpbOIO7KrnnBECjGRd7aocykXYhgLYoeo7xMnarHQHhLT
Uwf7TOniPYmJ6MnHJ76z17NSZfWs3R+OKlG1qIAF2w8iI5oAX3KLAbl2I8Lp9/H9
AWfIS/VckwyaRH4uwpJdfKMsCR9R+ADNEWIZDujxJJin9DGA539FbeDj08p7YRXQ
wj9u3+dirgxKV0ZhKcCFVSZkfe2SpEeuTOMtEvLWsWB+lIz43D/HX5ZfAfm3gXSw
6NmDAPpxbh5vfEhMpSPNTNQjizuaJO5NZEL78P9nR5609OwoP9s=
=FG+e
-----END PGP SIGNATURE-----

--Sig_/Yas7QZYBbIq8r5q/49kgap9--
