Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C362D327BE0
	for <netfilter@vger.kernel.org>; Mon, 15 Dec 2025 11:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765796417; cv=none; b=CkRJyOxT6W+XyZ9vo4wLInW1Uw4k6rNX9Kpo8OCUPR734PpLqsC4U7Ze59N5/o9f0uhVRnt45hjTvoElEKQbEtjvaddOt7jsJ3//N5iU8NGnPG2Mvx3VA5ejcWliV0oPxmo1VGv5ilnngfjF5LvFq6y4Uos+vhTatPRA3uviwSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765796417; c=relaxed/simple;
	bh=du5SLQDCuoafMSziKeWh6iwZCfkNeMOvRSowOsptQ+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SioJ5ymGbmuefWffKCxkVJ1W18rmlHMBTVbVEv05CQI4Hc9NiKmGI/h8UFGkUk48J5lPjyNzkxeSk3w7WXFjG8kpqUjnHmZoyrBFVGy4ZIlIYlJRmCsBgZnD5mT9sFMfIxmkQPrk9fZUjEvfymSHDTQlGd45lTG71pC+KtLJ7Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZUF/nHq4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=35axwnQO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZUF/nHq4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=35axwnQO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZUF/nHq4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="35axwnQO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZUF/nHq4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="35axwnQO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D9E013383B;
	Mon, 15 Dec 2025 11:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765796413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YUTv3A5uHxIGPhuRpRKvxKzzbuhnqhQHny84V2znxQ=;
	b=ZUF/nHq4AsPQ+HOV3dzvvbWgxRQwNuGBCRi8L1IiMzotVIsX0GmRu3eMxjV8yCvOlAG+qW
	nNmOfEA3uAlHbdE+w0lNqE8sfpJIBeXGiJIpp9SGryxDZfWCY0uhPlj32+a2JZ6hro3FA2
	A8rSe9Pahh6Ad2S6rl78lgvbvy67mv8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765796413;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YUTv3A5uHxIGPhuRpRKvxKzzbuhnqhQHny84V2znxQ=;
	b=35axwnQO0dXmCCWLpFSz6pULXenQSJfqmkQtGo1mG6ZTnEHV5FVkcdIT5jAMnlW3DfSV/F
	ESksLaYLHMfH+jDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765796413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YUTv3A5uHxIGPhuRpRKvxKzzbuhnqhQHny84V2znxQ=;
	b=ZUF/nHq4AsPQ+HOV3dzvvbWgxRQwNuGBCRi8L1IiMzotVIsX0GmRu3eMxjV8yCvOlAG+qW
	nNmOfEA3uAlHbdE+w0lNqE8sfpJIBeXGiJIpp9SGryxDZfWCY0uhPlj32+a2JZ6hro3FA2
	A8rSe9Pahh6Ad2S6rl78lgvbvy67mv8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765796413;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YUTv3A5uHxIGPhuRpRKvxKzzbuhnqhQHny84V2znxQ=;
	b=35axwnQO0dXmCCWLpFSz6pULXenQSJfqmkQtGo1mG6ZTnEHV5FVkcdIT5jAMnlW3DfSV/F
	ESksLaYLHMfH+jDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76CD63EA63;
	Mon, 15 Dec 2025 11:00:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id U24/Gj3qP2mtYAAAD6G6ig
	(envelope-from <fmancera@suse.de>); Mon, 15 Dec 2025 11:00:13 +0000
Message-ID: <46357175-2d8b-4d93-9c9b-20bbd51408d9@suse.de>
Date: Mon, 15 Dec 2025 12:00:05 +0100
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
Content-Language: en-US
From: Fernando Fernandez Mancera <fmancera@suse.de>
In-Reply-To: <b2064e7b-0776-4e14-adb6-c68080987471@k2.cloud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.28
X-Spam-Level: 
X-Spamd-Result: default: False [-4.28 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.18)[-0.899];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On 12/12/25 10:27 PM, Rukomoinikova Aleksandra wrote:
> Hi one more time! I found another issue. I'll describe it below.
> 
> In my opinion, it's relevant after merging [1]  I saw that a fix for
> this commit was merged last week, but but it doesn't fix case I'll
> describe below.
> 

Just to be sure, you have tested this with the latest mainline kernel, 
right? Because as you mentioned we merged several fixes addressing 
outdated counts.

> I create limits via Open vSwitch and run a TCP flood this way: hping3 -S
> -I host -p 10880 -i u5 10.255.41.101 -c 100 (Here, -i u5 is important,
> meaning with timers < jiffies; it's more likely the issue won't
> reproduce otherwise)
>  And I set the following limit on the zone where these connections
> arrive: ovs-dpctl ct-set-limits zone=9,limit=100
> 
> I start traffic, I see traffic on the interface: TCP SYN -> TCP SYN+ACK
> -> TCP RST. Zone 9 overflows, but connections immediately become CLOSED.
> I run hping3 again: hping3 -S -I host -p 10880 -i u5 10.255.41.101 -c
> 100 - I don't see anything on the interface and I see messages in dmesg
> from openvswitch saying the number of connections exceeds the limit. At
> this moment, if I call ovs-dpctl ct-get-limits, traffic will immediately
> start flowing again because the limit will be reset to zero.
> 

To me it seems that openvswitch should perform a GC somewhere similar to 
what we did on nft_connlimit/xt_connlimit.

> I think the problem is as follows: before commit [1], we called
> __nf_conncount_gc_list for every connection, and this function iterates
> over all connections and cleans up those already closed.
> 
> What we have now is that when trying to add a connection in
> __nf_conncount_add, if we don't find it, then while handling errors, we
> don't continue the iteration further and immediately exit the function
> with zero, which represents the current connection count - we will clean> connections in the list only until we find the connection we want to
> commit now - meaning the connection count will become outdated.
> 
> Furthermore, we then go to check already_closed found connections and
> iterate collect variable, which also doesn't allow connections to be
> fully cleaned up; we will clean up a maximum of 8
> (CONNCOUNT_GC_MAX_NODES) entries per one call to __nf_conncount_add.
> 
> Also, with such a TCP attack - when connections transition to CLOSED
> immediately - __nf_conncount_gc_list won't be called at all, because we
> will constantly be calling __nf_conncount_add and updating the last_gc
> status. That's why ovs-dpctl ct-get-limits helps; it simply calls
> __nf_conncount_gc_list and cleans up all closed connections.
> I propose the following behavior, which will be similar to what we had
> before [2]
> 
> diff --git a/net/netfilter/nf_conncount.c b/net/netfilter/nf_conncount.c
> index 19039a0802b8..e5224785f01e 100644
> --- a/net/netfilter/nf_conncount.c
> +++ b/net/netfilter/nf_conncount.c
> @@ -171,6 +171,7 @@ static int __nf_conncount_add(struct net *net,
>        struct nf_conn *found_ct;
>        unsigned int collect = 0;
>        bool refcounted = false;
> +    bool need_add = false;
> 
>        if (!get_ct_or_tuple_from_skb(net, skb, l3num, &ct, &tuple, &zone,
> &refcounted))
>            return -ENOENT;
> @@ -196,7 +197,8 @@ static int __nf_conncount_add(struct net *net,
>                    if (nf_ct_tuple_equal(&conn->tuple, &tuple) &&
>                        nf_ct_zone_id(&conn->zone, conn->zone.dir) ==
>                        nf_ct_zone_id(zone, zone->dir))
> -                    goto out_put; /* already exists */
> +                    /* already exists */
> +                    need_add = false;

I don't see the point to continue here. If we reached this, it means the 
ct is already tracked. Sure, the count is not being updated but does it 
matter? This connection is already tracked.

>                } else {
>                    collect++;
>                }
> @@ -214,7 +216,7 @@ static int __nf_conncount_add(struct net *net,
>                 * Attempt to avoid a re-add in this case.
>                 */
>                nf_ct_put(found_ct);
> -            goto out_put;
> +            need_add = false;
>            } else if (already_closed(found_ct)) {
>                /*
>                 * we do not care about connections which are
> @@ -222,13 +224,16 @@ static int __nf_conncount_add(struct net *net,
>                 */
>                nf_ct_put(found_ct);
>                conn_free(list, conn);
> -            collect++;
>                continue;
>            }

This worries me a bit, it would mean that for every legit add operation 
the function will go through ALL the connections tracked which might be 
a really huge number. This would impact the performance.

IMO, this is the only relevant line on the patch for your use-case 
probably. I do not think the others have any impact. I am wondering if 
this can be fixed by handling it from openvswitch side by calling gc 
when needed.

I am going to try to reproduce this locally on a machine I have. Let's 
see what I can get.

Thanks,
Fernando.

> 
>            nf_ct_put(found_ct);
>        }
> 
> +    if (!need_add) {
> +        goto out_put;
> +    }
> +
>    add_new_node:
> 
> [1] netfilter: nf_conncount: reduce unnecessary GC commit
> https://github.com/torvalds/linux/commit/d265929930e2ffafc744c0ae05fb70acd53be1ee
> [2] netfilter: nf_conncount: merge lookup and add functions commit.
> https://github.com/torvalds/linux/commit/df4a902509766897f7371fdfa4c3bf8bc321b55d
> [3] netfilter: nft_connlimit: update the count if add was skipped
> https://github.com/torvalds/linux/commit/69894e5b4c5e28cda5f32af33d4a92b7a4b93b0e
> 
> Do you think I missed any cases, and how will this affect the function's
> performance? Thanks)
> 


