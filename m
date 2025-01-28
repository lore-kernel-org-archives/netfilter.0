Received: from azazel.net (taras.nevrast.org [35.176.194.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04C61684AE
	for <netfilter@vger.kernel.org>; Tue, 28 Jan 2025 12:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.176.194.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738065740; cv=none; b=o4KrbWFrfotGq105dRdx4oCY7uMkCBeIvjehxh+GHANLLrFgntjmWQihDbKLo4P0YUcSs9WSlCBHzDT0iybMzcYrWmADGBONWwMuSXoSFJzhPOd7jyP0z6/wKK3k4N+EZ1NUaWhA2o5v7rt9M3KDjm8rp3E/4h4M8bnaWO+b8uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738065740; c=relaxed/simple;
	bh=BqO5kqRWH3BEJsoYWVK/1J1uhE9Ebxo4XeGAK9eFoes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3AQfIM+Yku5/0IF6Goe6Ir4g7OOHRC5gtO61pWhEdy/26qps4/qvBAPRPyXEOWTe8Zyen4haWtQY+ttvPWHXt6K09G1HoiWUrJTFUZ7r5KVnC3ivggnBUI/IbQE06AyTPjorKRJXakvA18wsjm0rxb0Zq6JIXWOgsMyC00DieU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net; spf=pass smtp.mailfrom=azazel.net; dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b=F/YtO2gw; arc=none smtp.client-ip=35.176.194.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=azazel.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b="F/YtO2gw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=azazel.net;
	s=20220717; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VpDvxH01zNiLfPrbH8ekhT2Xv0WN3aUGnZ29tGHAnnc=; b=F/YtO2gw1bqZ0kV8PYXeNA5u0S
	zpwbukb4dBXP9k9b8cTxlijFqNvqeQgMmphseh/8evLQXP0Vem9gbNqkugCJ1olh0sAYiLmuzpRz4
	xGOgD9aytYjev2Ohsate+/wSgfADbxv2btAq5f7oYiJ8zQqRZgXfaNPRyyubjjjLsLy4xK0mvB51n
	tf3umcup42hQN0oC9oDq8w0LL25Kd4eb4leCHzfrjPIglhhBiqprscwJIDRvOa94IfujjW91qPZkF
	eq01eVqOpo81aI6y4HYerQaRbyECgfyY8yFVAZ+Oda9McTeOi4kqAu3k8qCi36Eu+byIMjjS5zX0B
	NYQB/rEg==;
Received: from celephais.dreamlands.azazel.net ([2001:8b0:fb7d:d6d7:3c21:9cff:fe2f:35f] helo=celephais.dreamlands)
	by taras.nevrast.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jeremy@azazel.net>)
	id 1tckI9-00G7K9-38;
	Tue, 28 Jan 2025 12:02:05 +0000
Date: Tue, 28 Jan 2025 12:02:04 +0000
From: Jeremy Sowden <jeremy@azazel.net>
To: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: Florian Westphal <fw@strlen.de>,
	"netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Raw Payload Expressions - out of bounds write?
Message-ID: <20250128120204.GD485209@celephais.dreamlands>
References: <Bp_PH3aO9-d7-Av1SaQGtAgrvHaPwr0l5r_aR31_U8l5IvbSFaLJ1lXI3vFBV46Xb4IxK-tP-HkcSFS-2KCLyYfRibcIkioxjdem46U0IB8=@protonmail.com>
 <20250126135021.GB3073@breakpoint.cc>
 <R5drxaQptK9DK89Lt1TmFpDxo86ctD3Pu2WS4wEhXcOZq7yuVqJDxNIc2tZVIx1PJpF15g1AOJCW3gxNIPqlVH6ubbppDWQlzErAa4UP3UI=@protonmail.com>
 <20250128003706.GB29891@breakpoint.cc>
 <KzQMgyTEENAtLkTnyJgmjSJRjhrPRkiRZnDoPpM7P8n7Xs-yWpoBwP_SP12Tmn2ZGkEFLnzRRAOr4BNFwYUCKifrV8lgAtDEfki4KlpDaXU=@protonmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/LiOpep0+rnORp3d"
Content-Disposition: inline
In-Reply-To: <KzQMgyTEENAtLkTnyJgmjSJRjhrPRkiRZnDoPpM7P8n7Xs-yWpoBwP_SP12Tmn2ZGkEFLnzRRAOr4BNFwYUCKifrV8lgAtDEfki4KlpDaXU=@protonmail.com>
X-SA-Exim-Connect-IP: 2001:8b0:fb7d:d6d7:3c21:9cff:fe2f:35f
X-SA-Exim-Mail-From: jeremy@azazel.net
X-SA-Exim-Scanned: No (on taras.nevrast.org); SAEximRunCond expanded to false


--/LiOpep0+rnORp3d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2025-01-28, at 04:19:55 +0000, Sunny73Cr wrote:
> > Use --debug=3Dnetlink
>=20
> Apologies, I am not sure what this refers to: I assume it is a
> compilation argument; and I cannot recompile NetFilter as of yet.

It's one of nft's command-line arguments.  From the man-page:

      -d, --debug level
           Enable debugging output. The debug level can be any of
           scanner, parser, eval, netlink, mnl, proto-ctx, segtree,
           all. You can combine more than one by separating by the ,
           symbol, for example -d eval,mnl.

J.

--/LiOpep0+rnORp3d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

wsG7BAABCgBvBYJnmMc7CRAphqwKvfEEDUcUAAAAAAAeACBzYWx0QG5vdGF0aW9u
cy5zZXF1b2lhLXBncC5vcmfb3YG2ITsfb2qoDfy8qJoDb2Ga7z7dasuYUxsgPkRG
yRYhBGwdtFNj70A3vVbVFymGrAq98QQNAAAyKA//TVFSLzuCTf41DTGn8e3Qj/H0
GxBKFMnFmvIlg9L93vTyUjHy0SnPIL1dFxhMnKEPsMva7V8ts/eIMZg4eLunzAHo
ZPwcaBD/JgNDYJZ1XWM0tvGKnkN/rT9ZtF6fY/bIxzZaa2CTdPtQfd9/0hXbRIIc
eb41XN8MUF+vMCwXnwqWlpqnVhaVW/CZ4Y+x5Nr5jBqWVNmKaLVlO1dqC0wI2fSS
+wotCMQzrQHrJEq4bQtefy6m694uWaLzxn5xyo4osd9d1pn6rVutz3sf44FMHI/m
HpCQ8wXX9gzECMyEVsePnlNqABhGQd+DFDuCxXjvKh0cw9W+BTSOi4oIoFcWR0hi
hJNiWG06Q9uYRuMXrOJs0D1VqDuXKChQJ7pMPky7UvQn9gSSbdo0b0rq+mXyiYmX
oB6Zq132kgdbbIOqNYNHKA+DAWI1/rOBQPq5jKZt7mEBhZf9pUnSGjpClghkOBCA
183YCtaAgkJ0x1BVswiTXEiVUotUY9gGTNo08Kp/ToiJYfE0wE30o9uhDxos677P
cxyaTAOo8OllD8mQxnR7knnd1dL1he/l012uhSVIuTCselOmGe8FuItnW1f0JbKb
TMYlLCEUGfJ1IuFzT4/QK9aur7Zy1IWmuAUbcXIfOiqNupFlsvmT2PeK6Qd+d9dI
oyQFOl9Lo9PRl2zCjvo=
=YLFJ
-----END PGP SIGNATURE-----

--/LiOpep0+rnORp3d--
