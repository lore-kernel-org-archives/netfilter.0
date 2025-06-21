Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FCD136988
	for <netfilter@vger.kernel.org>; Sat, 21 Jun 2025 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=86.62.121.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750498324; cv=none; b=DfcpT4gN6FOAapBp3gp8wEU/h1+MvbOctqrYbtjnKQBecnWzfXJo1C8pyJKhm7jS+pC/1zQXYIcrK6UyNMJlagENQHn/EnlALx94IOod3Ni2ylzBdx+l+0iie7xGObMm29tp6eBhHzyt1Eb8oGWMSZgFqzq6PDrHW3AYEu+Fkpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750498324; c=relaxed/simple;
	bh=yOJCVnrqwskiK2SjVKboTtdkfvQTAA8HEAf7WncUgPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHHtloqNx2V2c3uj1CKn+kFNxdbDkGKNXlJ2UmrbYhNFnulAMK/tItF89XT167VLfuySZIcg2F27d1rEZeqKfG9G801NvVx+Y9dPeHTywpjkt009SnEI1m6SOO6v13IKlYSYuXTpEAuaamZ71d9uNufQdNhLq4etjXFJxp0uppE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tls.msk.ru; spf=pass smtp.mailfrom=tls.msk.ru; arc=none smtp.client-ip=86.62.121.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tls.msk.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tls.msk.ru
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4231512ECD6;
	Sat, 21 Jun 2025 12:31:49 +0300 (MSK)
Received: from [192.168.177.146] (mjtthink.wg.tls.msk.ru [192.168.177.146])
	by tsrv.corpit.ru (Postfix) with ESMTP id 7ACCF22A914;
	Sat, 21 Jun 2025 12:31:53 +0300 (MSK)
Message-ID: <a06d9f4f-4fa9-44f8-b1dd-6cc4cb610215@tls.msk.ru>
Date: Sat, 21 Jun 2025 12:31:53 +0300
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: order of netfilter hooks and check for martian source
To: Pavel Penaz <pavel.penaz@gmail.com>
Cc: netfilter@vger.kernel.org
References: <075d8041-5e10-43ae-bae9-12a3f25c70d5@tls.msk.ru>
 <ec2a6853-a864-4708-a565-267e61c5162a@tls.msk.ru>
 <7wR-GVqRP8l9UDDo4OaeWZXZOMKF6adK7-bORlkCF2AY4NKDLlPX1R91egntfEvG3tWyXuSY81TpbWsF0zyYk4MhPc81-g7HdntMFp7zPHE=@protonmail.com>
 <eb707b4a-0f98-43e2-a68a-7498aeed9b17@tls.msk.ru>
 <CANPmkQsQUPOpY2o7ytVVFuCtvLq-98cNvBYVFiAfxbPEatHyTw@mail.gmail.com>
Content-Language: en-US, ru-RU
From: Michael Tokarev <mjt@tls.msk.ru>
Autocrypt: addr=mjt@tls.msk.ru; keydata=
 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
In-Reply-To: <CANPmkQsQUPOpY2o7ytVVFuCtvLq-98cNvBYVFiAfxbPEatHyTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21.06.2025 10:54, Pavel Penaz wrote:
> Hi,
> to route the return packets accordingly, can you try adding the
> following two rules with "ip rule add ..." and check if this helps?
> 
> to ip1 lookup table1
> to ip2 lookup table2

Quite expectedly this changed nothing.  For a return packet, it is
sent from an IP on local network (target of the dnat rule) to the
external IP, so neither ip1 nor ip2 is mentioned in the packet.
So such rules don't apply.

After adding these rules with prio 32785 & 32786, the return packet
is still routed through eth1 (per rule 32790).

We need to exchange the order of operations (dnat vs routing), not
order of rules within these two.  Such reordering will automatically
and correctly solve both my problems, and a few similar problems
people reported over the years.

Checking result of NAT for martians makes no sense.  Ditto for
applying routing rules before de-NAT-ification of return packets.

Thanks,

/mjt

> Best regards
> Pavel
> 
> On Sat, Jun 21, 2025 at 9:26 AM Michael Tokarev <mjt@tls.msk.ru> wrote:
>>
>> On 21.06.2025 03:48, Sunny73Cr wrote:
>>> Hi,
>>>
>>>> from hostINT back to extIP, gets routed to gw1 through eth1
>>>
>>> Looks like the default route for 'any' source has too much priority; without looking at the code, it seems that the assumption is that there's no point checking the other routes, if there is an 'any' route. I suggest removing the 'any' route and relying on SNAT for 'hidden' clients. Add more routing rules if neccessary.
>>
>> Unfortunately there's no way to remove the "any" route
>> or make its priority lower:
>>
>> # ip rule list
>> 0:      from all lookup local
>> 32766:  from all lookup main
>> 32767:  from all lookup default
>> 32770:  from ip1 lookup table1 proto static
>> 32780:  from ip2 lookup table2 proto static
>> 32790:  from all lookup table1 proto static
>>
>> # ip route list table table1
>> default via gw1 dev eth1 proto static
>>
>> # ip route list table table2
>> default via gw2 dev eth2 proto static
>>
>> It is the rule 32790 which kicks in *before*
>> reverse-DNAT (for replies, SNAT), while it should
>> be consulted after SNAT.
>>
>> (There's no "default" route in main table.  It
>> has regular local routing information for locally
>> connected and inter-connected networks, there's
>> nothing relevant in it for the packets in question).
>>
>> The problem is that I can't change order of snat vs
>> order of routing, no matter how I change priorities
>> of the rules.  Or I don't see a way to do this.
>>
>> Thanks,
>>
>> /mjt
>>

