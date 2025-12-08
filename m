Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEA3433AD
	for <netfilter@vger.kernel.org>; Mon,  8 Dec 2025 23:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765236751; cv=none; b=emKUFzaW8fuICmjtQq4St+R8iNkbbZ8pcW3Uqr++6UuJ/StWWvsXJoJVeLatfX3FJNa7P6k0wLEJsP5Pbnppt5iwUhPkLh6nhYTAPbcOcXTbh8UXBtGQaEtQ+tMyqbdFUAQ9TGCuKGx90oWXkymT4THKxGb6rwbk1vFRuugyUp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765236751; c=relaxed/simple;
	bh=VeFM6QYsIaQCZ24AV+dOsj5Mq2FpUL3G7RMgYE7z8Vw=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=L/A1RXibU7gSulx7cjHmtMwzCWgeB6XqJeHQmUqWAsIK7VtI9RbC2t6R2ev66B+JDMsRo/0xW+UyN6jkvPwRaT1pa+/35f2lIFXhbM+opg61H0vWjDgBV8Md+mvEH8osp96KQC7aUo0DoXZBEUKaj5h8oYlVR+kC5UFxP/sD+Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZKLNRlV; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZKLNRlV"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-656b52c0f88so2917037eaf.0
        for <netfilter@vger.kernel.org>; Mon, 08 Dec 2025 15:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765236748; x=1765841548; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGT0sMK9oEAB+nHv+iKrfiA50pITwf9wp/nL0yV3dbM=;
        b=KZKLNRlV6mydFNw1YOy5HUNuM4xcelbrbf9mMx/o5VfrqyVSo47g8NY5hmIxYOG4N7
         V+a+Mzna1CiaJi7bDdiplUyMf98JPOo46CVjN2bG/5os3SEaTJb0ucl7+0NaGWu9GF+W
         vQ6pW6mVgQzgxg5qKvDr+gmcZz3o8mlfkePJw0EAQyZRFnuaMZ8/Yy10FH3hJFButDrd
         8JNL8HoHHRfw/Kmc7/p3G6JxAy8SZred9KGYGVSxN0jxyVpkuMYyYrx6TF4Ng0EHnWZy
         oGLJkIyoXdDBTD1HgI1mRu1HDIYoEmPk3zKNv6+9w83hLmtDhZaEfGq9MaDxFD6qzH1g
         oqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765236748; x=1765841548;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGT0sMK9oEAB+nHv+iKrfiA50pITwf9wp/nL0yV3dbM=;
        b=vWhiIOC3zV4lDJkQspJldejsrrMlbjLENbmMHW44ztHI6W1wCUyL6KyEbVi+KWPgUv
         KXmIIqYCuDazBfcGfnVrov9oN56jRvN/vsHa+oxkX2qyh94sTfu9SJhifUiBVUL3vcBz
         Xy619sNxYQmzD642P03rF4ynuUP+3RF7UwSucWc3BZWB6GGRDQW07Wp5RncUH/c5AQh/
         TXdHsgC5Co+B7K+4j+a9WoHBFMfKz/oyBZK0B9QilQBThzektvqdi2c24Zr20KCGLOWR
         bZwstGX+1Mdbtk2UjZofAz8hPMxE+e7/ZsSocs1GggD/5/j41lm9chZJs2nUbBc8zF9g
         urwA==
X-Gm-Message-State: AOJu0Yy+lxx/6iEEHgrlGMzAUXwimcXVt+yaHxRFTdn1qsdK3CoBBjx5
	AvEBwM1ctfFG6lOH/aBbBw6u6hcshN+uxFH2yR3SLXUo0Kiu/Y7cEOmtitWDvQ==
X-Gm-Gg: ASbGnctheSHwSQJoHh0cC6jcANZhA6VETJBDnwLQkudC/ecgbr5HH35sQmAF2gIsNA9
	QEwcqFcusjng2OMcpQYiiwNVawr9DnQylD+OgsXpRYU95s4/ZyEA++YRC5iBKHAweilBlAEFCSM
	9aqZJ7uboovHyN6XZ1m3zWalKJXIfHNTIbJOLM5oXz2/sNSjk8Ui7FQMq7pKSUbJo/SJH4f4s1j
	1jTb2MnO6bKatW+6AZ91072CzHbw2SRSAr9+UKZ1ETBPzkltG2by/2blneoxW67+zXyTPOE89rH
	hHJ7Z4ZcqHEsO8yIUk0W+N6lRy3ragl4hdqo8SuiSSvaS59yk18EF8jgScPU/BeV/XZNpHRwzf8
	f5MlOW1LyL5WBd7DFlzBNELnfLcbvaFxqbecbii1ydNxQ97+AwSPEG8sB1rIvVOqEyWsqTFdf0L
	QeN1svt5svEI9yksmAXoswN3i38fCP9y1ZUNKxvgv6lzpVojRm945QXhrJW4DgPobranCeH7RVa
	KYZsQ==
X-Google-Smtp-Source: AGHT+IFF6f2dgHgBG+yeQof1YjjolVb/pR5p74o72GNBoAqCQSRcGB6QPkm3tE/vAwsFdqN30066mQ==
X-Received: by 2002:a05:6820:4c03:b0:659:9a49:8e97 with SMTP id 006d021491bc7-6599a8c2b5fmr3643430eaf.27.1765236748096;
        Mon, 08 Dec 2025 15:32:28 -0800 (PST)
Received: from [172.31.250.1] (47-162-126-134.bng01.plan.tx.frontiernet.net. [47.162.126.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6597ea6807esm6838519eaf.0.2025.12.08.15.32.27
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 15:32:27 -0800 (PST)
Message-ID: <067a7b31-699f-4642-af16-9062c69e9fe2@gmail.com>
Date: Mon, 8 Dec 2025 17:32:27 -0600
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
From: Ian Pilcher <arequipeno@gmail.com>
Subject: How to determine type of nftables set
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I am working on an application that will be working with pre-existing
(created by the system administrator) netfilter sets.  These sets should
contain either IPv4 of IPv6 addresses.

How can my application determine what type of address a particular set
holds?  I can query the set and get a NFT_MSG_GETSET message back, but
it's murky after that.

The message contains a NFTA_SET_KEY_TYPE attribute, which looks
promising, but I can't find anything telling me how to interpret it.
ChatGPT says that I should just look at the NFTA_SET_KEY_LEN attribute,
but that doesn't seem reliable; how would I distinguish a 32-bit IPv4
address from 2 16-bit ports?

Short of digging through the source code of nft, how am I supposed to do
this?

TIA!

-- 
========================================================================
If your user interface is intuitive in retrospect ... it isn't intuitive
========================================================================

