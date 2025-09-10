Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2014E262FC2
	for <netfilter@vger.kernel.org>; Wed, 10 Sep 2025 18:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757528220; cv=none; b=qCfLcrH/DPGtBagiSM4mqN1DZvRHPpqmhOaFPyiZS4tQOw1IDtJj5Anznd1+/7p4smpORwao95Sao71ehQksjCOoMbqZu6nS8lYdfiCjBYJ66RGnEBHs/jFF6TvFMm6C0N0xo7K6doiCqZYN5d6vC5RaMKYRE5TpcZ5AcYmgzxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757528220; c=relaxed/simple;
	bh=qbJuJ7SiS7KbRyTNg0EjkKL3/1oMFZjkYRT0Z8+eMF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1sxyz2SBndcmroKOHJd5vXZJPnZIw0BPJgxoWAt2eJGoI668PJdRRJY0s0VQ1H/XVSON02zPlctYMl95gbf8IOghUl4b9zir8pxNkPxs68B7j5l9APjunfXFgiGJbhjuZUdHGfvEXY+TPUF/76orA8Ocay42j/2i9DLq3jE7gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 8226160532; Wed, 10 Sep 2025 20:08:38 +0200 (CEST)
Date: Wed, 10 Sep 2025 20:08:27 +0200
From: Florian Westphal <fw@strlen.de>
To: Andreas Fried <afried@emlix.com>
Cc: netfilter@vger.kernel.org
Subject: Re: "nft reset counters" bug on 32-bit systems
Message-ID: <aMG-m6RSgi2y4cet@strlen.de>
References: <c64ff2d8-5ca6-4031-bcc8-9ecfee833665@emlix.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c64ff2d8-5ca6-4031-bcc8-9ecfee833665@emlix.com>

Andreas Fried <afried@emlix.com> wrote:
> This was tested on an arm32 system running kernel 6.1.134 and nftables
> 1.0.9, but as far as I can see, the code is the same on current master.
> Looking at nft_counter_reset(), this is a problem for systems where long
> is 32 bits wide.

Good catch.

> nft_counter_reset() wants to subtract the current total from the
> counter, so it calls u64_stats_add() with a negative "val" argument
> (e.g. -total->packets, in our case -4). But that argument is an unsigned
> long (u32) being added to the u64 counter. That means that it actually
> adds 0xfffffffc to the counter, giving 0x100000000, a.k.a. 2**32.
> 
> Seeing that u64_stats are used all over the place, any change might
> break all sorts of other things. So I'm hesitating to suggest a patch,

I'd suggest to turn nft_counter_reset() into a variant of nft_counter_fetch()
that uses local_xchg() instead of reads.

Expensive but reset requests should be rare and its much clearer as to
what is happening vs. this
fetch-and-then-add-negative-total-to-one-pcpu-counter.
