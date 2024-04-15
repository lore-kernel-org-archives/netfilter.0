Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961287581B
	for <netfilter@vger.kernel.org>; Mon, 15 Apr 2024 13:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713187235; cv=none; b=ZqCSASuj/cZVyWBB5JW9P1qiF6J/Ee2Yp5tuqsbVYB4aGW6GDwcOtm0L7Wa/CmiiguwjS8fRaFAYndMF4+N9FyoBXaDMJF+69kWO//d+64ZLFn325cscQ1aNH9P7xc82WR0PHHrl/fJC2yA270hqPtrdgnkoKVOv8vThfGMO+K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713187235; c=relaxed/simple;
	bh=XW3OZ/LoH5txp9PB9BFWH+xm8Z2QB6OunUmufvEtqkg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lmu55vNgdFfllsjDrUxZJ7/KaVJZWTvYrA0UXdxoqjtcB/qgqw/E+sBB+PAjxuPsAgAI6Vdj8ZIDVEtFONG9jFUOgN80WIQ5FcBQSRmaaSEGf8YHTkozGXynFMX4Hwb0E5xsPsDpY/z6VCNDY8mrEwconVlqpV/Yi1IExfdM6UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1rwMG4-0007FO-19
	for netfilter@vger.kernel.org; Mon, 15 Apr 2024 15:20:28 +0200
Date: Mon, 15 Apr 2024 15:20:28 +0200
From: Florian Westphal <fw@strlen.de>
To: netfilter@vger.kernel.org
Subject: Re: NFQUEUE usage and interaction with later chain rules
Message-ID: <20240415132028.GA7880@breakpoint.cc>
References: <Zh0Y-j3NAbRmAi03@fysh.org>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zh0Y-j3NAbRmAi03@fysh.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Athanasius <netfilter.org@miggy.org> wrote:
>   I'm in the middle of trying to implement some firewall bans based on
> GeoIP data.  It seemed that implementing an NFQUEUE userspace helper
> to do the lookups and decision making was the most feasible solution,

For IP matching?  Use ipset or xt_geoip from xtables addons, much
simpler and faster...

> but I have run into some issues.  I can probably work around them,
> but it does make this setup more fragile than I'd like.
> 
>   So, I'd like to ensure I'm properly understanding some things.
> 
>   1. The only practical verdicts the userspace helper can return are
>   ACCEPT or DROP.  Checking through some documentation, examples, and
>   kernel code I've come across 'STOLEN', 'QUEUE' and 'REPEAT', but I
>   cannot find any actual documentation on what these might achieve.

You can accept, drop, queue (pass packet to queue/program), or repeat,
which will make the packet reenter the same ruleset, i.e. its queued
again unless you use mark tricks to avoid that.

STOLEN cannot be used, its kernel internal.

>   2. There appears to be no way to have an NFQUEUE rule act in a manner
>   where the userspace verdict can cause subsequent rules in the chain to
>   be considered.

Yes.

>     I'd specifically like my userspace helper to be able to say 'DROP',
>   but otherwise allow rule evaluation to continue in the chain, rather
>   than blindly accepting all else.

Thats impossible to do.

>     If I could cause rule evaluation to jump to another chain that would
>   also be acceptable, simply placing rules that would normally be later
>   in the current chain into that one.

Same.

> there's no userspace helper listening to the queue... but this literally
> turns the rule into an ACCEPT, rather than passing evaluation to later
> rules.  Presumably the 'fail open' socket option, to not cause all
> packets to be dropped if the queue buffer is filled, has the same issue.
> It's then blind ACCEPT rather than "let later rules look at the packet".

Right.

>   Is any of my understanding in error?  Can I actually implement this
> how I'd prefer, with later rules being evaulated upon some specific
> verdict returned from userspace ?

No.  It would require significant rewrites on the kernel side, nfqueue
would have to be moved from core into xt_NFQUEUE and nft_queue,
respectively, with nftables/xtables specific changes to support what
you want, and such change would also break backwards compatibility.

I don't think this is going to happen.
