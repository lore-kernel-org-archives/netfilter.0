Received: from azazel.net (taras.nevrast.org [35.176.194.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38722BDC09
	for <netfilter@vger.kernel.org>; Tue, 18 Nov 2025 11:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.176.194.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763466371; cv=none; b=a3IwXwwZmeOcSeaLu+gRyqwTDicEmjgS1lstM7PO6hFBZ4JnX+MdSyNAghCkLr734744rzsAxplceDzdAelqmqyR7o0r/vYHHBuxNe/irdopIr/iGZkUz7kOehN2cvnd1HQQmkBjgXPJuRju5lHDimWbBi0/Y7lbJPwkuUQlPWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763466371; c=relaxed/simple;
	bh=LfY1wxE3vCAkwg63+jMMcdUgny4SCd64oZk4uc+4RTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmYHy+fEp+Vv4yeliorxOiZ3aqKhOGjZmCCzxfG0uGTQc95FKnzZVHS3dK39jDtDN+DEq7ruSb5vMXeiFw1VPumvraZvQJOIoxcqDOBIJlfxD6SHWRXipiF1AN/lYMy95o66pUorLlz0MpHXQ5vpSw+74Htk1FhfPJLRFM77C7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net; spf=pass smtp.mailfrom=azazel.net; dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b=ZhjAk1tN; arc=none smtp.client-ip=35.176.194.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=azazel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=azazel.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=azazel.net header.i=@azazel.net header.b="ZhjAk1tN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=azazel.net;
	s=20220717; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=EKrf+0U4zfQoHdzkFK1JcvzD0u8ARMPUN/KujoVjT4E=; b=ZhjAk1tNZZCfTPY/hlKEVhc8d1
	jTVW6EEsZsmG6EoFYuNFWpNum2jwHZCDVZ3sLWExh5HAEhoPjEF4urHoA6tqTPVa8caehL9HnpSjS
	HrOr/8wEnbDEc99z4Pp5QOM3U4ra/L8BvO/GruDcH9Q9Ab3PwbF8imynTRyacm6jt0xR+yDMuKwRL
	lJKXyrJ/UMeHNVKGXVBT6BJnjLpJhRE10qZGJZoshRs+cDridb7SJAVG7Ss7mDBfE8VDcWVi3+Vku
	7IVT6oJflVZEbESr8WfeIFD+5+pNu3BxCY9oNfvw3y0walRbo5asoDCKBE0mMi55RDlkPMSaqipw1
	K+1Vqafg==;
Received: from celephais.dreamlands.azazel.net ([2001:8b0:fb7d:d6d7:3c21:9cff:fe2f:35f] helo=celephais.dreamlands)
	by taras.nevrast.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <jeremy@azazel.net>)
	id 1vLK9l-00000001N0d-0WWR;
	Tue, 18 Nov 2025 11:45:57 +0000
Date: Tue, 18 Nov 2025 11:45:55 +0000
From: Jeremy Sowden <jeremy@azazel.net>
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter@vger.kernel.org
Subject: Re: Changes in iptables-legacy
Message-ID: <20251118114555.GA968246@celephais.dreamlands>
References: <df96861a-23f2-428f-95d6-83ecbc4044ad@tana.it>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wjyK2I/gWK8MdGnJ"
Content-Disposition: inline
In-Reply-To: <df96861a-23f2-428f-95d6-83ecbc4044ad@tana.it>
X-SA-Exim-Connect-IP: 2001:8b0:fb7d:d6d7:3c21:9cff:fe2f:35f
X-SA-Exim-Mail-From: jeremy@azazel.net
X-SA-Exim-Scanned: No (on taras.nevrast.org); SAEximRunCond expanded to false


--wjyK2I/gWK8MdGnJ
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2025-11-18, at 12:31:15 +0100, Alessandro Vesely wrote:
> I'm still using iptables; my scripts work well... call me lazy.  I=20
> didn't expect behavior changes.  Instead, when I upgraded to the last=20
> Devuan release, equivalent to Debian Trixie, I got iptables v1.8.11=20
> (legacy).
>=20
> One of the scripts had a daily call like so:
>=20
>     iptables -L -Z -vnx
>=20
> The new version resulted in an error:
>=20
>     iptables v1.8.11 (legacy): Illegal option `--numeric' with this comma=
nd
>     Try `iptables -h' or 'iptables --help' for more information.
>=20
> Is this a Debian quirk or is it found in the official source?
>=20
> By simply removing -Z, the above command works and its output is
> properly digested by my legacy Perl code.  However, I'd be curious to
> know why this change was made.  I hope it's not a subtle way to push
> people to migrate...

It's a bug in 1.8.11.  The Netfilter team have fixed it.

J.

--wjyK2I/gWK8MdGnJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

wsG7BAABCgBvBYJpHFxlCRAphqwKvfEEDUcUAAAAAAAeACBzYWx0QG5vdGF0aW9u
cy5zZXF1b2lhLXBncC5vcmfIYJnvrgx8PiFV87oqSX1iJ5kYWpQvVYzN2YWqpe82
GhYhBGwdtFNj70A3vVbVFymGrAq98QQNAABT6g/+JQ5uAnW5rimqWIvpl7KGn/D7
zU/ZiqcNUHIW3T6pxGhlBPuHpkfnHheFNm2Nera0cZvNVypheQFQ7OM4DCvqBbOa
afv39mYjqzVmc9FlEv3s2/B87ix+N74xYtZPOnDE4HOlLKek8RLPikfydGKQWLcc
QogYTgdZvxGcOpvxQO4oim966/yWvVHg0ylMp9jO8zAU9bFWQo72K+HDynwnlsiR
HrZBOuc8+pOYibt7Z/j+5gvzlYmqltof41gOHt49iE1eC+tctu97PlDI6iXPhpuP
cqCqQ1sDnG2lAk2+mxqM220EfUHATbViKB6HDOhhRQjZB0gM4tftTkyLyPz7wMH/
PgHtdS176SVfgR9ipYOjE5DiodcKYud1DlOTFJA7putaEHMgujXnqBVG1FRNW0Ci
ZnyhpIMUvbyejiWhn7L4PaOQEVXrpj+EIMkNjsCk8rprcygic6fAwc6uekdqPLnh
hJyL/EGLkMXelySspP+g6Q1HQjsxPbJqcpnzpzBytV8ImdZYRsnl4fhNIqCdUpli
9a5tgnrVB1JqDe+L7s406ugX6CHjhn5cytnz0yp/VDfPduNV/RPHlbBU29obRFd/
U9Fpk/DnqVsPEOyOUnsR6ZUwgOvftQm8E4aQn1fnUsvsZQ0A+FwUl1IKcR08xARt
D/54yHoOkAccbpOSn88=
=O9kq
-----END PGP SIGNATURE-----

--wjyK2I/gWK8MdGnJ--
