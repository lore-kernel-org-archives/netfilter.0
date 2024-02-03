Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F100410A2B
	for <netfilter@vger.kernel.org>; Sat,  3 Feb 2024 09:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706952300; cv=none; b=Ip/uovWJvCj59cw97hF+VdPAE2ADOkFZbnvD/BCvXXePRvk+ObICLxkP0n+KEhvlOa/zcUwuHzYbUbf8BQZGrhxccxKjpXsLEEyZ8/WTTPmdQXYzstqO6NdRLInT2vqOi5m7KCSwtRSuQp/672bqoKDdCHABoKOIB3oSmeRtBhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706952300; c=relaxed/simple;
	bh=hvSobcovoZkJm7/Id/7gujYOyvxe+dPucQeO7ghHYPA=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sIHG7VMMCP2j9Ienx5/u1bdOLKdO9d6+NdG/NOQFP63cQPgperFlYrmxVjsqvmHUqh6hLQ5Fx1ewAWJdQtIqqKaPVubv5O78S1Yyy6TRRWPjZqrMIuRGyWqEB2+TLy6pg7GVFyS2G9q8H/0cAUUs4r3fnEHcLRE6zgQoRJJ222o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=BTZ4u3J1; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=JquL+kfb; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="BTZ4u3J1";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="JquL+kfb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Message-Id:Content-Type:In-Reply-To:References;
	bh=hvSobcovoZkJm7/Id/7gujYOyvxe+dPucQeO7ghHYPA=; t=1706952295; x=1708161895; 
	b=BTZ4u3J1AgnJP8M/VCUTER7Ana+obEGe5BjkKpBmZPwSNb9o71/RQmbh3cq5UHsHqM+odpk2p11
	SNOzETO301HjlkXW4X3LIJ96id+Fh4JJN2ztEtGeySadOPIaevuyIStBjPZVP9EDTS+vmGe8ipPIp
	i2wnyrBt3UID2VxpNbU=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Message-Id:Content-Type:In-Reply-To:References;
	bh=hvSobcovoZkJm7/Id/7gujYOyvxe+dPucQeO7ghHYPA=; t=1706952295; x=1708161895; 
	b=JquL+kfbwiSNvk/r7kGPUNfJaejgB49a+DcC6BuhQl8dZRvCgznZpzOwSbFDR9ElJBS0ypBs0RC
	iMFRI1LiXCA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1rWCGT-000DeM-31
	for netfilter@vger.kernel.org;
	Sat, 03 Feb 2024 10:24:46 +0100
Date: Sat, 3 Feb 2024 10:24:38 +0100
From: Slavko <linux@slavino.sk>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <20240203102438.2a037a23@bonifac.skk>
In-Reply-To: <Zby0eB9G4Qi2DJbT@calendula>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
	<e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
	<Zbj04V-90zpQwEzl@torres.zugschlus.de>
	<cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
	<Zbom4bTPnkTMbLNE@torres.zugschlus.de>
	<5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com>
	<83255444-F0BF-4340-B721-976AC8E5B6AC@slavino.sk>
	<ZbrLg8luc8tbZALr@calendula>
	<exUZ0UdNDgp0QYgSrJwO6Mii6zqR8O6_g4DXCCBpUSaXsMKzVsfIu3VCaA2wclVn_TdAK96h6kue-LSw4vazUBY8srLkCQP9GiuObeJgYY0=@proton.me>
	<Zby0eB9G4Qi2DJbT@calendula>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAFVBMVEX7+/xrTUz4//3Ozc10AAH5/v3///8f7tJ8AAAB2UlEQVQ4jW2STY6EIBCFSwmumykPQDTtGqxO74kcgNiJa8dE7n+EAfzBtONCpD5eVfko8Pszeb+sflqOPVyA535abyB+9wnfwMgek/8XFEO33sE6lYWB/8HLqOUOFre87H+g9LK2P7y6p+o+1mJ1B75j1g7VeFeshTXifbfEza+goAqqLyAhAKsC+QahqVD9o74VYxGB6PUBJl+C5FwCUhEUSEpCM41PmGYJABK07oNk0EQQAw54K9KDGAQhl6C4ewDwJnZjjVZptQaD0PQSOqC4R2x0Btg76HwbI5oE1Rt4WUPhvG9cjAht+00SvlD5JThQQYiY2g6s3oBRzXMzgG1nKS2asDr+HPb0aSGmsiWwS9r4+rxP0M1tkgxQW/PzewF+pqPKgEV1cbdiCQxUB+AyaJzeq5AmfQG+IEwtDSTwIU8ArtBCtSKYpEg/lhNwFnwYGi2I3qRhPkGpYx5kmmBqtcrgg5hcUrxhqBicoNh6wnB11vaXP/8lkSYkeYaan4CJV7RQVtFm88jAxSlE8M85XonKgM91qBwtmnVt+1z86eI1+/3OMLc7tgbV5k1IhtndMnS/j6x3dAEciB/D7VuVwQI5Po9h1E7Au/kkq89gKt3ziMu1SuAPWe5Dq/EEywcAAAAASUVORK5CYII=
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vY1msC_lLb8QNnzyftp9lCw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vY1msC_lLb8QNnzyftp9lCw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ahoj,

D=C5=88a Fri, 2 Feb 2024 10:23:04 +0100 Pablo Neira Ayuso
<pablo@netfilter.org> nap=C3=ADsal:

> Does your kernel turn on this?
>=20
> CONFIG_NETFILTER_NETLINK_HOOK=3Dm

Unfortunately, the debian's stock kernel doesn't enable that.

But how one have to realize, that kernel module is missing, from success
return code and/or no output at all? And i checked dmesg (kernel log)
output too, nothing related in it.

IMO, nft has report that by some way, and document that needing, at
least in manpage.

regards

--=20
Slavko
https://www.slavino.sk

--Sig_/vY1msC_lLb8QNnzyftp9lCw
Content-Type: application/pgp-signature
Content-Description: Digitálny podpis OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEwhNakIB2F5/fdXmSAQVZxpJoYkcFAmW+BlYACgkQAQVZxpJo
YkcTRQgApcHvgawovmRgIGVb96MFex4ZiWr3pKupFsst1w4yE4U0LJl56R9+jpbq
N5fYMWP7YB5wb+RjD3XEypu+eTGO6WilbSMovatkAc7h5F7tyHdgXx1gHUs1ecrq
UbfFzNVFwnG93EaezAWEOoVOm/AhE+ywhj+sDgdosu7Z588SQz9x+WPMd6aRbTJo
ftidk9EqQ+XdKK4oLPykghVGNQ5Au67eeIaZu0d15S9htRVu0+HdELySB3TSffCP
8QlInfG1oqdQ7R/OusH+HWJL9IOlL+GlSM1SlqcRu2MB/174cg1JsBS2cYTGMDmq
6P5VbxrCCZ8IkZx0tgci6bp+nbf5fw==
=Dj5O
-----END PGP SIGNATURE-----

--Sig_/vY1msC_lLb8QNnzyftp9lCw--
