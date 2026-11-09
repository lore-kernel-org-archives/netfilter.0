Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.190.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219941;
	b=vhfnm6KrVsbkGY9BK3ur3YMFEbNUCkRoxtc9/YmeQJqjD0qbxOhPBS/XuNyfDG9gMtEd
	 meDYP0jSfAJEhe/VnCE157KJeedacFTS+9aA1G0mXxOPwKHYMHZ9rR/5uh3EMXuCun2Rt
	 bHFyJCU+xjRNieScWtxFJTVN3gi+33CbqnNgf1MUlofqHkyI/L4VbRaxn8gN9z0eUr4Z+
	 uayML0g3XsFOYg8FpH/oEb1oUISrL/ig3LSXdV42vbDVFkg90S9ui3yoYUBsShJgqA7Uj
	 qoYu3KoxLW0xWDtQbjdjpPuLQZSkc9aaNU62+On1om6Hwl5jq76WpxlL+A6aY7+Myng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219941;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Spam-Status:X-Spam-Checker-Version;
	bh=THZ3FZeaxDmQRkAdlttH8vZVZbyxymyU3JEnnZIjEg8=;
	b=VZ/1n8DeP7dPU0khkUE/7eMIKFCpI/SZBKMx405KJqxxovlClMnyGZNCzxrL2Qniwe/7
	 2XE74j+GNpPufi7WVZ6rkkzoTj7YTQNHt3unc9JDiA0rkSfWVoH+fxcbibjZmwwbj50di
	 8d37rUOfW7fHKIM+14MyGfodDxLCI0v8dbcuLe7xdPdVKaRnTVFsfOi1+6ApoThF5+UJM
	 BzxgExnkGUo6Zf4zaxHnkpJ8gHfKkH7AZowu5MaubillrkUhR2Yv68J8rFHIlO4tHTHDI
	 OIaQJNMxRhIiXj5vsmGionXHdzIRbTbZEzY6aKYVJqOtjC7IRn2YAZrLK6Wh1OPfXpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=netfilter.org;
	spf=pass smtp.mailfrom=netfilter.org;
	dkim=pass header.d=netfilter.org header.i=@netfilter.org header.a=rsa-sha256 header.s=2025 header.b=vEHNTvxB;
	arc=none smtp.remote-ip=217.70.190.124
Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id E7E4C606A325
	for <netfilter@vger.kernel.org>; Mon,  9 Nov 2026 10:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7E4C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.a=rsa-sha256 header.s=2025 header.b=vEHNTvxB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1794219937;
	bh=THZ3FZeaxDmQRkAdlttH8vZVZbyxymyU3JEnnZIjEg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vEHNTvxBXd9SLws8nYvfh0LLYyk9cVzNGjn2Y9uchNtkaTFM1hC7Js+DD8Htq/RLR
	 xmvNi3h7fuw2ppmNHA5W3e36sONxORyT+k0DG6ifeCwRejjMAOCxceBTEyp85kA+3W
	 cD7fV5BG4a4zLntPw3PxhsGTEfLMVPYW2tcm2yNa1FE4CjvY/QOzIi793T9KWdMbw6
	 weg70uebY1wzGO3k6xQJydKLIzx1fw37zAUQcAYXWJ9vCMwvKIHZp4955maiIaKQC2
	 ENDuV0cSH9UXVPkyhmtKYBuzYXpWen/0/MM4qazmlSWHfdTdIDZlQqcxTLEIwbgfsd
	 iOp4HkO4v8dWg==
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 2F74E60074;
	Mon,  9 Nov 2026 11:25:37 +0100 (CET)
Date: Mon, 9 Nov 2026 11:25:34 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: allfox wy <allfoxwy@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Subject: Re: [regression] Completely editing packet should be allowed.
Message-ID: <avGfnpl1U8oFlEZG@chamomile>
References: <CAPH4NY1-MSa07O_hgrEXqyPwcTQDPeO2Cf2uN2GjGQFgaQ+kHQ@mail.gmail.com>
 <au1gtHLku32CeSVC@strlen.de>
 <CAPH4NY1NhxqqEbf8Ky+AaA561a0x6fDB3cS27FbVizx9ybm21w@mail.gmail.com>
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:netfilter@vger.kernel.org>
List-Help: <mailto:netfilter+help@vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netfilter+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPH4NY1NhxqqEbf8Ky+AaA561a0x6fDB3cS27FbVizx9ybm21w@mail.gmail.com>

On Sat, Nov 07, 2026 at 04:04:49PM +0800, allfox wy wrote:
> Thank you for explanation. I did a test. It is indeed the protocol
> number change in homebrew causing the block.
> 
> However, calling nf_reset_ct(e->skb) would still result in packet
> being dropped. I didn't do a precise diagnose to find out where it got
> dropped. But replacing nf_reset_ct(e->skb) with "return true" would
> result in a working system.
> 
> My deduction: in the system's NAT table there is MASQUERADE in
> POSTROUTING. As my understanding, MASQUERADE requires CONNTRACK
> information to work. When the outgoing packet going through MANGLE
> table and got nf_reset_ct(e->skb), later MASQUERADE in NAT table might
> dropped it.
> 
> Is there a function that recalculate the CONNTRACK info rather than
> deleting it please?

That would entirely conntrack lookup.

I think your software should be doing this packet mangling from the
prerouting hook *before* the conntrack hook, so you have a chance to
create a conntrack object that really represents the flows after your
mangling.
