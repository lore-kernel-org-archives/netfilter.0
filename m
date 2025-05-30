Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDDC1A0B08
	for <netfilter@vger.kernel.org>; Fri, 30 May 2025 17:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627460; cv=none; b=t/xXdN+b+DX4BSeYdDMO5t8cCk89DWdFJnIIA0wyNRovUVQqtmfRPuojBp0Ldc+7+lqDpQsNCYLOghxLqFtzxTLzkBJvR48ypfX3SBs2Gi8oisbm4pMPGkQn9qEPTY7hL0bNy+TUulYz63HK8653mzFbXXA3xjYi9mW4k/cbNMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627460; c=relaxed/simple;
	bh=izH/husjuRLRGba2sjgE6+XFZrDtCv/sRWKQCwDcmgs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=acEQRevgJhsTbgyd15xcm6IDIsI0donFsTCKDolya0qUtP1eXnUBYZtd9VJUGr+kELc0T0UrtWNw//DGRwxYTCKey4xSN//bOkrUfotTh1wOjlLmIlkOWzyvle45sE0oMomBoQQnNR44VKPv3fMULlKq+5g8QtAbI1lCKHguWtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeN27T5r; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeN27T5r"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a375888197so1186624f8f.0
        for <netfilter@vger.kernel.org>; Fri, 30 May 2025 10:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748627455; x=1749232255; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oaZRyTT8kWb/uSpl/Oqh6WPykhrqcT6PkgE3Jd7/yIM=;
        b=ZeN27T5rjFLC6GmkeKU6UAXWFMIUxYGGLBSLRSms5t9W44r/NUHOi9J0RjVFtfVgX7
         EAGVGO+tXn0MWszfSw2QzMXLr/QUA262/n5LPph2AWiBiWxXDg5Xs6+LFbv9EKM9zlmp
         wgVmGa/n+qcVuTJVRX8T40BLhkHdIzo2dQYk03iY3bJE3Uiix0/6UFvcDi0lvFHposPF
         Q0IDmGLTbH/40ExDnMiCI+NFicmlh7Mef8f/ydcQNt1gYOQ5PGaRLZOvlhgu7UjU29Uf
         Q6AJ6tRi0mI6eS6XJJzrUl9le3nc9OYveihLeje/G2gBFbvk5xGVbm0MnrxABHfrCVw3
         /gAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627455; x=1749232255;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oaZRyTT8kWb/uSpl/Oqh6WPykhrqcT6PkgE3Jd7/yIM=;
        b=o8BbLbrrOkjds0nC1VWVoVcO4KljJBzeOTElRIQ/ytPcLMrr7VY+Mgj0Ea3pRFNAIS
         0XrifTdtpmLKDfZnh1MCUhw57o0IAgp0WEEcYFePvckROimU7yPC6kSbA3kGrLnzkRYw
         354EG7ZbN97fX1XoxpxnSQ7vKsUUrIzB1zdW9Vp9N6i/dT7cj72uNqfuC3WctuJt5z9x
         0YScW6vUXg85tAAvOdbsyiJEcielm8tDg/nd8is6Fwz+kSNTDKfu8xrakuev9DbmS2p8
         Z0T2ychSDGOjEzXHk0N/qu9mkA1tU31R/JkDvIcZ0rX8ThczSy81DBtHypc0gG02HpQT
         2QUw==
X-Gm-Message-State: AOJu0YyhQtDDmfyfJef6LmbGUXyLucNIdthQ5doO7E8TN1EF50BEvyNR
	50biTVKOakSVSJ2mdz3tSNGjgHCCPSBM6XGVwvPv7VfymBAEJJ6XKk7PYbWNs39aWfhK6r0o9e6
	Mfs5WkmzmCVfXsNOUcnzbc4Y1T9pGFgvC8N1i
X-Gm-Gg: ASbGncuwbhgwtdQ1YiGTcgHYciV+nJBkvzRdni9+2YLuU8KFgzWR3AGqWEUI5zyH8wq
	XuZ9Wht6hPuelL5sh/7WGzeJtJ51jEtYW2GxwswpwhdpLdcUR9SZhN0sOqNGy6xY6eeYHuQNiQe
	oELRmA3ZehG0wb8P2181Wqr10WIAhVMRQ2
X-Google-Smtp-Source: AGHT+IEsK4EzlJcMRaYSoYBf55O/YKivIs6wiejbHEglrbeaTVxHIZSi53KguQ/t0r/f/MW2QJ+PMKVDaVMpzkWOTBk=
X-Received: by 2002:a5d:5885:0:b0:3a4:f51b:9f9a with SMTP id
 ffacd0b85a97d-3a4f7a4b143mr3159367f8f.18.1748627455008; Fri, 30 May 2025
 10:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andrew Latham <lathama@gmail.com>
Date: Fri, 30 May 2025 11:50:43 -0600
X-Gm-Features: AX0GCFu8wGNhY1sXi-cbKbl1bll_1tFajU1bvo_ZEZZhRkZ5fNWccOI0r6EKIJY
Message-ID: <CA+qj4S_A3P_17evt12MCF0T99e=oiOQnpeukr7Rs4+Ti3aEr4g@mail.gmail.com>
Subject: Command Line Interface Usage and Documentation Query
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Two items:

A. I was about to do some work using the nft command line interface
and I noticed the `nft --help` lacks the `Comands` section that
`iptables --help` has. I can provide a patch or proposed text after I
confirm that no one else is currently on this. Somewhere near
https://git.netfilter.org/nftables/tree/src/main.c#n98 is what I
suspect.

B. On the wiki the mention of the mailing list might also have the
subscribe link along with a link to the archives. I almost missed it
until I searched the page for `mail` at
https://wiki.nftables.org/wiki-nftables/index.php/Main_Page

-- 
- Andrew "lathama" Latham -
