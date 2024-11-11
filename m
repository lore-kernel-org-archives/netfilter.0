Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F0418BBA2
	for <netfilter@vger.kernel.org>; Mon, 11 Nov 2024 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731328162; cv=none; b=nHz0OIAv4gRsrCK5UDtMGSxX+mf0G9hpAWMmTBv/Iw1NoBroAuRsYxMWcGPEl1EG4bUwVQOnMc8hjBE/oXBqo9cETSaPxCWN2RcsvupiqFlvOcsOJfIwqTuWXYIKWB25A6782a8aRYQR7XzJiyMwn34yFuiCAizd45p5RtgDd7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731328162; c=relaxed/simple;
	bh=Ulj6kLcZFdfDQsoIbMi7YJR5T10wgf5v1XYsnyAabJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pst/zq/wXyu5uIX8KYCR00YUD7bMaEG2w2jCBwx/jQNYjcX7L3dIRqPxJ+F/UxC8C4QA4pivV6IqTBKZ7olF3dst2HnxmPxtl4j9FgfvCOZkO/o3K8QWvD4tiiCwVdX4CFoqg+W+Vg5uRIfCJC5e/0z3O3sAmQoTEMgbMw8jDiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=59844 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tATXf-0022pD-Hn; Mon, 11 Nov 2024 13:29:18 +0100
Date: Mon, 11 Nov 2024 13:29:14 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Florian Westphal <fw@strlen.de>
Cc: Antonio Ojea <antonio.ojea.garcia@gmail.com>, netfilter@vger.kernel.org
Subject: Re: Most optimal method to dump UDP conntrack entries
Message-ID: <ZzH4mhspJvY6zTRA@calendula>
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
 <20241017124632.GC12005@breakpoint.cc>
 <ZxE8-pDn9Alzm50K@calendula>
 <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
 <ZzHzTvYFOPcfWvRs@calendula>
 <20241111120946.GA13430@breakpoint.cc>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241111120946.GA13430@breakpoint.cc>
X-Spam-Score: -1.9 (-)

On Mon, Nov 11, 2024 at 01:09:46PM +0100, Florian Westphal wrote:
> Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > > This is how it is implemented today and it works, but it does not
> > > handle process restarts per example, or is not resilient to errors.
> > > The implementation is also much more complex because we need to
> > > implement all the possible edge cases that can leave stale entries
> > 
> > It should also be possible to shrink timeouts on restart via conntrack -U
> > which would be similar to the approach that Florian is proposing, but from
> > control plane rather than updating existing UDP timeout policy.
> 
> The time and effort needed to make something as basic as NAT
> work properly is jus silly.
> 
> Lets fix conntrack so this "just works".

Ok, then...

+static bool udp_ts_reply(struct nf_conn *ct, enum ip_conntrack_dir dir)
+{
+       bool is_reply = READ_ONCE(ct->proto.udp.last_dir) != dir;
+
+       if (is_reply)
+               WRITE_ONCE(ct->proto.udp.last_dir, dir);
+
+       return is_reply;
+}

... if packet in the other direction is seen, then...

+       if (udp_ts_reply(ct, dir))
+               nf_ct_refresh_acct(ct, ctinfo, skb, extra);

... conntrack entry is refreshed?

Will this work for, let's say, RTP traffic which goes over UDP and it
is unidirectional? Well, maybe you could occasionally see a RCTP
packet as reply to get statistics, but those could just not be
available.

I am not sure we can make assumptions on the direction like this, any
application protocol could run over UDP.
