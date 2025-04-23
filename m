Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28FE26FDBA
	for <netfilter@vger.kernel.org>; Wed, 23 Apr 2025 20:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745441932; cv=none; b=n1Hpi73uGDe7vvDiBx7QF3InhUnipjcKiUownkI9//xUCuED3kTbtnWWb/PVrudxL0kpt4Z12P2kt6Lxjsra7yiMZWeJdGgd7PlfTDeYLibgIp0ttzMwvRb3Lv8z3jxUGt+zzIgMA32L0oKwtF7EOvJIwnaPb9zxk7vTqIc2Ksk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745441932; c=relaxed/simple;
	bh=c4bQC8UTFy9SOOVsVAhmizSnVewHP3XkFxAOQZ1yOyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeX9p3C2gwstJ2v1lo5ZAXsHn+FR7pv/FrM22U4aUALmSsZqwoV7cAr8iXayu7S5KxQp3/4ihBvluxfKDEmcBjwf+yzopF/NOhZBg8V+HRLf1sezdpNFiDV++AodNzoGutF8V0XDn+TbIMR/P8JVgVc9qSdUJTNCvuSXfLxaP4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=TW5kvM3J; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=mT/z4yOT; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="TW5kvM3J";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="mT/z4yOT"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 5CCE86095F; Wed, 23 Apr 2025 22:58:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1745441928;
	bh=2lUvFK0QEiFB8a8F0sbhMhAZNA/9oZ8nuT0DlM15WVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TW5kvM3JJe+7DJlTbx25Zz0QGveFzsvzdA3QCnA4WicSwINE5pvCx6nETgjV7mZ68
	 4xEy14wyqp0EztoINyd+xIol5cxcq9NzRmOxJQT/xKZel1SDyhcH+xCOjIuBhKO6vf
	 XnkMlogJ7hW8xFNXbDgHQGgKq/PFMn8SGXIqEz+wPyua8Gfw+P11fJDMLmReurf5/U
	 HXQBLQtfYj8GQ1W2DvXLvt8jjpW8HX2mUdH60Uxr465lM6bMM5khmDadd90nw58LrQ
	 DmWNKb5o2bpDixsBDJPCZEvfpI/Iz2qT+fs1WLQSab01euIlGnBtzdgw8zPlPawPNT
	 Qt6PCyRFx5aUg==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 9246B6094A;
	Wed, 23 Apr 2025 22:58:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1745441927;
	bh=2lUvFK0QEiFB8a8F0sbhMhAZNA/9oZ8nuT0DlM15WVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mT/z4yOTmNFTz1w6LFy6jrYey8Em+tXnQplfxcGxH0p2WG/RUfNs+Ca9i0CrMasEC
	 +kL7Al2h5vk2CGdAlKLjSNEocPNhfWW7mEfcymJEiPAG4SnoHQNTFLKsx4smntHUh+
	 6SupyDJQyJsQJss1TlDV2Kc4XaHLj3hFa4JQ/PEi62Gytb1cGTRrz86r87HGvlmYH/
	 JjHy0nJFeehkUFRAmXl1k+ycxbE+KQnqvc0syL5UhFsk+1ob+nKWr3Fthhe2M63h77
	 TjliPcNsBwC19TrKf2sMXuMK4AwY34svW46lwXy4e9Plk+Jvh1nqB3FHLKM3p4rAME
	 /PgHx5HE4+RCQ==
Date: Wed, 23 Apr 2025 22:58:45 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Florian Westphal <fw@strlen.de>
Cc: Slavko <linux@slavino.sk>, netfilter ML <netfilter@vger.kernel.org>
Subject: Re: nftables RP filter and loopback
Message-ID: <aAlUhaH8ryNauGe9@calendula>
References: <905173BB-6745-4B59-8795-F9AC1E063A38@slavino.sk>
 <20250422114352.GA2092@breakpoint.cc>
 <622E44D0-8F02-4663-ABAD-01497C7D6692@slavino.sk>
 <20250422125351.GC2092@breakpoint.cc>
 <aAeknJtZBVycJKCm@calendula>
 <20250423091020.GA4038@breakpoint.cc>
 <aAjUNAdHpiIi1Pw9@calendula>
 <20250423120605.GB7371@breakpoint.cc>
 <aAlUBmTljaz3bD-L@calendula>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aAlUBmTljaz3bD-L@calendula>

On Wed, Apr 23, 2025 at 10:56:41PM +0200, Pablo Neira Ayuso wrote:
> On Wed, Apr 23, 2025 at 02:06:05PM +0200, Florian Westphal wrote:
> > Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > > Yes, I didn't notice either. Anyway, unless you can forecast any
> > > issue, I'd suggest to backport the entire patch? IIRC patch is
> > > relatively small and keeping it in sync with main could possibly help
> > > with cherrypicking fixes.
> > 
> > Right, it would keep -stable "bug compatible" too.
> > 
> > Maybe its ok to ask to cherry-pick it as is for
> > 6.14 and 6.12.
> 
> OK, let's request this cherry-pick for 6.12. Thanks

eaaff9b6702e ("netfilter: fib: avoid lookup if socket is available")

> > 6.13 is EOL already, 6.12 is longterm.
> > 
> > This would leave 6.6 and 6.1 longterm out but from lack
> > of bug reports so far I would not say its a prominent bug.
> > 
> > The upstream patch cherry-picks for all except 6.1.y, but
> > AFAICS its just a simple context conflict.
> > 
> > Earlier longterm kernels aren't affected.
