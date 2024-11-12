Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BDA2038C7
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 16:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731428347; cv=none; b=JgpAcvWEnv2CjkCaqdd3zYfc/pfoC6R8jJ/dZyDiLTBNV3A7pQJ+yIY+6bd99XpywSZ9nXa9lX2ZAXPkQHM/Q9MVYM3iSNImKTPo71DToL/KBbkCFWk8F7S5pdDaVM30zsTRFoPdCplxhvkyp/N/xlUDvDJCs6BxdBziTnFVI9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731428347; c=relaxed/simple;
	bh=h5j4ubIo3op1XvkDXGbi6cd106cNYtdoU8uqD1ylIME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxzgA9cLPqeNx5K9JGrs8X7v0ze7Z1b3kuTIslJp2i2BL+++fVQqeb/E1gJt0Y+q4jYqkTw6jNeyH8kigzlDadHrv3gHaDDpNin06Srn1JzqJfgjTmD5PUoxgR04F+9Ra6hXwRh54QMNHb1//pX8aClDFOYiYz/P6CsJcwfzBVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tAtbT-0006ex-Sq; Tue, 12 Nov 2024 17:18:55 +0100
Date: Tue, 12 Nov 2024 17:18:55 +0100
From: Florian Westphal <fw@strlen.de>
To: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Subject: Re: Most optimal method to dump UDP conntrack entries
Message-ID: <20241112161855.GA24085@breakpoint.cc>
References: <20241017124632.GC12005@breakpoint.cc>
 <ZxE8-pDn9Alzm50K@calendula>
 <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
 <ZzHzTvYFOPcfWvRs@calendula>
 <20241111120946.GA13430@breakpoint.cc>
 <ZzH4mhspJvY6zTRA@calendula>
 <20241111125456.GA14363@breakpoint.cc>
 <ZzMc-e7NdC9-SL5W@calendula>
 <ZzMdzP6KP-kVAhd5@calendula>
 <CABhP=tZKpaJ4qB9WGxjsDrqgC4-CUkrh-Pm=KamtcGyXCvfgiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABhP=tZKpaJ4qB9WGxjsDrqgC4-CUkrh-Pm=KamtcGyXCvfgiA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> On Tue, 12 Nov 2024 at 02:20, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> >
> > On Tue, Nov 12, 2024 at 10:16:45AM +0100, Pablo Neira Ayuso wrote:
> > > I guess the concern is that assured flows cannot be expelled from the
> > > conntrack table via early_drop, that is why an expedite cleanup is
> > > important?
> >
> > Actually, the issue is that packets could end up in a backend which
> > does not exist after re-configuration, therefore, removing the entry
> > need to happen so ongoing flow have a chance to talk to another
> > (different) backend.
> 
> Please take a look to this kselftest attached that emulates the
> problematic behavior in kubernetes,
> 
> I think that in UDP the nat rule should take precedence over the
> conntrack entry,on the contrary to TCP where it is important to
> preserve the session if it has been established.

Why? The peer is even alive in your test; from your initial description
I thought this was about 'peer stops responding, but udp conntrack
remains alive forever due to client-probes'.

This is just silly, we can't make a change to auto-toss all mappings
on a nat rule change.

What do you do when someone uses random sampling and refreshes the
mapping table?

Kernel doesn't know what kind of upper layer protocol is used, what
if its a stateful protocol that breaks when you packets get steered
somewhere else mid-stream?

Did you evaluate use of stateless NAT for your use case?  That would
follow rules 1:1 and thus break depending on the protocol expectations,
or not.

For insanity like this I think we really can't do anything except offer
an efficient conntrack table flush mechanism to avoid any loop in
userspace.
