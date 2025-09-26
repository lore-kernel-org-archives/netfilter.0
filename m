Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452D21C860B
	for <netfilter@vger.kernel.org>; Fri, 26 Sep 2025 14:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758895404; cv=none; b=Kw9lBYHFYrIuld3ShDDPyvAxn/Z2VlMI5J+e7ygnB4lGIw6zcOKBvqLst6onLAuhxLGKhelG4R62CgTC0XkUmYFOBOU/Wh9fAcxiJeMF22jkhYxBGqoCd6MVPzXzSS5M9SW7uLcHgGhA25WqaENDy8bc9nAZWA84b1sV8OKkiOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758895404; c=relaxed/simple;
	bh=6mgpTXkJCCLUM/vxXJ7p3GBeb0/G18M5W1g9jJtAw18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVFrQnnOYH+ADY3jcap1hqc+MBV0muT9IJCnBR/Zk+tFcnYuDs6l3mEGOAR8o+nfW5fFQg34saElrVi+zytToRuSOl2DdQ6BE0b0PRG+xS4rMu6Enu9/ZH2hMwni/qm5yFc9x0e42o9GwAhK2rGLpLVI333Ycg+RJbufMhrJ7g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id DFCC360230; Fri, 26 Sep 2025 16:03:18 +0200 (CEST)
Date: Fri, 26 Sep 2025 16:03:19 +0200
From: Florian Westphal <fw@strlen.de>
To: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Confirming conntrack behavior on environments with multiple
 network namespaces
Message-ID: <aNadJ2EiPn6pMQ1E@strlen.de>
References: <CABhP=tYo-R_vFJhfUGj_GmW5mCAFR3VNEkkhJDp7pHpHNYvD5g@mail.gmail.com>
 <aNLTtcdGNJT8FuYk@strlen.de>
 <CABhP=ta4Rxf-TUa9YU2dAM5zgpkL7sqNHaTSAiHDR_5cXh1hTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABhP=ta4Rxf-TUa9YU2dAM5zgpkL7sqNHaTSAiHDR_5cXh1hTA@mail.gmail.com>

Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> > Or add 'notrack' rules in init_net for the netns originating traffic.
> > Or create a netns, enable conntrack and then only create connections
> > to addresses reachable via loopback. In all these cases init_net won't
> > be affected by the net namespace.
> 
> It will be hard to disable conntrack in init_net, a lot of
> functionality relies on NAT in kubernetes and is not owned by the same
> component

Sure, I understand that no-conntrack-in-init-but-in-another-namespace
is atypical.

> > That will only monitor that namespace, I'm not aware of a global counter.
> >
> 
> Can this be a feature request? having a global counter can easily
> monitor the load factor of the system, but I'm not familiar with
> kernel conventions and having some global counter may be discouraged

Not sure we should add one, it will result in some overhead for no good
reason.  Maybe /proc/slabinfo is enough for your use case?

nf_conntrack has its own (global) memory pool, it should provide a
reasonably good estimate across all netns.
