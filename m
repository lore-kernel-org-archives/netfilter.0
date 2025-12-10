Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41531F872D
	for <netfilter@vger.kernel.org>; Wed, 10 Dec 2025 08:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765353858; cv=none; b=pWaUubSbL+reYBt/DY6gUL6XWNGS4EEkbvXj7gGRbSwU/9BFwSpPEqViufsXJ4KHaQ4Y6ClCNM3gywr+M6MGVi25IQd9bBdSkVKu54g23SJPDT73E9trOs65jJ8jnUkvLvCprBoo7UsGK01iHrv9nfxvYYcSp2v+IytU52kgkg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765353858; c=relaxed/simple;
	bh=+/kYlsL5OhmbZu4S0M8Ob6brFWyZEBoQfuREcSCp/CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGFc+zvUN9IQ0MxVwuEpQMWLwufjY/YvxMwsWOIwQwt0SLe5h0gYY46tILkbdxt40ECOv3UjQL8qFESzEX6V6KV0tXU/K/tFMK9MwRZdpj1XFqHAdvlR2ViC2tSeXZorY0w2OmRdcJO7dsQOk+oKTSa2TJ2EABo9gg66p67qE00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ywq3DP+m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9PXg/exU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ywq3DP+m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9PXg/exU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ywq3DP+m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9PXg/exU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ywq3DP+m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9PXg/exU"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C65A65BDE7;
	Wed, 10 Dec 2025 08:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765353854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0gQDZtFHba98o4HYVOjwaTOIhQJBoUBS0Fje4gQftaA=;
	b=Ywq3DP+mUYTunXejU54ddfwXV35+tVN8ZH//mclCM530KBHvHI7gjksc2kfHYTCh8fsJu9
	XyUXxBOhkJL62w7uNbsVHWWCnKp/4wIWkpaSbCYn6bX6xSgTBHhVPJUNMqtzCmT32hMDvM
	XjWgW4BNpS86AvcNM9uzgNVCWIBRpxc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765353854;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0gQDZtFHba98o4HYVOjwaTOIhQJBoUBS0Fje4gQftaA=;
	b=9PXg/exUcL9O3ae6LFxXm1AUhNBUlIeU71t7FnZ0DbEh97xM4nfeDqeebuIjxgf4q6s1g8
	Wsm3YiUBvdNsQSDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765353854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0gQDZtFHba98o4HYVOjwaTOIhQJBoUBS0Fje4gQftaA=;
	b=Ywq3DP+mUYTunXejU54ddfwXV35+tVN8ZH//mclCM530KBHvHI7gjksc2kfHYTCh8fsJu9
	XyUXxBOhkJL62w7uNbsVHWWCnKp/4wIWkpaSbCYn6bX6xSgTBHhVPJUNMqtzCmT32hMDvM
	XjWgW4BNpS86AvcNM9uzgNVCWIBRpxc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765353854;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0gQDZtFHba98o4HYVOjwaTOIhQJBoUBS0Fje4gQftaA=;
	b=9PXg/exUcL9O3ae6LFxXm1AUhNBUlIeU71t7FnZ0DbEh97xM4nfeDqeebuIjxgf4q6s1g8
	Wsm3YiUBvdNsQSDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 785263EA63;
	Wed, 10 Dec 2025 08:04:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 95LIG34pOWkIBAAAD6G6ig
	(envelope-from <fmancera@suse.de>); Wed, 10 Dec 2025 08:04:14 +0000
Message-ID: <6202915d-5129-4e48-aff3-c20446925406@suse.de>
Date: Wed, 10 Dec 2025 09:03:57 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: netfilter: nf_conncount: cpu soft lockup using limiting with Open
 vSwitch.
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Odintsov Vladislav <VlOdintsov@k2.cloud>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>,
 "ovs-dev@openvswitch.org" <ovs-dev@openvswitch.org>,
 Kovalev Evgeniy <EvgKovalev@k2.cloud>,
 Vazhnetsov Anton <AVazhnetsov@k2.cloud>,
 Rukomoinikova Aleksandra <ARukomoinikova@k2.cloud>
References: <7a6872ce-8015-4397-bbe9-22108c65b7ec@k2.cloud>
 <f801e56e-eba5-460e-919a-3e839b1f9905@k2.cloud>
 <8952aa2a-5882-4653-b34a-cb08f537c5ec@suse.de> <aTfg8A3QHDKqXxuY@chamomile>
Content-Language: en-US
From: Fernando Fernandez Mancera <fmancera@suse.de>
In-Reply-To: <aTfg8A3QHDKqXxuY@chamomile>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.26 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.16)[-0.807];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.26


On 12/9/25 9:42 AM, Pablo Neira Ayuso wrote:
> On Tue, Dec 09, 2025 at 08:57:59AM +0100, Fernando Fernandez Mancera wrote:
>> On 12/8/25 1:27 PM, Odintsov Vladislav wrote:
>>> On 08.12.2025 15:06, Rukomoinikova Aleksandra wrote:
>>>> Hi!
>>>> I was testing conntrack limiting using Open vSwitch and noticed the
>>>> following issue: under certain limits, a CPU lock occurred.
>>>>
>>>> [  491.682936] watchdog: BUG: soft lockup - CPU#1 stuck for 26s! [ovs-
>>>> dpctl:19437]
>>>>
>>>> This occurs during a high packet frequency when trying to get the set
>>>> limits through ovs-dpctl ct-get-limits.
>>>>
>>>> In the trace, I can see that the lock occurred on attempts to acquire a
>>>> spinlock.
>>>>
>>>> [  491.683056]  <IRQ>
>>>> [  491.683059]  _raw_spin_lock_bh+0x29/0x30
>>>> [  491.683064]  count_tree+0x19b/0x1f0 [nf_conncount]
>>>> [  491.683069]  ovs_ct_commit+0x196/0x490 [openvswitch]
>>>>
>>>> Prior to this, in the trace, there was processing of a task from
>>>> userspace (ovs-dpctl)
>>>>
>>>> [  491.683236]  </IRQ>
>>>> [  491.683237]  <TASK>
>>>> [  491.683238]  asm_common_interrupt+0x22/0x40
>>>> [  491.683240] RIP: 0010:nf_conncount_gc_list+0x18a/0x200 [nf_conncount]
>>>>
>>>> Inside the nf_conncount_gc_list function, a lock is taken on
>>>> nf_conncount.c:spin_trylock_bh(&list->list_lock):335. After this, the
>>>> not-so-fast __nf_conncount_gc_list function is executed. If, at this
>>>> moment, a packet interrupt arrives on the same сpu core (and
>>>> spin_trylock_bh doesn't disable interrupts on that core), then scenario
>>>> I encountered occurs: the first lock remains held, while the packet
>>>> interrupt also attempts to acquire it at
>>>> nf_conncount.c:spin_lock_bh(&rbconn->list.list_lock):502 while
>>>> committing to conntrack. This attempt fails, leading to a soft lockup.
>>>>
>>
>> Yes that makes sense. That nf_conncount_gc_list() was added there to cover a
>> different scenario which might be also affected by this soft lockup under
>> the same conditions.
> 
> See below, a quick browsing tells me OVS forgot to disable BH to
> perform this GC.
> 
>>>> Hence my question: shouldn't we avoid calling nf_conncount_gc_list when
>>>> querying limits without an skb (as OVS does in openvswitch/
>>>> conntrack.c:1773)? The limit retrieval operation should be read-only
>>>> regarding the contract state, not involve potential modification.
>>>>
>>>> Like this:
>>>> --- a/net/netfilter/nf_conncount.c
>>>> +++ b/net/netfilter/nf_conncount.c
>>>> @@ -495,7 +495,6 @@ count_tree(struct net *net,
>>>>                 int ret;
>>>>
>>>>                 if (!skb) {
>>>> -                nf_conncount_gc_list(net, &rbconn->list);
>>>>                     return rbconn->list.count;
>>>>                 }
>>>>
>>
>> Let me think on something, I would like to provide a solution that is
>> suitable for OVS + xt/nft_connlimit. Because this change would break some
>> xt_connlimit use-cases. Also without this nf_conncount_gc_list(), the
>> connection count wouldn't be accurate.. if some connections closed already
>> the count number would still consider them..
> 
> Side note, this particular line only affects OVS, which is the only
> caller passing NULL as skb:
> 
> net/netfilter/xt_connlimit.c:   connections = nf_conncount_count_skb(net, skb, xt_family(par), info->data, key);
> net/openvswitch/conntrack.c:    connections = nf_conncount_count_skb(net, skb, info->family,
> net/openvswitch/conntrack.c:    zone_limit.count = nf_conncount_count_skb(net, NULL, 0, data,
> 
> Another relevant aspect: nf_conncount_gc_list() is called _without_
> disabling BH (before recent Fernando's changes).
> 
> You fix it here, Fernando:
> 
> commit c0362b5748282e22fa1592a8d3474f726ad964c2
> Author: Fernando Fernandez Mancera <fmancera@suse.de>
> Date:   Fri Nov 21 01:14:31 2025 +0100
>   
>      netfilter: nf_conncount: make nf_conncount_gc_list() to disable BH
> 
> I think it is only a matter of backporting it to -stable.

That is right, thanks Pablo. Just a note, that commit doesn't have a 
fixes tag because I just did it to simplify its use so it won't be 
picked automatically.. should we send a request to stable mailing list?

Thanks,
Fernando.
