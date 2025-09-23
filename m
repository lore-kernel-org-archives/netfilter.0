Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDB4328589
	for <netfilter@vger.kernel.org>; Tue, 23 Sep 2025 16:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758645882; cv=none; b=rCllJd0DQpeQ/mvQsAVLLsk7yLdEff1cCZUKbUBkpOp8aRbUhOUmlSTUjVFxm9I78ipOeBxPJRp+XNa+hGWtxTlIPkJa9KT6Vh3mDni9/HkxzXWV1ztADTfo8HH35n04IqTjWew3jLFroSUvHUvtlqKUDNiYVoujocNqdkBtAXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758645882; c=relaxed/simple;
	bh=/nkWgswdN8Eo8SRxlhgidlzAZKXHpAEMvRpo2ImMAjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAuIoG2Uhyzn3xs5/swKsOcF2Y70Yvdd08nD/Nim+yE9RCcLvCTrJfgC1h6fLgyOtLEahmTrNBE3lx09fQBgYEzuI91SdLsNuCrJqUt8p0cp8Inz3OKoBfib7dSf5rOjj967apyaFF0NS4q/LGqe4deu1de43sn3g0hhRjcdbsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id E0C73618CB; Tue, 23 Sep 2025 18:44:36 +0200 (CEST)
Date: Tue, 23 Sep 2025 18:44:36 +0200
From: Florian Westphal <fw@strlen.de>
To: Andreas Fried <afried@emlix.com>
Cc: netfilter@vger.kernel.org
Subject: Re: "nft reset counters" bug on 32-bit systems
Message-ID: <aNLOdJdwjJIVaFxW@strlen.de>
References: <c64ff2d8-5ca6-4031-bcc8-9ecfee833665@emlix.com>
 <aMG-m6RSgi2y4cet@strlen.de>
 <6ab4cb4a-5e85-4178-bfa9-cb5f801a0f04@emlix.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ab4cb4a-5e85-4178-bfa9-cb5f801a0f04@emlix.com>

Andreas Fried <afried@emlix.com> wrote:
> On 9/10/25 20:08, Florian Westphal wrote:
> > I'd suggest to turn nft_counter_reset() into a variant of nft_counter_fetch()
> > that uses local_xchg() instead of reads.
> > 
> > Expensive but reset requests should be rare and its much clearer as to
> > what is happening vs. this
> > fetch-and-then-add-negative-total-to-one-pcpu-counter.
> 
> I'm afraid I'm missing something here. Wouldn't this be too expensive?

No, but doesn't work due to not being atomic wrt. userspace reading
stats in parallel.

> nft_counter_fetch() can read the stats from other CPUs without issues,
> but that won't work for writing, i.e. local_xchg(), right? local64_t is
> only atomic with respect to one CPU, so would we need to schedule work
> on each CPU to read and reset the counters?

No, it simply won't work.  We need to continue to use the existing
scheme to make sure userspace observers either the counter before reset,
0, or a new updated value that happened right after the reset.

With my proposal, userspace can observe incorrect value when one cpu
is doing the reset, as for each xchg it can observe 'shrinking'
counters.

> In d84701ecbcd6ad63faa7a9c18ad670d1c4d561c0, Pablo Neira points out that
> cmpxchg will not work unless all other functions also use it, and that's
> too slow.

A-ha. Yes, its not atomic wrt. read path.

Someone needs to add u64_stats_add64() so this can be fixed
for 32bit platforms in a followup patch.

local_add() already does the right thing for us, so the stats api is the
only missing piece of the puzzle.
