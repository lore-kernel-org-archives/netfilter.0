Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B3213C68A
	for <netfilter@vger.kernel.org>; Tue, 23 Jul 2024 07:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721719613; cv=none; b=ShUEltmwhyJLEGvSaaU6zhnhGAuYv7oFygxaerltaJoMEMoYd3dZrFmDyMG+vfGYFNsPzTxiSBJgVhkllUNWt/zx8sbbXG8QcqhVK5CmA/tZvHFXK+4Cv9dZvaN0e6tmCaniHQweFhTRw259fz7PimfwyGOzaFgHiT/ifvh7Axo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721719613; c=relaxed/simple;
	bh=Ya/bBvIYiBqAt/izwVdwP63ubTZspVH+3lt6Jkt55Vo=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j8mYEp6rZJmXOKCxzuA5Uuu+nJBoq653+6msQ+IhtN3hNewpYR6Bqe2hNfQla+tVZ2Y1H+leQyb0mB5eS1WWs7YvjGPfmBdgu/RfrRhzdjmmiYIBlvfvhHN7wcpkN6NtNLpEYFzUbMqdsuFgIRSFsUa01zDjM0FvR0C5+Sv97qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=2pMtRUjO; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=bA49wD1H; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="2pMtRUjO";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="bA49wD1H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=Ya/bBvIYiBqAt/izwVdwP63ubTZspVH+3lt6Jkt55Vo=; t=1721719609; x=1722929209; 
	b=2pMtRUjODd1Zglv8nuohLiJk3j8H1+JWWJ7Q4zEaC9iz6b4m0fs3ygDXtgox1GVBAZkUQ8qRSaG
	fNkI0x4yiyq9ElS8m9B/4mBSWuDFWDqeM5sv5O9ZGRh4pVC4qqOQDDPXN1x28Tv7YXm/9nM8Ooq1d
	apg4CAEmJ/pTDdUR/UE=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=Ya/bBvIYiBqAt/izwVdwP63ubTZspVH+3lt6Jkt55Vo=; t=1721719609; x=1722929209; 
	b=bA49wD1Hwqdu/xVWXlD1EcmMZj9YJ0YvJxfrHPJChjKMU6QdPrxMrbNSVdekOXZI/MOZ5jJ8CaN
	pTiDMA5tADw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1sW9v5-000Xv9-1D;
	Tue, 23 Jul 2024 09:26:47 +0200
Date: Tue, 23 Jul 2024 09:26:45 +0200
From: Slavko <linux@slavino.sk>
To: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter ML
 <netfilter@vger.kernel.org>
Subject: Re: Sets update
Message-ID: <20240723092645.733e2e08@bonifac.skk>
In-Reply-To: <Zp7C4VRGtXta6cdM@calendula>
References: <A1B9EF5A-1696-4A6D-B0D1-81DD32DC41C0@slavino.sk>
	<ba07a45c-7564-4b40-92de-ea698d16f49f@app.fastmail.com>
	<Zp7C4VRGtXta6cdM@calendula>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAFVBMVEX7+/xrTUz4//3Ozc10AAH5/v3///8f7tJ8AAAB2UlEQVQ4jW2STY6EIBCFSwmumykPQDTtGqxO74kcgNiJa8dE7n+EAfzBtONCpD5eVfko8Pszeb+sflqOPVyA535abyB+9wnfwMgek/8XFEO33sE6lYWB/8HLqOUOFre87H+g9LK2P7y6p+o+1mJ1B75j1g7VeFeshTXifbfEza+goAqqLyAhAKsC+QahqVD9o74VYxGB6PUBJl+C5FwCUhEUSEpCM41PmGYJABK07oNk0EQQAw54K9KDGAQhl6C4ewDwJnZjjVZptQaD0PQSOqC4R2x0Btg76HwbI5oE1Rt4WUPhvG9cjAht+00SvlD5JThQQYiY2g6s3oBRzXMzgG1nKS2asDr+HPb0aSGmsiWwS9r4+rxP0M1tkgxQW/PzewF+pqPKgEV1cbdiCQxUB+AyaJzeq5AmfQG+IEwtDSTwIU8ArtBCtSKYpEg/lhNwFnwYGi2I3qRhPkGpYx5kmmBqtcrgg5hcUrxhqBicoNh6wnB11vaXP/8lkSYkeYaan4CJV7RQVtFm88jAxSlE8M85XonKgM91qBwtmnVt+1z86eI1+/3OMLc7tgbV5k1IhtndMnS/j6x3dAEciB/D7VuVwQI5Po9h1E7Au/kkq89gKt3ziMu1SuAPWe5Dq/EEywcAAAAASUVORK5CYII=
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jdSmb.7WP4miTyx48PJ1pVS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jdSmb.7WP4miTyx48PJ1pVS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ahoj,

D=C5=88a Mon, 22 Jul 2024 22:36:49 +0200 Pablo Neira Ayuso
<pablo@netfilter.org> nap=C3=ADsal:

> On Sun, Jul 21, 2024 at 10:58:30AM +0100, Kerin Millar wrote:
> > I doubt it. Perhaps we need a new "update element" command to act
> > similarly to the set statement bearing the same name. =20
>=20
> I have these two patches that have remained in my local tree. They
> need a rebase, update tests and so on.
>=20
> I can aim at merging this upstream in the next development cycle.

While i don't understand the code, i will be happy if things will be
improved.

regards

--=20
Slavko
https://www.slavino.sk

--Sig_/jdSmb.7WP4miTyx48PJ1pVS
Content-Type: application/pgp-signature
Content-Description: Digitálny podpis OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEwhNakIB2F5/fdXmSAQVZxpJoYkcFAmafWzUACgkQAQVZxpJo
YkcTtAf7B7D1Aly22T6qyGBMKKZV/XUqTay0LneepsZ9yS2BVS95xYYj5t/KMr2l
UHEgN65TknFTwKW3SjdQbr6f6tSgIp69D4gE83KPZickuDZQvX/361WIGQKDSH7/
fU4UhB9zoh8GXhnwQDx4E/gcWk7d/cNuqKiEJk7e9wB6DQ4RG+/FjrJtpI72qWDY
y4gGHoWYSJRQg8e1MaHVaYzEyz5ynG9vHuAgTF/kjUgkGEaa1SbvALgEvyDTIKsZ
YWn5GOZ021QXJri6MvRO0ck7NpLxQIQEQjtFc8OL5roFXoUQDKUAw+1ePbJHJ3UE
C2PPoNFYL+aLqQAc0WAzo6VKoEZSKw==
=cT3K
-----END PGP SIGNATURE-----

--Sig_/jdSmb.7WP4miTyx48PJ1pVS--
