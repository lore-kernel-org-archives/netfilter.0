Received: from azazel.net (taras.nevrast.org [35.176.194.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0AF1B87EB
	for <netfilter@vger.kernel.org>; Wed, 19 Feb 2025 23:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.176.194.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740008242; cv=none; b=arV9nJTdP/OE/nTcjfr8nP7pOzZ1WQkswVDms60BNFPzWdtIXuBsva3fcxZICtPDHRdLxlxCjZ/wxnKPbrn3pjMb18IebOwp//TbaRHs9SsOx8VaftMMPbMy0Ol7HGF46WbwbrVffApuXZMPhA2yZIrh3onAmBA0q3kP6K+a8bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740008242; c=relaxed/simple;
	bh=E4qjImXgTnQDkwN5+GXcn0hmfpvy6ztPIHfg5APNj70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhu4ph2g9NzFPxvAyEV60AErpzZP4wSv8rLa1RC55uouL/wOPKNc3++kHZxmFRQZqJzCRA9JsMorIAgQozTc28VmRqfCxtt9GFmN4NLpvnxwMsBXtEoLZ4Nz4YrVt4gjjyWL7RNZLefV2mig6Svwob+UDyfuS20+io71P8R1nUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net; spf=pass smtp.mailfrom=azazel.net; dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b=dPjET3GG; arc=none smtp.client-ip=35.176.194.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=azazel.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b="dPjET3GG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=azazel.net;
	s=20220717; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6Aw3HlEstLrp62bJH1sJyI/DfdkCbB6x5JL9PJs5yO4=; b=dPjET3GGSFcP7SgZeYdsn+lPxW
	LbL6O4ZbsavUphycvtWAxhmiwnxKc9VaMPRW2YEGiOu0m1Gr9z78oZuvJCBQhVJU7pr3RxN2VBBZ5
	+XczRhn6QTGY6jgnApUvWtV4HzkJwqEkQXu5OFZd4UBThcPoed3jJklC+mdQs4Yk/vnZUxXl3PUc+
	+o0p9h3yk5+2qwPiHlgMynUmgox6CcFeW5IZspP6a4Pr7BKT8cMUGOaoyUF5YMcYykkBTa5iZ0Vpq
	4nVGdBY6I1lHhKyM3Oj0Og3XqsclRc25uYi8BjflcQA5qC4xpIIXrg54zgcA07FsoVWhZhgWe8q5t
	2D4lCrFQ==;
Received: from celephais.dreamlands.azazel.net ([2001:8b0:fb7d:d6d7:3c21:9cff:fe2f:35f] helo=celephais.dreamlands)
	by taras.nevrast.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jeremy@azazel.net>)
	id 1tktAF-00D8Ay-0p;
	Wed, 19 Feb 2025 23:07:35 +0000
Date: Wed, 19 Feb 2025 23:07:34 +0000
From: Jeremy Sowden <jeremy@azazel.net>
To: Slavko <linux@slavino.sk>
Cc: Netfilter <netfilter@vger.kernel.org>
Subject: Re: Cannot browse SQL files in ulog2 git
Message-ID: <20250219230734.GB489148@celephais.dreamlands>
References: <468BFBD9-371E-46E5-9BEC-018B8C3F5D11@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KwIWAuozBXooUT5G"
Content-Disposition: inline
In-Reply-To: <468BFBD9-371E-46E5-9BEC-018B8C3F5D11@slavino.sk>
X-SA-Exim-Connect-IP: 2001:8b0:fb7d:d6d7:3c21:9cff:fe2f:35f
X-SA-Exim-Mail-From: jeremy@azazel.net
X-SA-Exim-Scanned: No (on taras.nevrast.org); SAEximRunCond expanded to false


--KwIWAuozBXooUT5G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2025-02-15, at 14:57:21 +0000, Slavko wrote:
> i recently play with SQL in ulog2, it works, but i want to
> read recent SQL examples in doc directory in web browser,
> but i got 403 response, the same response provides the
> wget tool::
>
>     wget -qSO- https://git.netfilter.org/ulogd2/plain/doc/mysql-ulogd2.sql
>     Date: Sat, 15 Feb 2025 14:48:34 GMT
>     ...
>
> The Makefile in this dir is readable...
>
> Please, is it really blocked or by some mistake?

Confirmed.  I get 403's for all the SQL files in that directory.  At a
guess, mod_security is being overzealous.  If you use git to clone the
repo, you will be able to read the SQL.

J.

--KwIWAuozBXooUT5G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

wsG7BAABCgBvBYJntmQlCRAphqwKvfEEDUcUAAAAAAAeACBzYWx0QG5vdGF0aW9u
cy5zZXF1b2lhLXBncC5vcmd91PQhO8Rng+bYpAzO99fPJCxR7PCo9l/3WHlEqLNX
ThYhBGwdtFNj70A3vVbVFymGrAq98QQNAAAs+g/+PlMiv6HMcFuOPMUOhBidZsdl
U/dtASvxmAQ7cyx51ZcB0sQPREQpA+f9ra3/Rt/X+HSDJTRvkXncZ3/lAMCn/k9t
wef02iB5Jtww6MOHCuqYdn0SkGEUckB8inm4cKdYq3Fs1Nfm5a3Sj0keJpYLkizM
JQaS0/GEP8LKDCaph3jv1etDUM27IUw94b1jM6xV9lW+9k50L4kjR1XBfCkjINY5
fobKW+WpMMvvpobxiVt7wWQSMmNeNlJs20m8d9ZJwqA3g9GEDf+Kb40EP2w/ihLX
mGGXieOZcQsIiR5Arg+FvQI30GOSg0VoWTZk2366bffuSsyEuJTOiIqD7wzhveXv
BeR+LERZvRlZZY/aMbUkZ+opAy8Rsty6wMYW2LnJftPc2p86ufzqWis7scUDtGja
2vVqinBngOauS45BqjakxB2yba5mamT8LBb1jBIW8HJcSGmNNsfn8cwjlLxHYGCr
9eZJ+6NZegNO2+GOL/TMCXGsnO8sq2N4AZpldfsw3uk5aczZriH7H767Vlytfhj9
m+Lo12k8h6yJMSYKx82YR47u5QYJ2yTQyOCUf2gVyw5eMujdewy1du95sMW1tOpk
c+Ce3x9DAzxFVHdtF7fezWXiHYUJSX3eCxMH9x3knrjIlXjjZx0IE8NSpdsKs+Y/
hfkhtswqwQdy4vgKXfE=
=u1tz
-----END PGP SIGNATURE-----

--KwIWAuozBXooUT5G--
