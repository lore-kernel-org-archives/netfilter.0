Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855501CD1F
	for <netfilter@vger.kernel.org>; Sat,  5 Apr 2025 10:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743847357; cv=none; b=SKNnxjpchwG9wKTBDC0bmIDv0NSdMmPt2Yc+EEqO826wKfq+2zA2oFnOXUp4FXwOwEv7PHlJatz//bss4mZuzPwN6S2FUeQftcUR1PRk9cNApcYoe0ocP4iPVLLMnnECRV2OTWUpmFcZfWkDDYRWrkCxAiRNgc2LI72soj8Sx0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743847357; c=relaxed/simple;
	bh=hW+NvbGvqdh5Nj3+suYvwJoawJDyOE2LJU7iKprm3cE=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aqx3QaMyWrvFq6mDkBhCC9sITf/xw7EiQl78IQyZBR0qUZFOqOT19gZ9F+9NQqbS1pCz0IkCJbnNpfKrQqRz+zTA4hUAd4fQRn0707ZnXnwdfTZ08A5qt1YO2NIEF8fOx2dehwS76OEpWl1ry9YB1yEsB7D5n3alYb57X5SyW5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=j7zXEdR7; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=zS8bxBQ0; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="j7zXEdR7";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="zS8bxBQ0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=HlRihdRibqd2Q/ciupr822sgLW2tISaFYc61ICSqeV8=; t=1743847352; x=1745056952; 
	b=j7zXEdR7lnr5y4nZZN10FSXJRNNcozMw4BYXEMQfqDn4wIvy7Tclg6+JuBsUMSbTBcQ2bLEdACo
	zwJSK35nZzSzyyKsBDmgVs+k2vI6LoYXNY7LJdGFoFsws6fLgBj5ehXgfXYt7tXwfPYnKeCFRcX2Q
	gWB9t0ervJ7n5GxiK+k=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=HlRihdRibqd2Q/ciupr822sgLW2tISaFYc61ICSqeV8=; t=1743847352; x=1745056952; 
	b=zS8bxBQ0az423rppxbBv/Uy0tEXDcMYoAjL+TjfXjfu7teVXTnyTmPlBz/kwGC1Y8X24RreoLtQ
	+MYyVOCjpDQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1u10Eg-001i3n-2s
	for netfilter@vger.kernel.org;
	Sat, 05 Apr 2025 11:54:47 +0200
Date: Sat, 5 Apr 2025 11:54:45 +0200
From: Slavko <linux@slavino.sk>
To: Netfilter <netfilter@vger.kernel.org>
Subject: Re: Log ARP headers
Message-ID: <20250405115436.7b67e491@bonifac.skk>
In-Reply-To: <20250303220055.GA4034310@celephais.dreamlands>
References: <FADC1D05-BC58-45CF-AEBA-2D4B85928185@slavino.sk>
	<20250303193533.GA16225@breakpoint.cc>
	<88D0D02C-9C84-428F-B62B-EBA5E359D325@slavino.sk>
	<20250303220055.GA4034310@celephais.dreamlands>
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

Dňa Mon, 3 Mar 2025 22:00:55 +0000 Jeremy Sowden <jeremy@azazel.net>
napísal:

> > I understand this change, but i cannot see all consequence,
> >
> > Any chance that it will go to ulogd itself? Or i have to maintain
> > this patch locally only? (I mean for future versions)  
> 
> I'll look at this when I get a moment.

Please, any progress in this?

-- 
Slavko
https://www.slavino.sk
