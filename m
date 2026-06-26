Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7F5328610
	for <netfilter@vger.kernel.org>; Fri, 26 Jun 2026 17:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782493448; cv=none; b=dYFG0aqwNSZXrPSxRHlSlB1Td9TdoRpbVrs/hWEWBoljRlprch8pfoFOHXUc8QI5g3oqXDFevHp55ssVtl4FMCK60F+yWf+WppChsCwXlwz2czTMYCDJ8Ud9wq+iYQuX5hEN8NDSY9wZ3XGOjRuVNVRfdnkj2ns49MG5iqkQgCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782493448; c=relaxed/simple;
	bh=zmXlY5Q1VbnIhD2md201NDzJrfZY2++J6kTdFJzY3OU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jqg+yfwFMfxSl7vdzKVsrn4TtYt4QB3rCXNvCthWadbQi/V61bgn/crySdPP5n0cWTDOP0yZPi/rrIsY6O2k6MW2As9jgw2dffbPbNlJhIGBt3YhKNZCKPh6O7TJGXlWcgSdqlir+pT+lyoLLerHoMp72Eur7E2PNX2WlEddKJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sFvjfUUR; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sFvjfUUR"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bc871ecdfso1606727eec.1
        for <netfilter@vger.kernel.org>; Fri, 26 Jun 2026 10:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782493446; x=1783098246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AfQY+vHX01Bcb5UZrDO8pUaKTgyxnWNkC2i7H7+MAgQ=;
        b=sFvjfUURo+w26M9MtnPyZD5WajTvsMuLq1Qsavcbg7NdGInpk7yHqWOgglKh58hRFV
         UBVHqHHT9xMM61DzX+kGReqzeRIZuW0qaS3GyuncSZq4cAZT1H0QKwyeCFgeZxcoEZPR
         pAZ9rLatLBGRNZ0DwqAlizMqx8UXJ4HmXhK+smOfGrx6cjNbEbNgZI2ThTjGXl8IWD2X
         yHyv5MRec+Xw0AhAmcEoUUp6p3BPa0lf6c1CieQ3KrPrb6gR99yTpCQ2tid2GobaXQ5R
         3nr0x7oHZrEwB952p4nLlN9k57eVA21HxJmjgCLT41LHOUt3oqM+1e/op+xfD9chSPxL
         gtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782493446; x=1783098246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfQY+vHX01Bcb5UZrDO8pUaKTgyxnWNkC2i7H7+MAgQ=;
        b=S50/bkNSGFVf209tIi168QFaef5D9TT5M+zFAD1ZL64BNXk/DKFgz20AA4bNMr0wH0
         IEmNh7gLUnRIDUcw5O1zWHEXxCWmSfMog7RnYEkOt7i9pl+TOdDFTKEH+YJr0puoyb/r
         UkpL7j51MZiYZhif2LRwq47iBLhtkJoVaCa2mCRk6hH6ZYUSE3tHdKPN1hZixBZt+UEM
         2a8WyltpsxN7fo3DUwJHKhsSZGyYlwmnp3uods1xkA2mXHYSQPfLiOLHhbXY7rCTqprB
         hePsMl98LKLJvNnvvJUToyMoI6IK/8WaEYNJ7TBPXq1Rml5z3Ed1dU2Q3YsUro1oKDNl
         AOpw==
X-Forwarded-Encrypted: i=1; AHgh+RquwuKKOPkOmtnrKIiWZt2dBxYWJ+zQ3F8d0YM+kwx7E6gW2m8BGNn81A66D9iyI2gDFEbmgWyy/3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfgW5eUH7DlgvQcLw/FanVLc/tmjg9KxfEb3lolvhZ/wTKD7Na
	zGGL500rQc9BadSKvgY2qs3gz/XO33YJJe8uu0a7461iOFJ8iLafUxmx4z8EewzK
X-Gm-Gg: AfdE7cluuoQc2H7k8kQvCq06C5WDDBszO3ey9RG46VXzlRS9N4twYIBO8GplQgbTQX/
	T6Y4xtf18Ot9637a5hfEOOUqjL7VKKZhF0/EWBp4f50VFWzPSxZY6gJwQOMvG+Y2CRAAGVOyn3p
	JEHxf3LQuYLDsTxAd1EQT5AyBbgtlICc6bWgongcHw0aN+ENrkKA8dV62gx9k9v7I2EilYJM8P1
	Mg5+dkj811puiCoJPFcoCYCpI4K0PQ2E5gNFU5jKSdp3GHiFPZzLFw44qu6+m8MzVKM8H+dqlNY
	9QK2zlDAgBIX0t3QjxJRqpynPAy8gbw58ji2dOWNu9nGTfi8ZCjJkgj+JMJeZ2EmlVIJgPr7ug1
	Wpvrp1phv68LAktgqmH7rb7DSCzLTiI7zVk+y7GzfwPR1AjTJaLD/+qwJ3p8xg4/bhRqLE1ScyS
	iBlSPj8QbyjBaofp8C0uaWm27kWbV+38NTNVoEq+MHm2k=
X-Received: by 2002:a05:7301:6194:10b0:30c:99c8:2b1b with SMTP id 5a478bee46e88-30c99c82df7mr2109978eec.10.1782493446128;
        Fri, 26 Jun 2026 10:04:06 -0700 (PDT)
Received: from ?IPV6:2605:59c0:207f:5300::10dd:b102? ([2605:59c0:207f:5300::10dd:b102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca438ddsm18927893eec.23.2026.06.26.10.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 10:04:04 -0700 (PDT)
Message-ID: <310cc7ad-5e38-45df-9ae1-a54ec433c130@gmail.com>
Date: Fri, 26 Jun 2026 10:04:02 -0700
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on rate limiting on nftables
To: Reindl Harald <h.reindl@thelounge.net>, Andre Rodier <andre@rodier.me>,
 Slavko <linux@slavino.sk>, netfilter@vger.kernel.org
References: <DJ3MTZXMKPIT.1A41M4YZMF8UY@rodier.me>
 <8d84a240-b9ae-41f4-b111-33007909b0a2@app.fastmail.com>
 <74E543AC-1B65-4E99-8324-B5758DCBA669@slavino.sk>
 <e8e26118c36111d0b4aa290e1e411ff15b6f64aa.camel@rodier.me>
 <1bdfe5c3-f889-4464-a28e-9533e209371c@thelounge.net>
Content-Language: en-US
From: Gordon Fisher <gordfisherman@gmail.com>
In-Reply-To: <1bdfe5c3-f889-4464-a28e-9533e209371c@thelounge.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/8/26 9:05 AM, Reindl Harald wrote:
>
>
> Am 08.06.26 um 17:01 schrieb Andre Rodier:
>> On Mon, 2026-06-08 at 14:32 +0000, Slavko wrote:
>>> Dňa 8. júna 2026 12:45:55 UTC používateľ Kerin Millar
>>> <kfm@plushkava.net> napísal:
>>>
>>>> If the problem can be characterised as "I endure too much log noise
>>>> from sshd and I find it annoying" then perhaps configure sshd(8) to
>>>> additionally bind to some other random port than 22 and expose only
>>>> that port.
>>>
>>> Not worth of change ports, soon or latter it will be found
>>> and abused as default port.
>>
>> There is a big advantage on changing the port number, though. It is
>> reducing the noise considerably. Also, a connection attempts on a
>> different port should immediately raise attention, as it is involving
>> more than a basic SSH scan bot
>
> and in fact you can have a few ports before as trigger to put the IP 
> on a drop-list for a few minutes which isn't possible when you host 
> ftp servers
>
Which raises the question, why are people still using ye olde FTP still 
instead of, say, SFTP?

-- 
gfish

