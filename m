Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E5016F0EC
	for <netfilter@vger.kernel.org>; Mon, 11 Nov 2024 12:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731326807; cv=none; b=qLU46/UA/4Zm5o1sr7efH5dKoVkdfS1EYo7ngvzowFs7a6ID65xr9b80yLAbpDoOXl/QZlww9h3d70FfinVZy2J1Kt62digpx8jezHwLKPWQEjfNenTovM3tVGIbO4OlUKZsg9Emy6z1hj/tcs+VUWw6KhxH3vdhzyhbh32cOD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731326807; c=relaxed/simple;
	bh=bZvOL//+GXynEVMguFY4wuemUHKPAodjwb7MUbT0SwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVKfI+wKPj6h4dCZhEV0aQhDdfbgd6BcQe3t9O2SxzDaBdDxP8i7rXP16SYXZj1hH0taY5mNT+WfbY7Ta1UV4HRVGfyPUCDrmGkPOB3te0WauM0+BNuAD4ClbCrJjlDqpf26bmdTh5ZcR9X0Ng61GdbxwQM+UmDbY+s4BFOxFiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=34070 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tATBo-001xmo-5N; Mon, 11 Nov 2024 13:06:42 +0100
Date: Mon, 11 Nov 2024 13:06:38 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Subject: Re: Most optimal method to dump UDP conntrack entries
Message-ID: <ZzHzTvYFOPcfWvRs@calendula>
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
 <20241017124632.GC12005@breakpoint.cc>
 <ZxE8-pDn9Alzm50K@calendula>
 <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
X-Spam-Score: -1.8 (-)

Hi Antonio,

On Thu, Oct 17, 2024 at 11:10:02PM +0100, Antonio Ojea wrote:
> On Thu, 17 Oct 2024 at 17:36, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> >
> > On Thu, Oct 17, 2024 at 02:46:32PM +0200, Florian Westphal wrote:
> > > Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> > > > In the context of Kubernetes, when DNATing entries for UDP Services,
> > > > we need to deal with some edge cases where some UDP entries are left
> > > > orphaned but blackhole the traffic to the new endpoints.
> > > >
> > > > At high level, the scenario is:
> > > > - Client IP_A sends UDP traffic to VirtualIP IP_B --> Kubernetes
> > > > Translates this to Endpoint IP_C
> > > > - Endpoint IP_C is replaced by Endpoint IP_D, but since Client IP_A
> > > > does not stop sending traffic, the conntrack entry IP_A IP_B --> IP_C
> > > > takes precedence and is being renewed, so traffic is not sent to the
> > > > new Endpoint IP_D and is lost.
> > > >
> > > > To solve this problem, we have some heuristics to detect those
> > > > scenarios when the endpoints change and flush the conntrack entries,
> > > > however, since this is event based, if we lost the event that
> > > > triggered the problem or something happens that fails to clean up the
> > > > entry,  the user need to manually flush the entries.

You can still stick to the event approach, then resort to
resync/reconcile loop when userspace gets a report that events are
getting lost, ie. hybrid approach.

> > > > We are implementing a new approach to solve this, we list all the UDP
> > > > conntrack entries using netlink, compare against the existing
> > > > programmed nftables/iptables rules, and flush the ones we know are
> > > > stale.
> > > >
> > > > During the implementation review, the question [1] this raises is, how
> > > > impactful is it to dump all the conntrack entries each time we program
> > > > the iptables/nftables rules (this can be every 1s on nodes with a lot
> > > > of entries)?
> > > > Is this approach completely safe?
> > > > Should we try to read from procfs instead?
> > >
> > > Walking all conntrack entries in 1s intervals is going to be slow, no
> > > matter the chosen interface.  Even doing the filtering in the kernel to
> > > not dump all entries but only those that match udp/port/ip criteria is
> > > not going to change it.
> 
> We are not worried about being slow in the order of seconds, the
> system is eventually consistent so there can always be a reasonable
> latency.
> Since we only care about UDP, losing packets during that period is not
> desirable but is assumable.
> My main concern is if constantly dumping all the entries via netlink
> can cause any issue or increase resources consumption.
>
> > >
> > > Also both proc and netlink dumps can miss entries (albeit its rare),
> > > if parallel insertions/deletes happen (which is normal on busy system).
> > >
> 
> That is one of the reasons we want to implement this reconcile loop,
> so it can be resilient to this kind of errors, we keep the state on
> the API in the control plane, so we can always rebuild the state in
> the dataplane (recreating nftables rules and delete conntrack entries
> that does not match the current state)
> 
> > > I wonder why the appropriate delete requests cannot be done when the
> > > mapping is altered, I mean, you must have some code that issues
> > > either iptables -t nat -D ... or nft delete element ... or similar.
> > >
> > > If you do that, why not also fire off the conntrack -D request
> > > afterwards?  Or are these publish/withdraw so frequent that this
> > > doesn't matter compared to poll based approach?
> > >
> > > Something like
> > >    conntrack -D --protonum 17 --orig-dst $vserver --orig-port-dst 53 --reply-src $rserver --reply-port-src 5353
> > >
> > > would zap everything to $rserver mapped to $vserver from client point of view.
> >
> 
> This is how it is implemented today and it works, but it does not
> handle process restarts per example, or is not resilient to errors.
> The implementation is also much more complex because we need to
> implement all the possible edge cases that can leave stale entries

It should also be possible to shrink timeouts on restart via conntrack -U
which would be similar to the approach that Florian is proposing, but from
control plane rather than updating existing UDP timeout policy.
