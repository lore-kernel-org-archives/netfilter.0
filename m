Received: from azazel.net (taras.nevrast.org [35.176.194.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5263E361DB0
	for <netfilter@vger.kernel.org>; Wed,  1 Apr 2026 19:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.176.194.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775072291; cv=none; b=D5P+IQ0Sq2dqxyfZmZbjdWxW2To6x38u/zYfVCfVIIaEo4/jCpNU5PBEzggvOxYwRcVsdScv/wR1FxqMAH20OE+FZDsUYxmGi06jHeLX+fMkS1U/ccxHpfySBnVimouKawGbillWch1Eit3JEqXY3ffwGpi2IF6tcOdt/Cl3HR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775072291; c=relaxed/simple;
	bh=6TdNayRu1E5XLj2yIgviq+UkvpXEu+21G4MlBUpja9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSFqSICxfs8iZwS1N/LKSbFBL10W3wHzadNr9MNqmx33YZw2sUvDTYLVkNTKN/9sI+OuC9qzIC5HLCMtCKaRJhaXAjKjmy5+ryjleDFtigxfGXdSjYwjVexFq75kJlWTI/jQF3/hRleb4BqATTr4TqyXhK7Px5HsWkhd009srZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net; spf=pass smtp.mailfrom=azazel.net; dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b=hmVEf6Sa; arc=none smtp.client-ip=35.176.194.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=azazel.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b="hmVEf6Sa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=azazel.net;
	s=20220717; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=H1886ppYG+8gqgKysGz0qxr3PQ8D0PFGt0mTX07OLDs=; b=hmVEf6Sat0Z+rKmMKc4FKNsO7t
	4UZp8vHi4gNtHCmycNt08fvU87TKCQX0k+10LuvaI1xBCGShZ+3l5hf15ZqEaMrZlmgp8pCUlWuQl
	MH3afP5bWk43ZjeNT0lBJnlRCzqCm167OUjJPqHViWY7KQQQZ5M4sjXKqJgQNLD3C9vkxr1gQIaCx
	6BE9yOaS/yka8661l3Myn6uO/zJdjzDqLM0Q90J91H2txmqca3qRZ0Am4cxaqegeFMeCEjaDOLFsB
	zkdR0AomEMjUF+2L9Q2MkLYTY9f4i9atvO12L27lnGVXSmqkrhy6u5QAQEQYy/JA2/bqZpkop795X
	sUQD7Hhg==;
Received: from [2a00:23c8:a49f:6601:3e21:9cff:fe2f:35f] (helo=celephais.dreamlands)
	by taras.nevrast.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <jeremy@azazel.net>)
	id 1w80uW-0000000D364-2XGn;
	Wed, 01 Apr 2026 20:07:28 +0100
Date: Wed, 1 Apr 2026 20:07:27 +0100
From: Jeremy Sowden <jeremy@azazel.net>
To: Martin =?utf-8?B?TWFyZcWh?= <mj@ucw.cz>
Cc: netfilter@vger.kernel.org
Subject: Re: ulogd: logging IPv6 flows
Message-ID: <20260401190727.GA5449@celephais.dreamlands>
References: <mj+md-20260401.114453.17525.nikam@ucw.cz>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C1tGMC3L6Po9/vnt"
Content-Disposition: inline
In-Reply-To: <mj+md-20260401.114453.17525.nikam@ucw.cz>
X-SA-Exim-Connect-IP: 2a00:23c8:a49f:6601:3e21:9cff:fe2f:35f
X-SA-Exim-Mail-From: jeremy@azazel.net
X-SA-Exim-Scanned: No (on taras.nevrast.org); SAEximRunCond expanded to false


--C1tGMC3L6Po9/vnt
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2026-04-01, at 13:55:09 +0200, Martin Mare=C5=A1 wrote:
> I am trying to use ulogd2 to log all flows from conntrack, but I am
> getting corrupted entries for IPv6 connections.
>=20
> Instead of IPv6 addresses of endpoints, I am getting IPv4 addresses.
> Apparently, the bytes in memory are interpreted as IPv4: for an IPv6
> address starting with 2001:0718:, I see 32.1.7.24.
>=20
> A quick glance at input/flow/ulogd_inpflow_NFCT.c suggests that both
> IPv4 and IPv6 source addresses are stored under the NFCT_ORIG_IP_SADDR
> key, but the nfct_okeys array has a fixed ULOGD_RET_IPADDR type for
> it.

The use of `ULOGD_RET_IPADDR` for both families is (or should be) fine.
My guess is that there is a filter which expects `ULOGD_RET_IPADDR`
fields always to be IPv4.  I thought I had fixed all of those.  I will
investigate.  Can you tell me the whole stack?

J.


--C1tGMC3L6Po9/vnt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

wsG7BAABCgBvBYJpzWzaCRAphqwKvfEEDUcUAAAAAAAeACBzYWx0QG5vdGF0aW9u
cy5zZXF1b2lhLXBncC5vcmdr7IK7ngB6KYo3gI4Lvdoy19v5PevQgqRWX9ETVX7h
eBYhBGwdtFNj70A3vVbVFymGrAq98QQNAAAaaxAAsHgPNho+d4idQ0L+YtLFqvqv
jNXGGe9zJjY18Pw1DdoK6EcvVUl1BxTcBAZ0haYEidCm90MHMAZKFqJ1eKcmUQK1
9z8NCCGSpf4kx5FlHGEm47SeGBGKcmdoNqsjjBZMqn3ZzNGImL6r70c/iuBrqI4M
NWXuD6p8at+v2iOsqOqb4lQQd4nlPYhyzhSVNPfWPVgFUwKDFlnjuk48XVRP9sdG
osTYBQsM93LPCwx3faLniMyivmTqY+aZfnAZqwkL+NHKptbX/dUPvkuXgMIDGaTU
Xf0Xdb6Frk6yk110Z5fKBQoLTiGi3niDdOyDvD4g5NPB9LnG00Nwcik6YXp9EkvK
Tl3Svg98AaA12QOZkLSOCSAmPeI6aj8oK89IdzhEdNSqMV0hX3NIrZAhAa9I9iQZ
QcHA1RMQ1uQx8eQWmuUX/wmstnFLUwRCub4HoK0mogf0I0QRHnxGMivS774IBKM2
enK71uNRVvT5wXgWf7cJ5o7dwkJuZgH/K4Gml5PABojaGtaHeyD2CV8NBB6ODzhq
Gu+K5EE5Bo7e9wWGjf5mwke7bAf26BUDXqd6tDIWvFORog+29ilPwMZGbk5avKdg
SvidUnxbORSrigQ1Xj6vAWH0N9GAVJr+VwjwmcjdGTu9V2RFEiPJQ8g11N7hMcQ1
fN9MonmXUeU2xm6LH68=
=ZpSe
-----END PGP SIGNATURE-----

--C1tGMC3L6Po9/vnt--
