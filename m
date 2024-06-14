Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3866D26AD7
	for <netfilter@vger.kernel.org>; Fri, 14 Jun 2024 19:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718393622; cv=none; b=c5wmCPqVoxk5gMmYaZ4YgXgDR/rUesxUWWVqGcjA8EunmeE+CsOrvcrB1reCsbzQVw5ilt1w07PyTHo3fviaz+7m585Gc7+om7f2A1EsYMcIENuEzLomZxeVkZZxTETaO8U3h4fdAOQi8e9h4U5bW4CX5/eHnGGfJnv00l4mCrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718393622; c=relaxed/simple;
	bh=n8KSIdhG5UfsFiz8iec6PY2wyPV+mf64BoFykqHcZ9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=ulAwYqOuzZ5+le//gwdt0f/srcW23Er6FWRSckF8aI631jYpw0xIYxfb/3MWtsPRc9oeQc0ba+xLxHHM06j0EmmBdVy7pgF9GhbJRx37r6gGqgcgEVu7PEL3GJJKcdJ/Y4uREpQohjxh3RTsghAYHgmJvwo5ZUvlSj/Dt+nbcKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kraszewscy.net; spf=pass smtp.mailfrom=kraszewscy.net; dkim=pass (1024-bit key) header.d=kraszewscy.net header.i=@kraszewscy.net header.b=eyV8Ulrf; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kraszewscy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kraszewscy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kraszewscy.net header.i=@kraszewscy.net header.b="eyV8Ulrf"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a68b41ef3f6so293785666b.1
        for <netfilter@vger.kernel.org>; Fri, 14 Jun 2024 12:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kraszewscy.net; s=google; t=1718393618; x=1718998418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8KSIdhG5UfsFiz8iec6PY2wyPV+mf64BoFykqHcZ9s=;
        b=eyV8UlrffVHHCXwP8h3o8zVBF8GzI4F2EbgvRC7xlxxNjUFFyM5tm67HrDH0sIc+lA
         39STcUPjZ6eT8iVO9Ukamvxw+MzP6sLHUBLvR28bHamumDe/dN0t2IMQi0h4cGRRzqjI
         TNOXYDypXiVx3o2pi7dDraRLJUNLLbWLf8QN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718393618; x=1718998418;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8KSIdhG5UfsFiz8iec6PY2wyPV+mf64BoFykqHcZ9s=;
        b=RXjjaARm4QJZ5zZX21mP8lkNbtxusy1ciKZcBLYCq9ogG//7kSRuMjcIKmNdbOXU71
         mBRi9Kwj3+KovdlLd2RP0HmAht7+oNjUNmw2aaBnXkcpmBCSBTn7HIhONE7qtBMW/rY8
         X3FR/nOzT2Po67V4R5VJfGyIEgZ8KO9sth9Vrz9nBoIDyt/m/WGDcIO0ni1IyiwYSYpk
         Pbtl678yrVdUpFM9qixbxCcZZLCfEB+8Ml2QMcuRAPobhdorubqcblmcIbibSPDGZKxe
         f/k0N4RpgPJ4zdhWACKBGrNoIy+7QAdAHy3Yz14YSrbUqJlz8HWsPXdTqsj1g+kZL2+V
         x3CQ==
X-Gm-Message-State: AOJu0YzrlNYTfTPR55W7dzx6gH4A0T3dM9xPTwG+XtGGSBxM2bmfNZ2k
	idCFG+QPiE2yCXat/G7XlTHDbLrUOVZQpjDpKSJfgTvpM59D2//TmAhv4f4MoliJNcchYEeLTXU
	9O+whGjRmZmJmOJ+MKju/l2rLMUPAP+gpsyuGSc8ahBXzlQ==
X-Google-Smtp-Source: AGHT+IGpJuUFgnV5lAaAPtDDoX6k7w+pvbQpXf4+CatZzuK+lrDEe9OhjyycDqbdhfzzFuBmTV9Gnw+74gKZO5/mynI=
X-Received: by 2002:a17:906:c2d0:b0:a6e:b5ef:f731 with SMTP id
 a640c23a62f3a-a6f60de1d08mr197980866b.64.1718393617878; Fri, 14 Jun 2024
 12:33:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALnT2Lj0eo5FTgAiJB-napcNuZt4fhXAeMF35=4k408hpuBC6A@mail.gmail.com>
 <ZmxhNfpflittbRVc@calendula>
In-Reply-To: <ZmxhNfpflittbRVc@calendula>
From: Pawel Kraszewski <pawel@kraszewscy.net>
Date: Fri, 14 Jun 2024 21:33:01 +0200
Message-ID: <CALnT2LgRWDh=RfFucdXRT5nmFeBgFtJxz0WcxbJ22jhg52UBeQ@mail.gmail.com>
Subject: Re: Writing own match module for modern ebtables.
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For starters - verify that ether-type is XXX, lowest bit of byte 0 of
payload is 0 and second byte is YY. I managed to do that with raw
matches, along with "set" to rewrite the destination MAC address. I
assume that putting that in bridge/nat/prerouting chain will do the
trick and the bridge will forward the packet to the new destination.
--=20
 Pawe=C5=82 Kraszewski


pt., 14 cze 2024 o 17:26 Pablo Neira Ayuso <pablo@netfilter.org> napisa=C5=
=82(a):
>
> On Fri, Jun 14, 2024 at 09:01:22AM +0200, Pawel Kraszewski wrote:
> > Hello!
> >
> > I'm trying to write a simple match module for ebtables. Nothing fancy,
> > just check ethertype and first 2 bytes of payload. I need to make
> > ebtables' dnat, based on a custom in-packet tag:
> >
> > > ebtables -t nat -A PREROUTING -i eth0 --MYMATCH-tag 10 -j dnat --to-d=
estination SO:ME:MA:CA:DD:RS
> >
> > Kernel module ebt_MYMATCH.ko is almost ready (it just accepts
> > everything now, just a PoC for now), based mostly on ebt_vlan.
> >
> > What I am absolutely stuck on is xtables/libebt_MYMATCH.so library. I
> > mean, it is written, compiled properly, and objdump reports the same
> > structure as existing ones (say, libebt_vlan.so). The only slight
> > problem is that ebtables doesn't detect or recognize it.
> >
> > When running the above ebtables example under strace, it does iterate
> > over "standard" libebt_* libraries (with newfstatat() and openat() )
> > but doesn't even try to touch mine with a long stick. It doesn't even
> > check if it is there.
> >
> > When I do a match with existing libebt_* (say vlan), it still does
> > iterate over all standard libraries (for iteration's sake) and then
> > (apparently, there's no dload() or sth) just ignores libebt_vlan.so
> > and pulls NFT gun.
> >
> > That's Arch system:
> > * ebtables 1.8.10 (nf_tables)
> > * iptables v1.8.10 (tried both legacy and nf_tables, no change in behav=
iour)
> > * kernel 6.9.3-hardened1-1-hardened
> >
> > I even tried with manually compiled ebtables v2.0.11 (legacy), which
> > is, um, dated 2011.
> >
> > What are my options now? Any guides on writing both nft kernel modules
> > and matching userspace libraries?
> > Or just forget all that and use raw @base,offset,length matches?
>
> That is an option, if you provide more info what --MYMATCH-tag 10 does.
