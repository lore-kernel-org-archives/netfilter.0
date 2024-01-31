Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077C24F60F
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 23:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706742706; cv=none; b=EhSC++ygjmUGgMW6qVB6bZmYhsU3xlPgaQ2pCL1zc9Cwdq0TJVyRHiimtIBFe4yL20PRkijsyBX6tv6g5BGIPQM9sls6dIdwUotPri5LL47kgydGuEDJl87HoKXsCx9aEJTrRopZDX6PGCITQ/TbV2NUpatSd2Y2DIEUBjLPL9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706742706; c=relaxed/simple;
	bh=Wyof18NxeeS04tFUBTp1xSrzeHJYoiBqRJCLmkzWQkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rA/qhIAlLp6WPf87+4KngZfl6ijE5HwC6r5o9XcSUA26rKcf4t6RwQODHR+insS6KGMKNhEW1VMYUtyNS0MyW1CWX0vOcnDR85FOaIt0ocK/GmSj3yABhpOsMEY61eBl0T9Ouqa0YVZ4ble2JITCp8EmYePtelCPd0Q5soXGMbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzlM5ZsU; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzlM5ZsU"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc6c3902a98so243461276.1
        for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 15:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706742704; x=1707347504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wyof18NxeeS04tFUBTp1xSrzeHJYoiBqRJCLmkzWQkg=;
        b=AzlM5ZsUyiei3sWn5VUqK1rtcOd0qgKiHYsOWMtUmkBWQRQUffkpJnUJ6+sz0UYQSI
         srMF0+X6pvuNvstsmo9AZhJgLnAFHsnpBHCqRP9vYs1jSKbJIvIoYCPEB0zqhBizyfDi
         y1ej6JibbKpIiG83HkkMENwSIT+8gr/V5PRMzooIHb1nvqL7PczQle1DY/0IRvMcayXt
         +xKi7R0RCFGJoQGKT734wAkt5cSYJMMPguP/66YEKgQi86XaDyM1/mitOBBrTuTlsr3I
         wm+7Bq1yodXVNyBryyxyVIgaH5SBehPlbkbAmMIfM6Ofz6+JXQ/fXnQDcRPIQh8tK6nH
         +HuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706742704; x=1707347504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wyof18NxeeS04tFUBTp1xSrzeHJYoiBqRJCLmkzWQkg=;
        b=EHVEypEvkVGwo5XGA2myImaJUnGkVD49x36hCA0b/vPXtr/jjsZJzZesJ4+RrXEdSB
         wqUIUzYGSrKSPfM74H0BQwBkv+l6g5EvW5ucAUwCKaJ3qB7plTKm8Zdyg3pwwKUfr3jn
         /CYEK4K9VowuT8ErXF0/HlmGDm3NQNpVhE33LXn4n6oGHX9wLHVTaz5LVtKk1dkz2FuK
         uU7PnvSbIzjeq0FUluLq+Pjj3YyUXRvWsA9aIr/oim1hqdk/dtddD/vDR9tLmRX03iz9
         Ht4Cf/oRO6ueWnyuSQyshcr0zESPamOgAyCtrDMmXcqiO/O5aHYCtbojShh4SyvIxs94
         M72A==
X-Gm-Message-State: AOJu0YxCY/tsKFLufK5jnlInfUtMLfyzwoB2uGSUwpgQU1Wr9868tRch
	Hn28SUqlNx8rto9lw1KmCFP9yHdZ6SuM8AVBn9JA3Afww9E1JYFkvKcO/+bOHU/XdnZhPswO03M
	Pd9pnE6RTDbfkSRwZAf4vNiYQlr7HC9JMtUg=
X-Google-Smtp-Source: AGHT+IHf+bdEOtR7OkdejDCzXqQxBQPtUXQKAtH5+cUvZnmEb7jV2WEvftlGiXam0NkLiwMZjyjJ16+sJLaXJ9FpheQ=
X-Received: by 2002:a25:b112:0:b0:dc6:978:19a4 with SMTP id
 g18-20020a25b112000000b00dc6097819a4mr577080ybj.56.1706742703823; Wed, 31 Jan
 2024 15:11:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJE3=wmAh5Ne9fWdrHOyZx9uuz+_g4+PhVXnfr+pS417mVWfhA@mail.gmail.com>
 <3cfd95bb-93ca-4f40-9e1e-bb2526789161@app.fastmail.com> <CAJE3=wmhLSHY7Gqg7vHX_SAAYKx-PMQFC_i2iEek4mBnghyAbg@mail.gmail.com>
 <20240131223947.525533518741b6cae01e2d6d@plushkava.net>
In-Reply-To: <20240131223947.525533518741b6cae01e2d6d@plushkava.net>
From: Anton <anton.khazan@gmail.com>
Date: Thu, 1 Feb 2024 01:11:28 +0200
Message-ID: <CAJE3=w=WfYmp7QimYd7Q-rN+5rdq-+9ELVMgzk9GkQ5r60c6NA@mail.gmail.com>
Subject: Re: Is there an efficient way to delete multiple elements from a set?
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't know whether this is actually a bug, or is it by design.
Perhaps a netfilter dev could comment on that.

On Thu, Feb 1, 2024 at 12:39=E2=80=AFAM Kerin Millar <kfm@plushkava.net> wr=
ote:
> Anyway, if the performance of nft seems unusually bad for deletions, it c=
ould be bug material.
