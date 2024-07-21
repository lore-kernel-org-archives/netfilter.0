Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123D9441D
	for <netfilter@vger.kernel.org>; Sun, 21 Jul 2024 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721561026; cv=none; b=GArrcofgis5zhbI8qrf7xC1NtLvEtlv7xdU1rPjNKmM1qEDFPpFvuo2N3QGr+yIG7kRZxwO+Jh+oL4Ms9OV84QM3xxctw7B886O2kZ4TI/WnRW7wUXUZr60oi1Y0IrtS6NsIkWs9hc0dv8a1zXn5AVFwT4vidQpTBPaMhBjrbkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721561026; c=relaxed/simple;
	bh=vfz+LGwW8izc1Gei5c3kS3oPTTNdiA3EIuBRIM4WGz8=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gyh6Q2XK66dYZGRy6VlDJ20j8t8VJIiWi8MN6n+Z/ueXBQimFkhUKlBmnnKnmMRl2vdjbo6zsdPOCgJ1Snkf24Bq3pvO9t2v3+Cbj82tXs5c1X4Pk2PLwoSKnvSL2QrvXGROiROsn9Ph8/ZCRVK0cNZg2+IUGmQGvAnOF0ZePCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=j1XDKSSW; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=iWcMIFT/; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="j1XDKSSW";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="iWcMIFT/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=pmlTIwr99ZggrXfk9NS3Dxke1l1e3i7dm/5fVObLGwA=; t=1721561023; x=1722770623; 
	b=j1XDKSSWsaV2zL/7GflWVQ9JmdF2S188UEbx8GbQjSL3sCHtzExDudS+fRA474LmS7IqqNgpyah
	4n2AnP6361yM+GxjeA615NmFVdpICPplZO74IpJ//l7U6aktuzdKYQOWmjW8SqHFPaz3g9SJuKio4
	ayuJSjWJH2CHjKhQn0c=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=pmlTIwr99ZggrXfk9NS3Dxke1l1e3i7dm/5fVObLGwA=; t=1721561023; x=1722770623; 
	b=iWcMIFT//EgrfRnDxxca06PGGnItMN9qad99vV/VUpwms2rxbpzPrS0Ak/ecb6WdcVZvuWYV5Vv
	TNoBqoT8pBw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1sVUfE-000OOn-04
	for netfilter@vger.kernel.org;
	Sun, 21 Jul 2024 13:23:40 +0200
Date: Sun, 21 Jul 2024 13:23:37 +0200
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: Sets update
Message-ID: <20240721132337.29d2fbc9@bonifac.skk>
In-Reply-To: <ba07a45c-7564-4b40-92de-ea698d16f49f@app.fastmail.com>
References: <A1B9EF5A-1696-4A6D-B0D1-81DD32DC41C0@slavino.sk>
	<ba07a45c-7564-4b40-92de-ea698d16f49f@app.fastmail.com>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAFVBMVEX7+/xrTUz4//3Ozc10AAH5/v3///8f7tJ8AAAB2UlEQVQ4jW2STY6EIBCFSwmumykPQDTtGqxO74kcgNiJa8dE7n+EAfzBtONCpD5eVfko8Pszeb+sflqOPVyA535abyB+9wnfwMgek/8XFEO33sE6lYWB/8HLqOUOFre87H+g9LK2P7y6p+o+1mJ1B75j1g7VeFeshTXifbfEza+goAqqLyAhAKsC+QahqVD9o74VYxGB6PUBJl+C5FwCUhEUSEpCM41PmGYJABK07oNk0EQQAw54K9KDGAQhl6C4ewDwJnZjjVZptQaD0PQSOqC4R2x0Btg76HwbI5oE1Rt4WUPhvG9cjAht+00SvlD5JThQQYiY2g6s3oBRzXMzgG1nKS2asDr+HPb0aSGmsiWwS9r4+rxP0M1tkgxQW/PzewF+pqPKgEV1cbdiCQxUB+AyaJzeq5AmfQG+IEwtDSTwIU8ArtBCtSKYpEg/lhNwFnwYGi2I3qRhPkGpYx5kmmBqtcrgg5hcUrxhqBicoNh6wnB11vaXP/8lkSYkeYaan4CJV7RQVtFm88jAxSlE8M85XonKgM91qBwtmnVt+1z86eI1+/3OMLc7tgbV5k1IhtndMnS/j6x3dAEciB/D7VuVwQI5Po9h1E7Au/kkq89gKt3ziMu1SuAPWe5Dq/EEywcAAAAASUVORK5CYII=
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jGCbjZm=k9A9dZ3SngCt5f9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jGCbjZm=k9A9dZ3SngCt5f9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

D=C5=88a Sun, 21 Jul 2024 10:58:30 +0100 "Kerin Millar" <kfm@plushkava.net>
nap=C3=ADsal:

> Firstly, you should not use "delete element". It will never be

I am aware of this, but AFAIK the "destroy" is available from kernel 6.3
and i am on 5.15, thus i am out of luck. With any luck, the timeout will
not happen during update (due timeout value and set update interval),
thus in my case it can work reliable.

> Secondly, though you could handle each element one by one, I would
> not recommend it.

OK, i was in doubt.

> Yes, grouping elements in this way is sensible. Note that there is no
> need to worry about the ARG_MAX constraint because nft is being made
> to read from the standard input rather than use the -c option.

I hope in that, don't worry about -c option, i can understand the point
of answer ;-)

> However, I would suggest generating one element per line because the
> way in which nft reports errors is atrocious in the case of long
> lines.

Of course, it was simplified example in mail... Beside of nft errors,
it is more readable in any case...

> {
>    echo "add element ... {"
>    sed 's/$/,/'
>    echo "}"
> } | nft -f -

Eh, that looks really nice (simple), but IMO it is good for (nonexistent
yet) update command. As one needs any IP twice/thrice, thus list must be
read into memory in script, or i miss something?

> add element ... { <existing-ip> timeout <new-timeout> }
> add element ... { <existing-ip> expires <new-timeout> }

In case of existing IP i understand the "add element" as noop (does
nothing) command, thus this is IMO expected.

> I doubt it. Perhaps we need a new "update element" command to act
> similarly to the set statement bearing the same name.

Yes, and while it is possible to update timeout from packet path, it is
surprising, that it is impossible from command line, the code itself
must exists, just user interface is missing?

> Mind you, it gets worse. While the nft utility supports a JSON output
> mode to ease parsing, its output is less accurate than the
> conventional output mode in so far as all "timeout" and "expires"
> values are truncated to integer seconds and conveyed as JSON integers.

I am fain with that timeout precision, mostly because i am not
interested on per element timeouts :-D

I start to play with jq in shell for that, it seems as possible, but
that is in only on my "playing" machine, where i use nftables already.

I am curios why is not possible to directly use ipsets from nftables.
Yes, the nftables's sets are powerful and becomes better, but still are
not direct replacement of ipsets in some cases. Perhaps someone
competent can provide answer (other than "nobody coded it").

regards

--=20
Slavko
https://www.slavino.sk

--Sig_/jGCbjZm=k9A9dZ3SngCt5f9
Content-Type: application/pgp-signature
Content-Description: Digitálny podpis OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEwhNakIB2F5/fdXmSAQVZxpJoYkcFAmac77oACgkQAQVZxpJo
YkfCuQgAkVuAuNoa6M56Ibs+kKp3c8Ai2I0i9YSiocIbdmuvgwah3OEJzO+61Jh+
uqIxcf8bxASTdLD76c/Yru7m0g+FUyAR3G8RdlgvFqcUAc6IPImhEEDxP8T96f4w
YiT40OjRTby3V9BppDcvLAIkaLr3PMglvgUKE6UlOEWnbAgD+dzzQNq4Z4X33dA8
19DemHrj5TNDJbzfZwyDXGKC7oX+VIUnGmwNXUWj6pZCRYMmZpmM1q3/Y2tcbxOA
ZUv3fpl95PyyU74mJ6rjgWR2VgAQR8zegeQ6NR3vPXuc8x7pulNl385zCDZQTRdj
H2LRCM55NUAlfy5P3grW6F8+atP1AA==
=WNjt
-----END PGP SIGNATURE-----

--Sig_/jGCbjZm=k9A9dZ3SngCt5f9--
