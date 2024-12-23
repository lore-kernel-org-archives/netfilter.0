Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A48A1B3922
	for <netfilter@vger.kernel.org>; Mon, 23 Dec 2024 14:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734964515; cv=none; b=OUmiHsTQMZVn8PzLax7aFFnuei20XUGU0LSotLwqoCa91TDIWyuJAUbgm1m2oizzV7j1tmyVFTpomezKazKPDbZkhLN0+BQytpryx9/VJi4ApXoyElER6Endu67Gy0GzdwqeL2bljTpl/b+d7d2Bd3FNd486nH4k+EyYLBiQzzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734964515; c=relaxed/simple;
	bh=HlZzNvhTavYfHURKfeYdG2iAj7mVEJkwSKp3KNUGC18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lkUSrV7lsLfHXGHpIK1BS946MuDFK9tXtZMRdoTkeDdaHAyP0VW0TaGhU2112KWCPD/2SNt7kQI+ogiOv9lmDqhOAXsOR4FStFmfddfXYRna+haAqP1meOrG49EbzKDddV+DdhGUUnlkwFx/VclNEBHJUYXCO7iUtURv8q3+qAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOxjbZMU; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOxjbZMU"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a9cee9d741so28927955ab.3
        for <netfilter@vger.kernel.org>; Mon, 23 Dec 2024 06:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734964513; x=1735569313; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7TjW2TIevr3cpBK31D9JOq9hTmVh4yX+u1BmrIOpuD8=;
        b=kOxjbZMUJdxZrDHDG9MHl1+KykPTtofc2b/Hm1f9QcZtBKVEMLVUYUZv9HcfYcT8pV
         /lUBn3s3o9lH/g3pJdkz7aNDRPtY/gkWJcMozPJocyEGmmYOV3HDM/BV0+y40k84b+mX
         nwz2M7eRq9HlIQ4OxXSQQCZcGrKL0s7yN+3jj+yOYHtaF9yIVmMrlsRu9oCIySZqPotz
         O02By8M8/bVn4F4zvmTBkT/IeUVMwz+sIStQ2yKer5o0jK4JQOYwRc9o5f0BiyVZpCJv
         IQ07tMFaV1soa3JYvNDoo9AzeuV3SoNnN/DfAxXl4Y7AS+SI3LecoG41n6Xki/peoxrv
         aWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734964513; x=1735569313;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7TjW2TIevr3cpBK31D9JOq9hTmVh4yX+u1BmrIOpuD8=;
        b=ZR34zz5TB7B5Y/Uw+4uK1ynW53v6962/7Ffu5KyAxesKbaAsdxZiX2FFopSFd5oFHw
         bQ7BUxmUI1XELHUaD6FtiHubAWpB/X9A5u23sTiSeOeu8c9zALMvvtwDOBLpNumZBLPU
         WpQKYHkE/oRBL+0RH7BFdrcj2Ga6OTNnN6OLs/J9NSLL4O8+OaniC/nyZ2ETpvIz5yTz
         SQceM6ZVONUSk7l91+8BM4qn3ZxHntKTpKpMFVYWy/VDXV5Xg2m2aY2IA8u/4+NHpdfK
         g2lKQAyZjnrznq3Tq3Lm6ih0iuaNJ2BQKkb9wwOOj1p1g1ab6te08h7mI9p4Ix1pQRag
         F2LA==
X-Gm-Message-State: AOJu0Yxe3c0U0NSvFFX/y+bh94chiX5RCQLxmUaw4vGjRUt/YxiuNHJs
	Ze1tGn80qOHZ9gQIy5+mPyaVcP/lLorNsw5ysYg4vVnzhJ45VlKRyEoLtCu5vun2A2SMRVA5kSg
	8xJ4aV29t/SebpdR4KZFjXUrtYOb285THa/4=
X-Gm-Gg: ASbGnctJEYG16vP4EZQCnARixuiJdRfzV6NXrxtU/+xI93g/8i92j73P0Y2Xl5CTppD
	3rkxevMiSiprHid7vTfJu1pvkCzZSFk8+tJVH
X-Google-Smtp-Source: AGHT+IGPNdtYgxIW/gOsFjbd2KAzrgA9bVjzIWimVpGY/0OwC8Zb0nwvgRZLUCEYuvBcty9he8LEtOJ57UKpKcojQ6U=
X-Received: by 2002:a05:6e02:1a21:b0:3a7:8208:b843 with SMTP id
 e9e14a558f8ab-3c2d5a27dccmr121289665ab.23.1734964513250; Mon, 23 Dec 2024
 06:35:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABhP=tZtzqX8vfL5zdqxx6sdZWT56iWAhW35-=U8Z16HZBs-ug@mail.gmail.com>
 <20241223125151.GA7005@breakpoint.cc>
In-Reply-To: <20241223125151.GA7005@breakpoint.cc>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Mon, 23 Dec 2024 15:34:37 +0100
Message-ID: <CABhP=tbjB4H1NXxC+_xJFM0pGby3YX_V9PP-XqLVMr3xZUpQwg@mail.gmail.com>
Subject: Re: nftables portmap map
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>> nft add rule inet cni-kindnet prerouting dnat to ip daddr . ip protocol . th dport map @hostport-map-v4

>
> Strange, this version does work for me.
>
> table inet cni-kindnet {
>         map hostport-map-v4 {
>                 type ipv4_addr . inet_proto . inet_service : ipv4_addr . inet_service
>                 flags interval
>         }
>
>         chain prerouting {
>                 type nat hook prerouting priority dstnat; policy accept;
>                 dnat ip to ip daddr . ip protocol . th dport map @hostport-map-v4
>         }
> }

Yeah, it works for me too, it seems the difference is the "ip"
statement after the "dnat" ... "dnat ip to ip daddr ..."

Without that "ip" I can see with strace that it gets " -1 EAGAIN
(Resource temporarily unavailable)

Thanks for the help
