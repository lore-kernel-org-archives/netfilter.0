Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580C934D4C8
	for <netfilter@vger.kernel.org>; Tue,  6 Jan 2026 18:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767724580; cv=none; b=vC8/5ljfsriw/6yZJGEKE+l/00Qt+5rqoYeryhehq5LC57l/t5vi0bHVpgN35xpRiY412L5jedvLYfipTTxDIUuSwi58AKTrvbbx/Asp8THZXrFClrgOldKLIWLLl6yIcyVrH5jomcxYEZUpexxbK7pLOXhinbzlQP0mR+5tCG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767724580; c=relaxed/simple;
	bh=x3RVz9lAZt3o8jNsGIyeIlANbFycWi02eVxzk2S9wyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=me8LtV6hROZnGgnD1jkBPJDobSeQ0hLA0Qmd59AD7oszpVX8V97o9viE5OI45D67IpEJuCawYrA7LFZLKeleyUKlJHzCFoi9xGCbgQe1AY6OXksRARj+ot77h7H2cwz38o9MEwHlzoh/J7zLuXJJ8SFV+tDvyrFMUK7D3S2/OXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nr0bPVjW; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nr0bPVjW"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b725ead5800so184044366b.1
        for <netfilter@vger.kernel.org>; Tue, 06 Jan 2026 10:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767724576; x=1768329376; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xc7pSGY7vlrhJUxkhMbvD25eVXJzGzX88tkafZ/DlGM=;
        b=nr0bPVjWTmoXgF+P6haqz/7P66J9Wc0tP7Ljm8OQFwB8Hb3TG1nlgIIpKVIGpTdcuo
         DBMEyeoOVHFll9S0OnYkazOUn1ONt+k4FGSfZpL6rT7zYVcLSHTRT17YRniSYVNnMEAw
         pRKLZpuVziX6cPGiuFujD/ZQvmJ0KgxqOiMQxkHnQ+bemkksJhF7o7kkriiG8QEeeVuG
         0V9j8quNzn0K2MobDKtri6zYOgVzcJIHzCx8ndOO02FkV5tStVnL/2hDusDWws87cICk
         BqPm/Onk+ZFoF+a+Oa7Cjcw7ClM2aiv0+amGpsj3ORX4kyjkDnVGyw1Q7M9VS3KRJ0Us
         R/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724576; x=1768329376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xc7pSGY7vlrhJUxkhMbvD25eVXJzGzX88tkafZ/DlGM=;
        b=SZUTP81eJsBaef964W2u5Rcg6nvpiyMU5DjzUKPOtregPJN6jO9ep3q105oqF6P4qe
         2oh9Y2namHu0lduuDsOTv3WggjG24qTpZifHILRhOi1zKqq0Aou3/ObncU/kRLt/pruE
         Bx+YkBQN8vh+Vv185MJ2FU71rzSUrE7wfAjizKefOzXERY+qjmsyo4eFGuVyeC9kbqgi
         ubZIRvlN8KcBMgF0KGgvDH07iW2Of65UNCdKfjCUSf+b6BJ1l1u9JdBxom9huD0eNRj+
         pHPmQcqzcDo6P3S55T0x8c9iZMzqXMrr3AOCgp0Kk0gkuO+kvVgNHF1QZaIpTeFgV4Dj
         g/3w==
X-Gm-Message-State: AOJu0Yy/Wo7RxfEQo2n5R+o8U7jioo5GZ8+bKohgWP6BUeLCQNNXSJZ+
	rk3CHls7Rwq8iiEsxvdJ6lxShB3WmpvyG5qo6p8RrxqhQOBsXRNkLGnMcL6kG1yBwg2L2OvPq54
	PgnQbc4ndelgKKJNBUC7xpIAYOSuHNvZ14q+JCzg=
X-Gm-Gg: AY/fxX5wUHvvlWO6+hM8vsMfHFoLjcDbb68W0vuZS/FhAtGhW/OgVIHGicU1LD1mqL2
	MgmvqH597F5saiZIIjBEnyUrQnzxNL646HKyI07Q+7uCt1VsewBkuIMcaANc8O1rq5VLi/PBrzH
	E7Kn6HJ4Of/4pMYf6ES/AJrbmIR1Zl4oZxrX7/J2vnZBLlhb5iQjlf6WZRT59qn4IOmFWLPioZc
	1bH5gyF6Qo7yBTFNYl+A6599laGtvFM9TAFR2NGFQ5wFbfSoY/kNDQhxC2uQSuQW9CIjE/a
X-Google-Smtp-Source: AGHT+IHUrKMS8eJyuOzDaXSe9ceGisUcS3Q2zqBormzSRBJvwddzCMMiRdO1aI9RyhJDh/z75AuIOxNrzsHEetWjFqU=
X-Received: by 2002:a17:907:7f86:b0:b79:ff8c:d9a6 with SMTP id
 a640c23a62f3a-b84453a515cmr5393466b.33.1767724576173; Tue, 06 Jan 2026
 10:36:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABYZ2k5wSkW7ifYSzw_QekqNz7yrcAG3tN9qKA-dCzaD_uUvhQ@mail.gmail.com>
 <E1B33049-8304-4686-8806-56D7F5AF54F8@slavino.sk>
In-Reply-To: <E1B33049-8304-4686-8806-56D7F5AF54F8@slavino.sk>
From: Dmitry Konishchev <konishchev@gmail.com>
Date: Tue, 6 Jan 2026 21:36:05 +0300
X-Gm-Features: AQt7F2q36kvbkBbV5umJmVpxb_d1zb1w9nXzGSrh1hwCHESMpBqjYDOboD_qtBU
Message-ID: <CABYZ2k40WHg2Thzo0=4r6Y6UTAtrw3EMRq=0fwKVViL40exAMA@mail.gmail.com>
Subject: Re: Dangerous examples in nftables documentation
To: Slavko <linux@slavino.sk>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Note that match:
>
>     tcp flags syn
>
> Is the same as:
>
>     tcp flags & syn == syn

Oh... =) It's quite unexpected after `tcp flags != syn` which turns
out to be a simple comparison, as well as `ip daddr 1.2.3.4` is a
simple comparison... Thanks! That's what I am talking about: the
current documentation is so sparse, lacks details and having no
ability to test rules (it's hard to reproduce exact packets and test
your rules against them) that you have no options other than wondering
and learning from examples which are, as we found out "are just, ehm,
examples". :)

> The official documentation is as it is, but it is not TCP tutorial nor
> firewall building tutorial. In most cases it is just demonstration
> of nftables syntax. The valid TCP flags combinations are docemented
> in kernel sources, it will be redundant to repeat it in nftables (except
> point to right source file, as it is hard to find).

OK, thanks for the explanation! I got your point.
