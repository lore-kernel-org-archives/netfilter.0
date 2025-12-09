Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5852C2349
	for <netfilter@vger.kernel.org>; Tue,  9 Dec 2025 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765267111; cv=none; b=JJ8kkvm253fEU4P8nmuu4r29ixkIDS9kdJFPJyXt3P6/Fwxn/YD114SZQRPsnbx85oMJnQ7SGxiwr1nyYaGXeZSjuNw4kYrQ9z+YRooNuc+zEDLKT39ae4cu369+zvdwbjHHpDpXHVlydJRfqYzfRC4SVxdDGux3ixM0coASOd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765267111; c=relaxed/simple;
	bh=XuxaNrG4iHTngM90x7iL5gGm28cmPOvS8tY/c0M/E4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kTWwBZ7Ufl2lJY71RWrdc9ycHIfAEhh2DBWk2ollVw765wv3QJEsQ22dYcw8R6DVdTvp9UUPzUt8QMY3ispd4vmBg1ArMJZhGHcJ+AXFhgcGA6uM+lzyHAUQFZfcKqRXQfzochTfiVpe1hWvc0BPmNMtp3b6E4glqTm7i4DN/3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GbG/N/Zr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NkEHQ9E3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X3HYvriX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZXST4C5R; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GbG/N/Zr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NkEHQ9E3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X3HYvriX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZXST4C5R"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B3E2633796;
	Tue,  9 Dec 2025 07:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765267107; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoLjqVarGwon9YQWPPriNRjc1MwsPnU+rwGlRykKF6k=;
	b=GbG/N/ZrxyAiYJBuvBRIaiaWIbcYoXJahI08soTPqUYs/bW8rh+LTKfTM2NW2poIvCxr+H
	h9QrxVShkMSOWTlfxpJ/7rhePGquiYtH37mJ70TMf5dCT6jJhZzqTulSwMdK0nK8uNEC2A
	TKixyMxOVEjlsbhcDZDPAuScd49hBxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765267107;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoLjqVarGwon9YQWPPriNRjc1MwsPnU+rwGlRykKF6k=;
	b=NkEHQ9E3vFcsi3B+LIYvm+X3Lh09XRXCCOF79E4spbiN/ceVUTtagrFM/5tUMp6p6E7F48
	zxdWStMIdplhdKCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765267106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoLjqVarGwon9YQWPPriNRjc1MwsPnU+rwGlRykKF6k=;
	b=X3HYvriX0jz/+BKHIMAS2ktp7MkNiIJS1Tm5L5gJ0LZsiE9+Owp6di5I0Evwj3hELdRg74
	wJkKIqEjNkOnwSfLULeAkPi3oCed7lhJqcrhGbSejqK355UtlUeaYMnQO0Lap5uYh7Upq3
	8B6+07R2S4hJt7UPSs+KeAd66kzGI6k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765267106;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoLjqVarGwon9YQWPPriNRjc1MwsPnU+rwGlRykKF6k=;
	b=ZXST4C5RMjwuC6xoomvT9s/zq2CsMmkeM1tYSS2FHc7Ger7JKNtSyo2IvG/Dnw+/OixmLy
	Zn6fobHwMCgxMxDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 82FB83EA63;
	Tue,  9 Dec 2025 07:58:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2neVHqLWN2n9ZAAAD6G6ig
	(envelope-from <fmancera@suse.de>); Tue, 09 Dec 2025 07:58:26 +0000
Message-ID: <8952aa2a-5882-4653-b34a-cb08f537c5ec@suse.de>
Date: Tue, 9 Dec 2025 08:57:59 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: netfilter: nf_conncount: cpu soft lockup using limiting with Open
 vSwitch.
To: Odintsov Vladislav <VlOdintsov@k2.cloud>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>,
 "ovs-dev@openvswitch.org" <ovs-dev@openvswitch.org>
Cc: Kovalev Evgeniy <EvgKovalev@k2.cloud>,
 Vazhnetsov Anton <AVazhnetsov@k2.cloud>,
 Rukomoinikova Aleksandra <ARukomoinikova@k2.cloud>
References: <7a6872ce-8015-4397-bbe9-22108c65b7ec@k2.cloud>
 <f801e56e-eba5-460e-919a-3e839b1f9905@k2.cloud>
Content-Language: en-US
From: Fernando Fernandez Mancera <fmancera@suse.de>
In-Reply-To: <f801e56e-eba5-460e-919a-3e839b1f9905@k2.cloud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.26
X-Spam-Level: 
X-Spamd-Result: default: False [-4.26 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.16)[-0.803];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]

On 12/8/25 1:27 PM, Odintsov Vladislav wrote:
> On 08.12.2025 15:06, Rukomoinikova Aleksandra wrote:
>> Hi!
>> I was testing conntrack limiting using Open vSwitch and noticed the
>> following issue: under certain limits, a CPU lock occurred.
>>
>> [  491.682936] watchdog: BUG: soft lockup - CPU#1 stuck for 26s! [ovs-
>> dpctl:19437]
>>
>> This occurs during a high packet frequency when trying to get the set
>> limits through ovs-dpctl ct-get-limits.
>>
>> In the trace, I can see that the lock occurred on attempts to acquire a
>> spinlock.
>>
>> [  491.683056]  <IRQ>
>> [  491.683059]  _raw_spin_lock_bh+0x29/0x30
>> [  491.683064]  count_tree+0x19b/0x1f0 [nf_conncount]
>> [  491.683069]  ovs_ct_commit+0x196/0x490 [openvswitch]
>>
>> Prior to this, in the trace, there was processing of a task from
>> userspace (ovs-dpctl)
>>
>> [  491.683236]  </IRQ>
>> [  491.683237]  <TASK>
>> [  491.683238]  asm_common_interrupt+0x22/0x40
>> [  491.683240] RIP: 0010:nf_conncount_gc_list+0x18a/0x200 [nf_conncount]
>>
>> Inside the nf_conncount_gc_list function, a lock is taken on
>> nf_conncount.c:spin_trylock_bh(&list->list_lock):335. After this, the
>> not-so-fast __nf_conncount_gc_list function is executed. If, at this
>> moment, a packet interrupt arrives on the same сpu core (and
>> spin_trylock_bh doesn't disable interrupts on that core), then scenario
>> I encountered occurs: the first lock remains held, while the packet
>> interrupt also attempts to acquire it at
>> nf_conncount.c:spin_lock_bh(&rbconn->list.list_lock):502 while
>> committing to conntrack. This attempt fails, leading to a soft lockup.
>>

Yes that makes sense. That nf_conncount_gc_list() was added there to 
cover a different scenario which might be also affected by this soft 
lockup under the same conditions.

>> Hence my question: shouldn't we avoid calling nf_conncount_gc_list when
>> querying limits without an skb (as OVS does in openvswitch/
>> conntrack.c:1773)? The limit retrieval operation should be read-only
>> regarding the contract state, not involve potential modification.
>>
>> Like this:
>> --- a/net/netfilter/nf_conncount.c
>> +++ b/net/netfilter/nf_conncount.c
>> @@ -495,7 +495,6 @@ count_tree(struct net *net,
>>                int ret;
>>
>>                if (!skb) {
>> -                nf_conncount_gc_list(net, &rbconn->list);
>>                    return rbconn->list.count;
>>                }
>>

Let me think on something, I would like to provide a solution that is 
suitable for OVS + xt/nft_connlimit. Because this change would break 
some xt_connlimit use-cases. Also without this nf_conncount_gc_list(), 
the connection count wouldn't be accurate.. if some connections closed 
already the count number would still consider them..

Thanks for reporting it, I will let you know my findings on how to solve 
this :-)

Thanks,
Fernando.

>> Thanks!
>>
>> -- 
>> regards,
>> Alexandra.
>>
> 
> + ovs-dev ML

