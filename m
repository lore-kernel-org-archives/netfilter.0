Received: from mail.sdinet.de (hydra.sdinet.de [136.243.3.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0506B86126
	for <netfilter@vger.kernel.org>; Tue, 30 Apr 2024 23:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.243.3.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714518810; cv=none; b=lM7rGfwDq2d4QavA06eSdpChiOulzz2qFlR34GQ4WTtVTFDU7WyzHoKHTMvXOUAsbCYVe8P6Hp3QN+9dO96+OuEdVhLblNKB6ZG96fFfDwjO42JeWYMC3/wNXxDincwxyId02ZtMmcnLrZSa+5r8R+a5Ptqs8pdhkfwl9ufZGXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714518810; c=relaxed/simple;
	bh=86PkV1mn2DYdkJoYO+j2loIc2zvhlDXe3DqZdJAhBGo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nla4RKmn14AWOBVqnsw1qN/RUT2CzOfVZiK5PgXOqKrh/Qa9HiX2e0mFLiJZT/HuzWDx+rG/tMizZn4pjZb/l/Oqfik4HgSFZ7YHcNfoQE+tc2FRYDW1DwyH9VQ4CtBO2V085SXiuHxi6X9KLoEUR6B50WHfUfdwlKRkhaM+Gb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sdinet.de; spf=pass smtp.mailfrom=sdinet.de; dkim=pass (4096-bit key) header.d=sdinet.de header.i=@sdinet.de header.b=Zu7PrU6W; arc=none smtp.client-ip=136.243.3.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sdinet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdinet.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=sdinet.de header.i=@sdinet.de header.b="Zu7PrU6W"
Received: from aurora64.sdinet.de (aurora64.sdinet.de [193.103.159.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: haegar)
	by mail.sdinet.de (bofa-smtpd) with ESMTPSA id 963F634003A;
	Wed,  1 May 2024 01:03:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdinet.de; s=mail2024;
	t=1714518195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WrqYAh+XwRsRG/2VpIcWLmDZoxL8K1feCzaHK+LI1vc=;
	b=Zu7PrU6Wt4G8vkdCu3CiaFUWUv88SNZ2NlOOVPQbZBTbDM5gYRLAosRzWX6ftGpFJA2qDg
	caGADGGPxneDzif5CdSzAWXQJA3vLmYpRBN0YGBp/zbi1U/3Z02mU1yCBVbMi2XSPW52El
	al4AAZ6RGLHsgY2bLsziNK332ajN/xhRST5n8dIU0zZczDpVofc8AYnvrLS00n8UB07mWa
	Gq3nbiLSWE9Lgsrf5SoAbnxkHUKAOgM+NewXdQwPQWNjRS6b0wFzAKHNLNR1EJ0h4cANMF
	v+Cyj1Pfe1i8RRjlvU8jeIYf5PpU7oVIo7ZdcdCHLccrtUQrGAACTYEccqks/uo5tZcgZn
	q/eUzK7vBmfmz/6JNPwjqXbfgl1StwTh37Uef4Da1KY/qDjmFXwPHj0xus9YQUgF6I2dZv
	XEfLYMfihIEu1LPIoA4px4ZBMlLKsuVAbJFhxK8HBk8fNQxAIpnC22QKDzX/kY1AoYtjM1
	2zUjd6ZHP1qkUfk3KV6LNSBBqGVBAztj5l8IXFnbGV13FoHZwNtfAMzL4Q65yT5aUaxrui
	h8bP68Kmr6W/D8dI+zwYeEXR/tWYWBvPWgmVnBrLFTF4yeFF/8jbT3+dlAsjiWIK0Kv3DS
	yKn3qGv2QJPdRtCIwT5ZicGnsPI1lMPr+Ilue3u8kd0tj4Ca7WV9o=
Date: Wed, 1 May 2024 01:03:28 +0200 (CEST)
From: Sven-Haegar Koch <haegar@sdinet.de>
To: imnozi@gmail.com
cc: netfilter@vger.kernel.org
Subject: Re: IPv4 NAT and lo, and iptables
In-Reply-To: <20240430182200.39ac9ea1@playground>
Message-ID: <184bed16-17ab-d6ee-992b-2e094b639016@sdinet.de>
References: <20240430182200.39ac9ea1@playground>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, imnozi@gmail.com wrote:

> Questions:
>   - Is lo ignored in PREROUTING?
>   - Is it possible to DNAT local traffic on FW_A (changing) the public IP to
>     the private IP on LAN_2?
>   - Would I specify '-i lo' in mangle:PREROUTING and nat:PREROUTING (as I do
>     for the real NICs)?
> 
> The uber questions are:
>   - Should I be able to DNAT and SNAT traffic on lo just as I can on other
>     LANs, or do I need to take extra steps?

Locally generated traffic does not pass nat PREROUTING chain - you need 
to add matching DNAT rules to the nat OUTPUT chain if you want dnat 
rewriting applied to it.

And similar traffic targetting the local system (after DNAT) does not 
pass POSTROUTING, if you want such traffic SNAT'ed you need to use the 
nat INPUT chain.

>   - Is this a known oddity? or was it known back around Linux 3.16 and
>     iptables 1.6? (Don't ask; sometimes we're stuck in a place we don't
>     want to be.)

c'ya
sven-haegar

-- 
Three may keep a secret, if two of them are dead.
- Ben F.
