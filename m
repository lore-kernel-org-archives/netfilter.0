Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C2B244685
	for <netfilter@vger.kernel.org>; Wed, 23 Apr 2025 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399433; cv=none; b=JWdeM+G2d4cKn4XDh826t2CN+0IBLocUcm+8fJYHcVwXRJyrbZvg/9jQtSuDbBZ8IVI2Du/AAsLQbMwG2OjZLVLxKUM2mmbHoE48bzItvSsmsGOzaknAW3ZLOj3u3fwd9peNUuVvymcCQmeaKN1sAeweqwijQCrB01lGsyzjGXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399433; c=relaxed/simple;
	bh=DokOQJRkocIhvxJ2DHSIwhWImoMxWKuyfAE0xDako70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2gHr9ntuimj47T7HAUwDDaPNZ1xY3lNN2VgXsk9tkEDrQbwge4Gz93fbyBUFbjnqfyuG6ktPeDwizRvQ9aVhu7/nKnZEatvl45Q+ZUnRDBrt4bhaApl1Tmhr6ARJBoAJ2XsdYXTBkYfMcHWLQWMhKUgZigg4UcIN2F0dsqEdzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1u7W7Y-000185-KX; Wed, 23 Apr 2025 11:10:20 +0200
Date: Wed, 23 Apr 2025 11:10:20 +0200
From: Florian Westphal <fw@strlen.de>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, Slavko <linux@slavino.sk>,
	netfilter ML <netfilter@vger.kernel.org>
Subject: Re: nftables RP filter and loopback
Message-ID: <20250423091020.GA4038@breakpoint.cc>
References: <905173BB-6745-4B59-8795-F9AC1E063A38@slavino.sk>
 <20250422114352.GA2092@breakpoint.cc>
 <622E44D0-8F02-4663-ABAD-01497C7D6692@slavino.sk>
 <20250422125351.GC2092@breakpoint.cc>
 <aAeknJtZBVycJKCm@calendula>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAeknJtZBVycJKCm@calendula>
User-Agent: Mutt/1.10.1 (2018-07-13)

Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> Florian, is it worth to request to include this update to -stable
> kernels? Or you prefer the manpage note as it has been suggested?

I'll send a patch to update the nft_fib selftest to cover this,
then make a backport of the change that doesn't include the the
socket optimzation.

When I changed it I did not realize that this fixes a bug; I would
have split the change in two if I had.
