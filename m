Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C451AA7B1
	for <netfilter@vger.kernel.org>; Mon, 11 Nov 2024 19:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.84.196.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731352940; cv=none; b=lYV4EKpkvIDQyvwaEn0HGdtLPqHidcBpOU/faH3Z5Wv+nircEayBYgZQXWvI0x3Q03ByFSODI+h5unm5ZzVIDozyHylbS+mngHOaXfQtTv1m/CiuhHOJFBioVpEjB/70w84sT9pqShEKg8aA9RwR6QNfrfB6zHJR+LSf9Z5vZzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731352940; c=relaxed/simple;
	bh=BELwp2QNcqgxENIjwVYp0s3KTaY5CNWXyH+YxOryPaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aoyNu+VYW5FDBVvp5dsvAHXeV0tJyOFgiCWIYIZ4yVMJhn9nOhddhjI63xjI5b33x+7P8XwJY2ZROF7FLr8Dt9SVJvWU4PTJ1VIhiRyqnjRmWFFiDgdVPPVQTdWp+esY8bAM83b7zif9r3duquzfYifSapG720zihmjV62U/UoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d.umn.edu; spf=pass smtp.mailfrom=d.umn.edu; dkim=pass (2048-bit key) header.d=d.umn.edu header.i=@d.umn.edu header.b=Bg1PrWHH; arc=none smtp.client-ip=134.84.196.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d.umn.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d.umn.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d.umn.edu header.i=@d.umn.edu header.b="Bg1PrWHH"
Received: from localhost (unknown [127.0.0.1])
	by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4XnK4V3fHcz9wTXL
	for <netfilter@vger.kernel.org>; Mon, 11 Nov 2024 19:15:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZAxDWypvQNP for <netfilter@vger.kernel.org>;
 Mon, 11 Nov 2024 13:15:06 -0600 (CST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4XnK4V0vBSz9wTXF
	for <netfilter@vger.kernel.org>; Mon, 11 Nov 2024 13:15:06 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4XnK4V0vBSz9wTXF
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4XnK4V0vBSz9wTXF
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5c942f5b0c0so407346a12.0
        for <netfilter@vger.kernel.org>; Mon, 11 Nov 2024 11:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google; t=1731352500; x=1731957300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXAwX5s3d9JxcDuQ6Qzq8kpC1owPx/gOg0XQC85NcNM=;
        b=Bg1PrWHHcl/FG871X9lsGaWn/85eVoWrNE1rgD6KYIYHkKpOEKEd2moViwbRqU9n1u
         1uFiyxtZKSPTe6x9U2hrUZk5J7mhYbPrIH+zIlGwE+AauQzdlFtGmyEIk9MwIt8ut7HV
         NcNPOWs93Y8nPu8jgq/9cTyzyI9iA2Z6pt7Mu3X8tStOOuMQaSbwUV/ZKdlbz+Z0CUJG
         ilRafIliQWWEZ9XmW01XbZyf+voonOFzuReZn4tY1bNQ9TvLk5hrCOqWUCjIElYapwiH
         Rsqx7RqvI0lzTZZFNEIQoG9+tHQ/mhGQsMcGcgyFH64z1O0lMXeHypD/9a/H6N1ivTq5
         jTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731352500; x=1731957300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXAwX5s3d9JxcDuQ6Qzq8kpC1owPx/gOg0XQC85NcNM=;
        b=HwaIhLKroNtFHxGUKNx8LIE46TsflA+8rSYybU8wezec3a2SGlN9kp1PUG1plIId6O
         2Q16jQu6xBPZ3VDU8x7AKSMlmLVxgL5DAngHNxfch3ZwHhVBB3R+4QBpEs5G2xLM+gQN
         mrUoocz6nxP773EiBptJs+LVdVpZgXFwyrPzEt4/xZ4/jSaGQfhac3Hz51r7e06glf6u
         NfhOcCkSnvO1qlnN3569ayCt1HUkUyTe5OdVJYDqEpE7RWqsZ2ecWWeHF6E8qZoZhO+i
         qGmJATfDtKoNzT2LQiAM39f9x71ja5MYH0vLf8vBbDrzfGT1q/VFVE0L2p+hpR4jvMoq
         ll+g==
X-Forwarded-Encrypted: i=1; AJvYcCWP6rcOiVTahlCzCYBoLJpmUrSb5ePt+U+IGIVuuuRWwu3wXkOaoizRwn96y6So7CjvVo/dWIe7icE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxScU6k3Gw/yMz5r9+pqxKmpDlelzvUNZ4GtELDA9UOzF7d8O45
	dwBjOb5JCWgobh54ZIT5BRRRprMj8Vp5FUmiE6bHdMQWc0sgRQ1p+/+mbnYW1RqI/29K08xRwJH
	w4mbd7iRcOE6OGBLHZYlb/6op9kEZqVsXxMgp7X8oMA0p/IoJ/cBjBir4V++7rValWVuswihWU8
	FbATxd7tkENk73LDJXZ/3GxqpSODiJMOjYr2H9mtbo58agdQ==
X-Received: by 2002:a17:907:3f86:b0:a9e:e0a4:e984 with SMTP id a640c23a62f3a-a9ef0009b41mr548588266b.13.1731352499734;
        Mon, 11 Nov 2024 11:14:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKWoNcQI2480pbDGD3VEGPaeB2n4jXgcTuEJRMvIUBhUCHXKzFXfYopbjMw66WRj+xA3KoFZrwducw/tPBImA=
X-Received: by 2002:a17:907:3f86:b0:a9e:e0a4:e984 with SMTP id
 a640c23a62f3a-a9ef0009b41mr548587866b.13.1731352499337; Mon, 11 Nov 2024
 11:14:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOLfK3VUyrxBzd4sfk9Fhb8RnmQ8TAbszh0j2TD1a24WE-h74g@mail.gmail.com>
 <771EECBD-1B8C-46F9-8429-B1118380F7A2@slavino.sk> <CAOLfK3UWDAOAww10O2NxFBPgLa+Rr92=Lw+qFb1fxDOhD_6Dgg@mail.gmail.com>
 <20241110214746.GA25943@breakpoint.cc>
In-Reply-To: <20241110214746.GA25943@breakpoint.cc>
From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Date: Mon, 11 Nov 2024 13:14:48 -0600
Message-ID: <CAOLfK3UN5h3bSZr2N6xTWKcr+iNE48YdUbmbU_EmXqVA6A7qGg@mail.gmail.com>
Subject: Re: connection tracking and kernel dropping packets
To: Florian Westphal <fw@strlen.de>
Cc: Slavko <linux@slavino.sk>, netfilter <netfilter@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Florian,


On Sun, Nov 10, 2024 at 3:48=E2=80=AFPM Florian Westphal <fw@strlen.de> wro=
te:
>
> Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:
> > On Tue, Oct 29, 2024 at 10:48=E2=80=AFAM Slavko <linux@slavino.sk> wrot=
e:
> > >
> > > D=C5=88a 29. okt=C3=B3bra 2024 15:11:34 UTC pou=C5=BE=C3=ADvate=C4=BE=
 Matt Zagrabelny <mzagrabe@d.umn.edu> nap=C3=ADsal:
> > >
> > > >...but it is still dropping packets due to the CT.
> > >
> > > You have first to inspect what is filling your conntrack table:
> > >
> > >     conntrack -L
> >
> > I've waited a week to let the TCP streams in the conntrack table time
> > out. I'm still seeing the kernel drop packets:
>
> conntrack -F not working?

I didn't know about it. Just tried it. Seemed to work.

>
> > # tail -f /var/log/kern.log
> > Nov  6 11:29:02 netadm kernel: [48773744.961053] nf_conntrack: table
> > full, dropping packet.
> >
> > ...and confirmed with /proc:
> >
> > # cat /proc/sys/net/ipv4/netfilter/ip_conntrack_count
> > 65536
> >
> > ...but there aren't that many flows in the conntrack table, and none
> > in the expect table.
> >
> > # conntrack -L > /dev/null
> > conntrack v1.2.1 (conntrack-tools): 22 flow entries have been shown.
>
> Depending on userspace/kernel version this may only list ipv4.

Ahh...

>
> > Any idea where to find what is still causing the kernel to drop packets=
?
> >
> > I still need to handle the INVALID state, but here is my current rule-s=
et:
> >
> > # Generated by iptables-save v1.4.14 on Wed Nov  6 11:40:00 2024
> > *raw
> > :PREROUTING ACCEPT [559078817:46637850935]
> > :OUTPUT ACCEPT [539455981:114717831525]
> > [311121010:22258566347] -A PREROUTING -p udp -m udp --dport 53 -j CT --=
notrack
> > [82158007:15791189816] -A PREROUTING -p udp -m udp --sport 53 -j CT --n=
otrack
> > [160638557:7854716900] -A PREROUTING -p tcp -m tcp --dport 53 -j CT --n=
otrack
> > [55174:13694242] -A PREROUTING -p tcp -m tcp --sport 53 -j CT --notrack
> > [82898530:7187312985] -A OUTPUT -p udp -m udp --dport 53 -j CT --notrac=
k
> > [310815684:92319143568] -A OUTPUT -p udp -m udp --sport 53 -j CT --notr=
ack
> > [81356:4991618] -A OUTPUT -p tcp -m tcp --dport 53 -j CT --notrack
> > [134221259:13321766219] -A OUTPUT -p tcp -m tcp --sport 53 -j CT --notr=
ack
> > COMMIT
>
> Is this an ipv4 only system?

Nope. Dual-homed. Thanks for the reminder. I've added the
corresponding "notrack" rules to the v6 side.

Thanks again for the help!

-m
