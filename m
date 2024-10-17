Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175D31DEFDC
	for <netfilter@vger.kernel.org>; Thu, 17 Oct 2024 16:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729182990; cv=none; b=Sg81g01Ow6SZ1+jhXxYPsbaGQQdafRttPH1ORnem1Fo4PH6FS1ixoWumq9qVcmRbbMSl+iGz2nwGPZQupvrem6dvQhjkkYJrhB2PvYLHY7WR2IHcNcPW23qcggkhHe9bAfx5HahKBaOx75yZjtqmLK9RPYtuaUVn9tQxIUcFEdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729182990; c=relaxed/simple;
	bh=rgMdn3jjUjU6d12xeLRQW9UdKj1w8tafj0mLK+60A0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k31Mdjr6UhnyiFdbnA4QH0/V4YjLidC8giMkss6CnL2Hyt4ipNA+v7kYWl+ZH0GnvLOrjEwpCly+JatynoYypv+ep3HiRj0BrP1tWpA5wF3iB6rvxoJEYFQNCQTylO6f1s1Eo0USynLCwaEwzZfr7kQ8RWPgizDzyoSkMnQ4cbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=44386 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1t1TU5-00FPt3-R7; Thu, 17 Oct 2024 18:36:24 +0200
Date: Thu, 17 Oct 2024 18:36:20 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Florian Westphal <fw@strlen.de>
Cc: Antonio Ojea <antonio.ojea.garcia@gmail.com>, netfilter@vger.kernel.org
Subject: Re: Most optimal method to dump UDP conntrack entries
Message-ID: <ZxE8-pDn9Alzm50K@calendula>
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
 <20241017124632.GC12005@breakpoint.cc>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017124632.GC12005@breakpoint.cc>
X-Spam-Score: -1.8 (-)

On Thu, Oct 17, 2024 at 02:46:32PM +0200, Florian Westphal wrote:
> Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> > In the context of Kubernetes, when DNATing entries for UDP Services,
> > we need to deal with some edge cases where some UDP entries are left
> > orphaned but blackhole the traffic to the new endpoints.
> > 
> > At high level, the scenario is:
> > - Client IP_A sends UDP traffic to VirtualIP IP_B --> Kubernetes
> > Translates this to Endpoint IP_C
> > - Endpoint IP_C is replaced by Endpoint IP_D, but since Client IP_A
> > does not stop sending traffic, the conntrack entry IP_A IP_B --> IP_C
> > takes precedence and is being renewed, so traffic is not sent to the
> > new Endpoint IP_D and is lost.
> > 
> > To solve this problem, we have some heuristics to detect those
> > scenarios when the endpoints change and flush the conntrack entries,
> > however, since this is event based, if we lost the event that
> > triggered the problem or something happens that fails to clean up the
> > entry,  the user need to manually flush the entries.
> > 
> > We are implementing a new approach to solve this, we list all the UDP
> > conntrack entries using netlink, compare against the existing
> > programmed nftables/iptables rules, and flush the ones we know are
> > stale.
> > 
> > During the implementation review, the question [1] this raises is, how
> > impactful is it to dump all the conntrack entries each time we program
> > the iptables/nftables rules (this can be every 1s on nodes with a lot
> > of entries)?
> > Is this approach completely safe?
> > Should we try to read from procfs instead?
> 
> Walking all conntrack entries in 1s intervals is going to be slow, no
> matter the chosen interface.  Even doing the filtering in the kernel to
> not dump all entries but only those that match udp/port/ip criteria is
> not going to change it.
> 
> Also both proc and netlink dumps can miss entries (albeit its rare),
> if parallel insertions/deletes happen (which is normal on busy system).
> 
> I wonder why the appropriate delete requests cannot be done when the
> mapping is altered, I mean, you must have some code that issues
> either iptables -t nat -D ... or nft delete element ... or similar.
> 
> If you do that, why not also fire off the conntrack -D request
> afterwards?  Or are these publish/withdraw so frequent that this
> doesn't matter compared to poll based approach?
> 
> Something like
>    conntrack -D --protonum 17 --orig-dst $vserver --orig-port-dst 53 --reply-src $rserver --reply-port-src 5353
> 
> would zap everything to $rserver mapped to $vserver from client point of view.

This reminds me, it would be good to expand conntrack utility to use
the new kernel API to filter from kernel + delete.

I will try to get here.
