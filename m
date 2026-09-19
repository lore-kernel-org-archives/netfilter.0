Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ACA2AD00
	for <netfilter@vger.kernel.org>; Sat, 19 Sep 2026 13:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789824800; cv=none; b=Q+NM6S9ESizBYxkjjvtklCDY2vyhSXCk/SsVzkh9HM5vZEnaAVtGYs5vXeXIUn4iXKOiMpd5L3OmjzV58ylxSfXrd03ONYSGDckzUE3b52ywZ5J9Ev1ySUhv8YEvg/h5LSOiSk6AEKA8ut6A3M+FfkmiT58jKaQDZDqBGrrjdO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789824800; c=relaxed/simple;
	bh=WjSFD+aN6VACJngR2CrF50XYSLEFQWyjhRZQGpHbhtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IYxqsZFsEmJLRg8DuZK/lDKB2n7xCAeHOymcY3oNuezJK967jqx9cN+KLwZUsnx2IoQnolRHB2El1kC4Xl5jfQJ536z8BC7HqtrQwK5HRn67LjM7CNYkZKrJ8vlmId2lX1cPOGZA9Y5N0z7gCPog1asD63Ucw3o/PETYeL/MKXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 4236F60456; Sat, 19 Sep 2026 15:33:10 +0200 (CEST)
Date: Sat, 19 Sep 2026 15:33:09 +0200
From: Florian Westphal <fw@strlen.de>
To: js yu <junsang.yu3@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Question about security table priority in iptables-nft
Message-ID: <aq6PFTId2rPkprln@strlen.de>
References: <CAGh5W5g+7LiEyR+bJ_aq=8mtRkgQuebkDMT1zq7TJ4j0xxY8DA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGh5W5g+7LiEyR+bJ_aq=8mtRkgQuebkDMT1zq7TJ4j0xxY8DA@mail.gmail.com>

js yu <junsang.yu3@gmail.com> wrote:
> 
> In iptables/nft.c (v1.8.13), the built-in security chains use:
> 
> .prio = 150, /* NF_IP_PRI_SECURITY */
> 
> However, NF_IP_PRI_SECURITY is defined as 50 in the kernel,
> and iptables-legacy uses that value for its security table.

Yes, looks like a bug.  I pushed a change to correct this, thanks
for reporting.
