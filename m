Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D68249EB
	for <netfilter@vger.kernel.org>; Fri,  8 Mar 2024 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709889213; cv=none; b=NIGPrp9MpQauxp1ZIuYm4UsGHoVeT7oSl8W61FWUQpI0z2qCSZABwp+lYM7EcFe6AW3j5ppQxJR/MSG+X1Dw3nKFHhz2TjSJyyMZqenjgliAMdcVZD+tMe2Ga8BgkAl6OA+afCtw0Al+yxW1F/BrM/poOf5Iq9d4FzNcDp5O+vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709889213; c=relaxed/simple;
	bh=kCqXU64Pqb3FQ5BjAwbpwyJFvcSe45p3YQhZ622UN/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVxOR8bsz6vnAVCPgx11D1Z0YKgvusyE88QWvujxtIhk674w+xM+8PwBpqqiFvfWKYRU0YnvrkItFMdXcinN9SIuWXOSddLDJOYDJxT81qp+W7ib8Jjx7L13lhoLEgbpZWXS3uxNbPuAv0N/MiXviEEMA/nBhFnvovK2fXaoFhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9APH+ls; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9APH+ls"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5649c25369aso708221a12.2
        for <netfilter@vger.kernel.org>; Fri, 08 Mar 2024 01:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709889209; x=1710494009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdhoDV3JMvU7YSLh3R8mu3Ktqp3VkzCYhP56rscumKg=;
        b=b9APH+lsfJFSOyoA/EYEz+6i3O3DejrgAMcGzOSUhl55Zmo/nKN9mLUYOlEhMTfhaU
         Ac3ex7K0ZIU2EON+/057i2O9JsnLQncxzNJvyexfd3CZenIpBE9MNEklDMiNRgu6Pc8E
         24+4Zg3HxmHH0h6P8dhvMgOSYM4exhQRThcQU18spYZPdq1A/DO4ZRu858scdNhsNsOC
         AjUdXKVFVJKPKymdsj41AvwD8N1bDyWl1EY7iiiVlDxkaKEbsmlmvzSjwtwuMlKX9alo
         uhuTNfyyJEGhxqqwbNicbWvl3b6zWnpPA7MZirQjW43x1nIsrlNG9wyZXpDnJ1eM8WVd
         zNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709889209; x=1710494009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdhoDV3JMvU7YSLh3R8mu3Ktqp3VkzCYhP56rscumKg=;
        b=iTSEtJNYrMzfj6hIqestmW+6NuJ2zhJlbaSnLHlry8/ZkZQtsjdvc4SwoxXtMe63K3
         hAb64X1GUFchMDOTeisBjbrL6hzmphkCmFqdMXax2xr/V2OC5sDxItgJTxL0Rv9NFK5u
         j+Va1yqL0De7YvmosGCe8YPdMTGvO+rXykyZ82JR2kjlUJ15X7ckCpt+GKGhGu/du3eJ
         k9dwONpqrT/Q381Yh4ih9EqxhMDKPFPmk42RMFspth/jD0kHTGKmeFhmDRNt3kzk1HpV
         vhHJ4/hyJHCxGTQWVe9n7gd+D0T7AAO5gbUFk/L3olqn8ENewTDOfhZwu32DfZwdcQLi
         SZgQ==
X-Gm-Message-State: AOJu0YzZFvXED83rHxI8a06eiXB3HCq6YRSsmvFGodzaivmkxHu3mUhP
	W245iXJDfm29ieSN3p8sp886utjp/8fdJw/hD8RhAFfx0csQdTJC+gRbIxucX6yqX0DQYmrLstc
	CmYT61AbIdmVCA21ruyxlH29+vA8=
X-Google-Smtp-Source: AGHT+IEht1MWUx9xu62j/+tO6RzimuJtT4DcZir1D6/stRz7AOQHo+6j2DV97xo1A03TjJaNpKWa8yJl1BSnI37/+KQ=
X-Received: by 2002:a50:a695:0:b0:567:38db:8076 with SMTP id
 e21-20020a50a695000000b0056738db8076mr1575640edc.21.1709889209308; Fri, 08
 Mar 2024 01:13:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANvpR2BQ6--KT+aqTNXKO59VOVR9Bq_=JmXEaAL31ra1u_DZaA@mail.gmail.com>
 <20240306223923.a908a0e0cbfce4a77556ed34@plushkava.net> <CANvpR2CH-xmJ05dEou7h1PeBm498qwD0YfiDh_8u_2eQeQKL2g@mail.gmail.com>
 <c684a0b5-9e36-4d90-aa1e-af4dc99503fc@app.fastmail.com> <CANvpR2B4NtYKUyEo29SbVNdGoKrRxBgzCVPhNdfmxgviZeZKrQ@mail.gmail.com>
 <eb68b164-03ed-49e3-9fea-74768d3ded1b@app.fastmail.com> <CANvpR2BE=hjMrEMsnd5P5SgZRyu0LAD2hXt5t5UQHOcYSLeCjA@mail.gmail.com>
 <571e7293-771e-4ac8-bd0a-621f8db4a102@app.fastmail.com>
In-Reply-To: <571e7293-771e-4ac8-bd0a-621f8db4a102@app.fastmail.com>
From: Sreedhar M <sreemtech@gmail.com>
Date: Fri, 8 Mar 2024 09:12:52 +0000
Message-ID: <CANvpR2BxFSxecbA5LsRis6WsC+4Cxru6M4vX0fxKYwZt-Xb0zw@mail.gmail.com>
Subject: Re: nftables rate limiting per multiple seconds
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kerin,
Thanks for the mail.

I did the flush and clean-up in all my tests.

The main problem is with one of the below use case only other use cases wor=
ks:
problem Use case : Say clients sends new connection request every 1
second , in this case the new connections must continue to be accepted
 even after 15 new connections in 15 seconds because in this use case
we are sending only one per second. this what expected, this use case
is not working when we use "update" rule. This use case works only
when we use "add" in the rule.

Add: The above use case works , when we use "add" in the rule
 nft add set ip filter myrate  "{ type ipv4_addr . inet_service; flags
timeout ; flags dynamic; timeout 10s; }"
 nft add rule ip filter INPUT tcp dport 7880 ct state new add @myrate
{ ip saddr . th dport  limit rate over 1/day burst 15 packets }
counter drop

Update : The above use case won't work , when we use "update" in the rule.
 nft add set ip filter myrate  "{ type ipv4_addr . inet_service; flags
timeout ; flags dynamic; timeout 10s; }"
 nft add rule ip filter INPUT tcp dport 7880 ct state new update
@myrate { ip saddr . th dport  limit rate over 1/day burst 15 packets
} counter drop

Use cases that works :
when we send 15 packets in 1 second, we wait for 10 seconds and the
next will be accepted at 11th second, this perfectly works with
update.

Use cases that do not work :
Assume we are going to 1 packet every 1 second for an hour , we should
continuously accept all the new connections as we are sending only one
per second this is not working when use "update" in the rule , but
works when use "add" in the rule.

Fyi, I have tested by adding this also - "tcp flags syn";

Please advise me shall I use "add" in all the cases , so it satisfy
all the above uses cases.?

Thanks
Sreedhar

On Fri, Mar 8, 2024 at 8:08=E2=80=AFAM Kerin Millar <kfm@plushkava.net> wro=
te:
>
> On Fri, 8 Mar 2024, at 7:26 AM, Sreedhar M wrote:
> > Hi Kerin,
> > Thanks again .
> >
> > I have changed it for two reasons , because of the errors
> > nft add set ip filter myrate  "{ type ipv4_addr . inet_service; flags
> > timeout ; }"
> > nft add rule ip filter INPUT tcp dport 8000 ct state new update
> > @myrate { ip saddr . th dport timeout 10s  limit rate over 1/day burst
> > 15 packets } counter drop
> > Error: Could not process rule: Invalid argument
>
> Hmm. I would have to go over the release notes to be sure, but it may be =
that that it has not always been possible to incorporate a timeout as part =
of the rule. Should that be the case, defining the timeout as part of the s=
et declaration - as you did - is acceptable.
>
> > add rule ip filter INPUT tcp dport 8000 ct state new update @myrate {
> > ip saddr . th dport timeout 10s limit rate over 1/day burst 15 packets
> > } counter drop
> >
> > After the above error I have changed it to below , In one use case -
> > the below never resets , Say If I send only one message per second all
> > the time , the below rule will stop at 10th second and the next
> > message will be accepted only after 10 seconds. This is not correct
> > when we are sending one 1 message per second it has to accept it ,
> > because we are not sending all the 15 messages in one second.
>
> This should definitely not be the case. The bucket will have a capacity o=
f 15 tokens and they must all be consumed before the drop verdict can be re=
ached (the 16th attempt will be denied). Please review your testing methodo=
logy carefully and be sure to flush the set before you begin your testing p=
rocedure:
>
> nft flush set ip filter ratelimit
>
> Incidentally, it is worth worth noting that the "new" ctstate can be sati=
sfied under conditions pertaining to all three of the following things:
>
> - the content of the packet being considered
> - the entries that already exist in the kernel's conntrack table
> - the state of the kernel's "nf_conntrack_tcp_loose" sysctl
>
> I consider it highly unlikely that those considerations would have affect=
ed your testing. Nevertheless, in the interest of certainty, you may find i=
t useful to include "tcp flags syn" as a condition of your rule while you a=
re testing.
>
> --
> Kerin Millar



--=20
Best Regards
Sreedhar
