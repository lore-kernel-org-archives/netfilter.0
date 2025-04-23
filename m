Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9638A1F0987
	for <netfilter@vger.kernel.org>; Wed, 23 Apr 2025 12:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745409970; cv=none; b=f4GD/reNpBUysvXIjZCdtDGaVBjqF0m2FGZUHlQsEKJy0/IimJIhvXy8nhQbp+nNjhprJjr/Td32PJa6FOuqhItTH0fMwNG9fkQKtRhis+Z99WBg+ZwytnKDZHywGrkaPlzZRbCXPKF0TeNvcu6ryQ7V5whyOQAS1pGWKyYd2PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745409970; c=relaxed/simple;
	bh=sa2rJdVTf2VStZW9BtpaG0sKiCeFcIiZiHwZWanxyiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxD4zPstBOoUVCcApvLjWvhrQ6n6k+Qt7PyUmAOUIrsiZGR0zOjtOVZ5Cq1WEdnKm0pbat8n4zTKMNdS3iFOw9rl2+8zgl2RIQT5sYBcXICiHPyJ+pj/lyBYLawuKrUr+ORIcW14W802Yt40xnT6tld5x0GifcggVuSOw9D8LbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1u7Yrd-0002Gy-NH; Wed, 23 Apr 2025 14:06:05 +0200
Date: Wed, 23 Apr 2025 14:06:05 +0200
From: Florian Westphal <fw@strlen.de>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, Slavko <linux@slavino.sk>,
	netfilter ML <netfilter@vger.kernel.org>
Subject: Re: nftables RP filter and loopback
Message-ID: <20250423120605.GB7371@breakpoint.cc>
References: <905173BB-6745-4B59-8795-F9AC1E063A38@slavino.sk>
 <20250422114352.GA2092@breakpoint.cc>
 <622E44D0-8F02-4663-ABAD-01497C7D6692@slavino.sk>
 <20250422125351.GC2092@breakpoint.cc>
 <aAeknJtZBVycJKCm@calendula>
 <20250423091020.GA4038@breakpoint.cc>
 <aAjUNAdHpiIi1Pw9@calendula>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAjUNAdHpiIi1Pw9@calendula>
User-Agent: Mutt/1.10.1 (2018-07-13)

Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> Yes, I didn't notice either. Anyway, unless you can forecast any
> issue, I'd suggest to backport the entire patch? IIRC patch is
> relatively small and keeping it in sync with main could possibly help
> with cherrypicking fixes.

Right, it would keep -stable "bug compatible" too.

Maybe its ok to ask to cherry-pick it as is for
6.14 and 6.12.

6.13 is EOL already, 6.12 is longterm.

This would leave 6.6 and 6.1 longterm out but from lack
of bug reports so far I would not say its a prominent bug.

The upstream patch cherry-picks for all except 6.1.y, but
AFAICS its just a simple context conflict.

Earlier longterm kernels aren't affected.
