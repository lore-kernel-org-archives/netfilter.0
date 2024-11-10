Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57098157472
	for <netfilter@vger.kernel.org>; Sun, 10 Nov 2024 21:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731275406; cv=none; b=JTePXeUzOcn2A8kqvfFg9/XYJuqoqx81t3RXrI3gLErzTJNq6qXRQJ7e/gA2KrWjX5gs4PLg1vp7DqG4F0uX7gJbf2zNv+KzoflWy0RinShadWoqgewcozs+D4TKiy6cvrVnKDfEH1lwIAOCwVK6OrjowLW8FzLWjQkHBg4SL0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731275406; c=relaxed/simple;
	bh=LXJ7SbQGlbFvvAh6mTaB8jrw9xto0epzxiFdWw6fkw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKDw9B/jBDav2S56HAGl5/J6dWWEdFryuOrlLHbZX8+lSCLpy1ngA8mUGk4EddD6sOo9EMXgF4Y3e4hbbUGhZ4zw55VjXFUBfOz5TgpveL9/I5oKR52au4iDu5xaXiZ+Qgb0ZYYdEI/ozhZiCWBHDa15ITJcVPQ/eHsjv6CD4tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tAFon-0006rF-LV; Sun, 10 Nov 2024 22:50:01 +0100
Date: Sun, 10 Nov 2024 22:50:01 +0100
From: Florian Westphal <fw@strlen.de>
To: Florian Westphal <fw@strlen.de>
Cc: Antonio Ojea <antonio.ojea.garcia@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org
Subject: Re: Most optimal method to dump UDP conntrack entries
Message-ID: <20241110215001.GB25943@breakpoint.cc>
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
 <20241017124632.GC12005@breakpoint.cc>
 <ZxE8-pDn9Alzm50K@calendula>
 <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
 <20241017233031.GA3675@breakpoint.cc>
 <CABhP=tY=YnMPSMH0-T2oxHyE2Uzoy=RnHQmO4DRQ_Go8xzMGeg@mail.gmail.com>
 <20241018113318.GA28324@breakpoint.cc>
 <CABhP=tZronr5azSE9mrr+hTKWFVb41jYQ2FzoWDahwVf1Zt4zQ@mail.gmail.com>
 <20241021135342.GB15761@breakpoint.cc>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021135342.GB15761@breakpoint.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)

Florian Westphal <fw@strlen.de> wrote:
> Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> > On Fri, 18 Oct 2024 at 13:33, Florian Westphal <fw@strlen.de> wrote:
> > > Same as what happens now, 2nd packet follows NAT mapping of first one.
> > 
> > This looks like the way to go ... if you can send me a patch I can do
> > some testing next week and report back
> 
> Here is a better patch, renew only when responses are seen.
> This means that once either initiator or responder ceases to send
> packets entry will time out.
> 
> Subject: netfilter: nf_conntrack_proto_udp: renew timeout only for bidirectional traffic

Ping.  Did you have a chance to test this?
