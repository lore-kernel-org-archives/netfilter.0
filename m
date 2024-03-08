Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A4D4F5F9
	for <netfilter@vger.kernel.org>; Fri,  8 Mar 2024 10:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709893196; cv=none; b=BePX1BalkIIR1kTH1GeQLsRRL/sYCMPrVOzg9os0nYR5OQUaMYEhiTbijh6zh6oICknU3ZglRtB86TBtuuUi6RiXadQ64Uif/c6FJWsY7IEUj4DHIsjbhw4DbrQ/9UO+6rRfG2y3dMas8riQlD9Qbq0CyY4nSu2Zf8IWBHLtDCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709893196; c=relaxed/simple;
	bh=HkCeLusMMnDGBBFq8SBMt3+apAfh3TdKYFCT9HQKqW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ny9sA9VExTvE0dWhKVc6Or7iPNHBBwu9PHqRg+Toj5xmazNemSJ4hklMWz1nq4+CU6jQpLiTYUIqYXimM1NTegLUPsaBUM4EKygMQxJL8OPJtvCc3WY2IUHVFHFpyPD44Dq8ia63hz1glUODenLPA3Yb/oVMeevo0WZFzzcdbiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcQc/+OY; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcQc/+OY"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-566e869f631so2344751a12.0
        for <netfilter@vger.kernel.org>; Fri, 08 Mar 2024 02:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709893193; x=1710497993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emwlZwo0PJyRXWI2QhiYj3IeWd49vs8ln4e9go5mF24=;
        b=DcQc/+OYwwzDeWDZlw/IsUhgoM5hIt7dxfJQQ36ayOKPbbTeG650jcZCx65/conHa5
         9NdwJkhbgalUmY/fXUGCo1XYC2JRxtPtbhaunhAVjkaLbbaxuEY/rixblVDX7pOZ3FAk
         c++1xin+bryVvEXCMxiCn+hUg/wbviSfEYFfkKSW0crAirg2GPfKDXD1gxrEPf+YBcZ4
         qho1hdX/QBSp0JlEI9CA9MOvVjZaq4XvD1ux8+VcH2aIRYi6fr2FoPFsQjl/PlfIz4TY
         sEGH77J4LBzQPFIhGpip9bM7DrMHKHzxomtE/L4BSg1PmcVhGOHUvK1DxOOYmVcwydIx
         Sykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709893193; x=1710497993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emwlZwo0PJyRXWI2QhiYj3IeWd49vs8ln4e9go5mF24=;
        b=ld3TxiMiR6/3ItAsmxEjZMXfzgPKiZCrhNHbG53wFjfCzLgNqG1Xp8yrNfeOSe0Jag
         B5360ODhZRl95ECUZhaeyQZPrWNuT24I1Prrgzd7iTvWZTtQYP2B2ArqDHWDdbQMkW15
         R9tuTn0HVT2cCQvuY1HB1iqaJXYoUXOYlh3489NNqrujyHNheZmRTRIMqDDMzUWQrRbl
         dPaHczVjAObPYumYRmAF/b9JS+xavMyZcD63u3Flj0jjbXoEQNfavjR+7b8bAFuqE6YF
         ftc19jPLmkczdV5NLD+SjXU382AGO/nD0e3BTCasEUtVALXiJRxeB07NlS13txef9xgG
         fArQ==
X-Gm-Message-State: AOJu0YyCUMu4RQ218Zjsu6FyN0MwIuwT8mL6cfpJXycZA8AbjAnhicWJ
	52u9G22+Cz7roYjrbshEExIwRTHamH6llJeMxkc9ZSQI2nFSMztVTVTN6hKopIQtPd5wJaq6giR
	tKNT6rp3kHkky9gcmrZGl/RSSWYg=
X-Google-Smtp-Source: AGHT+IHZY0SF2Lwxrlg0VCTItH38KAjQ/Ob4vXRqIWmqZObXnFQlMhln3fFefzX04Rbqxu4+tXj/Abzaud/8Ko5pXmg=
X-Received: by 2002:a50:9f61:0:b0:566:117c:cfca with SMTP id
 b88-20020a509f61000000b00566117ccfcamr1673563edf.4.1709893192983; Fri, 08 Mar
 2024 02:19:52 -0800 (PST)
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
 <571e7293-771e-4ac8-bd0a-621f8db4a102@app.fastmail.com> <CANvpR2BxFSxecbA5LsRis6WsC+4Cxru6M4vX0fxKYwZt-Xb0zw@mail.gmail.com>
 <cd20799d-91fa-4f5d-ad04-04eba4c9f28b@app.fastmail.com>
In-Reply-To: <cd20799d-91fa-4f5d-ad04-04eba4c9f28b@app.fastmail.com>
From: Sreedhar M <sreemtech@gmail.com>
Date: Fri, 8 Mar 2024 10:19:16 +0000
Message-ID: <CANvpR2CLZcSOUXhRxn9g_9kH79HA7T2=AXF5s0LY8tEqxQ-pLg@mail.gmail.com>
Subject: Re: nftables rate limiting per multiple seconds
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great Kerin. Thank you so much for the support.

With the below rules specially using 'add' and all my uses cases are workin=
g.
nft add set ip filter myrate  { type ipv4_addr . inet_service; flags
timeout ; flags dynamic; timeout 10s; }
nft add rule ip filter INPUT tcp dport 7880 ct state new add @myrate {
ip saddr . th dport  limit rate over 1/day burst 15 packets } counter
drop

Thank you once again for your help

Best Regards
Sreedhar

On Fri, Mar 8, 2024 at 9:56=E2=80=AFAM Kerin Millar <kfm@plushkava.net> wro=
te:
>
> On Fri, 8 Mar 2024, at 9:12 AM, Sreedhar M wrote:
> > Hi Kerin,
> > Thanks for the mail.
> >
> > I did the flush and clean-up in all my tests.
> >
> > The main problem is with one of the below use case only other use cases=
 works:
> > problem Use case : Say clients sends new connection request every 1
> > second , in this case the new connections must continue to be accepted
> >  even after 15 new connections in 15 seconds because in this use case
> > we are sending only one per second. this what expected, this use case
> > is not working when we use "update" rule. This use case works only
> > when we use "add" in the rule.
>
> Indeed. That is because "add" does not cause the value of the timer to be=
 reset to 10 seconds each time the rule is matched, potentially allowing fo=
r elements to persist for a long time after begin added (along with their t=
oken bucket states).
>
> Consider the rule that you originally wanted translated:
>
> iptables-translate  -A rms0  -p tcp --dport 8000 -m state --state NEW
> -m recent --update --seconds 10 --hitcount 15 -j DROP
>
> There you specifed --update, which does have the effect of resetting the =
value of the timer. So it was that I proposed to use "update" in nftables, =
to precisely match its behaviour.
>
> >
> > Add: The above use case works , when we use "add" in the rule
> >  nft add set ip filter myrate  "{ type ipv4_addr . inet_service; flags
> > timeout ; flags dynamic; timeout 10s; }"
> >  nft add rule ip filter INPUT tcp dport 7880 ct state new add @myrate
> > { ip saddr . th dport  limit rate over 1/day burst 15 packets }
> > counter drop
> >
> > Update : The above use case won't work , when we use "update" in the ru=
le.
> >  nft add set ip filter myrate  "{ type ipv4_addr . inet_service; flags
> > timeout ; flags dynamic; timeout 10s; }"
> >  nft add rule ip filter INPUT tcp dport 7880 ct state new update
> > @myrate { ip saddr . th dport  limit rate over 1/day burst 15 packets
> > } counter drop
> >
> > Use cases that works :
> > when we send 15 packets in 1 second, we wait for 10 seconds and the
> > next will be accepted at 11th second, this perfectly works with
> > update.
>
> Yes.
>
> >
> > Use cases that do not work :
> > Assume we are going to 1 packet every 1 second for an hour , we should
> > continuously accept all the new connections as we are sending only one
> > per second this is not working when use "update" in the rule , but
> > works when use "add" in the rule.
>
> I see. You never wanted the behaviour of --update to begin with, despite =
implying otherwise.
>
> >
> > Fyi, I have tested by adding this also - "tcp flags syn";
> >
> > Please advise me shall I use "add" in all the cases , so it satisfy
> > all the above uses cases.?
>
> Yes. The effect will be that any element added to the set will be evicted=
 after 10 seconds has elapsed, no matter how many more times the rule is ma=
tched during the intervening period.
>
> --
> Kerin Millar



--=20
Best Regards
Sreedhar
