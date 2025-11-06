Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8124130DEA0
	for <netfilter@vger.kernel.org>; Thu,  6 Nov 2025 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762431238; cv=none; b=SdfuGGOFb35T81moZvX+Awr1N5yHp8nNcDoLLP9VsgjfvsXSDrhvf2j1qYAHVIDRtlxsAzpIjLEMfeyoMZTVPf5z9tTq1+51Vbv/nitFlqZMEMzgySQsnOsAk9k0mozxR8l7pVfgk1krhMKvanFTfQEh00MWGVRZMMAdMR1TGXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762431238; c=relaxed/simple;
	bh=8RdQ47RvgMG2Fi5jrPkWleClxQ0SZD2wBn0j7QX8DDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nNjg68X7dw2owFiMG/WQ90wIHcwJqSbc1AeSOjTOi8BOozJhqjnlLeRMcHQRPUm7mhNwcEYEvxQNNGk/vAqUPrTTj+B6xnjDF8lmb+9AjxYG00NaGBwzTBBn5lQcpSrWpD5ekb2x/DxMLku7XFEyxGeIzDXJzBMoSx/bxD7ONfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yb/QiFuc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yb/QiFuc"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4711810948aso6257185e9.2
        for <netfilter@vger.kernel.org>; Thu, 06 Nov 2025 04:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762431235; x=1763036035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PXntQziT8+XbDBSUMGkkSvdEr7GnX4pT4LFNPRQyYsE=;
        b=Yb/QiFuck/jMYAZVb9ttjYTKRQxd0YoRCyGXl7gZ6Siy+0HIENM3xGdjSf8z4oXz35
         3LUpi9vhfYRUl7H7XJN+onlXprrr7ncqsq3Jf2/iKpn0A2/hWw6pIw/M2ivXZR5N/mSH
         gk5c5hYwh1GHG3rm+9fdmMZqWs9a7/28olLQbLlWAbBkpivhY6bc2wQWrRsrYFSgIlkx
         8NP+k3tgKkBd5e+6nQPlzdHWbz9VKYSDyfedmKmghatcuXphio8zq/YWekF0Wp4NIa9S
         WPSgycw20uwESH1nwwN1EA4BTAmhC7GdMV+Lh4ADPun5bhcBWww8/jsdsFiY4/8Fii+j
         JWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762431235; x=1763036035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PXntQziT8+XbDBSUMGkkSvdEr7GnX4pT4LFNPRQyYsE=;
        b=P5akDh2KbiRGM1n9ZVPCGpp7fcVhvDJxeMqGSw9XMlHLltmQWeMDmO2bISIoiqoG3E
         iBD9qYZR3vvFXideHk9WT4Cd07xZm8hSHjO5ZiPerxX4YwtKsAW/Cv9ilz0YYl5kAHi/
         o6cu0QWCNCFijtSi0UQksAMCzgj8XREZX/ide3JrRzvlCQXpBIDm/kFTUL8zibPc2hR3
         clcf7mGzZ2anHVkckJiSxXZKFnhz1OgYCqosKjkMYcf6VelBM3nkt0tbZ/oVRnsYp4tZ
         l2OyOisqdJfnwLDZ+KjZ/Fhv+JHrUFRNHYogXA48WyMiqfeaYMxXfU2RXEHL3nKoKYZy
         lonQ==
X-Gm-Message-State: AOJu0YxpVwhx7waRPhAkc7iO0LCEbTLKXiLXVoStOtxowosySKjCav7O
	il+fzA1Z+L2BwII1WQxpu0W3+8SWuJyqOTiQa02gNvtrdmjtbS5PRl3hXFf8Jg==
X-Gm-Gg: ASbGncsqspj0M6jFV6FjAKFy4/UK22tq511yvfkPLZ+FhaTHrHPDzWsOXEmCHFHNSNT
	apDrbPiilyrRn3tL+HrBLdWuUubFNd2CCHHP7yMPKoTatBBtRY8ApNOxM6lMMEYXyAlaxs0K69S
	WPc8Ifkd0TeigS+jamwjw6KXCUJZ6G/Qd6igWtI/sxot/3HMcozXebbXPuolGmHW9H4Arbz/vF5
	b3iFccZBEK1YldIBP5KfH4m9ocPqBPRiiZYocvuSGGGETYukxLkZiF+awUUp2e1umUhoh1gy/jA
	dbWlc7A4r5gQ+alxO7UluStAqFDdoLxT8q8cDHQDNnGakRpyNXELgL2NVoGe44xFMhJNtgJAgtZ
	iIi0FGJf3v9auu1AjohZoWje2chIevoJORVH9teWmxrHCXSP2gxRT7WcjVJvQ9dcRW/vrmISAoD
	OmbSdtHvel4hccZrnc6yhBCMg6IO7fGP+/+dmteiuEXhNv1qaMDQ==
X-Google-Smtp-Source: AGHT+IHdqLNdRwuIK52OvrwtIQ9mWWaIva716EWQNoaiCdMLKj2T5PipMELhg43FMmIjDTKd+Erk0A==
X-Received: by 2002:a05:600c:5488:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-4775ce15707mr59327885e9.29.1762431234693;
        Thu, 06 Nov 2025 04:13:54 -0800 (PST)
Received: from [192.168.7.164] (buscust41-118.static.cytanet.com.cy. [212.31.107.118])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477626eb4fdsm44050505e9.17.2025.11.06.04.13.53
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 04:13:54 -0800 (PST)
Message-ID: <203843c7-371e-4e5d-9624-c3e00db722c0@gmail.com>
Date: Thu, 6 Nov 2025 14:13:52 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: coexistence between nftables and iptables ?
To: netfilter@vger.kernel.org
References: <6842094.MDQidcC6GM@topolinux>
Content-Language: en-US
From: George Shuklin <george.shuklin@gmail.com>
In-Reply-To: <6842094.MDQidcC6GM@topolinux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

There is DOCKER-USER chain for those things.

Don't try to use 'iptables for docker, nftables for filtering, it will 
cause a lot of bugs and issues.

See ready-made template which allow to add firewall rules into nftables 
to filter ports for both local (non-docker) and docker-hosted applications.

https://github.com/lidofinance/ansible-collection-server/blob/master/roles/docker_iptables/templates/iptables.rules.j2

(If you use Ansible, you can grab ready-made collection from Galaxy 
https://galaxy.ansible.com/ui/repo/published/lidofinance/server/docs/)


On 11/6/25 11:44 AM, PierluigiFrullani wrote:
> Hello all,
>   first post here so please be indulgent.
> I was wandering if I those two "technologies" can coexist.
> My problem is: I have a small machine that does firewalling for my home net, and on this machine there is also a docker environment.
> Docker use iptables for his internal stuff and for forwarding traffic between host ( and his net ) and dockers themselves. It does this by creating a quite complex number of rules and tables, which btw are handled by docker daemon  and scripts.
>
> So far so good you might say. Well... no.
> being that also my iptables rules are quite comples I used, when in need of modify them in some way, to flush all iptables and start all over again.
> This will flush also all other docker rules so that the docker environment does not work anymore unless I stop and restart the daemon ( which obviously is not always acceptable ).
>
> If I can use nftables for my firewalling and routing needs, and leave iptables only for docker, then I can flush my nftables whenever I want, without impacting docker environment.
>
> Is that true ?
> Is that possible ?
>
>
> Thanks in advance and sorry for my poor english.
>
> Pierluigi ( from Italy )
>
>
>

