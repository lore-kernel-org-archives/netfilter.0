Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CF812CD88
	for <netfilter@vger.kernel.org>; Sat, 21 Jun 2025 17:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=86.62.121.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750528241; cv=none; b=ntyV0NNryn2rVRgBG8OeJY+zJJyLGaca74dlgMuEWbQH5rPp9uA/6C7LuPT6D67tnr3Tr2jJA4yamqKg9q0x7r/2hRP7LEa5KU4ygRWUeB7zRxn2581zFSiGlrXRVOWxuLEYJ4K+vk1ziPY/ISOcghZ6KLdI8mrIZyeSJ3pFGCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750528241; c=relaxed/simple;
	bh=9co4093thu+hxWpPXHmjPW/unyebpBi+HQbExa1fpZ8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=J8eNix4PKsR6/SpFi1yztNb7YznoajFK+GCmmhlAmkgcOYvpR2dGxSa0izhwzPGSkBA4DQtkKTcfZoJBoHiJhUAhMEoIi4t1ICw3AH/Wh869A0OSMkL5wNzkQzqajgZ39MrykRoxosxo85aRWxy9e6bS3cYX1rNYUdq8gBQErtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tls.msk.ru; spf=pass smtp.mailfrom=tls.msk.ru; arc=none smtp.client-ip=86.62.121.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tls.msk.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tls.msk.ru
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BA9CF12EF9B;
	Sat, 21 Jun 2025 20:50:30 +0300 (MSK)
Received: from [192.168.177.146] (mjtthink.wg.tls.msk.ru [192.168.177.146])
	by tsrv.corpit.ru (Postfix) with ESMTP id 9094222AB08;
	Sat, 21 Jun 2025 20:50:35 +0300 (MSK)
Message-ID: <26692fd4-71d4-4a77-b581-064837e2bb07@tls.msk.ru>
Date: Sat, 21 Jun 2025 20:50:35 +0300
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: order of netfilter hooks and check for martian source
From: Michael Tokarev <mjt@tls.msk.ru>
To: Jozsef Kadlecsik <kadlec@netfilter.org>
Cc: netfilter@vger.kernel.org
References: <075d8041-5e10-43ae-bae9-12a3f25c70d5@tls.msk.ru>
 <ec2a6853-a864-4708-a565-267e61c5162a@tls.msk.ru>
 <b69fa9d9-6e56-0e08-adec-ba768a108938@netfilter.org>
 <9fc435dd-547f-4e50-8c2c-862a1ff62a2c@tls.msk.ru>
 <c1ecb68e-d4ce-9773-8649-ebac5171da06@netfilter.org>
 <51d3ebab-f543-4cbf-9923-8a9d965de826@tls.msk.ru>
Content-Language: en-US, ru-RU
Autocrypt: addr=mjt@tls.msk.ru; keydata=
 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
In-Reply-To: <51d3ebab-f543-4cbf-9923-8a9d965de826@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21.06.2025 19:08, Michael Tokarev wrote:
> On 21.06.2025 19:05, Jozsef Kadlecsik wrote:
>> On Sat, 21 Jun 2025, Michael Tokarev wrote:
>>
>>> On 21.06.2025 17:42, Jozsef Kadlecsik wrote:
>>> ..
>>>> However, routing decisions can be affected by marking packets. So 
>>>> I'd mark
>>>> packets before routing and use routing tables according to the mark 
>>>> value.
>>>
>>> The prob with replies to DNAted packets is that these packets traverse
>>> routing rules first, BEFORE they're seen by netfilter code.  Who can
>>> mark them for routing if routing is done before it's in netfilter?
>>
>> No, not at all. You can mark the incoming first packet, store the 
>> packet's
>> mark value in conntrack and restore from conntrack for the reply packets
>> in mangle/prerouting. Which is exactly that, before routing.

I tried to follow this route.  In the dnat rule, I applied a mark to
this conntrack entry, and checked this fwmark in ip rule to perform
routing through ip2/gw2 instead of default ip1/gw1.

As expected, netfilter code does not mark the reply packet with this
fwmark before it goes through the routing tables, - exactly like this
same netfilter code does not de-DNAT"if the source address of the
reply packet..

> Why netfilter can't de-DNAT'ify this (reply) packet at this same place
> where you suggest to apply the mark, so the routing see it in its final
> form, and no jumping through hoops is needed for the user?

So it's not just jumping through hoops, - it looks like netfilter just
can't do this correctly currently.

The order of applying routing and mangling/demangling is wrong.
And it looks like a rather interesting and serious bug, though not
for a widely used situation.

It should be:

   1 check for martians (network code)
   2 prerouting netfilter hook,
     AND de-mangling NAT'ed replies
   3 routing
   4 filter table
   5 postrouting hook

Currently, 2 and 3 is swapped out.

Thanks,

/mjt
