Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9173313D892
	for <netfilter@vger.kernel.org>; Fri, 14 Jun 2024 07:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718348523; cv=none; b=N2LfzcU/QZvG5qMObX0lpJSumt98Wsi9VY1PUa7zVjDErSyEQzVNLLfXuEqXZWm+eaeZyTqD0Nz6sns5bqL9Ik6ZJm5V8sA0L+oSuj8ZcZTCwNo2OJsyd0Gay3LEfxT9kOz2UgZrLPsYRhklRQZbyvgEgr4Hy1kWgfTm7EE9tAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718348523; c=relaxed/simple;
	bh=cvKM1rOiMEOnDuck8XUySD8Rnqx6bTNSgWEvj+xURTs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Q5fevTcQVThkBmf4AZoA9422olgD1BUSvzD+k6UbY9lMrSDSzumanytGznmOb4nIww5/hPvO7Dc+XBVbNdiy0ZEwI/JpISit/SJgFJEIJF3Uwnm+Faxb+plF93bqQlNcsjBoQPGlDdru92LM0WZ3IlxKo0BK8WYnbjwvlB2oosc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kraszewscy.net; spf=pass smtp.mailfrom=kraszewscy.net; dkim=pass (1024-bit key) header.d=kraszewscy.net header.i=@kraszewscy.net header.b=N4sej7gc; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kraszewscy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kraszewscy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kraszewscy.net header.i=@kraszewscy.net header.b="N4sej7gc"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57c681dd692so1870431a12.3
        for <netfilter@vger.kernel.org>; Fri, 14 Jun 2024 00:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kraszewscy.net; s=google; t=1718348519; x=1718953319; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cvKM1rOiMEOnDuck8XUySD8Rnqx6bTNSgWEvj+xURTs=;
        b=N4sej7gcNK79vUeyIc+e4zLM12HHevQWUw2mhagMYqYAjpFKem7bWPU+/Ps348S/SP
         7kkmUjtidAlAJZXZkQwryjPdcnOpqxSkrNrjZIgDf6Q40j9YqoUGDl+ZG3NrN7qvvLjE
         eR471R4HsS46IxEq1ZN2awDiG/8l3TIdOv6Oc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718348519; x=1718953319;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvKM1rOiMEOnDuck8XUySD8Rnqx6bTNSgWEvj+xURTs=;
        b=Y3thSWTFfzsZYhEHFfpZ1W+yjfjp5R0FL75RWOV6Qe3cu1M0uWfszGET5QKWMTPeQW
         mTwW3L1AEPym/Q5re4zBemzYw3SiRizsr6b/w3BFNPZQEVaXMDc03tqag6XAIcXMeGV+
         FCYM6drv1DPKWHKaR+3U1waUJuMpwGukfd6/SAsuE/LT7H+BLToThLdW5qjmLc62NPbG
         g1XXHb+D7PvWmexQSU7EL6frM5OD2qVdUQKdQgx4e/4lJfHnOGGkUoZAf7wLHRIy6N9p
         pAYsiFp/dgImlb0xyNjhDonyWvIf4sz5DhNzfuDmZ8ZhxqDMpQ+jTfLc9Xf12Bgeau1N
         HhuA==
X-Gm-Message-State: AOJu0Yw+YFpgiY1V6DXy+Db26WtJsBgkePhZY1pzm9BT82QqFgg5hpw2
	gb7g9Zrh8cB8HGJ6T/9KzL8fliEThcTqEbKK9QGYtI078PZd46IMFqK+Agdy260M6fcEo89zxW7
	Ii9y777scQlJ7Ipje90TZYXJwisleJNGvLF6jzFXVWQRwl/Fh
X-Google-Smtp-Source: AGHT+IGwQqdouoxuLYqRC/J+peQJqTOg8V00MAMVPfCYplK2HKP0QtkL/SwuQxr9rM8N+s3DsMFwJ3jssvgjAKOLjEw=
X-Received: by 2002:a17:906:c20e:b0:a6f:51c2:a217 with SMTP id
 a640c23a62f3a-a6f60de6034mr124063866b.66.1718348519194; Fri, 14 Jun 2024
 00:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Pawel Kraszewski <pawel@kraszewscy.net>
Date: Fri, 14 Jun 2024 09:01:22 +0200
Message-ID: <CALnT2Lj0eo5FTgAiJB-napcNuZt4fhXAeMF35=4k408hpuBC6A@mail.gmail.com>
Subject: Writing own match module for modern ebtables.
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

I'm trying to write a simple match module for ebtables. Nothing fancy,
just check ethertype and first 2 bytes of payload. I need to make
ebtables' dnat, based on a custom in-packet tag:

> ebtables -t nat -A PREROUTING -i eth0 --MYMATCH-tag 10 -j dnat --to-desti=
nation SO:ME:MA:CA:DD:RS

Kernel module ebt_MYMATCH.ko is almost ready (it just accepts
everything now, just a PoC for now), based mostly on ebt_vlan.

What I am absolutely stuck on is xtables/libebt_MYMATCH.so library. I
mean, it is written, compiled properly, and objdump reports the same
structure as existing ones (say, libebt_vlan.so). The only slight
problem is that ebtables doesn't detect or recognize it.

When running the above ebtables example under strace, it does iterate
over "standard" libebt_* libraries (with newfstatat() and openat() )
but doesn't even try to touch mine with a long stick. It doesn't even
check if it is there.

When I do a match with existing libebt_* (say vlan), it still does
iterate over all standard libraries (for iteration's sake) and then
(apparently, there's no dload() or sth) just ignores libebt_vlan.so
and pulls NFT gun.

That's Arch system:
* ebtables 1.8.10 (nf_tables)
* iptables v1.8.10 (tried both legacy and nf_tables, no change in behaviour=
)
* kernel 6.9.3-hardened1-1-hardened

I even tried with manually compiled ebtables v2.0.11 (legacy), which
is, um, dated 2011.

What are my options now? Any guides on writing both nft kernel modules
and matching userspace libraries?
Or just forget all that and use raw @base,offset,length matches?

Best regards,
--=20
 Pawe=C5=82 Kraszewski
