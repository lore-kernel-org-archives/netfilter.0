Received: from wmail.tana.it (wmail.tana.it [94.198.96.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BBD1170F
	for <netfilter@vger.kernel.org>; Sun, 17 Mar 2024 09:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.198.96.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710666534; cv=none; b=AMfLQecb072xp6CfvBWgXtOXfI8h0lpJJLyowkOrjqy57XaKfbl4StjWxzGEeY6Oyofip6drbaTdogQHcDzENKS6lrxK7g89m1+3BRMj13kze1FafVaYD5WSSKDGW3lau/l2vCRObOlAeBFD9egHBbjspFL2j7HZAkyt9qwQuk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710666534; c=relaxed/simple;
	bh=qAGI419sBDIwO1MkPUJzLhSYdTDz024yrlgQogGh5Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWZr3uvizxLtPqettaqlmkFN+UH1YAID6pnn381VY/8Y9w07BJFceRhicYp8m2Z/r4zejUWmAL0Pw3uEY6Nk3j/FUmGnbCUY+Hfqsasb6ryfHfuuEjBdL+bdouIKd3afuXhagzIL1AYTxbx9gP4EBKgAFQTH2Rs8uvzfgaPM1mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it; spf=pass smtp.mailfrom=tana.it; dkim=permerror (0-bit key) header.d=tana.it header.i=@tana.it header.b=YoGEm1RW; dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b=DBMRFk8U; arc=none smtp.client-ip=94.198.96.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tana.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=tana.it header.i=@tana.it header.b="YoGEm1RW";
	dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b="DBMRFk8U"
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=tana.it;
	s=epsilon; t=1710666524;
	bh=aZKNSPCSNlbuBcBznlh1vcLGIbIJ9ScwS45djXPi0Pk=;
	h=Author:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YoGEm1RWrBlDjNVfpn2WTFGAPEJ8MQ8pzzWxKR7ZgL7QNfo6xunnfUzTwneaVYSey
	 qIe4FaqNH1GgW1WkgvsCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
	t=1710666524; bh=aZKNSPCSNlbuBcBznlh1vcLGIbIJ9ScwS45djXPi0Pk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DBMRFk8UGuav6wGWQGbAqUy8dAaKZyEb84WEE36o6dQRMFbFjFpvC6Jjk2QZzG8WN
	 hZ1RheA0/79TItTCD/CVNpTPanFOtNVN57rU33iEEZXRjShE3PooVBtdIUKqJjzAQ8
	 uIZAvxv3K5dT52+7GZxDJaTzFNmLSLmTAxfhQJl9GMjF6MEHQi0GSi2Nj7Jcg
Original-Subject: Re: Cannot get the correct IP version from packet
Author: Alessandro Vesely <vesely@tana.it>
Original-Cc: netfilter <netfilter@vger.kernel.org>
Received: from [172.25.197.120] (pcale.tana [172.25.197.120])
  (AUTH: CRAM-MD5 uXDGrn@SYT0/k, TLS: TLS1.3,128bits,ECDHE_RSA_AES_128_GCM_SHA256)
  by wmail.tana.it with ESMTPSA
  id 00000000005DC083.0000000065F6B31C.00005493; Sun, 17 Mar 2024 10:08:44 +0100
Message-ID: <20078dfa-9dc7-48d0-9fe5-e0a3d66f967e@tana.it>
Date: Sun, 17 Mar 2024 10:08:44 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cannot get the correct IP version from packet
Content-Language: en-US, it-IT
To: Meiyong Yu <meiyong.yu@126.com>
Cc: netfilter <netfilter@vger.kernel.org>
References: <c7e596ef-ab4a-42be-9e84-642f598e764a@tana.it>
 <4B8994A0-C977-4A79-8D90-7D20B44A04E3@126.com>
Authentication-Results: tana.it; auth=pass (details omitted)
From: Alessandro Vesely <vesely@tana.it>
In-Reply-To: <4B8994A0-C977-4A79-8D90-7D20B44A04E3@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sat 16/Mar/2024 23:21:31 +0100 Meiyong Yu wrote:
>> 在 2024年3月17日，02:51，Alessandro Vesely <vesely@tana.it> 写道：
>> ﻿On Sat 16/Mar/2024 19:11:58 +0100 Alessandro Vesely wrote:
>>>     char *payload = mnl_attr_get_payload(attr[NFQA_PAYLOAD]);
>>>     if (payload)
>>>     {
>>>         int const af = (payload[0] & 0xf);
>> 
>> Heck, should be af = (payload[0] &0xf0)>>4 = 0x6
>> 
>> third time I change it...
> 
> char *payload = mnl_attr_get_payload(attr[NFQA_PAYLOAD]);
> 
>   before this line, you must check if attr[NFQA_PAYLOAD] is NULL pointer，may be it is NULL pointer


Good point, I'll add that check.  Thank you.


Best
Ale




