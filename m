From: Jeremy Sowden <jeremy@azazel.net>
Subject: Re: nftables and IPv6 prefix delegation (regression vs ip6tables)
Date: Wed, 9 Nov 2022 14:33:47 +0000
Message-ID: <Y2u6Swx8nR3/Ke6t@azazel.net>
References: <tk16fd$hd2$1@ciao.gmane.io>
 <20221103231245.GD29268@breakpoint.cc>
 <636AA7E7.6090404@gmail.com>
 <93c41631-7581-3a75-f59f-1eb3951e79c0@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4YlBaDj8i4y66Hx4"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=azazel.net;
        s=20220717; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=jAlMkaaPqmdtr52V+fNuBbz2fJ7Kn/cVH8qVOl+QeeM=; b=N871uOVb71l41OAEpxtRNbQcdb
        qB4xweHSqwScwnnfJmeRYNf7serVlxgE/yVg/fENwVzZ8e+suJ2je5Fc+otV/a6hOoksqZQ9txqV3
        UPkpRhVP0AYBdy2yr0Ehr1sQBc7YbOYhNj9sIGz9YcKWbaziCWYG0AO0HQtee9HechhYFmh2c8YTT
        V0IOxZ4UiQWfw3NNceIgxrjFPIytNlc7gTbTQqegMsg5rMn/5WhX8dIcbDrmJOUWi+m47N/oJZDFL
        yNfqFQi6Z1dBqFSDGEFlK5Doi3SJ5/35DzaLnUGdU34cebAq7ts7kOXFD0IpXCIXQNKp768NAvZKD
        VpwGJL5 
Content-Disposition: inline
In-Reply-To: <93c41631-7581-3a75-f59f-1eb3951e79c0@gmail.com>
List-ID: <netfilter.vger.kernel.org>
To: Ian Pilcher <arequipeno@gmail.com>
Cc: Gordon Fisher <gordfisherman@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


--4YlBaDj8i4y66Hx4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022-11-09, at 08:19:14 -0600, Ian Pilcher wrote:
> On 11/8/22 13:03, Gordon Fisher wrote:
> > Out of curiosity, why does ``0:0:0:c8::1`` get translated into
> > ``::c8:0:0:0:1`` ?
>=20
> At a guess, inet_ntop() is simply choosing the longest string of zeroes
> in the address to replace with '::'.

That is indeed what glibc 2.36 does, at any rate.

J.

--4YlBaDj8i4y66Hx4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEbB20U2PvQDe9VtUXKYasCr3xBA0FAmNruj0ACgkQKYasCr3x
BA1nQhAAxpXmiYdbG0dpB24sfhaAcS3nptpVVjGdfoKxkhoDeynSeE6/FI4HdqGs
w6qS+S35fxj9HFIB2wfR1N7SFv+m1pWRtwYRPeio3wbGvg06nJWfzXIRBoHXpW9y
QlvCXF/nfuESwVT9Ah/alsJMUF43/EKuFnRCq1gZ9iQiaCWjzo+7bevBAwj515wy
RQYD+MOK1KURMtXVzP5pNYkcYTokI7fNZUuTnRlwk+j+xp9wel6ZNXjzQD9CrNwZ
cIijc09eTCBdiB2JGsTwWQA1VPs0Cm5EarTQpcNR9lILuSa9x/TSyT9E0y55TNSh
f0dqiQ3UmPgBM5nh303OcpBDFrfahd2E/BwNJseM0XbyUUn4l9l6m99v6vMlU8Br
eaWr+aMwo8MxP/0D1ulATn3ogP4u8ORwaQBkV00uZkUze5fdVEgKQO6WsUV7oz+c
3KUgF0Pm43RGXieOvT6RpxwAWBTQtkrBOj+IXyp2cfQDZRfr82xAilTYZ7VVlPbH
zpYgm6vJU6Caz4aF3UzMEjmRvS4VkUiSPPDXYIvNkThUtrXufcVo8yXogmzt/qg0
Bef6mb6xQMquM/UzyBKCmZt1fWsK/gXihdHB6rvf4Z2zBacKJkRN933DvqNbp4uN
aesYtEkRTfhCV/FA3IOG/OyaTGcYNlTNqUDEwjj2H97Esq/t2Co=
=ZUlz
-----END PGP SIGNATURE-----

--4YlBaDj8i4y66Hx4--
