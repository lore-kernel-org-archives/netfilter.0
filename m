Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775A343E9F4
	for <netfilter@vger.kernel.org>; Mon, 20 Jul 2026 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784571573; cv=none; b=s/y3D5FzL2CbP33XZR3hwl6xthzXcQxwkw8U3Vu+VZYdb4uKD4wcBTyewbE98m3A7dogNC2AWUxukCKsJYCxJ8HxjjxLsEyrJbTlBgGs8L989mOq2VShMwvdla2dmBINDrvyT3VJzMj7DTpALpzlBfzklqG1cMwN5QTUjYJ5+Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784571573; c=relaxed/simple;
	bh=2QrVPuiA2Je67prmbCObrOkX944i31KDlZAOm34EN3w=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bPxZ1XY7EXNq1nXrZEoMks/GU5Yf9OSBKbSKj7TQekRToKNVPYjjPp13WogH4y6qD4PvM/5gFpbrEGvwZrCCIv28jeI5FSVi4vj5i9eCNOUJLZTWtcosFg27iwoXCCfO4YwNkHLB9LHh8bezxGr+/Ms0eJ6mkW0vjMichWbRhPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=nFOtFyVq; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=BWkT26sn; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="nFOtFyVq";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="BWkT26sn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:To:From:Date:From:To:Cc:Reply-To:Subject:Date:
	Sender:Content-ID; bh=SpXO+QGiCUNDstQCs5QKh+svRrOnoSxs6josXHS2Dkk=;
	t=1784571570; x=1785781170; b=nFOtFyVqZ/Mw9e2mvmP0Z1FQM2Put3DTp7roNwJ4etHcQHy
	BeLZnjMv76bLECw/Yk2FhOQf5FSD81oU2YCroiPCclZDV2u0fAVcIzVDjByvlRSqevT4+SKV0e1C7
	Sy0AsoVaWLY7yTfcVD/I4Zf2x+JmElRLQQDTVBqgRPUeMrM=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:To:From:Date:From:To:Cc:Reply-To:
	Subject:Date:Sender:Content-ID;
	bh=SpXO+QGiCUNDstQCs5QKh+svRrOnoSxs6josXHS2Dkk=; t=1784571570; x=1785781170; 
	b=BWkT26snA0WvK2Sw/W5FbMEyRq27TShEeo5ZT17C1foblQbJzHdsJrGPrQZMNZaGMReXL7oho9S
	5TSWCx2AYCA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1wlsUs-0008cK-1f
	for netfilter@vger.kernel.org;
	Mon, 20 Jul 2026 20:13:46 +0200
Date: Mon, 20 Jul 2026 20:13:45 +0200
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: Re: Bot protection on RSS feed for git.netfilter.org
Message-ID: <20260720201345.51e926cf@bonifac.skk>
In-Reply-To: <178456987406.6.15350942097428291948.1495131021@simplelogin.com>
References: <178456987406.6.15350942097428291948.1495131021@simplelogin.com>
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

Dňa Mon, 20 Jul 2026 17:51:05 +0000 netfilter.btvdk@simplelogin.com
napísal:

> I'm no RSS expert, but aren't feeds meant to be read by feed readers
> (bots)? How could the feed work if it's behind bot protection? Is my
> client expected to solve whatever challenge Anubis is posing? Does
> that not defeat the purpose of the bot protection?

curl works here:

curl -i 'https://git.netfilter.org/iptables/atom/?h=master'
Date: Mon, 20 Jul 2026 18:08:39 GMT
Server: Apache
Content-Type: text/xml; charset=utf-8
Expires: Mon, 20 Jul 2026 18:13:26 GMT
Last-Modified: Mon, 20 Jul 2026 18:08:26 GMT
Vary: Accept-Encoding
Transfer-Encoding: chunked
...

Are you sure, that you do not impersonate (fake) real browser? When i
set Firefox's User-Agent header, i hit anubis:

curl -iA "Mozilla/5.0 (X11; Linux x86_64; rv:125.0) Gecko/20100101 Firefox/125.0" ...
HTTP/1.1 200 OK Date: Mon, 20 Jul 2026 18:11:53 GMT
Server: Apache
Cache-Control: no-store
Content-Type: text/html; charset=utf-8
Set-Cookie: techaro.lol-anubis-auth=; Path=/; Expires=Mon, 20 Jul 2026
18:10:53 GMT; Max-Age=0; Secure; SameSite=None Set-Cookie:
techaro.lol-anubis-cookie-verification=019f80ba-316b-7dae-a172-50fdeecbc5ba;
Path=/; Expires=Mon, 20 Jul 2026 18:41:53 GMT; Secure; SameSite=None
Vary: Accept-Encoding Content-Length: 4469

regards

-- 
Slavko
https://www.slavino.sk
