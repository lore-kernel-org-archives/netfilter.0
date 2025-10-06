Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59030230BD5
	for <netfilter@vger.kernel.org>; Mon,  6 Oct 2025 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759747209; cv=none; b=aFEEKRoZwswp9BuGpiKaZfML19b2rU6h9HhZRTrd0qQUsPyrzAuqwH6JyJOr4pR3dNKgE8ZBXxNzSvb+qJt72fo+4f96ZuJfqTSYbF966AD2TkmVIB/QhAxsN/HnCoEVNiYU/og3DKkQuCuUnewqwschAyeQ5yCRMdTn4Bc/zgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759747209; c=relaxed/simple;
	bh=JrptJMhLPZg/iiKjf1sBLX8EPABP6jTKSOOoBi7v4xw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Xz0SdXLZ+KRYzO+bXecudQg98swOHhY8g4G1de+y3gNvb5kRD7zfrODukiLdMQc3eszj6AzxRrD4lRRPtbJHiAbdPsx/LdyqsQdautj7YldkkGq00Vh/MlYY38NfZYuBKq0I4jABdHxPtL3mMYLbnPT0zQbpS0PFUTXNceNQARg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPZyq0uX; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPZyq0uX"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b5506b28c98so3297267a12.1
        for <netfilter@vger.kernel.org>; Mon, 06 Oct 2025 03:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759747207; x=1760352007; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JrptJMhLPZg/iiKjf1sBLX8EPABP6jTKSOOoBi7v4xw=;
        b=TPZyq0uXWVtP5gVNGIB5GH7HI6H7Kja+U5Br+dHl47SeMPtIpwyGEqUYRmYne6TcKQ
         SUmtjdZ5sgC7kEJardlVECQJ+NmETlkVVj1PbdatWUGdiEqA5gxfjRSL0eAH81RArR80
         UsPpdpVUcVySB07/waaN+qTnPs1FYROPHS+2l6om+miVOc2NhuB2nW8KO/GI8vPslf/K
         uTg1/YzXfz6Vqpp8S1m7/Nla13ZPY4pWMlwzy+O4j7k4gzcfJvY0WdsnFVAPHPca45D6
         c3Xrx8UmgGodDtN1M5h9tFyht+jxNSNVO9baw1m+BHWPpxya4ZALF2XxEEbHvsL8ucpw
         +s3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759747207; x=1760352007;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrptJMhLPZg/iiKjf1sBLX8EPABP6jTKSOOoBi7v4xw=;
        b=A09WkEYlOd2/y196icZxrti1g+stPerb8BD7lH0gLTuYysKvPVmqQ97lz8zTum5lcL
         WgZMc/Z9aXbQcLrcOUmH1WtH/3XXUVkCMJwXaJxlPmk8DkU+aeFtj6CLowbclt2lqbF0
         lgX3y1SyscdiTp31CuYbCi4+ULRqMqD4hm4x/IhmngCv1WpndNKjOpECxWl1hOu8KiUm
         86mv2jI8l8qGCxGbFDjPjyYsBVWIvznqmbC064vk5SCzA6RZhR4ImH2+rOsBt2xwNDs7
         QvJraI1VBC4ccZEXGMcZpslVrzKu1ttr31ic3knlJPG8vm5mtafE6FMQrH7VwrBCxL+d
         z4uQ==
X-Gm-Message-State: AOJu0YwEn6BrDt68E7brl8Fg4tsKFfUoSMXZhxgZKiCUIVafu7OjAJgM
	+/qrKc9OG770Z7dn/j7+C6FWQxTADJL9jH+qkAKz/vo0k6pUfgjZOyiykz2PgoGdEuT3Gqloc9H
	lz2TurFixXzFLXFqFgAwLHMzpPqdUvV1HKHE4OEE=
X-Gm-Gg: ASbGncvQ5M0vdu3v3+IRoTHLGZneZHNSetu1lerc2ggYuaOD1LRyHzy9DfN9J+NS0OI
	MlqHhAO+LP9pgpMxHymXiXH4JprruYZI3vCqL29bKl66LAjsZp9bfCj4uKeMsEPCtPreP+kSzRH
	mmli8f64PGvhwb69SIsrq+pkb/AfCihui5nYN3O9CsXW+S6J7vg4nUEb4cTh0B2od+HhDiTeqBx
	oBcOQUI45tJJWrWb9Tej3SwjmQ8KZdUWQoNGrMUwF5GgzF9G56jvHZ5ysoiIzM0PTgkUAo=
X-Google-Smtp-Source: AGHT+IFNo2cEn67PX/InfZ49sKsMg7pLH0HoFKIZy6Hhqrk6GBpYCxxs7ZxRjE9Ng/nqbRbr05yRv+yoFyhgnvhxxMY=
X-Received: by 2002:a17:902:d4d2:b0:267:9a29:7800 with SMTP id
 d9443c01a7336-28e9a6609b7mr141363415ad.59.1759747207397; Mon, 06 Oct 2025
 03:40:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Stephan Ferlin-Reiter <stephan.reiter@gmail.com>
Date: Mon, 6 Oct 2025 12:39:56 +0200
X-Gm-Features: AS18NWBw5rLC6UuobV_E93QLv8K4rNntQLoCPqAM2vfmsf1e2iacvWu_g-GC410
Message-ID: <CAFctyt+UdMz_yJYg=dMojijFZXdHT8aUyb7ga7Cme-NdYRP-gw@mail.gmail.com>
Subject: Slow "nft list counters"
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On a host I have many network interfaces with associated nftables
rules and named counters. I=E2=80=99d like to get the state of the counters
and thought about running =E2=80=9Cnft -j list counters=E2=80=9D. That seem=
s to take
many seconds, however. As an alternative I wrote a small program that
talks netlink and sends a dump request with NFT_MSG_GETOBJ for the
tables I care about. That takes just milliseconds.

Now I=E2=80=99m wondering whether I=E2=80=99m missing something in my progr=
am - I do
seem to get what I care about. I=E2=80=99m also curious as to why the
operation with the nft tool takes so long. Is it maybe looking at all
the rules, which are complex in my case?

Thanks
Stephan
