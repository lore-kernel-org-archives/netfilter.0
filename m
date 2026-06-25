Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D0337C92D
	for <netfilter@vger.kernel.org>; Thu, 25 Jun 2026 17:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782408061; cv=none; b=QcC8pF9IUAAtzohqdkEJDa/MpJZwOUIZqbQzZJM9U8NEwFDKvBQOSZQJ8ipO+NEIsqW2XdH5wfLabTbeSGdVHyhVOTRlXnRBjgxtSqVm1I61b5eN6e1ZF68c7lptVeglrRFi2q2hW1a0IgFb571ysql1QOscFEwgWqjqIsFU/2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782408061; c=relaxed/simple;
	bh=Kj0z1vIajO6G5ISbmAQXRyEcLzfEvKd8CEFo4+HoJHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=S63l6F5XMBlytUJnbFRXmZfN7ONJhBLGBhKofhmbmf9mBoPR66xRhgylIjVP8S6rgId+A45HpkZYFdU2tD1Rsdf7dxxyX/lhcHInxgJuj4dlubGAjP8Xd3xglq4swuvkQziB1s/ePCLEoZ1VZ0zraHBF2gT4XXV7TEs6fUWDQTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmM3gFQj; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmM3gFQj"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30bf132969bso201754eec.0
        for <netfilter@vger.kernel.org>; Thu, 25 Jun 2026 10:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782408059; x=1783012859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ntVloE+C1mM/NaeyXSvt9iulU28ibzGc9NVPFiGH/xo=;
        b=HmM3gFQj7mzPVJUPmJjpELs76QBWunJzI++KtbBEGtBZYJS1fUOhmjgUi/7GN4Si86
         c4gNL4BDHEhhqMobPPVaiO6RewIX5umFo/j2Nt4L4+7x2VXRL5Uj/azHdqtgoUzqqUf7
         8tXDHuJ8nUTL6jF6vjuaUFZLJ1PKM004sEklKHpKIJUiOQ1HZV3ySibS74XhHE6VVIhe
         YkTpjNVl7xS0lZJLoKPFTG+nEOS4XQ6azQl2p4Ru/Pv4ZuyKrKshigTy0nHI0ZNag+XI
         2ZJs9WiGj8on0jqWCPBowGKYcsN5ium068p3WmXP6XGtP396i6Eu++WgsfG7npgfMQ5l
         UvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782408059; x=1783012859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntVloE+C1mM/NaeyXSvt9iulU28ibzGc9NVPFiGH/xo=;
        b=inMUSPXfQcb87TeY2GG7tlFs4L/29JbyABUU1OlM2SEkM/xB38HiIYrxEyKfVtWqQz
         vcOqb5/GXVjCCh8KJ8R+kT6RPhf16ebrgSTFaqbeBh66+Z2BFHTdxmgLR9EtMMa91hq5
         mHFpI/uSX+x7yuacokzLm6taIANxnImoCF1g/x96sFV7EZW9MwYYHT/zSiSlCTzdpVEm
         xnXWz42YbWu2G2ge9A7AwDKF2gWclyKFRkbsGJcbFQ2y/BUtPhpfK6PQxKxEnsQs/+bJ
         CuggWjrCnEuiKgfLo5wldTKSkYwJFVvjMQ6/dY/+sEhXJvoZO7bPSBix963voVCogreH
         eznQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqz7W4/9CIN7++oX3gIBBSrOJAgD+tYwDC6XuMdK1beaTterfYYaG6uj6524LMJp5wUY41g+iutRBI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu1NQvsNDCU95ZfqZGfaeegOmCS7/dFV9sX0ZHyQHJJIXQgJxo
	R1dajM69fMKCvJcyxcbLG45obz3zKoBnlt+CYKy+MGE3G3wDHRWLDPal
X-Gm-Gg: AfdE7clsIQUupsCCIN1N97jm/B/agjjJ0Pw6pzzhRvvWUQ0/f0T+R43BM1uRXNtkxTT
	ZdH4/Cyd7DTatHL9/XlHUvXQBSp2Qm+ENWVGG/ohz1rK51XeQXAJcaOrN7r1TVhFgIubTx2oEAZ
	Qytn4MA3tY575bGvay/sYSROnxZEAMcioIXs4loVDm/vu/OgzkJUB9UsPyKbT0K1xRjnccTqE7s
	4ARd9MqU4BRWNkhDx1GnTrWyuY53xX5QcQIvO4uth+GglnJyGgpYiimA71wnECtCLeHQCY0eNHe
	FGVAI0VYYtgDZSqzz8zZhuQtqT/dzusWBs4gIUG1JaqSip1EO/QkOHjyxxIvMZ6zPp6YwajvAFg
	La6pf0Pa7iaGaYyj0u38knP1iorALxLCHhlEbDUIUJ9NJfgCHxZpTf9Nbmt07eCD7v6fq0W8rRG
	f7pfvpue9f2LhGCNdwCq3ZcJ2Cp8jDLS7VDCH1ZkBG1rk=
X-Received: by 2002:a05:7301:6583:b0:30c:7b76:9047 with SMTP id 5a478bee46e88-30c84d4a202mr3547280eec.17.1782408059014;
        Thu, 25 Jun 2026 10:20:59 -0700 (PDT)
Received: from ?IPV6:2605:59c0:207f:5300::10dd:b102? ([2605:59c0:207f:5300::10dd:b102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1ab6sm16274478eec.15.2026.06.25.10.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 10:20:58 -0700 (PDT)
Message-ID: <e244a0d0-49ec-4ea4-aba7-3aee899ef0ed@gmail.com>
Date: Thu, 25 Jun 2026 10:20:57 -0700
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on rate limiting on nftables
To: =?UTF-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>,
 netfilter@vger.kernel.org
References: <DJ3MTZXMKPIT.1A41M4YZMF8UY@rodier.me>
 <8d84a240-b9ae-41f4-b111-33007909b0a2@app.fastmail.com>
 <74E543AC-1B65-4E99-8324-B5758DCBA669@slavino.sk>
 <e8e26118c36111d0b4aa290e1e411ff15b6f64aa.camel@rodier.me>
 <6141c93d-ca25-4b3f-8a6b-b048f2ec595f@gmx.com>
Content-Language: en-US
From: Gordon Fisher <gordfisherman@gmail.com>
In-Reply-To: <6141c93d-ca25-4b3f-8a6b-b048f2ec595f@gmx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/8/26 8:57 AM, Lars Noodén wrote:
> On 6/8/26 18:01, Andre Rodier wrote:
>> Also, a connection attempts on a
>> different port should immediately raise attention, as it is involving
>> more than a basic SSH scan bot.
>
> Shifting ports might quiet the logs somewhat, but your SSH port will 
> be found both quickly and easily by bots.  That has been the case for 
> a long time:
>
>  https://bsdly.blogspot.com/2013/02/theres-no-protection-in-high-ports.html 
>
>
> It is difficult to fit nftables into mitigations for those probes 
> because modern scans usually come from a wide spread of addresses and 
> networks.  In the case of SSH, using SSH keys (or even SSH 
> certificates) and turning off password authentication clears out a lot 
> of the bots, but that has been mentioned already.
>
You can just block access (drop) to all and only allow to specific 
address(es), then probes are taken out of the picture entirely.

-- 
gfish

