Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CC3303C80
	for <netfilter@vger.kernel.org>; Fri, 12 Sep 2025 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757684260; cv=none; b=Qs0wNJdOd1ikqj3cw1bNbYHTongneF2l0V7RQZZ3b+3+4bDm8SnmqBqwyJTcMdOEmR7UWdE5iPi5oleCdvTWFqQVRNaUWl8oGtEMoHnpuPfbqkmKcD8mI424zYSXR7c3LLoJznbJjnIzGpGDKs/RTXhBG3M0Sc6WWVu64m/WjXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757684260; c=relaxed/simple;
	bh=yPj6sewBWVZeUl251oSCcep84hS5Jpd+ImmUI8c35kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHGfeZxR/+Tnpmsk7X3/620KPIXFz210d5vDpRJ+3+Kbj+t97kJuOO9uSvMo4JF2mRgSH4aiFCevIwSVjM1xQE+E2PaKZiTTUmjTmnCxNGjjj/vKtbR+KtpxlCSpmtTHh/IwRGCkfREGIEdns6gtCXWcGadcTCWlqEDhQF6mo88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 6DC3660324; Fri, 12 Sep 2025 15:37:36 +0200 (CEST)
Date: Fri, 12 Sep 2025 15:37:36 +0200
From: Florian Westphal <fw@strlen.de>
To: Juan Carlos Lazcano <juan@placidnetworks.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Stateless NAT in nftables with maps for performance
Message-ID: <aMQiIC9016sR9Djw@strlen.de>
References: <1643443761.529082.1757676483522@email.ionos.com>
 <aMQMg33uIM63vKAC@strlen.de>
 <aMQQ0vB83DCfeboy@strlen.de>
 <1714012059.534025.1757681233048@email.ionos.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1714012059.534025.1757681233048@email.ionos.com>

Juan Carlos Lazcano <juan@placidnetworks.com> wrote:
> My echo/reply base icmp functionality for v4 is working atleast at a cursory glance, without further testing I'm not sure what other parts of icmp are not working with this approach.

Internal addresses leak via icmp dst unreach, redirects etc. which contain copies of
the (rewritten or original) addresses.
That in turn breaks path mtu discovery for instance:

Server may see internal address reflected in embedded header.
Client can receive error for source address it doesn't have.

NAT engine also rewrites embedded headers, see e.g. nf_nat_ipv4_fn()
in net/netfilter/nf_nat_proto.c and nf_nat_icmp_reply_translation() to
avoid this.
