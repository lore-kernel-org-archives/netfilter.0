Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22651C695
	for <netfilter@vger.kernel.org>; Wed, 20 Dec 2023 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsmYW3S4"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6da5d2c3ec7so3290355a34.2
        for <netfilter@vger.kernel.org>; Wed, 20 Dec 2023 01:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703065268; x=1703670068; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fEcgq9sY6vsZsRmj0sERWu5017EJGrY5xRxj2ZhDOZw=;
        b=LsmYW3S4TxtSjRCp9Z94S65efglorFRjlJE7t4URaYJ3kya6XvYmnn/uE41NAhlROw
         i06J85wpK1VjTeP13V8lASPM0z6r/dTlB7K8U/unrcwrcPPbc8hS8/7eQTvlPNzS9rwh
         4DSMOCVmMMUdX67Zba6RLTLRGjvhBIJt9xIYClL8kiWyR6WpOjOny1rwekFjHtcn9Akm
         WZWUwkdsRionyHoF2sBktYxP+oRQMuW89gma30mEIicmsaqIFcXHFSdl+PQw0aDkH2Vx
         C8nf3j+6beFPE/PAmUR8xn+UZ3WUVR10IeJ043chVcnmGDJFrFr493cPqBML1f/bXa4m
         nMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703065268; x=1703670068;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEcgq9sY6vsZsRmj0sERWu5017EJGrY5xRxj2ZhDOZw=;
        b=aPHOhXBK9C5DfE6UoKkjLbFV7tIMCJ7ZKlc9/P1Lw9A/7qspuq4eMkS7nmqrXXqGwm
         ReUVJiS7zTMZvAq9MKnT+rved+2SpmV5ikLRjBwm4De9SKvBQFTZm/lctxL/ZCxepPax
         fV8un7s1zzEYuZr5rJZJT+ZH3Y4GHIOE6M5WbrZmULHiWGOmVml2240rxWpZhbBqm8k6
         f5p05L+n4iBN2XZ6HvkG+qKXaVKpYWDjDWN//eUspNrmqtY7ON8hLsxAuUJriQIGGLLU
         EumQjRxHmOBQkCZGBxQLm8jCgk5bVMv9VbGxbQsLKFrRSzHeDT+JwLTXyqIJv4iK0Wyh
         Z7lQ==
X-Gm-Message-State: AOJu0Ywj7NI5A9m70AeaZyx+hfF05Rnl3tbAvaC6cT0M5LJRdcdMhNea
	1FWEVPuIwJa5h1FXRVHI//FNbYFNdESCnOsIBbuZeeg3ntM=
X-Google-Smtp-Source: AGHT+IGegpQgOgxJOrXDs4ZCG8P7oENpIgCigS4TRt3M0VzWfHeSbu4LVchgoRivnldG/upghlTQInrQIw554F8YE18=
X-Received: by 2002:a9d:75ca:0:b0:6d9:9fea:3328 with SMTP id
 c10-20020a9d75ca000000b006d99fea3328mr19747861otl.13.1703065268330; Wed, 20
 Dec 2023 01:41:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA=+QiiS_FZnaGNjx7kGYqJgkMTE48z7nHn1VREcV4PoD3GyZQ@mail.gmail.com>
 <CAA=+QigdCVDHgmDq8G+4U+SjYOGPQ8TrBXAcD8UXYxgJ4Dqtiw@mail.gmail.com> <d75fe7fb-f5ba-421b-940a-09383d8bbf86@app.fastmail.com>
In-Reply-To: <d75fe7fb-f5ba-421b-940a-09383d8bbf86@app.fastmail.com>
From: You Yu Lu <zxc70208@gmail.com>
Date: Wed, 20 Dec 2023 10:40:32 +0100
Message-ID: <CAA=+Qij5nxLOuj79Zc6T-XkDvUfPzuBaaYJDaiO5i4ZROSKYAw@mail.gmail.com>
Subject: Re: Unit dependency of network-pre.target in nftables.service
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thank you so much for this example. It is very clear and useful.
I will try this out on my system and see if the inconsistent behavior
is still there.

Just wondering, what is the reason you decided to use udev rule to
trigger the service, instead of a script in /etc/network/if-up.d/ or
/etc/networkd-dispatcher/?

>
> /etc/udev/rules.d/99-nftables-netdev.rules
> ----
> SUBSYSTEM=="net", KERNEL=="enp1s0f0", ACTION=="add", ENV{SYSTEMD_WANTS}+="nftables-netdev@enp1s0f0.service"
