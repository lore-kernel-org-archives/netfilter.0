Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5117220DD62
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731403012; cv=none; b=VovsxyR4MBnToJRHXMib9cvhQOygW1iAvFLT1hULrUPsA9VfNrdyn1qyb6PcttwEFancOhQj7XstnQe1hzIafWUWJofv4nluAeamLq2rAjYivKucVBKgpvrSU1GE9pVolCX/Tt9kyKuQgEaELIc9oUQGT+TbH6qH6QeMvXmEfMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731403012; c=relaxed/simple;
	bh=ExTfibeRsMHzdyP2ShaOe4apW9oQM5HqHKWI1/SbLgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENEkIIBYs2QfxxoyAtdnO9Mpp5/fZBPwdzWxUOfUk2dG/3xSqf+Dp7C3Bwt0tOs9t6iJNXAWUmBaws6DYXgRV6Li/+X+ufRYSJIvHL4R/jLqTZOygd7th0tg4hNeCH8/rB59PynCq7kN8HJLfCQwvphPKHC9Ji8KamvfKahdwZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=41360 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tAn0s-0073A7-UQ; Tue, 12 Nov 2024 10:16:45 +0100
Date: Tue, 12 Nov 2024 10:16:41 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Florian Westphal <fw@strlen.de>
Cc: Antonio Ojea <antonio.ojea.garcia@gmail.com>, netfilter@vger.kernel.org
Subject: Re: Most optimal method to dump UDP conntrack entries
Message-ID: <ZzMc-e7NdC9-SL5W@calendula>
References: <CABhP=tZe2MDYJWqmyhb=we2g_v11wuDb6yBp878vt7qQYrvUiA@mail.gmail.com>
 <20241017124632.GC12005@breakpoint.cc>
 <ZxE8-pDn9Alzm50K@calendula>
 <CABhP=ta5FesHP+xnPq7UaiNvvorfGgPJZV9Xxdvk_-SLk7ZxEg@mail.gmail.com>
 <ZzHzTvYFOPcfWvRs@calendula>
 <20241111120946.GA13430@breakpoint.cc>
 <ZzH4mhspJvY6zTRA@calendula>
 <20241111125456.GA14363@breakpoint.cc>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241111125456.GA14363@breakpoint.cc>
X-Spam-Score: -1.9 (-)

On Mon, Nov 11, 2024 at 01:54:56PM +0100, Florian Westphal wrote:
> Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > On Mon, Nov 11, 2024 at 01:09:46PM +0100, Florian Westphal wrote:
> > > The time and effort needed to make something as basic as NAT
> > > work properly is jus silly.
> > > 
> > > Lets fix conntrack so this "just works".
> > 
> > Ok, then...
> > 
> > +static bool udp_ts_reply(struct nf_conn *ct, enum ip_conntrack_dir dir)
> > +{
> > +       bool is_reply = READ_ONCE(ct->proto.udp.last_dir) != dir;
> > +
> > +       if (is_reply)
> > +               WRITE_ONCE(ct->proto.udp.last_dir, dir);
> > +
> > +       return is_reply;
> > +}
> > 
> > ... if packet in the other direction is seen, then...
> > 
> > +       if (udp_ts_reply(ct, dir))
> > +               nf_ct_refresh_acct(ct, ctinfo, skb, extra);
> > 
> > ... conntrack entry is refreshed?
> 
> Yes.
> 
> > Will this work for, let's say, RTP traffic which goes over UDP and it
> > is unidirectional? Well, maybe you could occasionally see a RCTP
> > packet as reply to get statistics, but those could just not be
> > available.
> 
> We could add a || ct->master to the is_reply test.

Assuming SIP helper is in place, then yes.

> > I am not sure we can make assumptions on the direction like this, any
> > application protocol could run over UDP.
> 
> What about adding a CT template option to control the behaviour?

Maybe custom ct timeout policy can help instead? Or even extend the
timeout policy to support for the behaviour you want to put in place
(refresh timer only when packets are seen in both directions).

If user knows what application protocol runs over UDP in just port,
then they can define finer grain timeout policies accordingly.

> More work, but would avoid any compat concerns.

Agreed.

The UDP conntracker is already making assumptions by handling UDP
traffic as "stateful" based on default timeouts that were define back
in 1999 and that has been adjusted several times in the past.

Shrinking too much the timeouts could also lead to releasing NAT too
early, hence removing the NAT mapping too soon, it is hard to know the
implications of this wrt. to the application protocol.

Maybe Antonio can extend the requirements stub he provides, he
mentions the following scenarios:

- Conntrack entry removal for backends that are gone. Probably
  speeding up conntrack -D with the new CTA_FILTER support is
  sufficient to improve the situation. IIRC, a user reported from
  3 seconds to 0.5 to delete million of entries via CTA_FILTER.

- Service restart, ie. "reconcile" scenario, I think this is harder
  because IIUC this means userspace needs to compare the current
  configuration with the conntrack entries in the table and purge
  those that are stale?

I guess the concern is that assured flows cannot be expelled from the
conntrack table via early_drop, that is why an expedite cleanup is
important?

Thanks.
