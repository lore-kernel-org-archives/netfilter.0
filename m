Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABC61A0729
	for <netfilter@vger.kernel.org>; Fri, 28 Jun 2024 14:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719583738; cv=none; b=mZdbYYnvPKyH29D5LEKoXQOTvxF2CjLBrKmcO9452/PhWlpJ6vAcUO2GEpg3U2eWQku1fQcdvtguflSRwwT5iDxIVVkL2gQ3SAkMBi1bqW9M7o6WHMAcBrvHYYjmv1OLY3mmsmMtotgTHPoKukArIZDaMKn5x8i6dxalZtG9tog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719583738; c=relaxed/simple;
	bh=6Xnm18b4Jb3+M/PY1T/ko464IwH7PN2IEk/WGgWBN2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WBn3EIr+NsNCVm37xMFPxVyHZeFrDRhg5wFcG3qeL1Kkue3G0/BR6m1qy6jQRdX/1fSKGn8GRf+y5mCu+SCDe+H45zdd65A4Vd6/8ESu16htXkOAfMaKaQkOCKG2rk4yKBadsD6XWqVNbczvBoVv3oW7PfovYYJ6dYlfgM80VP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=xtLoBGzj; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="xtLoBGzj"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ebe6495aedso6787081fa.0
        for <netfilter@vger.kernel.org>; Fri, 28 Jun 2024 07:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1719583733; x=1720188533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t/jIB2Uz3dGWJehu7j5on2QF9hpIsdAO6QhifsybXDk=;
        b=xtLoBGzjDQQhoKvGLNUp8H+x4z7X9ePpIpcxVbVHCcTjmX2fT5MWq0Lq7gAwq8q28i
         G/+yo+mIkjhi8cVTaTHFbJvo4OTzga+LNtLYT6b3t3D5ALhnl3wd3vRW8UVUq0A8ksaL
         m7OdZxmrUUglyxKqwuQdnbaY5SnLboiiuIiiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719583733; x=1720188533;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/jIB2Uz3dGWJehu7j5on2QF9hpIsdAO6QhifsybXDk=;
        b=ILYvYxb0a3K4BukiVX1+3tqY0yP5aVv/kRWQ130MqyPZh5F2FRGAOC8ff5hILrnbp8
         zksaTPWuq8LX+1J2pjwCFfCdjfTw7gWDzCuYwUfN2sk7+VlK7NSfGwdiCmvtbuGyrlHa
         Svgz0b05s2VFOy3byysJQxgrSAy5AoHwx5/wCzvkAh0NnRmOwvwQhNsdzY4Ydo1QicTi
         5hmb/RG01mKpcnwZZDyPRdVW/aYVliZ6+bRtYL/lIw9is57SfcGF0D/wmtaB/zN4UhUR
         4IeyiDEvwrBCphJcDCusNaQhcCK83/yf8x15WZdqUub8ZE/TBtXXrk7Z7b0Bwtz23twV
         MrWg==
X-Forwarded-Encrypted: i=1; AJvYcCU4oDOSIT+7ehMk7CEfkZOzK00T7Lnu5EyVEd3MNOyW/IlhOL13RuvboumATO/EYkOhMkq6i+mG5qLVhOfvML0cC32wE3zAqf7R
X-Gm-Message-State: AOJu0YzvXocPr1IWyw5eIV+Ec7D1K534Xlt3yrRSkBE+bH85axHGTy6h
	6tRuBEnyYNMQbastC6e+poetJbzKGTTbQbiwUuF4dW1VKHQy7ZK7ayKFxTc8pok=
X-Google-Smtp-Source: AGHT+IEgGSsoTSeY2D+Vmd7WdWIYCTg4uqR67hA196SL3slwuyEPMoWnHKPXAm0Olvw2j9FqCfPFbA==
X-Received: by 2002:a05:651c:154b:b0:2ec:61b5:2162 with SMTP id 38308e7fff4ca-2ec61b521d6mr114034251fa.25.1719583733000;
        Fri, 28 Jun 2024 07:08:53 -0700 (PDT)
Received: from [192.168.0.22] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af38a0asm38073025e9.1.2024.06.28.07.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 07:08:52 -0700 (PDT)
Message-ID: <feac4e6f-f47e-4dcf-9bbd-2f49cc86419c@smile.fr>
Date: Fri, 28 Jun 2024 16:08:52 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: conntrackd: Trouble using multiple Accept addresses in kernel
 filter
To: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org
References: <a0d8900a-4098-449a-8db9-adc49d8c63a6@smile.fr>
 <Znm4e0HWXFPomGqp@calendula>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <Znm4e0HWXFPomGqp@calendula>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 24/06/2024 à 20:18, Pablo Neira Ayuso a écrit :
> Hi,

Hello,

Thank you for your answer!
 
> There is a fix for this in git.netfilter.org/libnetfilter_conntrack at
> git HEAD.
> 
> Could you check that this fixes the issue for you?

Sorry, but no. I've tried master commit for both:
* conntrack-tools: 5b61acb (conntrackd: helpers/rpc: Don't add expectation table entry for portmap port, 2024-04-25)
* libnetfilter_conntrack: e0d9ff6 (conntrack: bsf: Do not return -1 on failure, 2024-04-26)

This filter config fragment allows CT to be synchronized using Userspace filtering but not Kernelspace filtering:
  Address Accept {
    IPv4_address 10.132.159.62
    IPv4_address 10.132.159.60
  }

What commit from libnetfilter_conntrack do you have in mind? (Maybe I can see if it's in my code path?)

Regards,

> 
> Thanks
> 
> On Mon, Jun 24, 2024 at 06:04:51PM +0200, Yoann Congal wrote:
>> Hello,
>>
>> We are trying synchronise conntrack tables across multiple machines using conntrackd.
>>
>> We only want to synchronise conntrack for a limited set of IP addresses (for example: 10.132.159.60 and 10.132.159.62).
>>
>> I'm working on Debian stable packages : 
>> * conntrackd 1.4.7-1
>> * libnetfilter-conntrack3 1.0.9-6
>>
>> Here is what I wrote in conntrackd.conf :
>>   Filter From Kernelspace {
>>     ...
>>     Address Accept {
>>       IPv4_address 10.132.159.60
>>       IPv4_address 10.132.159.62
>>     }
>>     ...
>>   }
>>
>> Except that does not work : After debugging, it appear that in this configuration the kernel does not send the conntrack element to conntrackd. If I understood correctly, this filter is read by conntrackd/libnetfilter-conntrack as "Accept CT that matches  10.132.159.60 AND 10.132.159.62" which won't happen.
>>
>> Switching this to Userspace filtering does work : CT are sent from the kernel to conntrackd and then synchronized across the other instances. This difference in user/kernel filtering sounds like a bug on one side.
>> Userspace filtering is a bit heavy for the system, and we would really like to stay on kernel filtering.
>>
>> I've also tried to use one "Address Accept{}" bloc for each IPv4_address but that does not work either.
>>
>> Some random elements I've gathered while debugging this:
>> * All the example I could find only used "Address Ignore {}" blocks so I guess the "Address Accept" option is not heavily used?
>> * The code adding the IP to the filter is here : https://salsa.debian.org/pkg-netfilter-team/pkg-conntrack-tools/-/blob/master/src/read_config_yy.c#L3258
>>   nfct_filter_add_attr(STATE(filter), NFCT_FILTER_SRC_IPV4, &filter_ipv4);
>>   Interestingly, the error messages some lines higher only mention the "ignore pool"
>>
>> My questions:
>> * Has anyone pointers on how to setup this usecase (kernel filtering + accept on multiple IPs) ?
>> * Is this a bug? (In that case, I'd push this to the bugzilla)
-- 
Yoann Congal
Smile ECS - Tech Expert
