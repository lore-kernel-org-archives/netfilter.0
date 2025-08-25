Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184993D984
	for <netfilter@vger.kernel.org>; Mon, 25 Aug 2025 10:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756118845; cv=none; b=ahUMnfXhG1MQ80Cms1okcDWlBOEt+J6FCrafjzVaELQZUKEvC9feYioa6HzGWJCkzvdoyMyM+FdVQCiU5jd2JfGkQCcAEqETxzAbpQlFa+nDS5NYXrUY3OrINwzzhEIzFtGPqYwHqIvuBxy8Dibhjo3jpGkmtXreVIxB73U4xvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756118845; c=relaxed/simple;
	bh=4Mn/yN6CeuMTk69c3PcQHobC04irOSkO0+nsBL97ntU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6sx8IymxbCU6U1CUpN9KXLGF8kuQwR3fsxEfWc8cdoYLrG/LnAeU5SRB7f4lHKhZEfIWzmM/UPrWQwy9Y9uck4Ax8jw8zvYqMybY00GeWL58D4eVsQ9HUbQKypQiY2g4URCvch2LP1TuCpqoyay22DklL6GVa/w8gKbsjet1Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZWUIYYX; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZWUIYYX"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e2eb6ce24so3157311b3a.3
        for <netfilter@vger.kernel.org>; Mon, 25 Aug 2025 03:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756118843; x=1756723643; darn=vger.kernel.org;
        h=disposition-notification-to:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hyJ0CFjVPzKBFblOqWXZFEVsNzsOYBLeEn6HPNRqtow=;
        b=YZWUIYYX6a7fiFlkDjAevboCPh1FX813Agx1dGvkRCGSwVtmEFkCmKWhE+A71VmUcd
         ercbgS8cz9x7pmq9mXyNCkW+KzBqh+AyoK8BuZwcfnRBmRQjY6kilSMztWszo2tQcHuO
         EE889rN0gWGwTaEjh4wyn7CbRiP4+AbA12hwT4gGAbaK9z2bB9fkV4c9kiZWYYrra1IJ
         FgFCVWwwKRnjI6WV6eDp17jHMWsMwiXONtuAuaSOeoRcXcmFyMjtlCqCobqGl/T6m2K1
         r7zEzpjnyaq5z9ubtsbAeuhFA4cieiZoSxks1lkZWISOd36BtmFEHYy90zYXj9qSEKMb
         Sf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756118843; x=1756723643;
        h=disposition-notification-to:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hyJ0CFjVPzKBFblOqWXZFEVsNzsOYBLeEn6HPNRqtow=;
        b=UpMUr2xZFe0P3qS65kvHiNl5n4qIdexYHKetw9TLJorapJa0oTs6U38N3a1rPxoRrr
         zIcnQ+v1uTnbw8ls497Lv06PxieTr7w3wdgJLIGyX60VgDuQi9LaMfgiAWKqPcEzEGJY
         9PeO8aKaEqdy5Ug2xj9fRlbxI027qQhwmkOVuJsg3bLdIu/MDnjcgJdT5iDlOncyc7QG
         Mvpw8a+WfSNDJAo5KG6Q7YcqqxcpvaoFEbzq3jllq+W6kF/L40md4efzCWz1+JHw2Cvg
         fz3JO2tByZtMqoeV+QF4iUapw73yvrPsuVXItxyIc8RUHtg4lJnroRl0c32AqN0qxZ9M
         ec4w==
X-Gm-Message-State: AOJu0YyPFknyCBanvCCv1PZ88bP4BG1ZbPROsJhBch+9PBUenoaSkoc8
	D2TkisY8Djw7n3BP/bWMrvFMG6MLBUhw964GZk2xceooybJuvQrZEVl581gQG9w5tyQ=
X-Gm-Gg: ASbGncv1BkVIYLtnMkO5bMEeLd//k4SLh7AdTxzSe3xIMY5P0LwUR+lG9dIs1iXthlr
	nYi4GrJ71C2bmoy/qwIbKJMDQAzigkv4/ve1oIhhnTCLJFvCVjHCiIA0zEIf0Ttw6QHdj8BFVZh
	/ie/cGbEWkMF5zbW9d8ccGnCLArwEKFUnTloKjA+4OI2Kb5XBq4PRIhncsdSvcMNuuhzi2U4RGa
	6Uv4j2urxcLU8EqLbTOnGwsPg33jHzu6b5JcOVEVh6gTzhh7fybVbv6Zkdx4l+oqLsnTaBeR/PN
	e2jHC60D0mk8iJ3MjPAa248agCRagysOX446hEiQN8Rtn7TNLQeSd1EEGUBBcKUoTJW4LqrAu/P
	E3Hdyg5BlIZsQDQWt9P5Vo6m0YzXACcsG
X-Google-Smtp-Source: AGHT+IEG9v6ZB+PyL0iGypNtYUSU85Ar4eicmM3P/hT7Hu3XTr/2BeUK0plvaYXngfR/OUhiahfTCg==
X-Received: by 2002:a05:6a20:7d9d:b0:240:387:cee with SMTP id adf61e73a8af0-2434081ccd3mr16492245637.0.1756118843132;
        Mon, 25 Aug 2025 03:47:23 -0700 (PDT)
Received: from localhost ([2a0c:b641:69c:caa0:5327:2ea1:4482:4eeb])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7704025a46dsm6975695b3a.106.2025.08.25.03.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:47:22 -0700 (PDT)
Date: Mon, 25 Aug 2025 18:46:48 +0800
From: lilydjwg <lilydjwg@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org
Subject: Re: nft error Could not process rule: No buffer space available
Message-ID: <aKw_GLWO53mX2ELx@lilyforest.localdomain>
References: <aKrK6h2zYdqj2unR@lilyboudoir.localdomain>
 <aKw4DikLFS8MVGVY@calendula>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKw4DikLFS8MVGVY@calendula>
X-Mailer: Mutt 2.2.14 (516568dc) (2025-02-20)

On Mon, Aug 25, 2025 at 12:16:46PM +0200, Pablo Neira Ayuso wrote:
> Hi,
> 
> On Sun, Aug 24, 2025 at 04:18:50PM +0800, lilydjwg wrote:
>> I'm switching from iptables+ipset to nftables, and as part of it, I need to
>> import a set containing ~2400 IPv6 networks. The file looks like this:
> 
> What nftables version are you using?

Sorry I forgot to mention that I'm using nftables 1:1.1.4-1 on Arch Linux
and the linux kernel version is 6.15.8.

-- 
Best regards,
lilydjwg
