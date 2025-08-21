Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9408533A001
	for <netfilter@vger.kernel.org>; Thu, 21 Aug 2025 17:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755798105; cv=none; b=Tg5ZhRhmyPZB4cXOvvxr6fbrHDg3pnjHDfDJ6EbtNr5c7ma/fnMDZsnRj8G3sq3hGmPoh9zwl3NEBBPe5ChO71YG4VnUUtnUfjeDF2SBsaUPteyAi3GrulPrGb8Z/2uB4uxD9ty0Xqnhh5miDqhRZSWbBhjWfODhVlFJlpyZQZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755798105; c=relaxed/simple;
	bh=xLGjc8uJPQNpI3nPj4EJOboODH0oPZ5fWi34w+Lt/DQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=siwHebqBNi/9sWgY9eEBz49Kgm+ZyYBTI7NX6YOlujRZ4C6ud+3O41jT/0yxgVktMW7AHHTzpcfA2rECjqOKF7HVh7fpWB8kizDkqDr2miyFt/oglp3+rOj7YFTfpRX7CG32z0cPJpjwnHqzZHTEt7+uKgCNu8Wd6V7+UAr6EnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tz6t/plf; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tz6t/plf"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b4717ba0d5dso940726a12.1
        for <netfilter@vger.kernel.org>; Thu, 21 Aug 2025 10:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755798102; x=1756402902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hb4i9wLH7Qc2VSNvG6WQcNDl2VL58bEHy/u4cex5pyU=;
        b=Tz6t/plfrEGfErRVzPufY2yelIIDMnxCdHTiHdxPlSgO0hE9VbJrEUEnE/CeNaJ+in
         1KrxiBxvLy+P7HcFW9iYS24f3V+f75h4RKGTH7lZDVmRe1zLsmzfklvV3l06gUkuTM/V
         G8H39RtA+kbP8h0ctsLbceTCGLQVEmORwFNIsGgTYV9o9DkVpSCYKKczwxXJ/FMiXtyQ
         L8cQZj6+gtQHBLzM1shGcO+dJp+jKLWNTUOaOFwa5uKFyT7W0ItgAgavARfWrK44EKN+
         u38g6xuup5Axh7aYqfg8i8tdlz2soPIKwtEE6XJ2gww0oF2f/fyUjGnSOnCoj5gVN1US
         z6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755798102; x=1756402902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hb4i9wLH7Qc2VSNvG6WQcNDl2VL58bEHy/u4cex5pyU=;
        b=cpNQhlXyXq+hQSYim1qzhufsmGNEHYS7erUTFOnRjsIMT9x129dLgm3dKct0YkpgiA
         aQ1DuJY5QMeNdsCdLU7gK0Yk27Pm80to7MOmIRacFYbOwLGrGEZLwCpH5/oNgBNv0jLW
         ZYPyNZBSIpPgVStEVhdLMgI9CUKmrEvvAmm+uhGxUX/9sov9XRXrwR0jSxUVflsBfjIN
         /g2Nlhg2xkOM1Pl0sbO6k71JiJwM9npadO4yVhTq6MFNPk5oGFTz+A50RAA7L5BSTAzO
         ht7shcSkUbkecfTCeKXu2XeoNunsPhnmf+Gf5I27137X85Netf8KytrIYc2MKqHdChka
         AB6g==
X-Gm-Message-State: AOJu0YwGu59FYwXTtRNAZuHWnAXtaHiZEeeE8zHZh4YS4SMeqoGf8p4M
	DpSOexRXOctGnhDh86FLn8ChXF9PsP6xYd5ut3E1tvnnLc1dQwMXE9z1kjOOVln1
X-Gm-Gg: ASbGncv68T5Djo2HtliNriSTTzmIaFDbfz1CYccIVJbLU/wxjrGP1iFVnwz9AwSk9dR
	+KdB8IrooIqzHP9Od1z5V4NgntrlHy0iK3F50XJRJoHlPurckZK3lpzaTSAl1KMh+WuR4M74lPs
	rs6o3HQWEFU2rd/d8mzOLN8X3BkvZCuRLN39btHO7KwPQK8N+00yShtW6CAcTSBTwFPMgcDLZ52
	2cMHrshi4PNIItoEUyBrLCKXl9x6LILCj221sw2b/Twgka4EJgzC4Hs3pCTwa3aNku6AckGM3gZ
	/F9+QUTTRupsq0lgKY9IAKNEaasi9LpxgPIEQxuns7e4UOgxEqDDdFqHxb4HbblKDuYMB0OdWyo
	Tq4fs2juZj8HO37a0EKN2p6WGcLmBVzFmrGTfXvPxjh2oNTMGNFhYaw==
X-Google-Smtp-Source: AGHT+IEt1LPOvf9HWKhEtv2LrwPaw451n1r9f2+UMxwYlz8KyihE8mxluhDjD0OuyzN3vv2Bou0D5g==
X-Received: by 2002:a17:902:c40f:b0:240:86fa:a058 with SMTP id d9443c01a7336-246023aec06mr42475705ad.7.1755798102569;
        Thu, 21 Aug 2025 10:41:42 -0700 (PDT)
Received: from ?IPV6:2605:59c0:20ab:6e00::10dd:b102? ([2605:59c0:20ab:6e00::10dd:b102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed339fb3sm61529835ad.13.2025.08.21.10.41.41
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 10:41:42 -0700 (PDT)
Message-ID: <90016230-6489-487c-a6a6-487a1defd853@gmail.com>
Date: Thu, 21 Aug 2025 10:41:41 -0700
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implicit add conflicts with declarative add
To: netfilter@vger.kernel.org
References: <1130f6aa-3c98-4960-879b-27f6ab054313.ref@sbcglobal.net>
 <1130f6aa-3c98-4960-879b-27f6ab054313@sbcglobal.net>
Content-Language: en-US
From: Gordon Fisher <gordfisherman@gmail.com>
In-Reply-To: <1130f6aa-3c98-4960-879b-27f6ab054313@sbcglobal.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/20/25 11:39, S Egbert wrote:
> Take the following NFT snippet:
>
>     add table ip table_id             # imperative
>     add chain ip table_id chain_id    # imperative???
>
>     table ip table_id {
>         chain chain_id {              # declarative
>             type nat hook input priority 0; policy drop;
>             ip daddr 192.168.1.100 dnat to 192.168.1.200;
>         };
>     };
>
> Fails with:
>
>
>     add-chain.tp.nft:6:9-38: Error: Chain of type "nat" is not 
> supported, perhaps kernel support is missing?
>             type nat hook input priority 0; policy drop;
>             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
I believe the issue is that ``type nat`` is a table type than a chain 
type, so it appears that you have that part of the declaration in the 
wrong place (the policy portion is indeed for a chain.)

-- 
GF

