Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E0C535A0
	for <netfilter@vger.kernel.org>; Mon, 18 Mar 2024 20:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710792860; cv=none; b=jlCHQsD2StKRhe/keET++6NqrXhtoCPoKwJGIsS0tKtJsSJAgn9FHchgiaMytPYCnyLVLeoxf59gFGVKhcyCk1snHIHcggNeaBG+9/N3fXfiIqCPdYxvb7nulS3IKzYAcmJki7g6T77q2OOUIbxFFK1ch0mgzPCyCfFCvShKsSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710792860; c=relaxed/simple;
	bh=3qalA4JQA32jFtDEwgIunOJMTNrdKdQ6VAV1ZgT4sDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CuIQrK5eWJBAxP1+YM0oT98sEPngps/OVqGJ3qFH0J0aqaKn3f/4xKjGqirIko28po7kBZzpHCflfay05n1qFu/5rroitzmWLCUO3RSjKtSoy8TVbYhMOKzBK2mblVYo/VJLXOmTDEIc94TikxjAWGRc1D/joudjRrWAmkcbr+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmUKT4zC; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmUKT4zC"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dd10a37d68so38872625ad.2
        for <netfilter@vger.kernel.org>; Mon, 18 Mar 2024 13:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710792858; x=1711397658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HJtrhUJQUWA//tRIIt4cNpWDAHaW92j+K6V1iNIMyFY=;
        b=dmUKT4zCMBnLMkdLaor0plZ+hddD6ijuAQDWmi0ETJeVOHw53ZV6fseqP2gNaFtfAx
         pOVQCxTR8VJNuno0c/zw0jvDhBepOGYEMYnFlaD7tyiwFbXyoWvVj0A8RwwY2D5ck0A1
         n1VtbPulFuqyBjtq7YjLdM9RGiO0VbYKeJ+M+4yL7miyQTEkZ6swsMeQ/yiSgqff3twf
         0PU2wGsPPPk6Kb0z576LrPQ5uWaOuZArAdeqa7t5xusOEEaUmeFnxqUhW22+/G0yQtSD
         FY0fuCmd0MjRvK5JO5BZhJlOOI2Rhz0MetjvJEfRGOH0UH2NTThbToooulY7p1I2Fyyo
         Syyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710792858; x=1711397658;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HJtrhUJQUWA//tRIIt4cNpWDAHaW92j+K6V1iNIMyFY=;
        b=WUy0FYHGa9UdhRb6cFv6NejRg/SVNgKUqf0dhkxKK4CNeNCzE+yqmxyjA1vJf75Zp4
         TNRqsv50E32zNE6AuTLFUy9orHjfF4iikm7QuAzjfNfmxOAqAvg/nqOKSFG9QiYBbBDy
         OTfKGgaeqZXKwyHKbBIWlsnytKiopM5B01yO6/ji2XBLPRkllQD1KZQCRAaUpOZsDLLs
         l20lXBeLffr6rxaerdvVgxD3lw1YR+WYFfCHQ9UysMJXGXyXH3fmljBwveZAuGrnRUlg
         OSPqUlWtadi2ezetDYR9Kb18FBKvcaYnH50eLyNeuuCFGX0lqGdG43FgD3h30nv6ZjTa
         e78w==
X-Gm-Message-State: AOJu0YwCfkDrpq9f5FPfiMkoV0551ORhwz2FOFLj1i4NTA/n+ECjUYpf
	Zo/5noYVdQu8ccoLpElFJSIegikj8hherjLlsOXZjX0/lqKL5aPQMJpu+Hkc
X-Google-Smtp-Source: AGHT+IEIVzh1zx5C6B9ckZ7sf2QKL12l23JQ9ai52fv7qdZeIUbG3kecKx6gxlgsib0s3cPmayt8qA==
X-Received: by 2002:a17:902:ef8f:b0:1dd:c288:899f with SMTP id iz15-20020a170902ef8f00b001ddc288899fmr11909725plb.18.1710792857812;
        Mon, 18 Mar 2024 13:14:17 -0700 (PDT)
Received: from ?IPV6:2605:59c8:309e:f800:dead:beef:cafe:2? ([2605:59c8:309e:f800:dead:beef:cafe:2])
        by smtp.gmail.com with ESMTPSA id mp6-20020a170902fd0600b001dee3c1559dsm8627453plb.303.2024.03.18.13.14.16
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 13:14:17 -0700 (PDT)
Message-ID: <eb843fc3-8b22-48e0-a9ca-d6ac94f28c8e@gmail.com>
Date: Mon, 18 Mar 2024 13:14:15 -0700
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IP not banned in interval set
Content-Language: en-US
To: Netfilter list <netfilter@vger.kernel.org>
References: <6586f71b-92d7-447a-bca4-d3b2dbacba20@tootai.net>
From: Gordon Fisher <gordfisherman@gmail.com>
In-Reply-To: <6586f71b-92d7-447a-bca4-d3b2dbacba20@tootai.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/18/24 09:36, List Support wrote:
[...]
> set toban4-smtp {
>     type ipv4_addr
>     flags interval
>     auto-merge
>     elements = { 194.169.175.17-194.169.175.18 }
> }
>
> chain input {
>     type filter hook input priority -100; policy accept;
>     ip saddr @toban4-smtp tcp dport { 25, 462, 587 } drop
> }

[...]

Side question, are you really using port 462, or did you mean to write 
465 (standard SMTP SSL port)instead?

-- 
gordonfish

