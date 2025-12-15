Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A31D326D77
	for <netfilter@vger.kernel.org>; Mon, 15 Dec 2025 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765813141; cv=none; b=CTuJpCMF/l1MsMydWw1MORKry2uxqePHtaOWbhQs8Tob7ryH6p+q8pgJkszEBduS8BTCnyHYs3mdWn9ddSOels5+W6H3Ot0xmqP3uIJ+CRDk+uSmyOONjQj5EbXUrLUAJZp70bLfKADgBLGIAJ2tqQK6mVUY81u4fDhVFFl9QJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765813141; c=relaxed/simple;
	bh=C11ynrESZe6r7h0FvXPzySXygrNPAfRgPD7H+FKII48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTbvGFvTP8bxqAUyLV+K72TIgqekfLlzRYDmVMDmaE7P1NLowe7QKTWFSBIFedU+IwzxzFWJ2bFWNOcpeIJchVXbJZFltOzDGm54J/56z1bsKvcrQ6K3UK7ddEuxaj6nGJPFueEr4GIMLdZI2WTROapbRDrDXweb+9RDDgmSDcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CljLJfCC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yLEa6uNO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qVU9q82w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xHiO3TmH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CljLJfCC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yLEa6uNO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qVU9q82w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xHiO3TmH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DFCCE33773;
	Mon, 15 Dec 2025 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765813137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RU8PvWRaKPY8aX6qYLWq9QbsLUW4uzPPJ7jYuq2Y100=;
	b=CljLJfCCFYE3AaQtZgoAu0LIJLGHIYJKhk8xARbHp9MstfDAm9BLcYChdwT2r/UTRS8iad
	tNFvYfDSBsSiwvs9gJmIJm9UQWoSM5Ka3FI7s7HFHWCZtMxeaOe/BL8G0ZQ61mjeH+BR1Z
	dGkL8t+Q6L/rJ7TgorsFfe4x5bZHTGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765813137;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RU8PvWRaKPY8aX6qYLWq9QbsLUW4uzPPJ7jYuq2Y100=;
	b=yLEa6uNOlndl1WuMZcxduhzCAUHwm1KGii+3Aj+iwz6SyancC+j+czTHqKD8w2kjsnEQYb
	7JbsTKqS+OU61eBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qVU9q82w;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xHiO3TmH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765813135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RU8PvWRaKPY8aX6qYLWq9QbsLUW4uzPPJ7jYuq2Y100=;
	b=qVU9q82wgt0LwokDGA7fQqHNwluker+ak8J5uLF5VeiLECsvan3q0qqXgQkFNHeFqJDby2
	L52+0HNXmtnDz9sEdoO2G0Y9sE1qldMR/+6bmQOr6uLMHihw7WPDFeh+vv8kWGMJbSA0QY
	I2nwFvW/XPgEFTuGJSKssJ+ny4kVeIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765813135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RU8PvWRaKPY8aX6qYLWq9QbsLUW4uzPPJ7jYuq2Y100=;
	b=xHiO3TmH75xB+oAI0TkLcBycEWVKTe5LO9BdWXqJpmJPXfV478zizSVhi258LVMlSEO0+O
	yb0YwL5ftxlUU9Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 75A543EA63;
	Mon, 15 Dec 2025 15:38:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dgK9GY8rQGkWYAAAD6G6ig
	(envelope-from <fmancera@suse.de>); Mon, 15 Dec 2025 15:38:55 +0000
Message-ID: <05f20da8-13c2-45d4-b029-95efe8c07acf@suse.de>
Date: Mon, 15 Dec 2025 16:38:27 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: netfilter: nf_conncount: cpu soft lockup using limiting with Open
 vSwitch.
To: Rukomoinikova Aleksandra <ARukomoinikova@k2.cloud>,
 Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Odintsov Vladislav <VlOdintsov@k2.cloud>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>,
 "ovs-dev@openvswitch.org" <ovs-dev@openvswitch.org>,
 Kovalev Evgeniy <EvgKovalev@k2.cloud>,
 Vazhnetsov Anton <AVazhnetsov@k2.cloud>
References: <7a6872ce-8015-4397-bbe9-22108c65b7ec@k2.cloud>
 <f801e56e-eba5-460e-919a-3e839b1f9905@k2.cloud>
 <8952aa2a-5882-4653-b34a-cb08f537c5ec@suse.de> <aTfg8A3QHDKqXxuY@chamomile>
 <6202915d-5129-4e48-aff3-c20446925406@suse.de>
 <b2064e7b-0776-4e14-adb6-c68080987471@k2.cloud>
 <46357175-2d8b-4d93-9c9b-20bbd51408d9@suse.de>
 <d524f896-44cc-4a61-8ee1-fdf3a9d933d9@k2.cloud>
Content-Language: en-US
From: Fernando Fernandez Mancera <fmancera@suse.de>
In-Reply-To: <d524f896-44cc-4a61-8ee1-fdf3a9d933d9@k2.cloud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: DFCCE33773
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 



On 12/15/25 12:07 PM, Rukomoinikova Aleksandra wrote:
> On 15.12.2025 14:00, Fernando Fernandez Mancera wrote:
>> On 12/12/25 10:27 PM, Rukomoinikova Aleksandra wrote:
>>> Hi one more time! I found another issue. I'll describe it below.
>>>
>>> In my opinion, it's relevant after merging [1]  I saw that a fix for
>>> this commit was merged last week, but but it doesn't fix case I'll
>>> describe below.
>>>
>>
>> Just to be sure, you have tested this with the latest mainline kernel,
>> right? Because as you mentioned we merged several fixes addressing
>> outdated counts.
> HI! yes
>>
>>> I create limits via Open vSwitch and run a TCP flood this way: hping3 -S
>>> -I host -p 10880 -i u5 10.255.41.101 -c 100 (Here, -i u5 is important,
>>> meaning with timers < jiffies; it's more likely the issue won't
>>> reproduce otherwise)
>>>  And I set the following limit on the zone where these connections
>>> arrive: ovs-dpctl ct-set-limits zone=9,limit=100
>>>
>>> I start traffic, I see traffic on the interface: TCP SYN -> TCP SYN+ACK
>>> -> TCP RST. Zone 9 overflows, but connections immediately become CLOSED.
>>> I run hping3 again: hping3 -S -I host -p 10880 -i u5 10.255.41.101 -c
>>> 100 - I don't see anything on the interface and I see messages in dmesg
>>> from openvswitch saying the number of connections exceeds the limit. At
>>> this moment, if I call ovs-dpctl ct-get-limits, traffic will immediately
>>> start flowing again because the limit will be reset to zero.
>>>
>>
>> To me it seems that openvswitch should perform a GC somewhere similar to
>> what we did on nft_connlimit/xt_connlimit.
> hm, Thanks! I'll try to think about implementing this.

I investigated this and managed to reproduce it. The hping3 with the 
option you mentioned is sending a burst of packets that makes 
openvswitch to process more than 8 packets per jiffy.

That is relevant because 2 different things:
1. Currently __nf_conncount_add() stops cleaning up connections after 8 
connections.

2. The optimization introduced to only perform one GC per jiffy.

Therefore, if someone manage to pass traffic fast enough you can grow 
that number quite fast.

I would like to propose to increase that number to 64, although it might 
make sense to match net.core.netdev_budget default value which is 300 
currently. I have tested both values with OVS and solves the problem.

Any opinion? What do you think?

Also, just as a note: this issue was introduced by d265929930e2 (" 
netfilter: nf_conncount: reduce unnecessary GC"), I bisected it.

>>
>>> I think the problem is as follows: before commit [1], we called
>>> __nf_conncount_gc_list for every connection, and this function iterates
>>> over all connections and cleans up those already closed.
>>>
>>> What we have now is that when trying to add a connection in
>>> __nf_conncount_add, if we don't find it, then while handling errors, we
>>> don't continue the iteration further and immediately exit the function
>>> with zero, which represents the current connection count - we will
>>> clean> connections in the list only until we find the connection we
>>> want to
>>> commit now - meaning the connection count will become outdated.
>>>
>>> Furthermore, we then go to check already_closed found connections and
>>> iterate collect variable, which also doesn't allow connections to be
>>> fully cleaned up; we will clean up a maximum of 8
>>> (CONNCOUNT_GC_MAX_NODES) entries per one call to __nf_conncount_add.
>>>
>>> Also, with such a TCP attack - when connections transition to CLOSED
>>> immediately - __nf_conncount_gc_list won't be called at all, because we
>>> will constantly be calling __nf_conncount_add and updating the last_gc
>>> status. That's why ovs-dpctl ct-get-limits helps; it simply calls
>>> __nf_conncount_gc_list and cleans up all closed connections.
>>> I propose the following behavior, which will be similar to what we had
>>> before [2]
>>>
>>> diff --git a/net/netfilter/nf_conncount.c b/net/netfilter/nf_conncount.c
>>> index 19039a0802b8..e5224785f01e 100644
>>> --- a/net/netfilter/nf_conncount.c
>>> +++ b/net/netfilter/nf_conncount.c
>>> @@ -171,6 +171,7 @@ static int __nf_conncount_add(struct net *net,
>>>         struct nf_conn *found_ct;
>>>         unsigned int collect = 0;
>>>         bool refcounted = false;
>>> +    bool need_add = false;
>>>
>>>         if (!get_ct_or_tuple_from_skb(net, skb, l3num, &ct, &tuple,
>>> &zone,
>>> &refcounted))
>>>             return -ENOENT;
>>> @@ -196,7 +197,8 @@ static int __nf_conncount_add(struct net *net,
>>>                     if (nf_ct_tuple_equal(&conn->tuple, &tuple) &&
>>>                         nf_ct_zone_id(&conn->zone, conn->zone.dir) ==
>>>                         nf_ct_zone_id(zone, zone->dir))
>>> -                    goto out_put; /* already exists */
>>> +                    /* already exists */
>>> +                    need_add = false;
>>
>> I don't see the point to continue here. If we reached this, it means the
>> ct is already tracked. Sure, the count is not being updated but does it
>> matter? This connection is already tracked.
>>
>>>                 } else {
>>>                     collect++;
>>>                 }
>>> @@ -214,7 +216,7 @@ static int __nf_conncount_add(struct net *net,
>>>                  * Attempt to avoid a re-add in this case.
>>>                  */
>>>                 nf_ct_put(found_ct);
>>> -            goto out_put;
>>> +            need_add = false;
>>>             } else if (already_closed(found_ct)) {
>>>                 /*
>>>                  * we do not care about connections which are
>>> @@ -222,13 +224,16 @@ static int __nf_conncount_add(struct net *net,
>>>                  */
>>>                 nf_ct_put(found_ct);
>>>                 conn_free(list, conn);
>>> -            collect++;
>>>                 continue;
>>>             }
>>
>> This worries me a bit, it would mean that for every legit add operation
>> the function will go through ALL the connections tracked which might be
>> a really huge number. This would impact the performance.
>>
>> IMO, this is the only relevant line on the patch for your use-case
>> probably. I do not think the others have any impact. I am wondering if
>> this can be fixed by handling it from openvswitch side by calling gc
>> when needed.
>>
>> I am going to try to reproduce this locally on a machine I have. Let's
>> see what I can get.
> Thanks!
>>
>> Thanks,
>> Fernando.
>>
>>>
>>>             nf_ct_put(found_ct);
>>>         }
>>>
>>> +    if (!need_add) {
>>> +        goto out_put;
>>> +    }
>>> +
>>>     add_new_node:
>>>
>>> [1] netfilter: nf_conncount: reduce unnecessary GC commit
>>> https://github.com/torvalds/linux/commit/d265929930e2ffafc744c0ae05fb70acd53be1ee
>>>
>>> [2] netfilter: nf_conncount: merge lookup and add functions commit.
>>> https://github.com/torvalds/linux/commit/df4a902509766897f7371fdfa4c3bf8bc321b55d
>>>
>>> [3] netfilter: nft_connlimit: update the count if add was skipped
>>> https://github.com/torvalds/linux/commit/69894e5b4c5e28cda5f32af33d4a92b7a4b93b0e
>>>
>>>
>>> Do you think I missed any cases, and how will this affect the function's
>>> performance? Thanks)
>>>
>>
>>
> 

