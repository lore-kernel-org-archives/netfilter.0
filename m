Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2BB411619
	for <netfilter@vger.kernel.org>; Mon,  2 Mar 2026 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772465528; cv=none; b=HgrlXVvKuIpMSFhd0fntKuba2bbVqRzhIPwVfbCx9RFmd1zQyHfSe8pQU4xRIkOnkQm8BiwePEhCWrVeNfaUBLFI5xH6fn+z2axxIInQESsiyhf32V+93bJHxDFGgWUy3DM5w6CXujO0eFn/Gs0gUyxWXcimZxP1adZWpDCAcyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772465528; c=relaxed/simple;
	bh=zD5AjoRS8YPilDOjIJBnluvDBNgj1JKHgmBfzfP0br4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CC2TihctH3a6yHzBE/wup6YeiWkznBC7nFJ17nYHgILgzdq+pxJmdGuaoML1SNGgZmYsiRxtzFDYPU0WSrpX67l7wRlEZG82yqOPfpHgcDK86FpNpQrSBzDg2JrjqPjW+n9bBHFELe3yTvyrwS3tsoLIpCl7/5XChSKQgSCGzzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njCYEGmr; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njCYEGmr"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4398f8e2837so4000509f8f.1
        for <netfilter@vger.kernel.org>; Mon, 02 Mar 2026 07:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772465525; x=1773070325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ik5HgW1f6SgXMX3AFQVrJuca0JDKwARN3TwmoVhFPQM=;
        b=njCYEGmrs8LaqPyWFF0jVt/MQSf5Hj/HH04nPw0ZpPTlAAWovNP7nwh/WcN9fsF4ci
         rEeNVjJO6Qca3VNi+439+z1Xu99eqAhclIQsc280n5pI/5eAN9UFPSz4QG0jWX3lEgMF
         Mikq6Rj1h1PJSNqfR0HSwGgmKay2di+Rrf8+cv7lQNA+QPDjk7U38aPiXtjfSp5Ez05Y
         bcM2HXkLoUGv8FpWo7KjHf5V/XlEb37joKfngYd+TdDD8N4DsRb3/19S2KKCJDE3TZZJ
         k9a5k2EtEjmq2ZbhjqOPsq37Qe4I1rDNvyWIr0F3DqwzQlq1w31if72rNdDYOZUkfDCN
         bc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772465525; x=1773070325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ik5HgW1f6SgXMX3AFQVrJuca0JDKwARN3TwmoVhFPQM=;
        b=r75/M1Ea3gsAv3t0C3D+a53IW+Y342mIw9Z5kK3Y1Yj8bG8zNrYW1oA6K6eiTvS6lD
         IlmASECnkIs6SsmfTWxnojru6wFPyZ7KvQjk0FGaFdgGNKTm3BDzqgQ3tR2PTEwERMao
         008V238jBlGdVIKeWCqpNyfCUtetD11do+QK/Upgnl+lF53qBybkd8t8TzqEOdpQsEsl
         0Mz9UFwP2DEk2b+KOIik8ZMFhzUSF9u3pBYchVBVPGuT+WiYj+LvRpCF8k10+82Dpmc3
         HVwGX8II5Rp+IGZ8FXYamOPD/6Spo/chZjOywW6YNr3pdOfMJEf1WYEJBqSaeWfQMVut
         wdhQ==
X-Gm-Message-State: AOJu0Yz1mfzUtgJZcZrvAEviEvXJMmjyogwbmTXMmO58FdmRBjLBG/Ie
	Z2IVsiVO7MLeVrMKPrpw5jtCeYCWh8807emFKCFF83lZkimFqHMpNIXm
X-Gm-Gg: ATEYQzxUk1Ilgqa7inCLKc9Hhb4JYVAFiLT4HR6HDoO8pLaJxi7SSuGqAjJHoWl0Ngh
	hibS0YtQEm5Ms4ltwgg20Y1N+Rns9jdqo7n2uuDQ7wmgOboaXBl3n/xSFJP3cdzWLamq6V/J7oB
	xqSQaBO+r+Ws6ZWnrBXOz2SfECgj7zX2N/9ABrUTQX+CSNouZEFjDanPmJRnXYZKtanI/d7i2yc
	T2s05neYmib9m/SVXnLspKl3I6WUHwDkzzw8jPNGtpkhUvUha0b7/EM6ByPm18WjzJ2nci2SbLy
	ytbN/4IPaw9PqBwTUaz0b6onXPO+g7z2BTEpcA1424NsT/iom2tSBjIBTq17H47QNk1j2XrV2KX
	qq/KMRbs0swC51KrkWHBlpDSr8Ln3QmVBirh9Dh301i+eNYtxhE+jy2NcF2EqgOLOcYexe+o7dU
	OImesNEeJ/GBEGPmBvFt27UUqGQKj7/d2JKwKoAGwP7+x9wtAMPauD69/zZumQLBYlPJR3Ry9Ul
	Yqurf/oGp4WeXGxR5h9nFUtz+PJLj5aUETkgcx7gjo=
X-Received: by 2002:a05:6000:26c5:b0:439:ba69:101d with SMTP id ffacd0b85a97d-439ba6912e2mr4561238f8f.1.1772465524221;
        Mon, 02 Mar 2026 07:32:04 -0800 (PST)
Received: from [10.9.9.21] (69.145.73.86.rev.sfr.net. [86.73.145.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b55d15besm11555852f8f.30.2026.03.02.07.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 07:32:03 -0800 (PST)
Message-ID: <cce93ef0-8b7e-4732-9fcd-25c5d935aca4@gmail.com>
Date: Mon, 2 Mar 2026 16:32:03 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: [nftables] is it possible to declare multiple tables for a
 given family type?
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
References: <752a3ecd-b379-4b82-8ac1-a64450e14167@gmail.com>
 <fc37db9e-39ed-4478-bb53-887156e309b2@gmail.com> <aaTRgeXDaznuZvgh@strlen.de>
Content-Language: en-US
From: Mathias Dufresne <mathias.dufresne@gmail.com>
In-Reply-To: <aaTRgeXDaznuZvgh@strlen.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 2026-03-02 à 00:53, Florian Westphal a écrit :
> Mathias Dufresne <mathias.dufresne@gmail.com> wrote:
>> Le 2026-03-01 à 14:52, Florian Westphal a écrit :
>> The goal would have been to have one table per service containing
>> everything related to that specific service and nothing else.
> I see.  One way to do it is to include such sub-configurations
> from a central ruleset file.
>
>>> Just like in iptables, 'accept' in raw table just means packets
>>> continue to travel through the stack, you need to accept them in mangle
>>> and again in filter table.
>> Do you meant the network stack or the nftables' rules stack?
> The former.  E.g. (staying with iptables, its same in nftables):
>
> if a packet is accepted in mangle prerouting, it will continue and will
> eventually make it to mangle input or forward.

A packet accepted in a hook is removed from that hook and it does pass 
through the rules after the one it matched?

And this same packet will have to pass through the potentially remaining 
hooks.

>
>>> Also, base chains (those with a line like
>>> 'type filter hook input priority filter; policy accept;') always cause a
>>> slow-down: they divert all packets into the nftables vm, so its a good idea to
>>> minimize the amount of times this happens per packet.
>> Again, I'm lost there... I'm certainly lacking the basic knowledge to
>> understand :/
> No problem.  Consider an nftables ruleset that has ONLY
> chain foo {
> 	some rule ..
> }
>
> This ruleset is very fast.  And useless.  Because it never processes
> any packets.
>
> In iptables, this isn't possible, because all tables have
> builtin-chains: PREROUTING, INPUT, and so on.
>
> In nftables, one has to manually declare which chains are the 'starting
> point' for packets passing through the networking stack.
>
> E.g. type filter hook input priority filter; policy accept;
>
> tells that you'd like semantics that are identical to iptables filter
> INPUT chain: it will see incoming packets that have passed through the
> routing step and are destined for the local host.
>
> Makes sense so far?
>
> This means, ALL incoming local packets will appear in this chain
> (minus those that were dropped earlier on in the stack of course).
>
> Example:
> 	chain myinput {
> 		type filter hook input priority filter; policy accept;
>
> 		tcp dport 22 jump ssh
> 		tcp dport { 80, 433 } jump httpd
> 	}
> 	...
>
> ... will be faster than making
> 'ssh' and 'httpd' two independent 'type filter hook input' chains.
>
> Why?  Because in the case above, all incoming packets pass though
> 'myinput', then only a small subset gets passed on to ssh and httpd,
> respectively.
>
> If you make the two user chains base chains ('type filter...', both reveive
> all the traffic).  In case you haven't tried it: See if 'nft list hooks'
> provies some assistance to you.
I'll try that very soon as my understanding is that a packet matching a 
rule with jump is removed from the hook and passed to the jump chain. If 
I understand correctly this will be an efficient way to accelerate the 
filtering process while obtaining readable rules with hooks sorting 
packets per service and service chains dealing with targets to accept or 
refuse them. I love that : )
>> --------------------------------------------------------------------
>>
>> Here is a working single table to SSH the firewall and one LAN through
>> that firewall:
>>
>> table ip filter_them_all {
>>     chain ip_log_svc_administrative_services/ssh {
>>       counter packets 0 bytes 0 log prefix "Accept ip SVC for
>> 'administrative services/ssh': " group 2
>>       counter packets 0 bytes 0 accept
>>     }
>>     chain input {
>>       type filter hook input priority filter; policy accept;
>>       ct state {established,related} counter log prefix "ACCEPT CT for
>> INPUT" group 2
>>       ct state {established,related} accept
>>       iif vdi-lan ip daddr 10.9.9.252/32 tcp dport 22 ct state new jump ip_log_svc_administrative_services/ssh
>>       iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22 ct state new jump ip_log_svc_administrative_services/ssh
>>       counter packets 0 bytes 0 log prefix "REFUSED INPUT packet as it reached the end of filtering rules stack." group 2
>>       counter packets 0 bytes 0 drop
>>     }
>>     chain forward {
>>       type filter hook forward priority filter; policy accept;
>>       ct state {established,related} counter log prefix "ACCEPT CT for > FORWARD"  group 2
> I'd suggest to add some rate limiting for your log lines.
I'll think about it but those logs yesterday were mainly there to help 
me understand what was happening with my packets.
>
>>       # these two are working and can't be omitted
>>       iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22  log prefix "ACCEPT FORWARD for ssh" group 2
>>       iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22 accept
> If you don't want to limit, you can combine this into one line, you can
> 'log prefix ... accept' in nftables.
Did you proposed that merging for cosmetic or performance reason?
>
>>     chain output {
>>       type filter hook output priority filter; policy accept;
>>       ct state {established,related} counter log prefix "ACCEPT CT for
>> OUTPUT" group 2
>>       ct state {established,related} accept
>>       counter packets 0 bytes 0 log prefix "REFUSED OUTPUT packet as it
>> reached the end of filtering rules stack." group 2
>>       counter packets 0 bytes 0 drop
> Are you sure you need output filtering?  This prevents e.g. dns
> resolution, ntp (time) refresh etc.
As my goal is to automate nftables rules I'll try to manage a tool 
capable of filtering everything. For my home servers, most certainly I 
won't...
>
>> table ip tracked_packets {
>>     chain input {
>>       type filter hook input priority 300; policy accept;
>>       ct state {established,related} counter log prefix "ACCEPT CT for
>> INPUT" group 2
>>       ct state {established,related} accept
>>     }
>>     chain input {
>>       type filter hook input priority 310; policy accept;
>>       iif vdi-lan             ip daddr 10.9.9.252/32 tcp dport 22 ct
>> state new jump ip_log_svc_administrative_services/ssh
>>       iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22 ct
>> state new jump ip_log_svc_administrative_services/ssh
>>     }
> This works, but as you found there is no 'memory' and all chains have
> to accept all packets for them to make it though.

OK. Several chain using a given hook, even if a packet if matched in 
early chain it will pass through the others using that same hook (as per 
my understanding)

And so, in your previous example using "jump ssh", this ssh chain shall 
not use hook at all (again, as per my understanding ; )

>
>> His this approach - several filtering tables - valid? I mean I could
>> easily have made errors in the syntax...
> Yes, but I don't consider it a good idea, I also don't think its suited
> for what you have in mind.
>
> If this is about enabling / disabling services, I would use a set for
> that.
>
> set s {
> 	typeof iif . oif . ip daddr . meta l4proto . th dport
> 	flags interval
> }
>
>   chain forward {
>        # these two are working and can't be omitted
>        iif . oif . ip saddr . meta l4proto . th dport @s accept
>
> [ totally untested, for illustrative purposes ... ]

That I don't understand at all but I'll keep somewhere and I'll try to 
understand... later :p

Thank you again for all these information and your time.

Best regards,

mathias

