Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDD7199943
	for <netfilter@vger.kernel.org>; Mon, 23 Dec 2024 15:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734966205; cv=none; b=LEFSUkaQVrB7LunETw/KqTrrhPK+6sc62Z+ipvyLoXEvs1sjMulGhuC4uDtRIT0hxBjP0iMegZfTqPqKJ52A6dz8wAC2b9H0fG7CO2Amkfphf/vySYtvnyrf/NYeRXVY6K+jgMYhkOJHVnMxVzhjb5/yahXLJedet2zWEKlaUIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734966205; c=relaxed/simple;
	bh=2MadDioAQUOkexJ2whQBw4UZ1ZcPFimc3qHhXDtOUE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecPO/M8lIh2R3OB8t8/aT5KZTk3O5TrBYfJTs3yOZNJedfAJaPmD1le5uF5nV+Ws02spYC+QQKu9fd/UcMDjBbA34NnXxJE37tK9EdazeKP/wXutOTWPnjCCSMNYsUQTzzIFZmbkjKNXJt57/aVSOXgSLsQHQncJDl/peE4b5BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7sfRzuT; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7sfRzuT"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a7dd54af4bso15306075ab.2
        for <netfilter@vger.kernel.org>; Mon, 23 Dec 2024 07:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734966203; x=1735571003; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VO/PKnMVh6GlUCmLEGMyFVSiOTaFybGH5XwqeiYkAaE=;
        b=d7sfRzuTusrpC6To74bJH+lNQb6XVwdNOOZRiu8MpEiT//egbCXUCXs83w1gPBJwG8
         nB0Wc+iYd8iXIgyZ9XHfkujn51FepQtYhloCsNHDCdxZZGYqRuFo8LC3Tq2uEF5s7jL1
         QdL2gffmfHU17j4lpR9thn2SShJl1Krjv44Y4OJBxctOmAnvTXz6fBiTyprLxZFj+l3d
         0YryIZTqszUaxOFsrWUrfB7MMHp0ZV5gOMuJcHl/zSS6rrQh9BJa+YzCzyRaAj263IGP
         uxC0dOmeQIkhNq8oikzHTpt9HbQrho4Ib0XJpeALcjHel4omaffi/1WtaEYDPZYqK/sp
         U/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734966203; x=1735571003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VO/PKnMVh6GlUCmLEGMyFVSiOTaFybGH5XwqeiYkAaE=;
        b=FunD5LHlIUhQ3nSdfruMEDRgbK4CR+uCfO9Y1CNhWYrfrzhreoe5lMCYFWQrXEwXCf
         gfFMuolBZkId/hGuJBBULpvtGm04BW6V6uboQwk46TEGJ+l0I2xMj8JaJ2+QGHQGEQms
         Mv8MrLm+60vC/88+IJkoUSzOL4sy7FJM3euegy/ydmQ0iTvdd41I4DrQrFPmNgAJikJ2
         jfIzXa8YZkZVZ+W+1HxzBUhqEjdDwOsn9iRlgmc/rOipEsXzQknAF/IWseVnOyR3yCzY
         ZeAmot74wNa2BCib15Jl1sfK+zTvxukIyPhZa1RP0wkv3up1RyGiRQe8j8k93XEAC7jA
         4Tzw==
X-Gm-Message-State: AOJu0YykMg0mr9oAYhLJLrNUVCDdcuxfRA9pCa43sfX6A82BTIB28icq
	Zk4SFg63lvjF38M3B0usGfENtxAQy7ylpyBdkTw4P7fPzbtzW5Gb1XfDBAeIEVEJZ5mGpB35o30
	EShHvWAWVfy3u/FtgQlURDb0gopw=
X-Gm-Gg: ASbGncui/TgUAS+c1HNLdhWuZzW5zX/oaD9egHqveiF69K83KldOd4iTu9yQgEpU02/
	beHtITYNROkTWxcxAzAueWStUupAatWqjGpbH
X-Google-Smtp-Source: AGHT+IHYlcxS+SdRjkXp0GDcsgfkjeECfZgKkZHqnpWdNdxCnem+x1dGo+i32icPdnqzhbMEQ1UtxNIZbkUWJ5Mzve8=
X-Received: by 2002:a05:6e02:190d:b0:3a7:7ded:521b with SMTP id
 e9e14a558f8ab-3c2d514f3ffmr97496265ab.17.1734966203107; Mon, 23 Dec 2024
 07:03:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABhP=tZtzqX8vfL5zdqxx6sdZWT56iWAhW35-=U8Z16HZBs-ug@mail.gmail.com>
 <20241223125151.GA7005@breakpoint.cc> <CABhP=tbjB4H1NXxC+_xJFM0pGby3YX_V9PP-XqLVMr3xZUpQwg@mail.gmail.com>
In-Reply-To: <CABhP=tbjB4H1NXxC+_xJFM0pGby3YX_V9PP-XqLVMr3xZUpQwg@mail.gmail.com>
From: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Date: Mon, 23 Dec 2024 16:02:47 +0100
Message-ID: <CABhP=tbWy7tQh1XKGAsQqQ5LzaUbrwz7iGvFaK_iEpP9LMH0kQ@mail.gmail.com>
Subject: Re: nftables portmap map
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Dec 2024 at 15:34, Antonio Ojea
<antonio.ojea.garcia@gmail.com> wrote:
>
> >> nft add rule inet cni-kindnet prerouting dnat to ip daddr . ip protocol . th dport map @hostport-map-v4
>
> >
> > Strange, this version does work for me.
> >
> > table inet cni-kindnet {
> >         map hostport-map-v4 {
> >                 type ipv4_addr . inet_proto . inet_service : ipv4_addr . inet_service
> >                 flags interval
> >         }
> >
> >         chain prerouting {
> >                 type nat hook prerouting priority dstnat; policy accept;
> >                 dnat ip to ip daddr . ip protocol . th dport map @hostport-map-v4
> >         }
> > }
>
> Yeah, it works for me too, it seems the difference is the "ip"
> statement after the "dnat" ... "dnat ip to ip daddr ..."
>
> Without that "ip" I can see with strace that it gets " -1 EAGAIN
> (Resource temporarily unavailable)
>
> Thanks for the help

I can not make it work for ipv6, and tried different combinations
        map hostport-map-v6 {
                type ipv6_addr . inet_proto . inet_service : ipv6_addr
. inet_service
                flags interval
        }

 nft add rule inet cni-kindnet prerouting dnat ip6 to ip6 daddr . meta
l4proto . th dport map @hostport-map-v6
Error: transport protocol mapping is only valid after transport protocol match
add rule inet cni-kindnet prerouting dnat ip6 to ip6 daddr . meta
l4proto . th dport map @hostport-map-v6
                                     ~~~~
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
