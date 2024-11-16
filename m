Received: from outbound5e.eu.mailhop.org (outbound5e.eu.mailhop.org [52.28.168.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AFD190499
	for <netfilter@vger.kernel.org>; Sat, 16 Nov 2024 11:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.28.168.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731755919; cv=none; b=AQPqDkXVuKeRUVaQtn0x0A64GK3bpP+zxoKoEtxaIA5ckzy0w7NytAc2yVuomi9ZBGYsolFDx7ZCcPvtjtEmDXxja56cRey9jWuYaZfuubMw71Y0qn5EDZPS0+0TgVCg/sVMJuPCef4f2hD5dIjPP9Av+md7sVT7OLyDWeiUFX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731755919; c=relaxed/simple;
	bh=IJFjzFDPocJLl8crRomOAtVGArGC2+Ry8iHvlDA7cs0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ireuJolRcf4GF2qncYEkLoUgJ/t+JgJw/Vjzf60o1MAVqyFFaZTRZCfAWXaLhR6I98jumMlEYzN+IFCksrAdaPpCpQW3NXMVTqeeW+DRlQbbVk+QSg7CNp9Y/BbtPm6I0Mnampiq4lgisP8w9vWMh/urnuvA7kP2KcOg0H6bXJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=koeller.dyndns.org; spf=none smtp.mailfrom=koeller.dyndns.org; dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b=BscaEM1D; arc=none smtp.client-ip=52.28.168.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=koeller.dyndns.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=koeller.dyndns.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b="BscaEM1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=outbound.mailhop.org; s=dkim-high;
	h=content-transfer-encoding:content-type:in-reply-to:references:cc:to:subject:
	 from:mime-version:date:message-id:from;
	bh=K+a4r2bVrzgecq1n1I/T+7I+F8EbZd000wfmkPMtFVM=;
	b=BscaEM1DLtVe1cGQouX+560lK6IVQjKhnhsFt/tZJSz2qmSVkrrVBOWlo2rPOjMeSXLsrJainZyrG
	 MB6sJ9xJ6/3tz+QKrbD1d04P5Tn0HKv/WEO1r4lTsaQ96JR6bYzfh0wZTx0iKs7PMYQDbpGMQeXhEY
	 x5jxzVYqk1bkFofBFwumY8MJ7z9bm0IWmvXRB9oBX63yOwmr1OW7Xojczaas+oqsdkedu2lJlCqIJz
	 G00s8d5K5REX2UaKIYS0U/aqPg3+x6tfED2l7k8Y9O9dOGDlByLapc16F6eUqrWY3RZS+r6areePlR
	 xEMhmENhQEgY8v03hFjZv2zJu24rIBA==
X-MHO-RoutePath: dGtvZWxsZXI=
X-MHO-User: 5cce41c7-a40c-11ef-a0a0-7b4c7e2b9385
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.koeller.dyndns.org (ip1f123f5c.dynamic.kabel-deutschland.de [31.18.63.92])
	by outbound2.eu.mailhop.org (Halon) with ESMTPSA
	id 5cce41c7-a40c-11ef-a0a0-7b4c7e2b9385;
	Sat, 16 Nov 2024 11:17:27 +0000 (UTC)
Received: from [IPV6:fd46:1ffa:d8e0::1] (sarkovy.koeller.dyndns.org [IPv6:fd46:1ffa:d8e0::1])
	by mail.koeller.dyndns.org (Postfix) with ESMTPSA id 5694B96AC15;
	Sat, 16 Nov 2024 12:17:27 +0100 (CET)
Message-ID: <0f260665-7d2c-4274-b635-f40519ed193f@koeller.dyndns.org>
Date: Sat, 16 Nov 2024 12:17:27 +0100
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
Content-Language: en-US
In-Reply-To: <Zzc4D1R7pTJlCDvR@calendula>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Am 15.11.24 um 13:01 schrieb Pablo Neira Ayuso:
> Hi,
> 
> On Thu, Nov 14, 2024 at 02:53:04PM +0100, Thomas Köller wrote:
>> What exactly happens if an attempt is made to add another element to a set
>> that is already full? I ran into this condition and found that a subsequent
>> 'nft list ruleset' would display the set with no contained elements at all.
> 
> I don't see this here.
> 
> Would you post a reproducer for a current kernel in -stable?
> 
>> I think that a reasonable way to handle this case would be to apply sume LRU
>> strategy to free up a slot, but that is apparently not the case?
> 
> Could you develop your usecase?
> 

I wanted to create a blacklist that the ipv4 source addresses of packets 
that matched certain criteria were added to, like so:

add set ip tbl_ipv4 blacklist { type ipv4_addr; flags dynamic,timeout; 
timeout 1h; gc-interval 6h; size 256; }

and later:

add rule ip tbl_ipv4 syn add @blacklist { ip saddr timeout 1h } counter drop

I noticed that set elements were accumulating over time as expected, but 
after some time the set showed up as empty in the output of 'nft list 
ruleset'. However, I cannot state with certainty that it was the 
overflow condition that caused this to happen, that was just a guess.

I since reduced the element timeout to 10m and the gc-interval to 30m, 
and haven't encountered the problem for a while now.

Assuming that the storage allocated to deleted elements is reused if new 
elements are added before the set is garbage-collected, I would reason 
that the choice of gc interval is not critical and it probably makes 
sense to choose a rather large value in relation to element timeout, is 
this correct?

