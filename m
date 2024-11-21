Received: from outbound1a.eu.mailhop.org (outbound1a.eu.mailhop.org [52.58.109.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D629D230980
	for <netfilter@vger.kernel.org>; Thu, 21 Nov 2024 00:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.58.109.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732147583; cv=none; b=ByLNWCljK3twSzxrSEAJSxGqg8kRb/EFCjP1pp/gv/loYDbH+r93/Fr1R2VxSjBgCHDiu7fbTMZUdBaZgKYiM9LT+/ZbO69rVO1ekpw8XPP+idJM+q3bU74y0Z/hC5HeHPIlx/D6d0E1TDYHVOqQHrkSgRHzlnOtDPcWyqkSztc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732147583; c=relaxed/simple;
	bh=/VsQn9qxkupqPYJI0eKOaTNNYjFoC7jg4/WrhBLnoj0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=O0GRGAq6bQEsacm2dyhgbzZi0A9307aONjtuuD1CxokWJIViwr6OLtqt/PYWdI8FIMwHnyI3wrFM7G3fwZgxHgVYGS1M7GcKCmRAdfFJAGNhi4Apm092t40L818B4Se+5E/8F2b8lQiik7LCjR248w2R9W40TtLmu6gua9P7JiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=koeller.dyndns.org; spf=none smtp.mailfrom=koeller.dyndns.org; dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b=aII/27yy; arc=none smtp.client-ip=52.58.109.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=koeller.dyndns.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=koeller.dyndns.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b="aII/27yy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=outbound.mailhop.org; s=dkim-high;
	h=content-transfer-encoding:content-type:in-reply-to:references:cc:to:subject:
	 from:mime-version:date:message-id:from;
	bh=o74phD1zTksy6Gb9GHMC9DuMuvkS/9OgoLcFDn/qQww=;
	b=aII/27yyQRoReG7zIUzMVVvCDPQV8ggIVQ61F/ujfvJqL77l7ebbQkULO/r0RrNs5945aBFbajMOJ
	 vlihPdIeGfvG1r7TaUiVbIk8wdpzE9PFBenV2HxNv9CP6ufMZZyKqjLGKM4ggyJXoMr1tCnT0NJZtp
	 80g5ERv5xQN2ki/msjadYn4bUMWym9nFiEdhjIugdJiS7mUnRvbCHcP3RnyalrsKtSGnsVrqIGPJcu
	 xQ9rS2/lhPG8Qyul82NYdBLRNYRaYpEGV7GCQECOqs5V2XIBIFZWrLovPlDYFdDZbpwMabZ2lY98QV
	 HU1Y3OLyH2s4wpVVYo9pnI0PUv9OJ9Q==
X-MHO-RoutePath: dGtvZWxsZXI=
X-MHO-User: 4680084f-a79c-11ef-a172-7b4c7e2b9385
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.koeller.dyndns.org (ip1f123f5c.dynamic.kabel-deutschland.de [31.18.63.92])
	by outbound2.eu.mailhop.org (Halon) with ESMTPSA
	id 4680084f-a79c-11ef-a172-7b4c7e2b9385;
	Thu, 21 Nov 2024 00:05:11 +0000 (UTC)
Received: from [IPV6:fd46:1ffa:d8e0::1] (sarkovy.local [IPv6:fd46:1ffa:d8e0::1])
	by mail.koeller.dyndns.org (Postfix) with ESMTPSA id F14F4972CE1;
	Thu, 21 Nov 2024 01:05:10 +0100 (CET)
Message-ID: <22c64c07-bb73-41e8-a3e2-c3658e711675@koeller.dyndns.org>
Date: Thu, 21 Nov 2024 01:05:10 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Thomas_K=C3=B6ller?= <thomas@koeller.dyndns.org>
Subject: Re: Adding set elements
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org
References: <209ce99a-9f22-444d-bd75-8b38865aea3b@koeller.dyndns.org>
 <Zzc4D1R7pTJlCDvR@calendula>
 <0f260665-7d2c-4274-b635-f40519ed193f@koeller.dyndns.org>
 <Zz5kktcay8xI3J0l@calendula>
Content-Language: en-US, de-DE
In-Reply-To: <Zz5kktcay8xI3J0l@calendula>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.11.24 um 23:37 schrieb Pablo Neira Ayuso:
> On Sat, Nov 16, 2024 at 12:17:27PM +0100, Thomas Köller wrote:
>>
>>
>> Am 15.11.24 um 13:01 schrieb Pablo Neira Ayuso:
>>> Hi,
>>>
>>> On Thu, Nov 14, 2024 at 02:53:04PM +0100, Thomas Köller wrote:
>>>> What exactly happens if an attempt is made to add another element to a set
>>>> that is already full? I ran into this condition and found that a subsequent
>>>> 'nft list ruleset' would display the set with no contained elements at all.
>>>
>>> I don't see this here.
>>>
>>> Would you post a reproducer for a current kernel in -stable?
>>>
>>>> I think that a reasonable way to handle this case would be to apply sume LRU
>>>> strategy to free up a slot, but that is apparently not the case?
>>>
>>> Could you develop your usecase?
>>>
>>
>> I wanted to create a blacklist that the ipv4 source addresses of packets
>> that matched certain criteria were added to, like so:
>>
>> add set ip tbl_ipv4 blacklist { type ipv4_addr; flags dynamic,timeout;
>> timeout 1h; gc-interval 6h; size 256; }
> 
> Any reason why you picked such a large gc-interval?
> 
>> and later:
>>
>> add rule ip tbl_ipv4 syn add @blacklist { ip saddr timeout 1h } counter drop
>>
>> I noticed that set elements were accumulating over time as expected, but
>> after some time the set showed up as empty in the output of 'nft list
>> ruleset'. However, I cannot state with certainty that it was the overflow
>> condition that caused this to happen, that was just a guess.
> 
> What you observe is an empty listing because all elements have expired
> but garbage collector did not remove them yet, so the elements are
> still there taking a memory slot in the set until gc runs, ie. set is
> full with expired elements, therefore, no more elements can be added.

So there is no re-use of expired elements when adding new ones? That's 
what I expected to be the case, because to me it seemed to be the 
'obvious' way of implementing dynamic sets. And that misconception led 
me to choose a relatively large gc-interval, assuming that its purpose 
was just to free up resources if the set 'shrinks' permanently.

I guess this means that in order to make use of the full capacity of a 
set, garbage collection has to be performed rather frequently, because 
otherwise expired elements will block addition of new ones, correct?

> 
>> I since reduced the element timeout to 10m and the gc-interval to 30m, and
>> haven't encountered the problem for a while now.
>>
>> Assuming that the storage allocated to deleted elements is reused if new
>> elements are added before the set is garbage-collected, I would reason that
>> the choice of gc interval is not critical and it probably makes sense to
>> choose a rather large value in relation to element timeout, is this correct?
> 
> There is on-demand garbage collection in the rbtree (which stores
> intervals) from (add element) control plane path, but not for the hash
> type. From packet path, some sort of on-demand garbage collection
> needs to be put in place to support your "storage allocated deleted
> elements is reused" assumption.
> 

