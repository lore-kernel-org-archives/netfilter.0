Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9377291C
	for <netfilter@vger.kernel.org>; Wed, 28 Feb 2024 21:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709156152; cv=none; b=e/LXkwIEQi610dJjYiWAF2tVJv32KZh8QICAIUuU4NdssRr93EkktvjHc9xWKQZLKqYUgxyNjJda9F9LgrwDpJWJWBUD+jMC1UVlFMT8UJHLfyHte1MGSnOIc497sTVEaWHZNK4OvlvcBIovXMP5pGtMgQqzNSJs6G0V/ClcHDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709156152; c=relaxed/simple;
	bh=syLbqE+hkizTVk2PYQqopo/CdY/qKlh262wKcC21uV0=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:
	 In-Reply-To:Content-Type; b=X4kgtRnzqAc3tYGmLuWTs+O1sK4/h6BGBIc5T2NLt3rKisScupRMyunypMIaDevd1LDm/Sir87FMdxDpgkv0IiJC9ToUdRnu2bwZ4DBB9IvUU8jUY3HuG2P5j6sFe5UZyxoAI/lE1XPV5HC73ySYXjlAUA2ub7edBX7cHYUT0m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDbWc5WC; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDbWc5WC"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e56a5b2812so114120b3a.1
        for <netfilter@vger.kernel.org>; Wed, 28 Feb 2024 13:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709156150; x=1709760950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:to:from:references
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o7Z8sM/xmXoJTi3RrWMC6sKP1D73go3X8Rs3ckulXsE=;
        b=mDbWc5WCkHlWO42xnuuiAG5s4yH3sT3OojlvSXY9jx6eq5vocZHbObU1VWa7VshcMl
         OZtdtDQT2zJDMImcnUy2SOOj+4OdcvtpK26wpBmB9Hmel2cw61N6OcZDPPniMaXfUkCD
         hFJaY1ukEpxydW5O06KsekNLK7+vGxfgHI7Dsrp18nkY2PUS+wz5f2z/xLykXe1thkor
         Qh+UybF043YaxaRVXrd8tmfyxBwJEDrq1jCdv0F3cWHnzULFPmYfGr1dGZE/IW/GPfWG
         uyxo901AAWMryJxoIw98teEAjX4zJzFWcNX12y1CvJgMUp4xFR09ItpolI3FU1RzYdsx
         2krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709156150; x=1709760950;
        h=content-transfer-encoding:in-reply-to:to:from:references
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7Z8sM/xmXoJTi3RrWMC6sKP1D73go3X8Rs3ckulXsE=;
        b=wJCnNeUBev7FfN5WZUDiyLQlHY9LGm7VTTe0B4BDc5OjBDK7R9tt8S60rWoUbA4QMM
         /WUETWw3R8lNsutPiQpupbMvDXbYcjMAhWlrZVhChgkSB658D3fSzd/XZXMLFu9P1TDd
         kDBbN1gsadyUUIqxbw4neEawxJ3cACV4do5aRyM24b8cWCrujfSCPw1KMpl7w/iFoJAF
         QTFYoY0I8y9P0L4Kg9aykIMwhxqd5JuHRwYlPeEMJZI2dJ80J1oMXTD2+8xJVWEFIlSU
         VyjnHlI0XKpH64e790D1jGH5FzhPhFd7QI4d4o9EIXrySCFI2U25K5ibXyLQZkFWBdP6
         Rt/A==
X-Gm-Message-State: AOJu0YzncOeotSNdgGLJLIUwKCnPz0bQvDyFHmt8s2qggKKQuwWhQM/Q
	o0r0srY8SBuqYhE9qPJb+t7MFJ7LScbRcvlfIF4fGooOHV6pt2ku1zSshDow
X-Google-Smtp-Source: AGHT+IFoiweA5Q1QnLu124rNxoDtPpUM4xY9IdOX4G4ii2W3c0KBUFKEZtCQU0MtY8rzLa6v6ijCVw==
X-Received: by 2002:a05:6a00:139e:b0:6e5:d6:134a with SMTP id t30-20020a056a00139e00b006e500d6134amr477344pfg.14.1709156150492;
        Wed, 28 Feb 2024 13:35:50 -0800 (PST)
Received: from [192.168.8.45] (75-172-97-132.tukw.qwest.net. [75.172.97.132])
        by smtp.gmail.com with ESMTPSA id e23-20020aa78c57000000b006e509762bcbsm158088pfd.85.2024.02.28.13.35.50
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 13:35:50 -0800 (PST)
Message-ID: <bc801ae2-1ce5-493f-9187-19a5a2731f01@gmail.com>
Date: Wed, 28 Feb 2024 13:35:49 -0800
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: Defined parameters
Content-Language: en-US
References: <0ca5dacd-4930-4d0f-8423-26bf81ca4834@woollysoft.com>
From: Beewoolie <beewoolie@gmail.com>
To: netfilter@vger.kernel.org
In-Reply-To: <0ca5dacd-4930-4d0f-8423-26bf81ca4834@woollysoft.com>
X-Forwarded-Message-Id: <0ca5dacd-4930-4d0f-8423-26bf81ca4834@woollysoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Greetings,

The inclusion of defined parameters should be a boon for tailoring 
firewall parameters.  It seems, though, that there is a peculiar limitation

    define to = 5s

    set hosts {
         type ipv4_addr
         flags timeout
         timeout $to
    }

The nft tool complains about the presence of the $ in the timeout line.

Cheers

-- 
/Marc Oscar Singer/
*Woollysoft*
+1.206.328.1718
