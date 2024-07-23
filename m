Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F3713C68A
	for <netfilter@vger.kernel.org>; Tue, 23 Jul 2024 07:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721719500; cv=none; b=U9h6g4K/iP20rwNa+jQb6sBySSEU5hHsksXMGjGy0pb0t1uifH7PyH421PaizmpJ8l+MBWiZOFh82Od3L7WTdj2isSMhKIGQRYMrrpcpj9Z1jl2h0yrKcV43VKA+u19txz44masZCOEkz39jA6fEkgeb0IBdjgfwF8s/tJO7nUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721719500; c=relaxed/simple;
	bh=0jG0vp+HiumE7YV2nlwIw3wjgDaMjXAVPinSMCuaRo8=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m/Ph6/MDSALjg9KdOeONZF5gllMjdnWPDSmg0I3lmSWSy8BpPNVStvEuafK6oXhDLZ6MDPKIgV2/rA0wyRVSV901z+iqhHYuYu/NKP0fpSbgHPkdFcxdYwcSe3Mjc3SmFvtoIgNoYWo+311tTWGLhWNELrMgWp+YpQSb6RmrGqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=ilp6mw+Q; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=oNdYElQe; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="ilp6mw+Q";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="oNdYElQe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=s75drrYx1OeXwMfVS0UuYbwURw3e/bWbpf9uQSg+Vho=; t=1721719495; x=1722929095; 
	b=ilp6mw+Q2xd6L2kGCy58omql2KlQ4gT5m+gNqDlREd3xy21P6XeQSuND0/f10eI3f0wf+a8CYIa
	dv4z5Zd61wJHCfM7bdWteoQh8NpQ80KG4KfBR0MoxVBW30LGzj1F1ml1qVo39tvAJeHZP1O8HmB8m
	bHI0DNup90QmkSyNIA0=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=s75drrYx1OeXwMfVS0UuYbwURw3e/bWbpf9uQSg+Vho=; t=1721719495; x=1722929095; 
	b=oNdYElQeY9dX+MD9flx66+TvH5LpH2weeu7pLs4Kt1/jJ494m5FNlZmYj2qRtc1+Lleis/NOnHq
	7q20D2nw9AQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1sW9t8-000XuB-06
	for netfilter@vger.kernel.org;
	Tue, 23 Jul 2024 09:24:46 +0200
Date: Tue, 23 Jul 2024 09:24:39 +0200
From: Slavko <linux@slavino.sk>
To: "netfilter ML" <netfilter@vger.kernel.org>
Subject: Re: Sets update
Message-ID: <20240723092439.7b9f7b58@bonifac.skk>
In-Reply-To: <4a9d6e4b-61e8-4aa6-ac50-8cbb9357e398@app.fastmail.com>
References: <A1B9EF5A-1696-4A6D-B0D1-81DD32DC41C0@slavino.sk>
	<ba07a45c-7564-4b40-92de-ea698d16f49f@app.fastmail.com>
	<20240721132337.29d2fbc9@bonifac.skk>
	<4a9d6e4b-61e8-4aa6-ac50-8cbb9357e398@app.fastmail.com>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAFVBMVEX7+/xrTUz4//3Ozc10AAH5/v3///8f7tJ8AAAB2UlEQVQ4jW2STY6EIBCFSwmumykPQDTtGqxO74kcgNiJa8dE7n+EAfzBtONCpD5eVfko8Pszeb+sflqOPVyA535abyB+9wnfwMgek/8XFEO33sE6lYWB/8HLqOUOFre87H+g9LK2P7y6p+o+1mJ1B75j1g7VeFeshTXifbfEza+goAqqLyAhAKsC+QahqVD9o74VYxGB6PUBJl+C5FwCUhEUSEpCM41PmGYJABK07oNk0EQQAw54K9KDGAQhl6C4ewDwJnZjjVZptQaD0PQSOqC4R2x0Btg76HwbI5oE1Rt4WUPhvG9cjAht+00SvlD5JThQQYiY2g6s3oBRzXMzgG1nKS2asDr+HPb0aSGmsiWwS9r4+rxP0M1tkgxQW/PzewF+pqPKgEV1cbdiCQxUB+AyaJzeq5AmfQG+IEwtDSTwIU8ArtBCtSKYpEg/lhNwFnwYGi2I3qRhPkGpYx5kmmBqtcrgg5hcUrxhqBicoNh6wnB11vaXP/8lkSYkeYaan4CJV7RQVtFm88jAxSlE8M85XonKgM91qBwtmnVt+1z86eI1+/3OMLc7tgbV5k1IhtndMnS/j6x3dAEciB/D7VuVwQI5Po9h1E7Au/kkq89gKt3ziMu1SuAPWe5Dq/EEywcAAAAASUVORK5CYII=
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0Zh9FncjZ_0DJJ6x/WicwR0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0Zh9FncjZ_0DJJ6x/WicwR0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

D=C5=88a Sun, 21 Jul 2024 13:29:44 +0100 "Kerin Millar" <kfm@plushkava.net>
nap=C3=ADsal:

> #!/bin/sh
> set -e
> tmpfile1=3D
> tmpfile2=3D
> trap 'rm -f -- "$tmpfile1" "$tmpfile2"' EXIT
> tmpfile1=3D$(mktemp)
> tmpfile2=3D$(mktemp)
> cat > "$tmpfile1"
> {
>    echo "delete element $* {"; sed 's/$/,/' "$tmpfile1"; echo "}"
>    echo "add    element $* {"; sed 's/$/,/' "$tmpfile1"; echo "}"
> } > "$tmpfile2"
> nft -f "$tmpfile2"

I play with that, i add one more "add" before "delete" and seems to
work, except after boot...

After boot the set is (obviously) empty, i try to fill it with something
as:

    curl -s https://my_local_URL | ./nft-addset.sh inet fw4 myset | nft -f-

But that fail with::

    /dev/stdin:1:1-2: Error: Could not process rule: Out of memory
    add    element inet fw4 myset {
    ^^

(The host has >6 GB of free RAM, the list has ~1700 items)

Initially i blame IP duplicates in downloaded list of IPs, but that was
unrelated to this error. When i remove the first "add" and "delete"
lines from script (thus just one "add"), it works. After initial fill it
works with all three commands (add+delete+add) on already filled set
and even when i flush that set, it still works. Only first fill (after
boot) ends with that error.

When i delete and create that set, i got "Out of memory" again, the set
is defined as::

    table inet fw4 {
	set myset {
		type ipv4_addr
		last counter
		timeout 2d
	}
    }

I tried to add "size" into it, but that doesn't help.

I roughly remember, that i read something about some memory limit in
container (i am not in container), but i am not able to find that
again to check if that is problem.

Please, what can cause that initial fill error, how i can debug/solve
it?

regards

--=20
Slavko
https://www.slavino.sk

--Sig_/0Zh9FncjZ_0DJJ6x/WicwR0
Content-Type: application/pgp-signature
Content-Description: Digitálny podpis OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEwhNakIB2F5/fdXmSAQVZxpJoYkcFAmafWrcACgkQAQVZxpJo
Ykffugf/WwKPuSiKluzIlm2PRgiH/5E5MmjS3zSSsguA4pBb3w2lPOmntAr8jpI1
MkmWurzGPdMxZa9NNOJawY/lXdXXamNIX9RQLCyBtKGbq1Ns54vKqk33GAOXTlUA
XJZ9WcYVTYpzoT5r2GzgjJmXIXVqZMFMmRtvZfZDSKzL9u1CABHZ8HWChUG2Q8o7
41udcZwOkOB3JWUn8u9C025sFWn8apLjrJb/3puuD6dhiJwEPiigW1UL3brZjUVY
Rh8G7gpXXbl0pe3wqxcpIboPvO0cgPEx0ETpzb9iN6O3cvBfg/BsJ/zRp0UcT/EI
AVs5oIXoRr/gxvD08Kb/JTTZ/c7Ssg==
=pRvA
-----END PGP SIGNATURE-----

--Sig_/0Zh9FncjZ_0DJJ6x/WicwR0--
