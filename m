Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640A221ABD0
	for <netfilter@vger.kernel.org>; Tue,  9 Dec 2025 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765269759; cv=none; b=i8DYDXjzByIE7Ipn+vogqzwCmZaI059XuCA2rQHLafI78JAQCPBm5fpkecvjgTf7qlYWpP2NwtzZnBi/cVWebcmT6iR7ChDY9WKDAJG47RDxyH5qHtGoar2oeEZuNxFWdypXC6KxcnME9Je1CVJvyoDHR1zQYz+xySvdqhHQu7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765269759; c=relaxed/simple;
	bh=2TBQH5T/X9y9wDslYrFE7tB6pU7cGrbydFD/p8u/ces=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJJDNohviSQFn6Ty/8nRceJsiCsFSbsOm1WT04RkSkOGJuePOqfE/hGJKRqbmGxfsHlh9LPTUnPQN+T4oOaCQYIYrWGp+PD8G3FFTiU6ZxqA+reeRrT4tHoVP0T5pj6SqygmwxGepOizpKoQb5YnPZfL3pRbVRuqFyhLdprPM+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=OERiO+K5; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="OERiO+K5"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 27D416070C;
	Tue,  9 Dec 2025 09:42:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1765269747;
	bh=AR6oWminPeQ3omUHQ56+cWRUCs3YpN+CEiiXU1HX+lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OERiO+K5qKeqUyMVtDFFFwHvxiMXh5vtyxKzXtxdrvCwejH3u837jqnGniGzkYJZx
	 OPJr7+bXFrNWDjDICjITwh0SKJ0KPTLIb7WyHlgega75bpJ0LV8PHEIvA3eBqxoozq
	 +bm6t4ZYeRdpAvV/LtaUMwJO7hjc4LW6VbF1V+XzczIxhnk2FW1Bnpj9Rlko2UNGRG
	 cQgie1dEsuq6cC0OXvtMULCv/JPOlX+H2elvJhlPS0ZjKymvAHYwAjNsd/V4wWHKzX
	 YsyphzIcMZQN2kyyyE7uktcM3sOwmaUiSZ1UMLWa1iVv3ZZ4th6JxRwISyYwbm4zX/
	 loEl++feceksw==
Date: Tue, 9 Dec 2025 09:42:24 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: Odintsov Vladislav <VlOdintsov@k2.cloud>,
	"netfilter@vger.kernel.org" <netfilter@vger.kernel.org>,
	"ovs-dev@openvswitch.org" <ovs-dev@openvswitch.org>,
	Kovalev Evgeniy <EvgKovalev@k2.cloud>,
	Vazhnetsov Anton <AVazhnetsov@k2.cloud>,
	Rukomoinikova Aleksandra <ARukomoinikova@k2.cloud>
Subject: Re: netfilter: nf_conncount: cpu soft lockup using limiting with
 Open vSwitch.
Message-ID: <aTfg8A3QHDKqXxuY@chamomile>
References: <7a6872ce-8015-4397-bbe9-22108c65b7ec@k2.cloud>
 <f801e56e-eba5-460e-919a-3e839b1f9905@k2.cloud>
 <8952aa2a-5882-4653-b34a-cb08f537c5ec@suse.de>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8952aa2a-5882-4653-b34a-cb08f537c5ec@suse.de>

On Tue, Dec 09, 2025 at 08:57:59AM +0100, Fernando Fernandez Mancera wrote:
> On 12/8/25 1:27 PM, Odintsov Vladislav wrote:
> > On 08.12.2025 15:06, Rukomoinikova Aleksandra wrote:
> > > Hi!
> > > I was testing conntrack limiting using Open vSwitch and noticed the
> > > following issue: under certain limits, a CPU lock occurred.
> > > 
> > > [  491.682936] watchdog: BUG: soft lockup - CPU#1 stuck for 26s! [ovs-
> > > dpctl:19437]
> > > 
> > > This occurs during a high packet frequency when trying to get the set
> > > limits through ovs-dpctl ct-get-limits.
> > > 
> > > In the trace, I can see that the lock occurred on attempts to acquire a
> > > spinlock.
> > > 
> > > [  491.683056]  <IRQ>
> > > [  491.683059]  _raw_spin_lock_bh+0x29/0x30
> > > [  491.683064]  count_tree+0x19b/0x1f0 [nf_conncount]
> > > [  491.683069]  ovs_ct_commit+0x196/0x490 [openvswitch]
> > > 
> > > Prior to this, in the trace, there was processing of a task from
> > > userspace (ovs-dpctl)
> > > 
> > > [  491.683236]  </IRQ>
> > > [  491.683237]  <TASK>
> > > [  491.683238]  asm_common_interrupt+0x22/0x40
> > > [  491.683240] RIP: 0010:nf_conncount_gc_list+0x18a/0x200 [nf_conncount]
> > > 
> > > Inside the nf_conncount_gc_list function, a lock is taken on
> > > nf_conncount.c:spin_trylock_bh(&list->list_lock):335. After this, the
> > > not-so-fast __nf_conncount_gc_list function is executed. If, at this
> > > moment, a packet interrupt arrives on the same сpu core (and
> > > spin_trylock_bh doesn't disable interrupts on that core), then scenario
> > > I encountered occurs: the first lock remains held, while the packet
> > > interrupt also attempts to acquire it at
> > > nf_conncount.c:spin_lock_bh(&rbconn->list.list_lock):502 while
> > > committing to conntrack. This attempt fails, leading to a soft lockup.
> > > 
> 
> Yes that makes sense. That nf_conncount_gc_list() was added there to cover a
> different scenario which might be also affected by this soft lockup under
> the same conditions.

See below, a quick browsing tells me OVS forgot to disable BH to
perform this GC.

> > > Hence my question: shouldn't we avoid calling nf_conncount_gc_list when
> > > querying limits without an skb (as OVS does in openvswitch/
> > > conntrack.c:1773)? The limit retrieval operation should be read-only
> > > regarding the contract state, not involve potential modification.
> > > 
> > > Like this:
> > > --- a/net/netfilter/nf_conncount.c
> > > +++ b/net/netfilter/nf_conncount.c
> > > @@ -495,7 +495,6 @@ count_tree(struct net *net,
> > >                int ret;
> > > 
> > >                if (!skb) {
> > > -                nf_conncount_gc_list(net, &rbconn->list);
> > >                    return rbconn->list.count;
> > >                }
> > > 
> 
> Let me think on something, I would like to provide a solution that is
> suitable for OVS + xt/nft_connlimit. Because this change would break some
> xt_connlimit use-cases. Also without this nf_conncount_gc_list(), the
> connection count wouldn't be accurate.. if some connections closed already
> the count number would still consider them..

Side note, this particular line only affects OVS, which is the only
caller passing NULL as skb:

net/netfilter/xt_connlimit.c:   connections = nf_conncount_count_skb(net, skb, xt_family(par), info->data, key);
net/openvswitch/conntrack.c:    connections = nf_conncount_count_skb(net, skb, info->family,
net/openvswitch/conntrack.c:    zone_limit.count = nf_conncount_count_skb(net, NULL, 0, data,

Another relevant aspect: nf_conncount_gc_list() is called _without_
disabling BH (before recent Fernando's changes).

You fix it here, Fernando:

commit c0362b5748282e22fa1592a8d3474f726ad964c2
Author: Fernando Fernandez Mancera <fmancera@suse.de>
Date:   Fri Nov 21 01:14:31 2025 +0100
 
    netfilter: nf_conncount: make nf_conncount_gc_list() to disable BH

I think it is only a matter of backporting it to -stable.
