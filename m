Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518DB2D3EEE
	for <netfilter@vger.kernel.org>; Tue,  7 Oct 2025 08:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826652; cv=none; b=azgwfHI3PrF5Z9+9StN1vckprzLVd99iXXOfpYYwq031UQix9+gdxkwLetX6RLnUTrflNbuJqZRs7g62qD5B6RWr0mVEPAx4Bqhi9++jvbYdiRXxfddkrkTRFs3OXWZCPGWp0rPa9RPEEHcQAQhuYR6jUGc5z7jZvYrHQptVDSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826652; c=relaxed/simple;
	bh=S+7zIh/sPUrKAqbMXN0u/iFBnxLgzTjXo6BXWobqknY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZ/bmr5wX+OJuxnKAEqYrODPNgPnaJCbP0CrOY6vkNpxLOGE6ni+51ZUo0CCPNcu3PUmQdLI/mQielUsdawBC0Z4+311i8N9ErWaNniL0UnzSFAVXp1Uur7WiuwW4lFOf14BtHvvJ7qmUaDo2nDouZDR9WBfmBzfyjCnfYi+dsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CagaH9Ip; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CagaH9Ip"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-330b4739538so6057737a91.3
        for <netfilter@vger.kernel.org>; Tue, 07 Oct 2025 01:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759826650; x=1760431450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9+a72fCw5xIsgOpaYo4LJRuD/uNqHny7IWIvXUxNNk=;
        b=CagaH9Ip/saf6ejt3+p/p7d3e2V5NxXUsgQui9VPOyX5D/GVRze4niASkYO86F9pls
         uq4DWelBd6QpWbD34kmZ3QUlOapCcsNJz87ZvRWf5v8rCzG44nOq9FX2ET4y9PNbjgpw
         yyfXYis5vBR1pO0H85WjysqXkjTrQ7icjxq3z8cHcr7Z2OTO+ZIHp41/4gGVOpLQQUnp
         PKDe8p+dQaplr9pCBJeQ/g4kLgBBWKfP00OhuCw2aJsD+9sCWAb1dh+UaFy4eP/zgoLY
         DmgcC/TM6sFmhm5SHMV1Z7CFkfBUZVbAg7D4k+xDYV3GE1AS1whOA3hKGb4JqVClmxl2
         lzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759826650; x=1760431450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X9+a72fCw5xIsgOpaYo4LJRuD/uNqHny7IWIvXUxNNk=;
        b=GucLzueZ4vGXy/1c++ncerD05L8nqcckSlHXQH8/LxKinxZ0SVaFLooZJ68LoMai/J
         4BIF5nvCBxUJgDvkIrnKstBlW/wm0Q5+6rX+2Lk+jYHrtbaXKg3V0dgIr2o17k8kY/rw
         8L6TqCLIPHDl/ncixQ17orpFDjYQhzSX3PswH5c2ZZ9+ul+T0+4YA06F0evMg/W6ABlp
         lBUVyr7ksUSmToJ7iUsC/uWPTquJFxj6sqFiQwgp/5l+XuJdaFvOP1xRQ5uvGDXRqm29
         wp6Bju6MuL2Isls5Vdi15rNJ7kf0FpUCIrXoTMcoFHEpyQ/9Yeb5o8X08l/pQGqmVcSg
         f7PQ==
X-Gm-Message-State: AOJu0Yxmp/E3WcVE+voSe/9pMkkc/0k2WZZXg7KSdaljrWRk9XH/g8FL
	1oaeDPYwr8HDwq5VuXIsLgT/63OtKGIaLF7YaPRmEV4I8OiY0YNBB+eMgOrYTgBxHRN2j8Bbfkd
	Bvr7um0NBpJtXE81V4RJfLypVB2CBWq7yJI3UOic=
X-Gm-Gg: ASbGncs5UpfZBsmcwnCmSB9PXjPzBKiexxDZXxSM9iysh2jzxHEdsy5r5EBDMCg3wd4
	JjD5y+Uf93o8V+GFMv1JyZ5dJ/QbGU5fIEN0vFDOCN+vXOcqtPG9NVA3gezMWcQjh+PauecvaG+
	eKBK90hW9ATf2pEtwdZjfDt0uxjLi7//HtH9wE6QGdAK4oH6RHr7B71MydNCK5+jySIcJXQTANW
	5LddoY73dXOrKx2qI0UDkCgyeaf4XF9Pfvq85sreQ9fBMw11D5froaGzOToqcL23efXYBZdWJFf
	PnrX4u0PAbCITmFp0i/K
X-Google-Smtp-Source: AGHT+IEM52WnfT65pqDj/EOwACDKvWAq+iNXXE6bWn7R9iV9d07hrqgF2vIKMrda9uYTZry9OVJ7yAcJj0musyXrMCA=
X-Received: by 2002:a17:90b:2692:b0:339:d1f0:c740 with SMTP id
 98e67ed59e1d1-339d1f0cdc2mr10437797a91.1.1759826650351; Tue, 07 Oct 2025
 01:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFctyt+UdMz_yJYg=dMojijFZXdHT8aUyb7ga7Cme-NdYRP-gw@mail.gmail.com>
 <aOQsGUZTYvZkDcFx@calendula>
In-Reply-To: <aOQsGUZTYvZkDcFx@calendula>
From: Stephan Ferlin-Reiter <stephan.reiter@gmail.com>
Date: Tue, 7 Oct 2025 10:43:59 +0200
X-Gm-Features: AS18NWDz_ZAJLq60IXv0KZilo22yC0iKKA_k1_WXLH5ITKftumouo45lS9T5uyo
Message-ID: <CAFctytKDnop82KtiTmNbgExrczMScGYMNZo6xY16PY_6iYH=Xw@mail.gmail.com>
Subject: Re: Slow "nft list counters"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C2=A1Hola!

nft --version prints:
nftables v0.9.8 (E.D.S.)

Which doesn't include your fix. Fantastic timing that you improved the
situation just recently, Pablo.

Thank you! I'll try to build the latest version of nft and give it a go,
Stephan

Am Mo., 6. Okt. 2025 um 22:52 Uhr schrieb Pablo Neira Ayuso
<pablo@netfilter.org>:
>
> On Mon, Oct 06, 2025 at 12:39:56PM +0200, Stephan Ferlin-Reiter wrote:
> > Hi,
> >
> > On a host I have many network interfaces with associated nftables
> > rules and named counters. I=E2=80=99d like to get the state of the coun=
ters
> > and thought about running =E2=80=9Cnft -j list counters=E2=80=9D. That =
seems to take
> > many seconds, however. As an alternative I wrote a small program that
> > talks netlink and sends a dump request with NFT_MSG_GETOBJ for the
> > tables I care about. That takes just milliseconds.
> >
> > Now I=E2=80=99m wondering whether I=E2=80=99m missing something in my p=
rogram - I do
> > seem to get what I care about. I=E2=80=99m also curious as to why the
> > operation with the nft tool takes so long. Is it maybe looking at all
> > the rules, which are complex in my case?
>
> What userspace nftables version are you using?
>
> I remember to have speed up this recently:
>
> commit 969ce17b66f8084626610202f11d607911e049e6
> Author: Pablo Neira Ayuso <pablo@netfilter.org>
> Date:   Mon Aug 26 00:41:37 2024 +0200
>
>     cache: add filtering support for objects
>
>     Currently, full ruleset flag is set on to fetch objects.
>
> otherwise, provide simple script to reproduce.
>
> Thanks.
