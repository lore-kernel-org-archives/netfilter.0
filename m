Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1552127703
	for <netfilter@vger.kernel.org>; Sat, 23 May 2026 20:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779566622; cv=none; b=Kp5TISFDl3/LBqqF73aI3rNLepNSJnjWPjbeao99RFgROq3L9ZkS3zk8Sr1m1GtaUOrkS/XpzVcZeabRsjlK24YRl2YbDtgffWu49U0oi/JnbLYp32mzItmL0y35nWfAUwQU7a58tM1pZad3TnAeWgN+8qfc3ihsh3gl0CKp0OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779566622; c=relaxed/simple;
	bh=4TpfrTDawDV+YHS6WoPqPT/MUjsixWQaVEZ6zjwCQHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Z8S1w6B1yPIexk/JpPVOnsqqAIOxVK4QBjGEQjWoclJqe/5F1xUvHMWPYF5k/MfC5k0rzdxC4l0qIPLMUO9+uaR9MOFQ7muRIEgR/N7/GK7yvBUMZ+MQ3DZ/o6Aaqov30QBLZflEZPPboA77DkwQWeE12Tav0ptchM262UoFD9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bX8nnaVA; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bX8nnaVA"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f00a567cfaso4983742eec.0
        for <netfilter@vger.kernel.org>; Sat, 23 May 2026 13:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779566620; x=1780171420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IjMXJ7nhUempEswuo0Vq7ZrV0UNq2Eez16y37m4EAiI=;
        b=bX8nnaVA/yfKggM6HJWx/e9F9A+S/FMSTti+dqIXrcNPLjXq9EcxKH3dKcwORgIpwQ
         VKEdEJBJmxoVN6XJbCtLr7SS3oL8G/JGirBw8GZElxjxxw4OwqeGEUFqHzDpAcKTZ4a5
         s/M4MOE31f3uXCidcrpG/PV0DjdKRlvByz5poDZVuN9RMuwH6LMk9KhqxYhDF9GFUdHZ
         l811vYrw/24tg++NbHiWyohNos9amXZMvY+ziDGqzYg4hHTl64bztzeDnZ4ZxyDj2cJw
         Waa7AaX7sWGnB9gEZmUBnWSwBoybNIM9So19gNwhCtFSIUD2ogVZoPFhqWWOWDKI7K+V
         5Dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779566620; x=1780171420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjMXJ7nhUempEswuo0Vq7ZrV0UNq2Eez16y37m4EAiI=;
        b=VL6LXrdVmpgq9Bzfzxm+ONbBpcJouWZPrGXuPPayhGDGLtx79GF16UVD2Sx2nV+GWE
         K99KholA37FbCagSarxAZfyp73fbK/1u1YJ+83KhxD+ZYUgeiUSbDEUmHYuSOJpDp2Nh
         S5N+Abb/3SuvbUoM9y72iJ8lmG8+4C32nsn+YDjXl1Jb57h05rtRFwU987x3His9BZLJ
         Z5//KsMYdJosSibzt3T0TWgJgjGIq2qZbpCjWVXoaODHZ78dYzsg2HZvGhLysAbwo4c6
         1Q6/aR5jGKvv6iKtmrMLO/4CCEptUJSDKHcPdUujKiNrG0VITFimsIOLPSFy5kK0Ozto
         xiEg==
X-Gm-Message-State: AOJu0Yw1/pCA14CprSiQ8NCDQh/qw8g8JLkEPou//jLCcCx4RT2+q3rR
	0a9Flq6S1rJUFYwrC/BiD+oPJ0Lkp6T/ZwGIN152h71ybKKbtLmf0FyNKKXYxg==
X-Gm-Gg: Acq92OGZkyvcWS7imupnxbG6YQnmD7wAyn85lVfc4C354Yu+2SsD9miRrhewFaWPHSY
	qSxvSVuXrDlEBZBoIlqUwg6jQxoq6ynreJ/lSNf0LaK1baFvB/4OXATFQRVIriw9dgaTU3uLtEY
	lNk4SQ1gF3Z8p0yvAZbhbN0aohF/Ai4ms0tl50l4YriifvrDxS934+M9iJWXj732lmnrGd1ybCA
	Jj+R9WOm+o3HzH1HCej6cEJqG09VEih0Q1xOYrvaFvugTBJOrZuqSuCc5KsGBPIclKk7Mm6PmhS
	FDuC+twbIjsevIKxxfOOpJy5yl9Vq5mr2S8QvPwY5QmS+zVfXfSpotCRkOCxE0lM4vWKCU0i3vA
	bar4DVklxThb+91IJNvzW4c8eJHyL7pngNPaXS82dBfp2hphrB8Ha8lrZwCT5cVMR2caj/vpgmW
	ALUSITPrerEQijquJnBgvusJZcbyK7GGRYCECeRWrudqb0FNZvq7HTXA==
X-Received: by 2002:a05:7300:5ba5:b0:2f9:1004:b2cd with SMTP id 5a478bee46e88-3043109e7admr6619669eec.20.1779566620150;
        Sat, 23 May 2026 13:03:40 -0700 (PDT)
Received: from ?IPV6:2605:59c0:207f:5300::10dd:b102? ([2605:59c0:207f:5300::10dd:b102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef4af0sm3973617eec.3.2026.05.23.13.03.39
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 May 2026 13:03:39 -0700 (PDT)
Message-ID: <a3d5ef59-b8ab-46d7-ba14-da0ab3ac6f66@gmail.com>
Date: Sat, 23 May 2026 13:03:38 -0700
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re:
To: netfilter@vger.kernel.org
References: <CALtjan=uhF_TjxyK53Ya5PVJsNgiyhOJ0Twq=-H-h1JbGhZFoQ@mail.gmail.com>
Content-Language: en-US
From: Gordon Fisher <gordfisherman@gmail.com>
In-Reply-To: <CALtjan=uhF_TjxyK53Ya5PVJsNgiyhOJ0Twq=-H-h1JbGhZFoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/2/26 4:00 PM, Luis Mario Niedas Hernández wrote:
> help

I have checked the old well. No one was inside.

-- 
gfish

