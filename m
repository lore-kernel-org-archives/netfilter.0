Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FE3137750
	for <netfilter@vger.kernel.org>; Tue, 12 Aug 2025 12:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755001108; cv=none; b=TGPXxgRXAn+nd9DhIDls/K8GAEJDSXpnV4U0s5TblaUQvcZ+h9p7Od0NGxEEj8sV68SHBGnfKgfK6aHSo4/pvUaTGzrKSbhRUxHU6p30owrk57X2xesjzxk/wbxrZJKDd7utndy0z4h7L/G7UhZIKRzwIu46S6BAhHjmX/aAnag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755001108; c=relaxed/simple;
	bh=iZ6nsFNfu4lbzMliEFXuiWPvuOaYy66rKc4uxXvFPsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSsAD4kEYufELAlTsXUBTIQo057GZ9UzgkWk4AV8ybVyG9H050IGqKt/C0Jpb2uPvjBS2szwTwTnRn58V8zIZQxi4VnIcxPD12UFsyFn2KD07D7vfXojpi8tDLxTKv4yKKS8bUi6GDYJb/XW5ZXAZs6tnuyX8xzsapeSIS7hrVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=X/rUABlB; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=X/rUABlB; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="X/rUABlB";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="X/rUABlB"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id CB6AA606C7; Tue, 12 Aug 2025 14:18:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1755001103;
	bh=IUHJB707c7M4+HL71gcyAtRM/oFWKEqZdXtm73FYU9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/rUABlBIkHHs0becMavGhbIc5CGUDOHxt11WuFsncs4xM5696NXvVnwf2QWeUKl9
	 3jm8EhiRqk3cWSFE+XhalRgoUSeUmmufpRj1CylPK5Xi9AGDsvzOVWTjIyAuIvH8Sr
	 nblWRwbqH8LDhyTGouqgXuITm1PtnWBYHjeKzhltATiZJky69OxmBVqqgEVFDt+yh9
	 erNoE5yGUdBDKccV52V5JCBlJWl7yvTbWIMnUkcdYdURxAfWIqyXJHjvlUie2k51CP
	 M+6AJKXUt7aVGmaq99Ts9V0i8N4r1KFAmRtjQafFn4P6pQXnmzK0cjmS3lM+9Mlq5L
	 M81Ds90Ci4BMg==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id E63F2606C0;
	Tue, 12 Aug 2025 14:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1755001103;
	bh=IUHJB707c7M4+HL71gcyAtRM/oFWKEqZdXtm73FYU9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/rUABlBIkHHs0becMavGhbIc5CGUDOHxt11WuFsncs4xM5696NXvVnwf2QWeUKl9
	 3jm8EhiRqk3cWSFE+XhalRgoUSeUmmufpRj1CylPK5Xi9AGDsvzOVWTjIyAuIvH8Sr
	 nblWRwbqH8LDhyTGouqgXuITm1PtnWBYHjeKzhltATiZJky69OxmBVqqgEVFDt+yh9
	 erNoE5yGUdBDKccV52V5JCBlJWl7yvTbWIMnUkcdYdURxAfWIqyXJHjvlUie2k51CP
	 M+6AJKXUt7aVGmaq99Ts9V0i8N4r1KFAmRtjQafFn4P6pQXnmzK0cjmS3lM+9Mlq5L
	 M81Ds90Ci4BMg==
Date: Tue, 12 Aug 2025 14:18:20 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Florian Westphal <fw@strlen.de>
Cc: Antonio Ojea <antonio.ojea.garcia@gmail.com>, netfilter@vger.kernel.org
Subject: Re: Query on nftables DNAT for localhost-to-localhost traffic in
 IPv6 or without route_localnet
Message-ID: <aJsxDCRGVSQjGh6f@calendula>
References: <CABhP=tbrKeaQCAnKHbJoWNcgTthvmAEPEOcvux_W8eztR5QT1Q@mail.gmail.com>
 <aJBugbUKvPaiZ_PD@strlen.de>
 <aJpNme8xRUbhNs4P@calendula>
 <aJsi1_zrVmQyHyw0@strlen.de>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aJsi1_zrVmQyHyw0@strlen.de>

On Tue, Aug 12, 2025 at 01:17:43PM +0200, Florian Westphal wrote:
> Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > >This seems to do the trick:
> > 
> > To simplify this example below, would it be possible to extend nft_fib
> > to attach DST_METADATA in prerouting to modify the ip6_route_input_lookup()
> > behaviour? This is similar to the conntrack template, but for routing.
> 
> skb_valid_dst() doesn't consider DST_METADATA as a valid dst, afaics the
> dst is then discarded and we end up in the same code paths.
>
> But I think we could extend nft_fib to attach a route/dst.

Then ip6_route_input_lookup() needs to be updated, and it would be
good if there is a flag somewhere to specify that the existing route
is intentional to skip this:

        skb_dst_drop(skb);
        skb_dst_set_noref(skb, ip6_route_input_lookup(net, skb->dev,
                                                      &fl6, skb, flags));

> But at this time I don't want to spend time on enabling such hacks
> (lo-to-remote-dst-nat) unless there is a good use case for it.

I am not familiar with this use-case.
