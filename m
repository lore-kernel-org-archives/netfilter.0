Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEF32F32
	for <netfilter@vger.kernel.org>; Sun, 25 May 2025 07:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748159509; cv=none; b=QDnD72l8+/8IPqcAdsacVguV2ze2fk8OV/lGuBQacL/3k4lyzfj1R8+2X4CYALFAfv5yEKJj4eM0UFucyLE7BGDdT42N7zlOkpKs8FxgZOA4dHCQSkabmErg21GlNn2JlRQRZN0NvKRkjSini0fS5cgQ8VKdv+4N8uBpHPZ29uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748159509; c=relaxed/simple;
	bh=EINlKqXeKUrErt/TwIASOBC+7tfM+GZQzW18b5jLuak=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iMUethNSBxbhX8jWvppnbKnCIk7Sau2xiG2eH46v36AaatuMJu06u/X3brd+r0+Kjp9EsI/3K6Wuity06JOsYx/JCfPpdSpLBTwG2KUgQtorfIv73aU3lEcjPdaHU/gNaeUGRl/+1KZ+E41v3s9hBJGWt5ttsQOGtKucRJZ7zTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=BxLcOwph; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=n4yM5Pyj; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="BxLcOwph";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="n4yM5Pyj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=ugrnd/8lnc89WzbQmO2PqCNLg9OSPFX53Ms8LCSuuP0=; t=1748159505; x=1749369105; 
	b=BxLcOwph2UTa3c3u+dVH+YS+TlED9FuUrhJI+CIm548YqFY1559hom3kUBgAEd6mE3zfMgZW3d6
	z7PcNdhXOxEZT6RZ2qCswqTfQGrA1k0RcWziffRqSGqReCvozYoez5MrRSEQ1qbOgX7IC6t3Llmif
	o3k9qowrkbIt9xLE52Q=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=ugrnd/8lnc89WzbQmO2PqCNLg9OSPFX53Ms8LCSuuP0=; t=1748159505; x=1749369105; 
	b=n4yM5Pyjs1VRN6L7Ph2v93Pi+CXDhzqaDtyE47M0hPqxD5m9FpyoKWstwocW2VQYPhsFKF8N73R
	NoK681oCxBg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1uJ68z-0006ie-2x
	for netfilter@vger.kernel.org;
	Sun, 25 May 2025 09:51:42 +0200
Date: Sun, 25 May 2025 09:51:40 +0200
From: Slavko <linux@slavino.sk>
To: Netfilter <netfilter@vger.kernel.org>
Subject: Re: Log ARP headers
Message-ID: <20250525095130.69477537@bonifac.skk>
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

Hi,

Dňa Mon, 3 Mar 2025 22:00:55 +0000 Jeremy Sowden <jeremy@azazel.net>
napísal:

> I'll look at this when I get a moment.

I seen series of patches, i seen some related debate about these
patches and i see some that some parts was pushed to git, then i lost
in it.

Please, is ARP logging working in 2.0.9?

-- 
Slavko
https://www.slavino.sk
