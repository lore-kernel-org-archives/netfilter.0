Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFA18BEE
	for <netfilter@vger.kernel.org>; Mon,  4 Nov 2024 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730728214; cv=none; b=EZU0nYky32/ZlpXdGevnAa9ICjuG9pSHQACAG5rz+RFGKvOI6vzstrI0Rq2aB1pC/w+u4IvW2dO1rXZcHwLWHmA7IoApXpqMjlwfAjFT+wVZIGYz0AHhXpcG5SSGZ5uLgyhZDwS/HTwbP7262WBZUwARGeMPa4W55bnLWUxkSTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730728214; c=relaxed/simple;
	bh=8Gno5WHwuWZDY5r9FALS1eye9nkLl7DHmNosT7RzwVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P2PweVh7hW/2gpwkned/RerPHr5vxn9CKWInzb6w3GQrwh2xeqEWDEyMzpDFTccMi+mGoOdJL0LsDLOO+PoA6GUpcEr4MCT9R7LV9B6ISTclLL6bR63eu1RlK7y+R/gQNDsnz622Hctrcdv3NaNM7vOYQ9idQ6rqQgucm7q5UIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b=uNvHiMUQ; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b="uNvHiMUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1730728210; x=1731333010; i=lars.nooden@gmx.com;
	bh=sF5uLQds+YqWV+Epq7LmnWRbdIylL7nYxXQQ20Rug84=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uNvHiMUQYWyFIfNbxydNeRO2Jo9xBjdATWo9l3WFH5HKK4en6L7SNzP6xSF1VVrC
	 uJgiITKYbRkFz5z8yAj73Ueq3KsTPuHWwBdBjiR6+gdRk07iwpxpBuCW7Cso+cDWM
	 UefkF5EQpuSP0tmt5GmzO/YAREG1Pzu0KvxcOwr1A93r4Q9OAORbrDTtPsM7puHOd
	 v7VWbfayyOgOWs9KVMq7vbsdXTSLVK31pu35svz+KbYbWwtR4j4k96Fh6WJOQxyUN
	 R/W+qbqMET60vKdUruA+gvoXzsC7iWHsRJ98xmEYJxjKGxdbEw0x1DCvcgMZwAmXq
	 0nS4Ma259UjEb9Auiw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.11.9.65] ([80.220.108.110]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MUXtS-1tGiva0E8u-00YF8H for
 <netfilter@vger.kernel.org>; Mon, 04 Nov 2024 14:50:10 +0100
Message-ID: <bcbdfe35-ad06-4b48-9d22-bd454ba363bb@gmx.com>
Date: Mon, 4 Nov 2024 15:50:09 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Countering some types of SSH spoofing with NFTables
To: Linux Netfilter Users List <netfilter@vger.kernel.org>
References: <d985d5e4-18b9-4f66-9e24-c7b1c9640caa@gmx.com>
 <f0624e62-0079-43aa-9bd9-28f820914263@app.fastmail.com>
 <66933c54-769b-4371-bbf7-b115a85de4c2@app.fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>
Autocrypt: addr=lars.nooden@gmx.com; keydata=
 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 2w==
In-Reply-To: <66933c54-769b-4371-bbf7-b115a85de4c2@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Xb1wPz1YUNXRkSHtTVd1Fr+68vNpudXy7kpX75vVQo87EoKo5VR
 w2JETqtENvkQgy9GpdKB0ZvX6uuf5tmysDSQoAOPzv9cvec6rvuboZxYORLZYVe9C/lzvaZ
 aWVrlvMqQyQAfRr8M+UGm4AfRfI0oBYYK2kTdPfVG2/bpdhNybCNG03tdKVcLjFZdj0KQPD
 br7FFqgXpkmJuZsRxwkSw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BKjr2yIofag=;YERpgez1bqdXkB8zqvOQODNfV0e
 u27XxYL6sMcIh/5pe1nPGCLNVuuL8NbwqriKghECI+0jvYFWow577VDs62QsVQrPrMSi8t8CJ
 EK+KC5pseAY7ykNfUj7nAeDG6oQIc1V5y8ciPjomNwsdJTjqlymMgC+LPtfvJ3HXhtzbdZmaj
 hpQxaPCycfTcmT9fPnZyIF5ws1hN8uN9tNHzUX4Yc3/BtN1BYah0V8p5jIO93VyPo7Yjh/8Kl
 Neoa+vaUr570WfvmfN9DNFAq7Yz70XLV/xtf9/u92+xE3LXkx+b52Y04Gl0HahffN5WH9b8MC
 WxErkKOSUlzlxJOrdfHpSFN/Wy/25+Iwt8vyNSPzEfQEc5NoiyqNtAv//SBFtrnLJ23yi2mFi
 5arNn0ng39fHnpep6pqNCnI9VVDZyj14WqrgxF2aW6znDwLFTPQEDYfkEtIWfEQl08kdxtVkZ
 CowSeQDahXulR8R8mzQBoxLr2KxRy8kFdO9NwFYoNuyATaoCoqBfsR3zcsJlEkY+T+OEebKQD
 ehap2TaH179x6nKDkhx5cLUt196x8v8nsqPCbPd3GU9RHmFqhFbgvVKmzG/7a4uubDxts958W
 UBWDqA3j0wAlVdW2rMLhPS6BhN0A6aEQr4Ctbm/Rg071wQffy8cbLL3e2JMdUcdrGh7JiAmLM
 c8jZHqIGgbmz9F272bp4yP216tCtD9yDqJTNVh1/uFwDUU8b5HNYxHzKhP7vXdSRGifaHwB3c
 exG0LeQWoXudhy+JVqHZeoAZ8ZJ8AFQDwkfNuEv7F1SmVDIiTk6Rkc=

On 11/3/24 21:08, Kerin Millar wrote:
[snip]> Upon reading your post a second time, I noticed that your sample
ruleset already
> contains a rule that depends upon connection tracking. As such, you coul=
d use
> state matching to assist in accounting for backscatter.
[snip]

Thanks for the explanations and the NFTables rules.   I'll do some more
reading and experimenting.

/Lars
