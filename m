Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E555A11D
	for <netfilter@vger.kernel.org>; Mon, 24 Jun 2024 16:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719245097; cv=none; b=JSrTONxWF9QAvYNv7hTPX6Bh+E6g+03ZPKyhtlp4XJ/vKeFR1WQOpQsbgoMQgJkhyH9BCWWWZbJls7oynA7+Ft8RsqeIc90vjb6Zx8M/sPZ+LZoM21nxMrgPCoOCnIc7K55U7CJBtmm/gZ14CsfJgXdq7xDvgKqAhB40F1yrnR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719245097; c=relaxed/simple;
	bh=VoHq5rHRvFSR/BxoJ6z7rbVj7DK02ls/4sMDzqCtg30=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=R0vvncDx7RyONljEauQhB3+/EdA8YR0fmiWxF8vATQqx8ybGGmWmcH2cvsBTKr9Mr5Q5Jgjs2Tfb6MRpD8wja1h7hnltXIhRJYP8E0XIzk7KV0JxoLlvYi91HcAIeSeI/qjSmckuZkFgFwe/wugj5BOU8QLR3rIUXouQsk/SLXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=hVm0q9ba; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="hVm0q9ba"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42172ab4b60so37447375e9.0
        for <netfilter@vger.kernel.org>; Mon, 24 Jun 2024 09:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1719245092; x=1719849892; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:organization:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6A21eoCAQqxreg97yyjvdEEE8HpIMBjFHYh2LJRFxI=;
        b=hVm0q9ba1C/iQtWwysjZiTMO1UC8RT+5FN/Ca4Xa7sqgBNaMB/laaNOj5fBJMAHP5R
         LwsCr5X4/vVXo6MfjhDVk0693AzFNguQUur+Pb9fdDjd5Px5tqPPJdnygrE7eyRPEexy
         lkR+1uIesk9rrFUiaOkbVRPWYnnsapYyHl2P8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719245092; x=1719849892;
        h=content-transfer-encoding:subject:organization:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6A21eoCAQqxreg97yyjvdEEE8HpIMBjFHYh2LJRFxI=;
        b=ivYqeDS66ZKwLw4kynHjAJZ/S6HSrFmTZymLJKTxz2ZslppbHtDmEcLCwif4LKS//u
         eQbo8Hqjw60FwnUFZ2sBUVBBAr7CdhaTp8VTEiWkqNptrHLHQprfP0HoFy6xsb2LqRo+
         rYlSQm9K9649ffgBLWZXdtQ4KPx+iejTg3RFYm6RIPcGMkAiS7+ppCEFb3QVSjRou4+C
         K//OxV548mjoZe6mZvIUS3m1VD5ZqSlepyOAzK/vybFDenY/KQ+taxfa1x3RqdRFvhB3
         zsWwa43lZM3jf5/rH2Sn6IiDVs5yA9XZayELlPO34vuDonftt/D9j3KH4DQAyhLReW43
         2lPw==
X-Gm-Message-State: AOJu0YwxMdYXbhpWDoc+R7foAGJag5JmImg9Yk6nhAXdmTnl32Jv6gvz
	2r7h6D6dXHsA2EzV8Y/qJ2odgQtTPtOk4Kd+RbHlez8+BolRA7XGTFc6fQokJ7qAqJHyF37sifw
	v
X-Google-Smtp-Source: AGHT+IFPXDP5Tr23FrDVjlubCV7heSjQWdADpQ3uVnBlDEpjCv+l+gQq0/YVH3Pnl7vn2B/BLUoB+g==
X-Received: by 2002:a05:600c:4451:b0:424:76db:3583 with SMTP id 5b1f17b1804b1-4248cc59a47mr32997325e9.30.1719245092003;
        Mon, 24 Jun 2024 09:04:52 -0700 (PDT)
Received: from [192.168.0.22] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366388c425fsm10408051f8f.38.2024.06.24.09.04.51
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 09:04:51 -0700 (PDT)
Message-ID: <a0d8900a-4098-449a-8db9-adc49d8c63a6@smile.fr>
Date: Mon, 24 Jun 2024 18:04:51 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr, en-US
To: netfilter@vger.kernel.org
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
Subject: conntrackd: Trouble using multiple Accept addresses in kernel filter
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

We are trying synchronise conntrack tables across multiple machines using conntrackd.

We only want to synchronise conntrack for a limited set of IP addresses (for example: 10.132.159.60 and 10.132.159.62).

I'm working on Debian stable packages : 
* conntrackd 1.4.7-1
* libnetfilter-conntrack3 1.0.9-6

Here is what I wrote in conntrackd.conf :
  Filter From Kernelspace {
    ...
    Address Accept {
      IPv4_address 10.132.159.60
      IPv4_address 10.132.159.62
    }
    ...
  }

Except that does not work : After debugging, it appear that in this configuration the kernel does not send the conntrack element to conntrackd. If I understood correctly, this filter is read by conntrackd/libnetfilter-conntrack as "Accept CT that matches  10.132.159.60 AND 10.132.159.62" which won't happen.

Switching this to Userspace filtering does work : CT are sent from the kernel to conntrackd and then synchronized across the other instances. This difference in user/kernel filtering sounds like a bug on one side.
Userspace filtering is a bit heavy for the system, and we would really like to stay on kernel filtering.

I've also tried to use one "Address Accept{}" bloc for each IPv4_address but that does not work either.

Some random elements I've gathered while debugging this:
* All the example I could find only used "Address Ignore {}" blocks so I guess the "Address Accept" option is not heavily used?
* The code adding the IP to the filter is here : https://salsa.debian.org/pkg-netfilter-team/pkg-conntrack-tools/-/blob/master/src/read_config_yy.c#L3258
  nfct_filter_add_attr(STATE(filter), NFCT_FILTER_SRC_IPV4, &filter_ipv4);
  Interestingly, the error messages some lines higher only mention the "ignore pool"

My questions:
* Has anyone pointers on how to setup this usecase (kernel filtering + accept on multiple IPs) ?
* Is this a bug? (In that case, I'd push this to the bugzilla)

Thanks in advance,

Best regards,
-- 
Yoann Congal
Smile ECS - Tech Expert
