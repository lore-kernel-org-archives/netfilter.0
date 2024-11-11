Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C323919DF44
	for <netfilter@vger.kernel.org>; Mon, 11 Nov 2024 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731329701; cv=none; b=h2Tygjkb6Lwu3fE8kb3/W6mZyBiOOuoCWmfnq0AVNTqJyWnfZzoUYNnvwuBln8cQxv8y+maL+KaksGo2wHHukW50w2e1AHW25uYeUm7m7AFBIYxW1v9wHzN7mOP2pKjwKzGD2CmVkVjxSoOCCurok1UH0d7QGmAreVMuwjx/cIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731329701; c=relaxed/simple;
	bh=A4ucUM4l43ol4ayQwTstBwhkbidjnKEOxmms2qgIi5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHACWRihlger92QWBorpLon4JmklJk7Jv2wFJTw/u3CnpAD08D/xvkoaOwjPCMPB4vJrDOcNdDe7RdpcM1IwjXEN1GHSKDCOvtTgrIujOAPXhsTZpq2Vu3jYcGzjQF9UGmSanzkHsZl3Q9bkcDubtXhJ1RzZnlrEAH5yUzcur1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tATwW-0003ok-F1; Mon, 11 Nov 2024 13:54:56 +0100
Date: Mon, 11 Nov 2024 13:54:56 +0100
From: Florian Westphal <fw@strlen.de>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>,
	Antonio Ojea <antonio.ojea.garcia@gmail.com>,
	netfilter@vger.kernel.org
Subject: Re: Most optimal method to dump UDP conntrack entries
Message-ID: <20241111125456.GA14363@breakpoint.cc>
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
 <20241017124632.GC12005@breakpoint.cc>
 <ZxE8-pDn9Alzm50K@calendula>
 <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
 <ZzHzTvYFOPcfWvRs@calendula>
 <20241111120946.GA13430@breakpoint.cc>
 <ZzH4mhspJvY6zTRA@calendula>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzH4mhspJvY6zTRA@calendula>
User-Agent: Mutt/1.10.1 (2018-07-13)

Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> On Mon, Nov 11, 2024 at 01:09:46PM +0100, Florian Westphal wrote:
> > The time and effort needed to make something as basic as NAT
> > work properly is jus silly.
> > 
> > Lets fix conntrack so this "just works".
> 
> Ok, then...
> 
> +static bool udp_ts_reply(struct nf_conn *ct, enum ip_conntrack_dir dir)
> +{
> +       bool is_reply = READ_ONCE(ct->proto.udp.last_dir) != dir;
> +
> +       if (is_reply)
> +               WRITE_ONCE(ct->proto.udp.last_dir, dir);
> +
> +       return is_reply;
> +}
> 
> ... if packet in the other direction is seen, then...
> 
> +       if (udp_ts_reply(ct, dir))
> +               nf_ct_refresh_acct(ct, ctinfo, skb, extra);
> 
> ... conntrack entry is refreshed?

Yes.

> Will this work for, let's say, RTP traffic which goes over UDP and it
> is unidirectional? Well, maybe you could occasionally see a RCTP
> packet as reply to get statistics, but those could just not be
> available.

We could add a || ct->master to the is_reply test.

> I am not sure we can make assumptions on the direction like this, any
> application protocol could run over UDP.

What about adding a CT template option to control the behaviour?

More work, but would avoid any compat concerns.
