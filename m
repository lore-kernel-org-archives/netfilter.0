Received: from azazel.net (taras.nevrast.org [35.176.194.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9BF218821
	for <netfilter@vger.kernel.org>; Fri, 18 Apr 2025 11:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.176.194.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744976669; cv=none; b=F7iXnAlmSTsCGl505KAs+aHeY+wIvB/7N3USfQNWYs2Nq0eMlI9cr1P/xqFBQQuCJpCEG9E4ts26ktwPhZUBrXgP7c6s1G7nUp9qWQE9obrMRHpWKtEUD2yrJSsPMNbv2BY2JEaM0526NDAVCdmYS+b4YGXilLgu6bXFs2D9mII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744976669; c=relaxed/simple;
	bh=cpQmNw832C4ibXK+ZbtC5EVbpqfEm7cTXTTJQ6ci6Go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+N7dSk5kqaU+XTZZC+DqyCORx3toWcdzGlPRcg582yJaVYVyq0YftwVePpvMgoQD191k+8R/bq1hToGif9ndfTq7bc2yYEvpq0nK8LWGsNzNcYDr61NJ5zAqAMELLw81A4MU1wRsIdrogG0dJ3Zb/WNdgeQR/D1IxhEHJu+A64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net; spf=pass smtp.mailfrom=azazel.net; dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b=EXN1yXsJ; arc=none smtp.client-ip=35.176.194.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=azazel.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b="EXN1yXsJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=azazel.net;
	s=20220717; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lXm+lWCHHLhPmo8JvpzKw4zf/7wdl2/uepgL7h2/0RQ=; b=EXN1yXsJaYJAqbjyGcXr4OUxiK
	ovtzMT7hVl4eZjpAYH/dPllqWMOHLdd2daIYoA1y++ZC49u6SiqQkDWU/PRQxglqm8W9efSRYNkHR
	fPgb0yrzx5nNtHZb6PMOZbgC56jsv43K1i5RnHnscKIuVt9TdDvA7RKvqZcXrRqYZuag0dPEbfh6I
	GcLEC2v7UcSZ4BEgPGOuWwMnt7mTw8VT8G5Z/jmFCo99KEW4kIg0OTzdPdhLQ2/34JyC9DX/HwmNE
	Lql4hXTI9KUW1XW+V0JNY4/tGN4lyzQv22KeJfoyJIVhD5c0x3wfRonuNrrv7KBKpMSql5VUQUn8n
	Cqt/0QUQ==;
Received: from celephais.dreamlands.azazel.net ([2001:8b0:fb7d:d6d7:3c21:9cff:fe2f:35f] helo=celephais.dreamlands)
	by taras.nevrast.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jeremy@azazel.net>)
	id 1u5jSp-003tgM-2p;
	Fri, 18 Apr 2025 12:00:55 +0100
Date: Fri, 18 Apr 2025 12:00:54 +0100
From: Jeremy Sowden <jeremy@azazel.net>
To: Slavko <linux@slavino.sk>
Cc: Netfilter <netfilter@vger.kernel.org>
Subject: Re: Log ARP headers
Message-ID: <20250418110054.GA788356@celephais.dreamlands>
References: <FADC1D05-BC58-45CF-AEBA-2D4B85928185@slavino.sk>
 <20250303193533.GA16225@breakpoint.cc>
 <88D0D02C-9C84-428F-B62B-EBA5E359D325@slavino.sk>
 <20250303220055.GA4034310@celephais.dreamlands>
 <20250405115436.7b67e491@bonifac.skk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zzZzNTGcefHiuuCV"
Content-Disposition: inline
In-Reply-To: <20250405115436.7b67e491@bonifac.skk>
X-SA-Exim-Connect-IP: 2001:8b0:fb7d:d6d7:3c21:9cff:fe2f:35f
X-SA-Exim-Mail-From: jeremy@azazel.net
X-SA-Exim-Scanned: No (on taras.nevrast.org); SAEximRunCond expanded to false


--zzZzNTGcefHiuuCV
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2025-04-05, at 11:54:45 +0200, Slavko wrote:
>D=C5=88a Mon, 3 Mar 2025 22:00:55 +0000 Jeremy Sowden nap=C3=ADsal:
> > > I understand this change, but i cannot see all consequence,
> > >
> > > Any chance that it will go to ulogd itself? Or i have to maintain
> > > this patch locally only? (I mean for future versions)
> >
> > I'll look at this when I get a moment.
>
> Please, any progress in this?

Apologies.  Wasn't sure after your continued conversation with Florian
whether my services would be required, and then forgot about it. :) Will
make a start.

J.

--zzZzNTGcefHiuuCV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

wsG7BAABCgBvBYJoAjDYCRAphqwKvfEEDUcUAAAAAAAeACBzYWx0QG5vdGF0aW9u
cy5zZXF1b2lhLXBncC5vcmccl53YkKlovV1xK6/51H6u5Z15HprasaLMPjKUNZJ4
thYhBGwdtFNj70A3vVbVFymGrAq98QQNAACqCw//YlZa+FAKAZNHpNcKdVspV5CS
QoM2fKliDdHogd8SJOwJN3YYlJB3wNVNETsunzNBEPax6m0S8Q1dyy+OoxLlcRSR
z6ztWKmcE4IThryqkiQHSCJTBHT4ndMlCBeyntdzAMiGwwteAiiTFkJVmMnnymA8
eOzhUGRXu2Ja/1iCMwSYErGmpIw9Mw1imQI29DxJf7IJFsECgD4rLFUgU/CK4VGo
axVEYDfF6L5IxrqgRT8XpRcQvK4eMZqR5MBUCGP5Y+Uf+WfJEbmyaH1DsDGEse5d
pum6gt45GWdNXhcV8MREqtUd2vqhjtR6QV05CQlTPggdi4TOXWysh/1Q4m735vyW
Br3VGsr3CGqyGRZSY40bU2vU8jaGxn2cAvtA3mhjbWAgVDVOWZYoUHHZDU+4Lpzs
QCokbV9La7FQRI2dOnNKp3kuqiYwrURWvY+mrYJio8JQy+OKA30Tp7m8QZ6R74+q
cpqieg4dVOHydWiYw4eMZb4Ix+anAv39JBe4cSKYwxYwTxeoCyeNYwRjPbwrN/H7
Myf/prLwxQaB6aQsLZ4MgTt7Q6W2NgDcFWMU9ro618Zy6e+hMWw3NeJrUUDyHe3U
hEy1lb+MuUboGwDcOPEe7naT16EhfbXtNxaKnnc9/NjhVUHGS4Wpbb7A1NLq9DZM
oSznJmVESoP4cZqT3zg=
=I+8g
-----END PGP SIGNATURE-----

--zzZzNTGcefHiuuCV--
