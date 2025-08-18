Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23FD341AAF
	for <netfilter@vger.kernel.org>; Mon, 18 Aug 2025 16:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755533548; cv=none; b=e9IiOAOvfmUxIqz/VmyLYTLBNmRW5E+MItPzzphEn3htA7aZDiNbXOAJsXngoWcnYXtAi1BZWbf4l1qCgFj2NE4GC48XN4e9bTmKW/Fpzsl7nJiLWy0/21r7PQPoAILwkECPFTLzo0q03bdWbkvq08JWoMD1STFIxxVljfNSxvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755533548; c=relaxed/simple;
	bh=OZkuxi+MAEq/fthUxDF1qw9Ysf5puzuemL5F6UWXYmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jaJiMRkYAD7K0szjDmaJt0CIyzuvaQWKPdzLFxbta0RHOPfYfTfGcT/lMLXFt2SPLGK8wWiO8gtylQfzBK+fuCcuh0QlNkOiAI9jyGQ3Wye/F0Kk5BzVWr5qd3doUifAt/NMqSdtB7H6veZSZX5+iZo5a/ye/FONmTjuVpS0uRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJs4+2+Q; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJs4+2+Q"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3e57376f5abso39194915ab.0
        for <netfilter@vger.kernel.org>; Mon, 18 Aug 2025 09:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755533546; x=1756138346; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OZkuxi+MAEq/fthUxDF1qw9Ysf5puzuemL5F6UWXYmw=;
        b=FJs4+2+QlR9pXrYvnKb7CWKiBITZrm3SotEzIAF+7sFgSXt3k17leBnO94Bmhjtrh3
         m9m/hmT9Mz2FcDxbuDHgjkxe2bDs2rzAlTihMQl2iXhkVjZu5cSRME7ydcDGCkFrEndX
         oSuRwdWsQ/Mpet9ks+vxuor+Lw5q/0hSBnxkVFTzuTbCdSY91DdCPaTVFT1uOUysWqAf
         ULYczuoACUZxEHTDqy1ChsjFtymylvCFhzscBcZutH00TZiiRyJ/hKim8c4b4jxEYVvR
         EDOgedZcYkViu0cYX4Ji9pxnoh7NLzuwRCaRxAFfbqh2x6J6OJQ9nMyYopg6W0LkcX5Q
         uRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755533546; x=1756138346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZkuxi+MAEq/fthUxDF1qw9Ysf5puzuemL5F6UWXYmw=;
        b=h+u5IewCwbN12nPPi6xHX+i3RG/iBp6ZM/yUJO3wNoPp+N5d3u/gVcN1YXIzYmlZW1
         hOlpHNhexphddUvnnimSsx2K9b9+hna8rY/YTg4+g2aLq8mJ8X6vHVB3CXqcwMYzDTtO
         JeS8Yl0NroZrGF1eumscukUuxJ8Fa++tCbp6TvkQ549YS7Iwdwkk86irQQrhfRrTC+I4
         wuNP0oARBEiFYFtIrwbfCXURJe1clhAcOO5mIenZUZuqou4KyXkrLFDFQJaSalSu7oIF
         d6FyImAZURQaF4PNnndotN9h73cGDL/kL52al5emOsHAZvuIKJnUm80sA2id2gQMKrVV
         /5bg==
X-Forwarded-Encrypted: i=1; AJvYcCU10TQ5HYqRVT7+0YhzWHED4+7WpjfXI9+YcJOVgFouUl3+aWH005b8bDJK6YPtrEBNErzOm+6Kh6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHhE8MnydUK0LtSE9+aiMVgBBr0389Jh9qpa2TvL4V7+s3pUf8
	qc7LJG2SUiLt6OJ+ON8atmz23fcfdmSKDQBFgWmYMqZCv8EHRU4o22fN7sdwEcYp3Wpf44HmVdq
	Y8JmZpgh2dqq/eKBR1aWFY6sfTxd2x58=
X-Gm-Gg: ASbGncsdSWizeyqEy6b6u12Vmcltt2CBd2L3077c5YVfWlxq/QImYwI4PRzIk9kz3aQ
	yXuLlstRK04w9pmPH4IhgvEtGJQ6ZnNMx3GbMo5JwkKU+8O/6lUE63yaVoZHyzmkV3MvI7aO0qs
	YOn7wH0DREcPVonvs4eI684ykpHmIQ88Q7Y94Vln8xiex1859679SLt5JluEJ6w5eGMsEoa3QXc
	K9GQ+GYErIYl1Prwg==
X-Google-Smtp-Source: AGHT+IED+JTTmlvy1wdq83Kv6byzirgfFWZ5D/9VXeUX2vPiPqG2+MRhzT30+VYYgcAti164L5GFOCaaetiw8/80Cco=
X-Received: by 2002:a92:ca4f:0:b0:3e3:ef06:674c with SMTP id
 e9e14a558f8ab-3e57e9d5defmr246583565ab.20.1755533545764; Mon, 18 Aug 2025
 09:12:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABhP=tbrKeaQCAnKHbJoWNcgTthvmAEPEOcvux_W8eztR5QT1Q@mail.gmail.com>
 <aJBugbUKvPaiZ_PD@strlen.de> <aJpNme8xRUbhNs4P@calendula> <aJsi1_zrVmQyHyw0@strlen.de>
 <aJsxDCRGVSQjGh6f@calendula>
In-Reply-To: <aJsxDCRGVSQjGh6f@calendula>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Mon, 18 Aug 2025 18:11:49 +0200
X-Gm-Features: Ac12FXzkwJzI7Nq9UBgrbTcTVOXKg1j6JIwLgYNZ9vzOQV8TrZ0TfhM2EHipQxU
Message-ID: <CABhP=tbYVM2NBCo35QBGmwe8JL98Vt08JE6NWBgpxKpFTGFqeg@mail.gmail.com>
Subject: Re: Query on nftables DNAT for localhost-to-localhost traffic in IPv6
 or without route_localnet
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> > But at this time I don't want to spend time on enabling such hacks
> > (lo-to-remote-dst-nat) unless there is a good use case for it.
>
> I am not familiar with this use-case.

only one use case in kubernetes and one we were trying to avoid to the
point we removed the functionality in the new implementation of
kube-proxy with nftables, but since it came back recently I just
considered it worth to ask.
I will try to expose the use case simplifying some of the technical
details, container runtimes need to pull images from registries (think
of it as a webserver to serve container images).
For efficiency and to reduce network traffic, it's common to run a
local registry mirror or cache. Localhost is a simple and reliable
target for the container runtime that pulls the images, and by
convention they treat localhost registries as "secure" by default,
meaning they don't require a valid TLS certificate setup.
Kubernetes has a networking option to forward a specific port in a
node to a virtual ip with a set of endpoints, and people were using
this functionality to implement the local cache mechanism ...
So personally I do not feel this is a good use case for netfilter to
implement something new based on it
