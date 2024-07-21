Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F30D4400
	for <netfilter@vger.kernel.org>; Sun, 21 Jul 2024 17:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721584725; cv=none; b=kC/ZIa+6LVYVYmf0TZg5tVgj+WUWN8+tTY8fsun73fzzx4mM23h3EEHlIMYt2J/N2megHXucFdkxgjlJR5KJsrhICgB7zbBNl/SJgGdcuKSpX9kgvPI6HclHKoXUEIyo1Lk3txo6OXoZmoVDzeRk5L2plVv5t26jzmr5pplyXIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721584725; c=relaxed/simple;
	bh=CAyRoRu4VWHMJ2dVI+B1ziOlM3VFTkp2cEDJw7cp5CM=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bfIBdDLEiefOA1AWvsnW5QTHy9i1bogZT8ikKQg3O6mg3FClvsg0gRBkBvSBzjdo7PCPCD4Aes6KiSnd+QP0e7OM502LqaU2jUsOdtuO1mQ27Baw14uo9dPDA3qNLgDeY4ZCvvnGA2YLPBseYn/BW7sS4JIxRmLkxouVX/whoWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=K/y6HBfO; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=h6JVwkhc; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="K/y6HBfO";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="h6JVwkhc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=K0a/sUNd7aWiip8vym20NqfjZRKrkrGI1ulUsD1+/M8=; t=1721584721; x=1722794321; 
	b=K/y6HBfO/Lsyr60QEyPnQdg0DmXFGa8TS+OSv2VJWOIgFi8okhG7oJr0iLnsdb5U8/jPOlTjgez
	JVFYWccWlSGHjpU/c5mGG/6A6wXFx9xmzrrHqC0GDTSekgxlYWxkkeX2yFBSkoXnxJ47LnPgFxZd+
	PSCwZTUDzvXu4rowg3M=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=K0a/sUNd7aWiip8vym20NqfjZRKrkrGI1ulUsD1+/M8=; t=1721584721; x=1722794321; 
	b=h6JVwkhcmkVHvRoegsjaqqSFCcqWRfEbMOsmO7U8ADVBgdpZBRfOtR6hAvOw8DL0/JQjLTudVMJ
	kKTw5/FDVAQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1sVapS-000Q4M-1j
	for netfilter@vger.kernel.org;
	Sun, 21 Jul 2024 19:58:38 +0200
Date: Sun, 21 Jul 2024 19:58:36 +0200
From: Slavko <linux@slavino.sk>
To: "netfilter ML" <netfilter@vger.kernel.org>
Subject: Re: Sets update
Message-ID: <20240721195836.340f65f1@bonifac.skk>
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
Content-Type: multipart/signed; boundary="Sig_/04tqrqE3r/uReEop6cXB3sW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/04tqrqE3r/uReEop6cXB3sW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

D=C5=88a Sun, 21 Jul 2024 10:58:30 +0100 "Kerin Millar" <kfm@plushkava.net>
nap=C3=ADsal:

> Mind you, it gets worse. While the nft utility supports a JSON output
> mode to ease parsing, its output is less accurate than the
> conventional output mode in so far as all "timeout" and "expires"
> values are truncated to integer seconds and conveyed as JSON integers.

Even worse, the JSON output lacks counters at all, the nft output:

    ...
    elements =3D { IP.AD.DR.ES last used never counter packets 0 bytes 0\
                     expires 1d23h36m40s340ms
    ...

But JSON output lacks counters:

    nft -j list set ... | jq '.nftables[] | select(.set !=3D null).set.elem=
[0]'
    { "elem": {
        "val": "IP.AD.DR.ES",
        "expires": 171653,
        "last": null
      }
    }

And yes, error messages are more than cryptic... We was talking about
memory usage, and my first attempt to add/update list of ~2700 items
ended with "Out of memory" error. First i was shocked, 2700 items
consumes 6GB RAM??? It took some time to realize, that i had duplicate
IPs in list. Really not helpful error message, and one element per line
doesn't help with that...

regards

--=20
Slavko
https://www.slavino.sk

--Sig_/04tqrqE3r/uReEop6cXB3sW
Content-Type: application/pgp-signature
Content-Description: Digitálny podpis OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEwhNakIB2F5/fdXmSAQVZxpJoYkcFAmadTEwACgkQAQVZxpJo
YkfOiAf/SuIa8ZEq4BYBzChAzMqTw7F94uuPFYSqmLRk7jz3XGFUKds6aEB7GbWt
/M/SWyzmhqGGD4QPOkYxxJULFU+1orXiPvgNX1GNLLWowinIPddbljwo7AEAQ7Od
qfFrPCJUMa6i//LIh1sYLG7icVLOMifY8oUzBl00Sbcwd7cNCsXhP0WezUndO8hd
J48dozk4oZdQPeVZDySK1hKkXJMMWr6jZ9RN6kOU0QbeHDjA1+1oLejt/Tg1jE8C
ZWJ8dlFe37dglkiTkRsYjC0YOSOOWCXJ4lwMPuojInW08Q24hISLSI5fi1i8J4kZ
BLmSmOrIXpKSRDQjz1e0pVjkgaNlFw==
=ndlX
-----END PGP SIGNATURE-----

--Sig_/04tqrqE3r/uReEop6cXB3sW--
