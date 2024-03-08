Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7917D2E3E4
	for <netfilter@vger.kernel.org>; Fri,  8 Mar 2024 07:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709882834; cv=none; b=MoedQhE7nbn1BH6VVKQk2LT/SC0/Jchy+VpElPhrZc5rKPTiaxeoFMWPPfuzaDk7PJ764H/GwJh746OwVkYPMFELkysd/ktzx5ARzDGKLA8yulxjS6rQfhVuVfCWTxTDJnaEyg88cuQwA2TwbriS8GvIQbZGvEu5f92Mg9m9gck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709882834; c=relaxed/simple;
	bh=VLbJtTGaaoAR3w7WvIlZPMhA8TFv/2snNqySq4ZSHrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQzELQuFChA7Aoef57VQb28myZcA4gB9Wpka1ZZ9ALCKRQWJ+B8jzCmeL0fq0/SAcPVfW0gsdsP+u4p3QW6qP07+rpPKzKq8Aefs+Y0CYpf+d+Y37ruvI7jjS8Q3RRsFTmhJbONzxdk7769QxQJvUvaFPhch2RgaZ7h5W0X3N6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXdI6n/n; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXdI6n/n"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-563d56ee65cso558695a12.2
        for <netfilter@vger.kernel.org>; Thu, 07 Mar 2024 23:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709882831; x=1710487631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ia4vBVRjGq8PSsCdQR168pa8x8HlqnLISmqAtyUqvE0=;
        b=BXdI6n/nH7VD4/hm65+0MReL4EdUw9hHlAK9YE1JkpCbhDQEFqm9cfqAYeCDK0cey7
         SKwLKlQ0m3xQTb3NPikeAtM+hyT2NaKJi4ymAimIcIFz4jNYKR/BA9sKbmCVfYAO6vqL
         /N9PeTx/xCM5h+jWEkl7DWgeWVE68kP5lzUke8tXJFElQdcLcYx4nPq8wRXeAtCrBgqE
         nhyxFJ3cMkzLN4YKHNMhHOKyA4Nassu8mnlN44fS1qPW9WW7gytVrFhOuUc3F1VV0dd4
         4rlGdDWOo7KamWodZ8ygRHp8SuDDKYtSegpiRJDKgrTEX/HbSVHFJpx7rdOvdvMsUGpw
         mVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709882831; x=1710487631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ia4vBVRjGq8PSsCdQR168pa8x8HlqnLISmqAtyUqvE0=;
        b=DJDocw52su5oikfE0S0RerLJFr8LwaO/YKP38oS59kWEASn8BIGaWkB6V4u7mqOJTu
         h5rOIxyuWNGM1OCn8BEM1wj1SMyEqgbc9YdXP3SfJbLF9mNWsjMLdaG7ZJ1fuilvVhJE
         7rf+LG3YzgFIrhs7JZJAvSDM2xYudRp3y/DKP5Dns1ijcnwnQPNF1DQ93FJbUETl09Pk
         /dAIU8mLXI9+wIyAVT3zib8MKY2D/t2oWycENvx4NO24GO7IudbH/htgvH22jmWcLozQ
         mJBdx9t32Gzh2jccefbWeplUul9cFs3/rInVs1z2TbZXWd+QwbcYDTGeO3yrpz9spGDT
         1d9Q==
X-Gm-Message-State: AOJu0Yyplh+wf5Qyeh9HR6Uhk957ooksmqD9/v8n1SIm4SyZ0EDi/hgL
	T5R3+Tmnz6MsYKiGO7xZwdea99NjVLJM2p10DK3ZzKyqgGlvm3cULTlEliQCIPrj1gycFgkUYSA
	luIGhW6HtDa/SdJL9YNZhIqg3szo=
X-Google-Smtp-Source: AGHT+IHDsEZ8Wo/DbFYL27fPenMWQhPqEKe7B/ivOx20PqNM5YvJ1gYM/GWDpggmCVqOp4MtBWXUgZs/DNWKuWQSLVM=
X-Received: by 2002:a05:6402:2157:b0:565:de91:5c7e with SMTP id
 bq23-20020a056402215700b00565de915c7emr1084086edb.27.1709882830555; Thu, 07
 Mar 2024 23:27:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANvpR2BQ6--KT+aqTNXKO59VOVR9Bq_=JmXEaAL31ra1u_DZaA@mail.gmail.com>
 <20240306223923.a908a0e0cbfce4a77556ed34@plushkava.net> <CANvpR2CH-xmJ05dEou7h1PeBm498qwD0YfiDh_8u_2eQeQKL2g@mail.gmail.com>
 <c684a0b5-9e36-4d90-aa1e-af4dc99503fc@app.fastmail.com> <CANvpR2B4NtYKUyEo29SbVNdGoKrRxBgzCVPhNdfmxgviZeZKrQ@mail.gmail.com>
 <eb68b164-03ed-49e3-9fea-74768d3ded1b@app.fastmail.com>
In-Reply-To: <eb68b164-03ed-49e3-9fea-74768d3ded1b@app.fastmail.com>
From: Sreedhar M <sreemtech@gmail.com>
Date: Fri, 8 Mar 2024 07:26:34 +0000
Message-ID: <CANvpR2BE=hjMrEMsnd5P5SgZRyu0LAD2hXt5t5UQHOcYSLeCjA@mail.gmail.com>
Subject: Re: nftables rate limiting per multiple seconds
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kerin,
Thanks again .

I have changed it for two reasons , because of the errors
nft add set ip filter myrate  "{ type ipv4_addr . inet_service; flags
timeout ; }"
nft add rule ip filter INPUT tcp dport 8000 ct state new update
@myrate { ip saddr . th dport timeout 10s  limit rate over 1/day burst
15 packets } counter drop
Error: Could not process rule: Invalid argument
add rule ip filter INPUT tcp dport 8000 ct state new update @myrate {
ip saddr . th dport timeout 10s limit rate over 1/day burst 15 packets
} counter drop

After the above error I have changed it to below , In one use case -
the below never resets , Say If I send only one message per second all
the time , the below rule will stop at 10th second and the next
message will be accepted only after 10 seconds. This is not correct
when we are sending one 1 message per second it has to accept it ,
because we are not sending all the 15 messages in one second.

table ip filter {
    set ratelimit {
         type ipv4_addr
         flags dynamic
         timeout 10s
    }
chain INPUT {
        type filter hook input priority filter; policy accept;
        tcp dport 8000 ct state new update @ratelimit { ip saddr limit
rate over 1/day burst 15 packets} drop
}

Thanks
Sreedhar


On Fri, Mar 8, 2024 at 2:04=E2=80=AFAM Kerin Millar <kfm@plushkava.net> wro=
te:
>
> On Thu, 7 Mar 2024, at 5:10 PM, Sreedhar M wrote:
> > Thanks Kerin for the Info.
> >
> > The workaround is not fulfilling . The use case for me is multiple
> > seconds combination.
> > I Wanted to keep new connections, at given every 10 seconds period I
> > don't won't to allow more than 15 connections
> >
> > Let me explain , as I Wanted to accept new connections, at given every
> > 10 seconds period I don't won't to allow more than 15 connections .
> >
> > With the below rule, ex: say on a src client  If I run 15 connections
> > in one second because of 15 packets burst the rule will accept, from
> > 2nd second onwards it accepts 1 each second until it reaches 10
>
> You have to set the interval long enough for the bucket refill rate to be=
 immaterial (1/day is the longest possible interval). The example had it as=
 1/hour; I do not know why you reduced it to 1/second.
>
> --
> Kerin Millar



--=20
Best Regards
Sreedhar
