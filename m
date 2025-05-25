Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287D3FC1D
	for <netfilter@vger.kernel.org>; Sun, 25 May 2025 07:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748159689; cv=none; b=pGVI8TCcQTw/5cynJcxNLvBQcCi3uFLyZPv44aHz4rGqVB3dFuwlOanqPzACiwlmR7FYbAfQyWUEnhGsaHXTzGVnQAZ42xI37du8r9opc10+U+wLmd3Q3C0Gc2jLU9jRdj88eWTW9oKZmrXLNKUbVBzwAgxRPkSrUl7a+Uowz6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748159689; c=relaxed/simple;
	bh=AtLCNJQxVdMpC5HPFAfv1UguvA4fwswitNKBeYoGywM=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QinLUp8gj1PxTyQ1XlKgH7bCBsER2tPIyoJHSDXE3ljp0UuWy+prvF6nn4H/dfu0V60f1/n7cQAk1Y/P0+J50bNpqNnl5P3C4TgBDu+3J3ErxCga7MQjO6V9hR/0ozNut0pTR4D9qsVV5/BqsrhccbXdbCmhma9TuzH/Qn9Bw7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=AIXJbZZq; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=f1lRdEZA; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="AIXJbZZq";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="f1lRdEZA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=yJ6lTLWxXr2HgV2nElaUGtHHs3VlflP22qvcqn9d078=; t=1748159687; x=1749369287; 
	b=AIXJbZZqWWbyNZ4L8vhFTeJQ74a4r5liDZp2Oco3QpZteSk/z7yarDbe8/sLrhibyS0BaAQVdJW
	fyElLiOEHR2Jo58l9E5o+g+f+BRKHI0hrCvCmWzfpxFkuo3hDbeU0jlVIaSxNCdVOa0drP1cK8gnk
	n6vI2aVyzQ2SofEItB4=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=yJ6lTLWxXr2HgV2nElaUGtHHs3VlflP22qvcqn9d078=; t=1748159687; x=1749369287; 
	b=f1lRdEZALZsonKqBf4ewFc7/phDRVmKd5WpI0/p3igykAyaXhvwlhmvFUWRaDzurd/E09VbcGzG
	pMDlhkl32Cg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1uJ65G-0006hh-0h
	for netfilter@vger.kernel.org;
	Sun, 25 May 2025 09:47:50 +0200
Date: Sun, 25 May 2025 09:47:48 +0200
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: Re: ulogd2, sqlite3 and negative TCP Seq numbers
Message-ID: <20250525094748.61f2d76e@bonifac.skk>
In-Reply-To: <20250308111405.441477a1@bonifac.skk>
References: <20250308111405.441477a1@bonifac.skk>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAFVBMVEX7+/xrTUz4//3Ozc10AAH5/v3///8f7tJ8AAAB2UlEQVQ4jW2STY6EIBCFSwmumykPQDTtGqxO74kcgNiJa8dE7n+EAfzBtONCpD5eVfko8Pszeb+sflqOPVyA535abyB+9wnfwMgek/8XFEO33sE6lYWB/8HLqOUOFre87H+g9LK2P7y6p+o+1mJ1B75j1g7VeFeshTXifbfEza+goAqqLyAhAKsC+QahqVD9o74VYxGB6PUBJl+C5FwCUhEUSEpCM41PmGYJABK07oNk0EQQAw54K9KDGAQhl6C4ewDwJnZjjVZptQaD0PQSOqC4R2x0Btg76HwbI5oE1Rt4WUPhvG9cjAht+00SvlD5JThQQYiY2g6s3oBRzXMzgG1nKS2asDr+HPb0aSGmsiWwS9r4+rxP0M1tkgxQW/PzewF+pqPKgEV1cbdiCQxUB+AyaJzeq5AmfQG+IEwtDSTwIU8ArtBCtSKYpEg/lhNwFnwYGi2I3qRhPkGpYx5kmmBqtcrgg5hcUrxhqBicoNh6wnB11vaXP/8lkSYkeYaan4CJV7RQVtFm88jAxSlE8M85XonKgM91qBwtmnVt+1z86eI1+/3OMLc7tgbV5k1IhtndMnS/j6x3dAEciB/D7VuVwQI5Po9h1E7Au/kkq89gKt3ziMu1SuAPWe5Dq/EEywcAAAAASUVORK5CYII=
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Dňa Sat, 8 Mar 2025 11:14:05 +0100 Slavko <linux@slavino.sk> napísal:

> i noticed negative sequence numbers in DB, eg.:
> 
>     dt                   ip_saddr_str   tcp_seq    
>     -------------------  -------------  -----------
>     2025-03-08 08:14:56  47.83.121.132  -1689958912
> 
> As i log the same packet to file too, it is logged as:
> 
>     Mar  8 08:14:56 ... SRC=47.83.121.132 ... SEQ=2605008384 ...
> 

I found in 2.0.9 changelog:

    sqlite3: correct binding of ipv4 addresses and 64-bit integers

please, does it means, that this problem is solved in 2.09?

regards

-- 
Slavko
https://www.slavino.sk
