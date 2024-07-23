Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD3D13C9A3
	for <netfilter@vger.kernel.org>; Tue, 23 Jul 2024 07:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721720233; cv=none; b=Ay0HfYduNYLLcQMnIapJJPUOnpafT1+vgT5+blPq2ToUzg5OgihdaEWr11Kg/LTLxS0dG7p3IdsAM6n239dVOcZzzwljaZONVeLBaah8ASYMs8zYXJHWdrCp6bInOj+cU/HKHy8cZSRZ9KBkVi/LceDiFgGpK/+u6v5fD0eU9m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721720233; c=relaxed/simple;
	bh=1u6MV5pEreaJ3Zp0LOQoYtcsXVoVWQXeoKxrTT1DuSM=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QoMHcK2FBcedERqxzHuEEz1ke/Y4MKYT8ICiiZjCzQoOQoR7qT/jnFc/RJu1TrtVusMqEELASQMDmeQOwz2kYFSxP6RgPhuek1kMr0sgSOGtLT8o60GKQphcalmv2Tulnx15XDUAABxBpWMWmGmAgxuUr0AW5Ffl0g6X9XoJAJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=iGlPskvk; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=fjjjONFn; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="iGlPskvk";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="fjjjONFn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=1u6MV5pEreaJ3Zp0LOQoYtcsXVoVWQXeoKxrTT1DuSM=; t=1721720232; x=1722929832; 
	b=iGlPskvkyfzkn0gTrZky9Y7a7CA8t9/CiDeGZQv0gwRiQV3AxEV82EWfZdD+Iz0IE9z0mSFA/UU
	2/yR/3p70doTXqqu7FmPfO99rJWU6LGstLuwIXy57tp3lAGM98P82Yz1i4JZvvZVXvPms9ovOWbKB
	H1GTV37HmUte+4ZAh8w=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=1u6MV5pEreaJ3Zp0LOQoYtcsXVoVWQXeoKxrTT1DuSM=; t=1721720232; x=1722929832; 
	b=fjjjONFnk7gpL4VlojiVNwxx78vbcrWxPaQPnDE4mlolZmrHBrlESFQBxR+KVDa5swIMVW9QOMG
	Mqk+W1srwAQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1sWA57-000Xx7-1N
	for netfilter@vger.kernel.org;
	Tue, 23 Jul 2024 09:37:09 +0200
Date: Tue, 23 Jul 2024 09:37:07 +0200
From: Slavko <linux@slavino.sk>
To: "netfilter ML" <netfilter@vger.kernel.org>
Subject: Re: Sets update
Message-ID: <20240723093707.33723353@bonifac.skk>
In-Reply-To: <20240723092439.7b9f7b58@bonifac.skk>
References: <A1B9EF5A-1696-4A6D-B0D1-81DD32DC41C0@slavino.sk>
	<ba07a45c-7564-4b40-92de-ea698d16f49f@app.fastmail.com>
	<20240721132337.29d2fbc9@bonifac.skk>
	<4a9d6e4b-61e8-4aa6-ac50-8cbb9357e398@app.fastmail.com>
	<20240723092439.7b9f7b58@bonifac.skk>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAFVBMVEX7+/xrTUz4//3Ozc10AAH5/v3///8f7tJ8AAAB2UlEQVQ4jW2STY6EIBCFSwmumykPQDTtGqxO74kcgNiJa8dE7n+EAfzBtONCpD5eVfko8Pszeb+sflqOPVyA535abyB+9wnfwMgek/8XFEO33sE6lYWB/8HLqOUOFre87H+g9LK2P7y6p+o+1mJ1B75j1g7VeFeshTXifbfEza+goAqqLyAhAKsC+QahqVD9o74VYxGB6PUBJl+C5FwCUhEUSEpCM41PmGYJABK07oNk0EQQAw54K9KDGAQhl6C4ewDwJnZjjVZptQaD0PQSOqC4R2x0Btg76HwbI5oE1Rt4WUPhvG9cjAht+00SvlD5JThQQYiY2g6s3oBRzXMzgG1nKS2asDr+HPb0aSGmsiWwS9r4+rxP0M1tkgxQW/PzewF+pqPKgEV1cbdiCQxUB+AyaJzeq5AmfQG+IEwtDSTwIU8ArtBCtSKYpEg/lhNwFnwYGi2I3qRhPkGpYx5kmmBqtcrgg5hcUrxhqBicoNh6wnB11vaXP/8lkSYkeYaan4CJV7RQVtFm88jAxSlE8M85XonKgM91qBwtmnVt+1z86eI1+/3OMLc7tgbV5k1IhtndMnS/j6x3dAEciB/D7VuVwQI5Po9h1E7Au/kkq89gKt3ziMu1SuAPWe5Dq/EEywcAAAAASUVORK5CYII=
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jOj7iMCKN+IjUP9ZS_Tg8j4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jOj7iMCKN+IjUP9ZS_Tg8j4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ahoj,

D=C5=88a Tue, 23 Jul 2024 09:24:39 +0200 Slavko <linux@slavino.sk> nap=C3=
=ADsal:

> When i delete and create that set, i got "Out of memory" again, the
> set is defined as::

Strange, after several delete/add set the initial fill works on empty
set (with all three commands).

I am out of ideas...

regards

--=20
Slavko
https://www.slavino.sk

--Sig_/jOj7iMCKN+IjUP9ZS_Tg8j4
Content-Type: application/pgp-signature
Content-Description: Digitálny podpis OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEwhNakIB2F5/fdXmSAQVZxpJoYkcFAmafXaQACgkQAQVZxpJo
YkcPSQgApoZqVzhaUaS16avsdfnSkFWWuooLgfB8wQNC26nlk5qJshFqZIaDKlRA
xg0FREH3k9/QIOqKWecenLcT3SYsxSLRHu/PSJurM2GqoFRQ7NZwvtp/3tHorYva
pLK2jhYZca/CfXW482kZpKYRVH3gAN0i+i7/JRbIVtNHM8oggqJ8OMamHfTaQJcD
vJXzGzx3hXHmOtnxw3Bi+M66qoXRqt+j0uhprPXtm2oa4XUNQh0cY+d+bfdIs4Ja
My76+5PJK4wsGmGw7Qdpa+bCDUNO2iXAbR1yr1d3HkXlcVmM7Ergvk5wuvwsC7ej
abHWGUoObBmycVmuKHoVZsOMATlTYw==
=BzNZ
-----END PGP SIGNATURE-----

--Sig_/jOj7iMCKN+IjUP9ZS_Tg8j4--
