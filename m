Received: from azazel.net (taras.nevrast.org [35.176.194.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0113A21147D
	for <netfilter@vger.kernel.org>; Sun, 25 May 2025 17:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.176.194.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748193874; cv=none; b=HWoiGQ3Tt4fz4JtvB8oHIYEYZ+gr/gjed2xcgZdi8gpALt4gmAzynAkczRpX6KZjQa8ZYnvlo9s3NjZXTtatF88SnV5QqBbqUsWgw1QitEdkA63bGkMk5vnn64GhYUeMUlTLn6S1l83ZME9fZhosQ2In+TL8/K+Xv/Cpp8REnHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748193874; c=relaxed/simple;
	bh=7goNJOrTootvZ7GG3Dv4XdcXICY1YYE8s7pHbWBkEUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ed9xEY4s0LCRjIoyFmKiXfjAVXNnwaIWCSqTYwUAJ1ClBYXKtdnWmHe//4I/aGy8rpYZtekbCTMqGAF+1rYzsz2gJcHhoSiaJxIl1B6RcGwKzP4DeTLU+kHc4vYHVggYs5KZm69+8KNFcHChqQNqRQ4qCuDuRzd+htzPd/naQbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net; spf=pass smtp.mailfrom=azazel.net; dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b=hDkBeabp; arc=none smtp.client-ip=35.176.194.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=azazel.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b="hDkBeabp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=azazel.net;
	s=20220717; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=7goNJOrTootvZ7GG3Dv4XdcXICY1YYE8s7pHbWBkEUw=; b=hDkBeabp4ZJ0M474+pUQ5v2dgT
	b+zvXcC6Yb3TuNjoqws5+vd1vejpACs/CF9zfVLGF/OHKQcXvHirJw6sua5JnkvbctS64Tt3SRKKX
	6oP+R+JTMTd5vhIaO+BAUv2itczU2XxHvUW7mqyegQphqM3RDdSLtatVZ7cWzR8WBIpp7cUNt3/5t
	I05Nf0YA54OfC4lFTzj9E9kaWn99GgycR5erM9AdRZQXWxhbNz/layo3+3w9f4L4euRr3WWQu8+pu
	CiIkU9stESgNshwL9aEGh26b8AjTPbJdUYwbM9//Zmdc8MBdZoCMHicBiuEuIpacMMlzlDh7+wYNi
	HkLXOt6g==;
Received: from celephais.dreamlands.azazel.net ([2001:8b0:fb7d:d6d7:3c21:9cff:fe2f:35f] helo=celephais.dreamlands)
	by taras.nevrast.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jeremy@azazel.net>)
	id 1uJF51-0006TQ-1i;
	Sun, 25 May 2025 18:24:11 +0100
Date: Sun, 25 May 2025 18:24:10 +0100
From: Jeremy Sowden <jeremy@azazel.net>
To: Florian Westphal <fw@strlen.de>
Cc: Slavko <linux@slavino.sk>, Netfilter <netfilter@vger.kernel.org>
Subject: Re: Log ARP headers
Message-ID: <20250525172410.GD2764308@celephais.dreamlands>
References: <FADC1D05-BC58-45CF-AEBA-2D4B85928185@slavino.sk>
 <20250303193533.GA16225@breakpoint.cc>
 <88D0D02C-9C84-428F-B62B-EBA5E359D325@slavino.sk>
 <20250303220055.GA4034310@celephais.dreamlands>
 <20250525095130.69477537@bonifac.skk>
 <aDLyD-JCbdEz60X4@strlen.de>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nGZdiHE0WN7cJaE5"
Content-Disposition: inline
In-Reply-To: <aDLyD-JCbdEz60X4@strlen.de>
X-SA-Exim-Connect-IP: 2001:8b0:fb7d:d6d7:3c21:9cff:fe2f:35f
X-SA-Exim-Mail-From: jeremy@azazel.net
X-SA-Exim-Scanned: No (on taras.nevrast.org); SAEximRunCond expanded to false


--nGZdiHE0WN7cJaE5
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 2025-05-25, at 12:33:51 +0200, Florian Westphal wrote:
>Slavko wrote:
>> Please, is ARP logging working in 2.0.9?
>
>No.
>
>https://patchwork.ozlabs.org/project/netfilter-devel/patch/20250420172025.1994494-7-jeremy@azazel.net/
>
>I'm waiting for Jeremy to rebase and send v2.

Coming shortly.

J.


--nGZdiHE0WN7cJaE5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

wsG7BAABCgBvBYJoM1IrCRAphqwKvfEEDUcUAAAAAAAeACBzYWx0QG5vdGF0aW9u
cy5zZXF1b2lhLXBncC5vcmex4/IUzYYJJ7N01zYRMOn9uh1L2t6tkDbi3AEwSHMx
PBYhBGwdtFNj70A3vVbVFymGrAq98QQNAADQtRAAkgWwwzlEThupeFOmjX4xfBWq
qVx0RbEYQHp2p0QQzF5uJ/exrCJjXlJLxIFMnxv+JiJ7U5yOauIMS6bhfisYERvV
aBDChC2BkJYi9NW8CSgU7pt0AeNomCjQTQe+9X/GvLeUu4TInPWU87iLff3p/6zd
zObo4bc3GIT/QwbX18wYWs76qLTp8d27pOXVM+vL01ZaMMcFjXIeKpUe4AVlVzVZ
fzHQCinY/WC7EzGG0EM/C0IeobXxRu2vTDCpOpIpkIAEe+s1UxIVoZ3df2HuwtJj
B7eZ1Ssx7zsGje3+ryy6FjOIJ69t8YsVyLCPitlvXpNGxLfgcQ27AZCrk45sQQ9y
s5i8HLj+0WKUM/uSITC6zSAtfZ2/4zez0KW3vbH3cdtPYdIIXenUt/lq8ZIjDXP+
s+Lb4SyE9hAR78Zax73eeoN8iAPF8wpUXlYCC8S1FbbDV7tAIfYLFktAIF+UB0lx
FUX24pmgebn/V0mDBySOxNkLaQWCFtiCVw0H2YIfgpv2JQxYFDBqYITBQAi1iIvC
mMPmVxeg/Q8mD0hxsN1/aZnbklvkpGtHc4cj1vQ7HCwcEn8pE7p0oHQ18N6XFXLx
2iV8Gpcb28Sp/s7+keVTDmYqhwombo5quG8HjwcwvVBRZHDELKzA2Yc4fEqSBcvM
E/+rWV9sDLYiAPB5KHM=
=cxam
-----END PGP SIGNATURE-----

--nGZdiHE0WN7cJaE5--
