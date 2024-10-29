Received: from mta-p7.oit.umn.edu (mta-p7.oit.umn.edu [134.84.196.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07CC197A7E
	for <netfilter@vger.kernel.org>; Tue, 29 Oct 2024 15:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.84.196.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730217493; cv=none; b=OyDqAILHslguvau+RUTckxeqDGOAxNNmMjPennaQKNHFNvtcvi+aXZeGxDaO715qfxAl+PrnfwIfkLpcGCCIuvrVmT83bFE919tgcGxyC+HXK9I4O7PQIsIqG9RhVY3MCt4Yct+nofgHm/Wrm4uyetHKP4RvQ+E3V4+ppMURDmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730217493; c=relaxed/simple;
	bh=Rj8+GVhXIEGYaFP2d5EcpyeijaD3Nkk8UCQGfeHCDKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mUiCdu/eb7rRPZyysT3FdTJF+t9+RbLLOR9jiHxfUbHP6Dok8L+hN2/gaGE4GRneKsOxyAwGpt4irYnZ7mwjLh2UP7FzMYc2LccAxHpmCJcYW5zigg37xxR4yBsNMcpulG7A98sFQcU11ll8tNZNFrtB6KPvjIdT/tebzAy8BOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d.umn.edu; spf=pass smtp.mailfrom=d.umn.edu; dkim=pass (2048-bit key) header.d=d.umn.edu header.i=@d.umn.edu header.b=BzPEzdrk; arc=none smtp.client-ip=134.84.196.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d.umn.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d.umn.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d.umn.edu header.i=@d.umn.edu header.b="BzPEzdrk"
Received: from localhost (unknown [127.0.0.1])
	by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4XdFK81fKfz9vYdL
	for <netfilter@vger.kernel.org>; Tue, 29 Oct 2024 15:58:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjE2HWlfv7UK for <netfilter@vger.kernel.org>;
 Tue, 29 Oct 2024 10:58:04 -0500 (CDT)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4XdFK75zfhz9vYdB
	for <netfilter@vger.kernel.org>; Tue, 29 Oct 2024 10:58:03 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4XdFK75zfhz9vYdB
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4XdFK75zfhz9vYdB
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9a1c2c963aso64034066b.2
        for <netfilter@vger.kernel.org>; Tue, 29 Oct 2024 08:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google; t=1730217482; x=1730822282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jT1x3WVWN5+wgmuWasbL+rZ3x5/0r9WPPtah01fMWGk=;
        b=BzPEzdrkayVR9M0mFJ+cZI3X+TIVH0G9wkNAxAND//BkC2KkSePGs6yLv5LD8RJNxu
         BI97j16HnuPpBZ1rU+LP52nXKfM0vgq8GNu31fZnvhODnG4jOjWWB4WoiEz2Y/cmFmsK
         5hIksC9uNZPQREj/WeQIaEbCtOayGSicmlnQQdgNZ40Bt56H2Nb4hah7NdslkXkv4XAq
         3x3B6DkcxI/V3rGSpeA6OwaGTgOO0RgFsvlRtmBm7xC89IpUB/VvbjjkDfr6wX28+wMg
         4Et/iWqHv6pp2w3EsvykprYhyoGzPn3MhPPOMLKoTg9E2FFu7oc2n5+RaobvV5oz3m39
         Pb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730217482; x=1730822282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jT1x3WVWN5+wgmuWasbL+rZ3x5/0r9WPPtah01fMWGk=;
        b=fT4niB/QRVR1XqIXbKdWH4dfaQt3yKXdbsHb+d483C14956M/sn7yDE1iSFUSqhGgU
         u65rVuAxPshlQCCWyHzidQVqE8AX9r3oYrpo5IPN1ICO30I1zScRubiRQe/h5FR9FwRT
         tqyug4N5KV5a9fnh8NZZIN0ywoPtPdtouyh3Ygs55M+dKjS3PE9rkazMZq78aiNU99xN
         EpPr/o0Ew5Ia7YtCy02BhB72PE6aDKspD4GKuLoAL7tSLWLcSs8NgoXWFxbEsoBjdvLM
         CE4MgOtKZSRKPwUndcI6cRBdeZORJEPfqPWsQgDHYfZqWNYlhMiO8XGOm6yafhsLhV5x
         lGHw==
X-Gm-Message-State: AOJu0Yyd8MUqoLo+2IKlj7FahlgNtEI+8essL75M+L+GdK0ntj9Zo/+2
	MO6hpvbltnzOKJ3cpPJTYwGS2Pzy0PoxQz6dYBm2BH392XISIwWbKjtgEiREADRFKOmTcgWP1LF
	HinzEVCnolAC+vB8VR3AkyGuHSoFjGatDO0teve7h8mHwEcS7YfAtQanCf5Lm+7MWxIIRavtz+f
	VBa2WLDuIIppBBd4pdoedMiJlXTuupzUwnDSD49YOAqjrwWg==
X-Received: by 2002:a17:907:7f0e:b0:a9a:147d:fec2 with SMTP id a640c23a62f3a-a9de5f04397mr437645566b.6.1730217482224;
        Tue, 29 Oct 2024 08:58:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6bEZMLonmBR8tb0KtvcFAirx+TjROrYK6cnfuE8/POyo6x80MyadFxir4C2Pz8YKBsnFz/j25iMEeLnQsObM=
X-Received: by 2002:a17:907:7f0e:b0:a9a:147d:fec2 with SMTP id
 a640c23a62f3a-a9de5f04397mr437645166b.6.1730217481832; Tue, 29 Oct 2024
 08:58:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOLfK3VUyrxBzd4sfk9Fhb8RnmQ8TAbszh0j2TD1a24WE-h74g@mail.gmail.com>
 <771EECBD-1B8C-46F9-8429-B1118380F7A2@slavino.sk>
In-Reply-To: <771EECBD-1B8C-46F9-8429-B1118380F7A2@slavino.sk>
From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Date: Tue, 29 Oct 2024 10:57:50 -0500
Message-ID: <CAOLfK3WiKNW4iHARxRm=Kr20USL-k8ctrHEx1GJ5EMWNf1320w@mail.gmail.com>
Subject: Re: connection tracking and kernel dropping packets
To: Slavko <linux@slavino.sk>
Cc: netfilter <netfilter@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Slavko,

On Tue, Oct 29, 2024 at 10:48=E2=80=AFAM Slavko <linux@slavino.sk> wrote:
>
> D=C5=88a 29. okt=C3=B3bra 2024 15:11:34 UTC pou=C5=BE=C3=ADvate=C4=BE Mat=
t Zagrabelny <mzagrabe@d.umn.edu> nap=C3=ADsal:
>
> >...but it is still dropping packets due to the CT.
>
> You have first to inspect what is filling your conntrack table:
>
>     conntrack -L

Ah.. Thanks for that hint!

>
> Then you have to decide, if you have to add more notrack rules, or
> you are under eg. SYN flood or so... IMO you forget that DNS can
> use TCP too (not mentioned in that article"s rules).

Agreed. I added the TCP no track after sending the initial email.


> Do not forget, that "lo" traffic can create (a lot of) conntrack entries
> too.

Sure. I'll look at the conntrack output.

> >I'm running Linux 3.2.0-4-amd64
>
> IMO quite old, AFAIK modern kernels can do better with SYN floods
> (via better SYN cookies approach), if that is source of your problems.

Agreed. It's on the docket to upgrade.

Thanks for the helpful reply.

Cheers!

-m
