Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37449339708
	for <netfilter@vger.kernel.org>; Fri, 12 Jun 2026 17:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781284823; cv=none; b=rZzmWuL2aVqnOD+9KHQDDe15GYcewG19c+o/GCPcCbYsNoE6ZmusLw+sG6I45ervRBxdynpDd6q7w4Wa5hXVdi/bqxDBHxQfiTbX0RhBcVde6RHi8tQy710J/dA4e7sBl8zZN0KmhJ/By6oLXaapoOYTHFE6Nd3Em9Rf0yOhkV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781284823; c=relaxed/simple;
	bh=A08TSzPY6XYPNZXjtVynLfFKQRzXm08w0LTqW1MzRPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m67paxqK7GAMeF8Rr9kR/ZzrZk+5+uxg4gU+lu5WUkQXQLNgsODQ3ZZlPGFrzp8MBDmLVDQ6WfdSFtmAjJ22/1+fsf91B2UA8B8Cwr6R2mjmfKCOh9L3yU5LTsEFx9jD5uTmGjlevy0CIVjC6mLuCfxPpf8aEteoS09daOIO7HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1GYTw66; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1GYTw66"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30759632453so2601677eec.1
        for <netfilter@vger.kernel.org>; Fri, 12 Jun 2026 10:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781284821; x=1781889621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yPCMbIDgBVEqWxc2nJ38l0SYi4ga3DLde3jIIAW0cx8=;
        b=c1GYTw66rrmKE9XtVey0+M+czfwXQgacv4cUNJL02JkYFUd+/EczaISWhhMPEz5084
         fleat76kuTl1P9nTqOhGy3WvM/WB0YkmIHv32T5qInAotj8zjMlq51od56BVTk71ReF0
         bsCCSa/s9tpz+7VD8OG2uDVgyMU1wmcv/YAcHDKjnJIjO6dM0sAs6lgASK5Fh1MZ4FbA
         apF/rfeZm71vMzZ9vXPW7hKARu3BHO3YJ1maVzGGGMG1NGV3ozNjXfMyWBCTx/QqWFTX
         kkowyhpyhV67wOqg3zImxV6wlMtOkO//BEncVzpvmqFNItKaGTp6zh/M0wwraVkbLywP
         SiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781284821; x=1781889621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPCMbIDgBVEqWxc2nJ38l0SYi4ga3DLde3jIIAW0cx8=;
        b=YrN86TSXCyVgE3HGebTjarF8msSfx24gbb3QlGWSbcm+VaPQO8d/ILsbPRzBNdyScw
         XYn23NSoTysbgg9TO3RcloEwUcSii2Oot3mMf2CEbEF7b9sY67hiX0QLbLRbQftwGeMA
         yUy0Y7LoiNJX7sCst0qUXao6uAyh+5r+RY6+R25pSxv8hkePKkHmmolxAkZSsAaOrlA8
         RevCLHGcTQYIqlp9+GuKxf8/nSP8Q4/6hFMd8+Kc4TnCZ5TEfJio3t/kRVgWU23MsN3p
         VUqAxYBkkaOSVnikyLv3sl/H4pfybfzSzQrau+I4ydBd6rRIUHsFoB44nQBRhNdE1Zoi
         u7dQ==
X-Gm-Message-State: AOJu0YyTw9sOikNbiWwIp8JBbCGPKNDrU6jACVRjSjwF6Mja/QYxZOEz
	QNxxn3JXVca0pb1EYNDI5BU80v5oMVuyVcstM54RkVXC8/yoHTSumMpLf1ZCDAdQ
X-Gm-Gg: Acq92OHmmg+Hg2OXgW6gP69DQhf3pKsz00p4DONmuxyektfIALYnSk+b0ug+oCZ87SG
	yhe/OuSFs41ImYNyHrVkj6PZBRmNnICSdu6mwtn7YTNNNEocmvB2pUivDRVsBDJAPr96jdsqiVT
	IwardiHc5v+YxsFSGJezcptd6HHQjrAd30AEJX5VQxAEfJSk5AnpgDJnlsSxyH2194tD96VDl/8
	UsqEV6KfRWQc3+2cMvyPmlnNbRt2/lVRPaPo6uSfp3kqJ6yS6Vp4vbIsmEE74YZRToI0h8G2rAp
	y3CD8mDZxIqolTCaDkGNItavopf2z9fUcqB389ouBDI+jFgpI+UjHhlGyvLdcrZxtSmjAr3F4Nk
	dkp1u2Lr/URpOW9dhOp1nZuoWp+mtJ4LPQ8+DQGWjGMoMnhTudL009yGHqXGgOfBoPIz8EwyHzY
	1obsJtGcQTlgLepP/cneU745MW6NRDvSWE5wTOvalEaoXfIZaSyFdOxkPalJ6EO3hu
X-Received: by 2002:a05:7300:5412:b0:302:e560:afb5 with SMTP id 5a478bee46e88-3082009d0a3mr2446913eec.18.1781284821244;
        Fri, 12 Jun 2026 10:20:21 -0700 (PDT)
Received: from ?IPV6:2605:59c0:207f:5300::10dd:b102? ([2605:59c0:207f:5300::10dd:b102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a138sm5323751eec.31.2026.06.12.10.20.20
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 10:20:20 -0700 (PDT)
Message-ID: <2e1fb0a1-076d-41a7-a328-3f7871d5931b@gmail.com>
Date: Fri, 12 Jun 2026 10:20:18 -0700
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Logging SNAT'ed connections
To: netfilter@vger.kernel.org
References: <aibwHhKDBOgr2p7M@fi.muni.cz>
 <90d53169-3ae6-40a6-a01d-7fae27d24c8f@app.fastmail.com>
 <aich5cMiSFlr1pcH@fi.muni.cz>
 <3c59323d-449d-4f1c-abf3-2df0ada64cbb@app.fastmail.com>
Content-Language: en-US
From: Gordon Fisher <gordfisherman@gmail.com>
In-Reply-To: <3c59323d-449d-4f1c-abf3-2df0ada64cbb@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/8/26 1:47 PM, Kerin Millar wrote:
> On Mon, 8 Jun 2026, at 9:11 PM, Jan Kasprzak wrote:
>> Hi, Kerin,
>>
>> Kerin Millar wrote:
>>> Unfortunately, it appears to be a bug affecting ICMP. Possibly here:
>>>
>>> https://git.netfilter.org/libnetfilter_conntrack/tree/src/conntrack/objopt.c?id=7e5397b9167bdd7597be809b8f088ff333e1ad31#n189
>>>
>>> For now, I would suggest filtering with something else.
>>>
>>> conntrack -E -o id,timestamp |
>>> perl -ne 'print if /\bsrc=(\S+).*\bdst=(\S+)/ && $1 ne $2'
>> Oh, I did not expect it to be a bug.
>>
>> Anyway, you probably mean src= in both cases. Using backreferences,
>> I did it this way:
>>
>> perl -nE 'print if /\bsrc=(\S+)\s.*\bsrc=(?!\1\s)/'
> The idea I had in mind was to compare orig.src against reply.dst. Where orig.src != reply.dst, NAT applies. Your approach compares orig.src to reply.src. Those will differ for most flows, whether they were subjected to NAT or not.
>
> I would tend not to use backreferences in that way because it becomes quite easy to make a mistake.
>
> $ printf 'x=123.45 y=123.45\n' | perl -nE 'say "matched: $1" if /x=(\S+).*\by=(?!\1\s)/'
> matched: 123.4

Exactly, great care needs to be taken with back references; also given 
'x=123.4 y=123.45', the \1 will match the '123.4' portion of 'y=123.45', 
making it seems like they're equal when they're not, so getting it done 
properly going that route will be far more complex.

Instead, here ...

$ for s in 'x=123.45 y=123.45'  'x=123.4 y=123.45'  'x=123.45 y=123.4' ; do
   printf "%s\n" "$s" | perl -nE 'say "x $1 does not match y $2" if m{
       \b x=(\S+)  .*  \b y=(\S+)
     }x && $1 ne $2;'
done
x 123.4 does not match y 123.45
x 123.45 does not match y 123.4

...is a cleaner way if one wants a more readable version.

-- 
gfish
