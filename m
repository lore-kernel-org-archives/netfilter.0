Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6540D1A2393
	for <netfilter@vger.kernel.org>; Tue, 28 Jan 2025 12:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738068105; cv=none; b=nnCeyZZ+pIi0wPdBgmY9Fe23mgTeT1/b0+Fqw+Vo1TBKsFPK6ubjdF56M8AwcpAA03nFKYgTDtOBEnOn08KEZSu8VSJVnxw8m6WjkwVYpcVuCYuCGS49IOwRu9LSmCxdsUqjOvQPjnwGfPYvEtu21XDbXIImEzIs60r43OIWYBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738068105; c=relaxed/simple;
	bh=11ArZcUQWrX6Zh9aHpDprZcz9CHE+psw3X5jAtRGtdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VxBaUZw/aYN2bvGpzky+8/vhHJcxW6AVrOOBvYKpbOcmAnfbwhfqsp5sBBWA3sqOoCYXDSudVWiK4+NPLt+qJtoZSgxgSO/ZgXKwNyOGaaeeI2+GdHMQo0oAbR3yqyTmX45jqMsBc/qqQdjxu8k2gQW1+ueoRYwV8VhoM5PkE4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=CEXhSCms; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=CEXhSCms; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="CEXhSCms";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="CEXhSCms"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id CF5816028B; Tue, 28 Jan 2025 13:41:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1738068100;
	bh=66PP5WSI4hh+gl869kbCF6nSRv60KCigOvIoNrOGH6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CEXhSCms2tNk/3aPaYK4juBFkOlInTtezS7dhqrk+ZqRPQlfXiewws4V+/PTkKLaM
	 JHXqGw4of7KlQYnCpuTwb5A4yrq0MTsuI0e2K5ik1gQ9gHjPvADJOof9USkjgjyvQo
	 Gu9EXREH/01lY0Eb1SqrxAMtoqJT7AIJXSrCDKJ79dPA+On1F4xpsk4kyeWYxjBNj5
	 1PZ7q9MDeLYiFuQULx/zTRyorE4bvOvhVOvZXa7v4KfJQN0sYprdyefd3K8KXFlmmF
	 cUovlP9W0xajb40c20s3WEj1YJaEtp+2cTZt8989h3VsFe3xMx03PYAEEY4sF7LsD8
	 ou9LWgT/f8S1w==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id ECE9B60286;
	Tue, 28 Jan 2025 13:41:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1738068100;
	bh=66PP5WSI4hh+gl869kbCF6nSRv60KCigOvIoNrOGH6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CEXhSCms2tNk/3aPaYK4juBFkOlInTtezS7dhqrk+ZqRPQlfXiewws4V+/PTkKLaM
	 JHXqGw4of7KlQYnCpuTwb5A4yrq0MTsuI0e2K5ik1gQ9gHjPvADJOof9USkjgjyvQo
	 Gu9EXREH/01lY0Eb1SqrxAMtoqJT7AIJXSrCDKJ79dPA+On1F4xpsk4kyeWYxjBNj5
	 1PZ7q9MDeLYiFuQULx/zTRyorE4bvOvhVOvZXa7v4KfJQN0sYprdyefd3K8KXFlmmF
	 cUovlP9W0xajb40c20s3WEj1YJaEtp+2cTZt8989h3VsFe3xMx03PYAEEY4sF7LsD8
	 ou9LWgT/f8S1w==
Date: Tue, 28 Jan 2025 13:41:37 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Florian Westphal <fw@strlen.de>
Cc: Sunny73Cr <Sunny73Cr@protonmail.com>,
	"netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Raw Payload Expressions - out of bounds write?
Message-ID: <Z5jQgcbCXiLyPwV-@calendula>
References: <Bp_PH3aO9-d7-Av1SaQGtAgrvHaPwr0l5r_aR31_U8l5IvbSFaLJ1lXI3vFBV46Xb4IxK-tP-HkcSFS-2KCLyYfRibcIkioxjdem46U0IB8=@protonmail.com>
 <20250126135021.GB3073@breakpoint.cc>
 <R5drxaQptK9DK89Lt1TmFpDxo86ctD3Pu2WS4wEhXcOZq7yuVqJDxNIc2tZVIx1PJpF15g1AOJCW3gxNIPqlVH6ubbppDWQlzErAa4UP3UI=@protonmail.com>
 <20250128003706.GB29891@breakpoint.cc>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128003706.GB29891@breakpoint.cc>

On Tue, Jan 28, 2025 at 01:37:06AM +0100, Florian Westphal wrote:
> Sunny73Cr <Sunny73Cr@protonmail.com> wrote:
> > > Please elaborate as what is wrong here in listing 3.
> > 
> > Within the second line of the rule (@ih,80,16 set @ih,80,16 & 0x3f0 \)
> > 
> > The mask 0x3f0 equates to 1,008 in decimal.
> > (3 * 16**2) + (15 * 16**1) + (0 * 16^0) = 1,008
> > Here '**' indicates exponent.
> > 
> > 1,008 is far larger than the 34 bit range that I covered.
> 
> Sigh.  Why did you not say something like:
> 
> The mask is provided as '0x3f0' in the listing, but I had expected
> 0xfc0f, as only 6 bits should be cleared, but the mask KEEPS 6 bits.
> 
> It would have saved me a headache figuring out bug you refer to.
> I am not a mind reader :-/
> 
> Use --debug=netlink, it looks like its a display bug.
> 
> I'll have a look.

It looks like netlink_delinearize is missing code to compact the
expression.
