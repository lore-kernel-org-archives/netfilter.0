Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565E146C4AA
	for <netfilter@vger.kernel.org>; Sat, 17 Oct 2026 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792227879; cv=none; b=Lja9Bgt0oV7VHe1tl6y/RQ1z4KU2BJqxagKlt2KLMkOnODkIkLmdyqi5UfnsOb363HY5ci5UHN9YVGY9BnnjuJzzDBykF8IQZD9npZrMW/N2tYV4oGAHYa2JCrJZ85hYdLf4gnLj5qohZ6nh/IQ2JnIiuyqhqLY/6QbbUHYz56g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792227879; c=relaxed/simple;
	bh=nYeihqYrkfR3+NvVZtkybhB9trdHX0oSi6ivG1n9XSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBT+0g2yzD64FfM+51J/R8fUlwcg4l+Xl1VMyIa+3FIhG55V4+Vf9xJzGTMzVOHxTY4YYauQWruKBABWoyH4fO5RTVQxQP71XaAK/8Es3stRGvAonlwXNgAgHpFCk1rg2JjZ6Kpi47yl2eJwjK+L/1z7yT97mBqpiELAM54ji/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=rTQg+cfe; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="rTQg+cfe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1792227867;
	bh=j3L1FmWHZChLxLVQNDKC/L8DaJdt8BYBtdWFdZQfaAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rTQg+cfeyHu1zTdXWNkqUPzz9Su1qPad6RDxFb/uLNq9sjLtPMUrqz7SedKKvRYvm
	 bM0npVvFi4Nohd+ieeGh9WaS79uc5Ta4U+TMDB8ekEh6Z0NvhaiW6V/MuAa+LWKcAs
	 FVBRog2h0nMu5MjSuD3oZpSA1sJYkwkEvobJRib+Qj1/MnopR1KQiW3DAHynuxszvd
	 Zm3tYDyWTHHZ4ImVtgMOM/yPhO0XBJn23/cERYeoq1J1ocb9+KVeHg1ogHplyIOnEN
	 57QF0KSIGumEnpj+GkHvd5jCjcwdwnuD0dhAg5L3N3HkjfH9riNPnsh/ylXuCMUgk1
	 CJSrbfJrVyS1Q==
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id C037B60056;
	Sat, 17 Oct 2026 11:04:27 +0200 (CEST)
Date: Sat, 17 Oct 2026 11:04:24 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Florian Westphal <fw@strlen.de>
Cc: Richard Van Tassel <richard.van.tassel.work@gmail.com>,
	netfilter@vger.kernel.org
Subject: Re: userns packet mangling
Message-ID: <atM6GAEwmgR5ZhIq@chamomile>
References: <CAGLc8_RABvE42M_1icBskniznt5-e2QLNd7g3Fku3bcw+2aE2Q@mail.gmail.com>
 <atKqWQwqM3AW7pil@strlen.de>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <atKqWQwqM3AW7pil@strlen.de>

On Sat, Oct 17, 2026 at 12:51:05AM +0200, Florian Westphal wrote:
> Richard Van Tassel <richard.van.tassel.work@gmail.com> wrote:
> > Hello, netfilter world.
> > 
> > I am very curious about the status of re-enabling packet mangling in
> > user namespaces.
> > 
> > I understand that it takes time to find and address security concerns,
> > and I hope the netfilter community takes all the time they need. That
> > being said, I just wanted to echo the appetite for that functionality
> > to return, similar to
> > 582d218b638be68342dd80893c41746b35c1be76.camel@student.kit.edu (sorry
> > if I'm linking this incorrectly, I haven't used this sort of mailing
> > list before)
>  
> > I am currently working around the disabling in a somewhat controlled
> > fashion using a custom kernel patch and module to allow a process in
> > init ns with CAP_NET_ADMIN to grant permission to mangle on a per-ns
> > basis. As I understand the situation currently, I don't think there's
> > much appetite for accepting this workaround as a kernel contribution,
> > since the disabling is meant to be temporary. But I feel like I should
> > mention it nevertheless.
> 
> https://patchwork.ozlabs.org/project/netfilter-devel/patch/20260905050150.30273-1-fw@strlen.de/
> 
> is still pending, and its closing known security hole.
> So no, for now we can't re-enable this feature.

I will pick this in the next nf.git PR.
