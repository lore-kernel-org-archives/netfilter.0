Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AA61D514C
	for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 18:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741803627; cv=none; b=qAbO6e2zc9JJi9G5U+Hgwf1XVZmXLjRqyYobAoN5O8VLgMSLVsZ7VIJk0djKlxOgeqAGk+stA4LeGG52V0/hlKswcNSZDwh42BsSvoXXh4qeKpZoC51KKSU8UBOc+3VhwPtiPlicUjmEXwu1lByALVFwJTcROwwRWm60TtdGRmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741803627; c=relaxed/simple;
	bh=VMUu2hyeBw693TsmnR3eGEIR/m55SbzCe3P3VKuwQrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbbmRMbTbYw1W4fEo7GpH2KmXeh91vZBNEoVpAbiBVuBsLa0PNXDYW/gDvGZ22zKnmmzXYhAdoe+tlty6ckVOFxWcdEmKL+jDq33KIi10Lw4jkg8iJCgj2Q3nV1f4WSj6U9AKdegDyCH4B3863qlAw5fvvJU6I7W7AXv0qzp4lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tsQgn-0000o6-Ug; Wed, 12 Mar 2025 19:20:21 +0100
Date: Wed, 12 Mar 2025 19:20:21 +0100
From: Florian Westphal <fw@strlen.de>
To: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Subject: Re: netfilter expected behavior for established connections
Message-ID: <20250312182021.GA3007@breakpoint.cc>
References: <CABhP=tYOynShd82rwVuDMJDTE8LcM6+FHwx7Tfuk183EW+ipPA@mail.gmail.com>
 <20250312161324.GB28069@breakpoint.cc>
 <CABhP=ta1mct0M37VvT5_HA-oQdJ5s8LCRL4AF=Mb=TzZS=0F0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABhP=ta1mct0M37VvT5_HA-oQdJ5s8LCRL4AF=Mb=TzZS=0F0Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> heh, I got bitten for that too, that is why I have
> 
> echo PING >&3 && read line <&3
> 
> the moment that you read it from the fd, it does not come back to the
> socket and you break the loop.

AFAIU the read could happen before socat managed to read from
the pipe (so nothing is sent over network).

Or there could have been several writes over the network,
not just 'exactly one write'.
