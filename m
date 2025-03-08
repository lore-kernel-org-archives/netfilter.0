Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B5D1AF0C5
	for <netfilter@vger.kernel.org>; Sat,  8 Mar 2025 11:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741433575; cv=none; b=u/47iDrVUxMMxa4/HMaYxNJv6FcQ18R/nGDoa46QLvgtR3mbR02+dIk7PtNBaxGS3EtyJ/cNd7Q5dJubHaE/52r4tVyrXRgwXZqEEFZ27mT/ZiqjRyipCzIdCpFqprgUvqcE7T+qDrPeTHT2g+Dy/R5dQbm/njp7PMKsKlRQuGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741433575; c=relaxed/simple;
	bh=SoiM2+TjvZU9sewN0ihoB2yZNxYr4fbMTsOLRT+8P5E=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UxHZ8X5zuR8NwzhDMMd+tuOFd6eHLBAz5CfmfaNfQyVoAYbSmm98e39tw45nqVOhvGiSbIdoO+7fM8R7lY/T6EJBXRvkjmNo/M2vgh5Nktz0ANigOjPxHweigaPpFnb7wwEknDrmpLwWHfGVNkkCzLaSl8BMkDl46JLFXYAYzWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=bAHL1/gG; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=vI4n+8Hc; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="bAHL1/gG";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="vI4n+8Hc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=7FO50oGx/6YJ34n+AQMxRUTYnKF3hcZO63JNkDUGSGI=; t=1741433571; x=1742643171; 
	b=bAHL1/gGITBr0dMQeKqEyoG3Z3izaelGS/3kSnICDvaoIlyCE+b7clfjoDLaBjpv8bn82R0Pji3
	vM9IzvWMvE1a3sBkLOfaqoHHu5pUWIjD+ylwyX2g/eqBrtW9bIsL6EheWwVyu1xj0hsUAVHO3xDEK
	fqJhCsgjKqAh18xxTv8=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=7FO50oGx/6YJ34n+AQMxRUTYnKF3hcZO63JNkDUGSGI=; t=1741433571; x=1742643171; 
	b=vI4n+8HcE/WWJUOdy6jny29Yc11zXR7OhE+sBfLKhLzArBAPMOViiSEwmoyIv0vaHaZHzv+SXsz
	mLsNNANyyBA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tqsQC-002Kiv-1n
	for netfilter@vger.kernel.org;
	Sat, 08 Mar 2025 12:32:48 +0100
Date: Sat, 8 Mar 2025 12:32:47 +0100
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: Re: ulogd2, sqlite3 and negative TCP Seq numbers
Message-ID: <20250308123247.0bed888e@bonifac.skk>
In-Reply-To: <20250308204559.178294db@gnosticus>
References: <20250308111405.441477a1@bonifac.skk>
	<20250308204559.178294db@gnosticus>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAFVBMVEX7+/xrTUz4//3Ozc10AAH5/v3///8f7tJ8AAAB2UlEQVQ4jW2STY6EIBCFSwmumykPQDTtGqxO74kcgNiJa8dE7n+EAfzBtONCpD5eVfko8Pszeb+sflqOPVyA535abyB+9wnfwMgek/8XFEO33sE6lYWB/8HLqOUOFre87H+g9LK2P7y6p+o+1mJ1B75j1g7VeFeshTXifbfEza+goAqqLyAhAKsC+QahqVD9o74VYxGB6PUBJl+C5FwCUhEUSEpCM41PmGYJABK07oNk0EQQAw54K9KDGAQhl6C4ewDwJnZjjVZptQaD0PQSOqC4R2x0Btg76HwbI5oE1Rt4WUPhvG9cjAht+00SvlD5JThQQYiY2g6s3oBRzXMzgG1nKS2asDr+HPb0aSGmsiWwS9r4+rxP0M1tkgxQW/PzewF+pqPKgEV1cbdiCQxUB+AyaJzeq5AmfQG+IEwtDSTwIU8ArtBCtSKYpEg/lhNwFnwYGi2I3qRhPkGpYx5kmmBqtcrgg5hcUrxhqBicoNh6wnB11vaXP/8lkSYkeYaan4CJV7RQVtFm88jAxSlE8M85XonKgM91qBwtmnVt+1z86eI1+/3OMLc7tgbV5k1IhtndMnS/j6x3dAEciB/D7VuVwQI5Po9h1E7Au/kkq89gKt3ziMu1SuAPWe5Dq/EEywcAAAAASUVORK5CYII=
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ahoj,

Dňa Sat, 8 Mar 2025 20:45:59 +1000 Adam Nielsen <a.nielsen@shikadi.net>
napísal:

> If I run this in bash:
> 
>   $ echo $[0x100000000 - 3489577139]
>   805390157
> 
> It gives me the same number you get in SQLite.  This means you are
> taking a number that needs 32-bits, and storing it in a place that
> only has 31 bits for storage.  It is probably a signed 32-bit
> integer, which has 1 bit for sign and 31 bits for the number.

OK, that my initial feel, that it has something with signed/unsigned,
numbers was correct. Interesting is, that i tried almost the same
calculation (2^32 - X) with bc, but i must did something wrong (or
typo), now i get the same result as you... Initial investigation i did
yesterday at night, i my eyes was really tired.

> A quick Google suggests SQLite does this automatically.

Yes, that is how i understand the SQLite's INT field -- up to 2^63
positive value, and all other *INT (SMALLINT, BIGINT, etc)
definitions are just for readability of schema, more or less aliases
for INT... IMO the same (more or less) applies to UNSIGNED definition.

> This means SQLite or your schema is not at fault, but rather whatever
> is handling the number before generating the SQL is using integers
> that are too small (or are incorrectly signed).

Eh, get all (wanted) fields from source/ulogd -i output is not very easy
task, in mean that is is huge amount of fields, thus prone to mistake.
Thank for confirmation, that schema is OK (at least in this case).

> Possibly it is something calling printf() and passing %ld instead of
> %lu for that field.

I don't know, if ulogd2 does some decision based on SQLite's field type,
or takes into account field's name only...

I see in sources (ulogd_output_SQLITE3.c), eg. the ULOGD_RET_INT32 and
its ULOGD_RET_UINT32 counterpart, but i don't see that counterpart for
ULOGD_RET_INT64. For me, it is hard to say if that is important...

regards

-- 
Slavko
https://www.slavino.sk
