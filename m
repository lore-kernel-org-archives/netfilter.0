Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDD81A9F87
	for <netfilter@vger.kernel.org>; Thu, 25 Jun 2026 16:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782406519; cv=none; b=pOq4x0vV9ainUtvSIX9dL/uarzqF+pkNswLLJysPVjf+tat1KZrm3i3CyF/eAUsA6MP6upejE5PjsgR1vZAlII5+knFy/8BYKC3tjFvX9YrQFYzbV9W1PyYzQDJtc9/vaWkynvx+ZPHkN+Pdbf33+hkAC9q2FrNMDMOjk6kF5cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782406519; c=relaxed/simple;
	bh=T0Cu4sQiMtn3GGbuT8isvTMNrsQBX9sZDipdP+YA+Ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rfPgy/EzPWQid3Qkdhvp9DBC+R67x2hivOuSt7JVCx5l0m48Fhr9LvXNkMISbUNu7zZZyEKWCNJ8F0IHxdFTGCkFomdFixhRp1LdrNJ8tdfO0opMw1811qZtCEunf4ozwHCCE4lWejPMitX2lk8O7BUOxrt0lRDJiGVhM5F1vis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhI8b+lL; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhI8b+lL"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304f590dd91so128505eec.0
        for <netfilter@vger.kernel.org>; Thu, 25 Jun 2026 09:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782406517; x=1783011317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wNycTMUND9rX+oId0ZF7rK5i/JnXzYQiUlj9MZmtqGg=;
        b=UhI8b+lLlg6iwbnzoMbHxQqu8rQLbUMhrLMp8mkNMrsZPFWwb7+PZWKRc1hcFINo8R
         Yrh7zdwbbAkcRy0+BPBIUnhpIxqjFrbAj+EoMfNYeq8F96X/3AmglapSIBs07PmGzqpk
         x7pvK6Cya0iPJtPcIA78qSibHp4174yVqNNKp+8AxB2FoskKDY2Fp9PFZZ9y6cKtg0Gi
         uoUS5l+a3yb8DLLST4k1ejuG6X4vxzehIZZ+/8wmd2y7qJSywC+0TtoFKeqRf8Nexm5A
         ZtS+bE+4iksJ34EvMQaqeNMpwx3QTlVVrxyvm7QTDWgsxmywSAKLGnl5hrTG0Lw/ip86
         ZX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782406517; x=1783011317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNycTMUND9rX+oId0ZF7rK5i/JnXzYQiUlj9MZmtqGg=;
        b=KRi1xvISNLZscpQMr6I8jwCtUHI1CbWXckyx9/hS7GN6qYVfBwf7OZxTQpMf8AidpN
         OJCSBqxD2/qPaqEbUqj0BRa3e1R5F4L7Fze9NXeuR2dfD4oBg7LlYOuMMLx7WsS3ToDW
         c3sryxBNRA0cWe6lERe6ig34unVN3/aDk5LqV4giEmiOKSdP3TR7iAV/gTL0DjiodNjK
         YtqI4rHxdmfQ/u5b3bCFqMCdhd+6RuDeuKtfFgcM64weL9SUl7Y7/xi10coFwiB4COkC
         HVtR9RxaibG7XdRJxkYGsshvg40Q/zDtOpykKWEwjUlcAkNpq18X0cRoddykCcBCIZN6
         TQmw==
X-Forwarded-Encrypted: i=1; AHgh+RoNZtrSuQQtjHOoTKBXz7HQz9LYR/f3rimUS89Zap/q+CjAilJxi8gGJ00fmGFeMrgk+kWBmtjHJw4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1830FhSXIp/um9/G7aNyqNagby1jlaXlQ9gqkM/MPRIYgH5uc
	0WmjpQaDSXBDkDbClrJb8RBVk6Ll59oaR4/hkM+Dq54gBxJsrc+IRbXXcstYtm6w
X-Gm-Gg: AfdE7cmK991+BFcCXxDC9UOHN0P7ctC7f6zmHXDo1KXOIFaZ5WAuoTcQjHrlZ8TnAuc
	hENpSe5S1Uq1/6/NhuldiB58mF1MVgZt2zy+JmC0qvDld9B415VWfZsuRnu5asXX6Duk/ICGglq
	4zC3PHXO0IDp2s523fvLExIcOcs41zH6pZYmuQtPF+qokO8SPOSmYYut0hCEWm6flSbQXeCWKlM
	3Vf5q36+MRILdX6JeGXCnaSiwwFnRPiRd6/cBEnBGE4OC0IPFhcfub4rf3ldQErTtscSHh7Kk6o
	vcLXDWZoWRKgWgwgGgSnlHYdb1qcS9K4Gq45H32b236MVCJqBho/4dOYtXjOdLQEMaAyEJWsA2v
	Ewu8FvbJHJhWJyogCG7LP4AXsDC6MP9eNgeaj70q+dy9cCXEkKTh6EV/TSbUum1xLS4dtMqmy+5
	7THDMDo3f9lRDja2tB+5o5NVPVZYGYG181Ni7RoANl2JI=
X-Received: by 2002:a05:7300:8c2c:b0:30c:2af0:1cc with SMTP id 5a478bee46e88-30c84fdf0c5mr3967060eec.34.1782406516846;
        Thu, 25 Jun 2026 09:55:16 -0700 (PDT)
Received: from ?IPV6:2605:59c0:207f:5300::10dd:b102? ([2605:59c0:207f:5300::10dd:b102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca87caasm9534797eec.27.2026.06.25.09.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 09:55:16 -0700 (PDT)
Message-ID: <5a12f4da-c052-493b-8cd5-3b5319d05057@gmail.com>
Date: Thu, 25 Jun 2026 09:55:14 -0700
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on rate limiting on nftables
To: Kerin Millar <kfm@plushkava.net>, Andre Rodier <andre@rodier.me>,
 netfilter@vger.kernel.org
References: <DJ3MTZXMKPIT.1A41M4YZMF8UY@rodier.me>
 <8d84a240-b9ae-41f4-b111-33007909b0a2@app.fastmail.com>
Content-Language: en-US
From: Gordon Fisher <gordfisherman@gmail.com>
In-Reply-To: <8d84a240-b9ae-41f4-b111-33007909b0a2@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 5:45 AM, Kerin Millar wrote:
> [...]
>
> If the problem can be characterised as "I endure too much log noise from sshd and I find it annoying" then perhaps configure sshd(8) to additionally bind to some other random port than 22 and expose only that port.
>
> [...]

Another way is to simply disallow (drop) all connections to resources 
you don't want the random public to access, and only allow the 
hosts/networks you actually desire to get in. This has long been my 
policy on any server that I administer and thus never had a problem with 
random probes.

-- 
gfish

