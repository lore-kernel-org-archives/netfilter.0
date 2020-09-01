From: Mikhail Morfikov <mmorfikov@gmail.com>
Subject: Re: Nftables rules change when network interfaces disappear
Date: Tue, 1 Sep 2020 14:51:18 +0200
Message-ID: <a9be73f3-d8f4-b7cb-a240-749edf0dc757@gmail.com>
References: <219301a8-70a9-d2d9-f231-1ab9db107e1a@gmail.com>
 <20200901124139.GA3981@dimstar.local.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="llk8AJrT76OeYlmwl3LLbHu2IvmDYeolw"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id
         :disposition-notification-to:date:mime-version:in-reply-to;
        bh=PzYqphQ+lJjN/3+BuqgRFApG3lKMM4sAggTPhgfMLIw=;
        b=qKHH3+iqrc0B/V9TEJJ7G37FAigdzqRiL50oFPrVLk20kA/FMEfMWnfmZMdFzMJEGY
         e2VvSQzdI1mSvSWVvnOd3toRyylAduCHPeJnFb+tey/hAEC0hDlq3Kq2bGECRsyPlaNp
         lK4lwi0sUiKzTRHsJYw2O3007M8laOdR3I0TpEr+T4vmUXdTjEr/zTp2YnyxndeUxn0r
         h+5rruZ5xAq2PPq2c+KzxcrzcNcdzwEbrw71h30yXoKb7imc92DvqWF8/TTqMjuvDxjl
         1jQbDn59Ab6s0FVKslrW/mXOnjQHkXBb/iM7gNf7PIJ5IM2mEPZbZp/rNbAVgF6uRFit
         QAPQ==
In-Reply-To: <20200901124139.GA3981@dimstar.local.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--llk8AJrT76OeYlmwl3LLbHu2IvmDYeolw
Content-Type: multipart/mixed; boundary="7KTeBTzMezAWs6dbV1GOK4hgGa5u5QrBv";
 protected-headers="v1"
From: Mikhail Morfikov <mmorfikov@gmail.com>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-ID: <a9be73f3-d8f4-b7cb-a240-749edf0dc757@gmail.com>
Subject: Re: Nftables rules change when network interfaces disappear
References: <219301a8-70a9-d2d9-f231-1ab9db107e1a@gmail.com>
 <20200901124139.GA3981@dimstar.local.net>
In-Reply-To: <20200901124139.GA3981@dimstar.local.net>

--7KTeBTzMezAWs6dbV1GOK4hgGa5u5QrBv
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 01/09/2020 14.41, Duncan Roe wrote:
>=20
> You can only use 'oif' for interfaces with indexes that will never chan=
ge, such
> as eth0. For all other interfaces, you must use 'oifname'. Otherwise, y=
ou get
> the behaviour you report.
>=20
> See PRIMARY EXPRESSIONS / META EXPRESSIONS in 'man nft'.
>=20

I see. It works well now. Thanks.


--7KTeBTzMezAWs6dbV1GOK4hgGa5u5QrBv--

--llk8AJrT76OeYlmwl3LLbHu2IvmDYeolw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQR1ZhNYxftXAnkWpwEy2ctjR5bMoQUCX05DxgAKCRAy2ctjR5bM
oTj5AQCWsG+CpXwzvUYR1nQaBaTClWmx9WC8x/OQBx06dcYoBgEAo5btszIzTGTs
ZuOI47lmUTKhfygND4bcoOkSM2hDIwQ=
=NS5U
-----END PGP SIGNATURE-----

--llk8AJrT76OeYlmwl3LLbHu2IvmDYeolw--
