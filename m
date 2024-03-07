Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A1712FF6A
	for <netfilter@vger.kernel.org>; Thu,  7 Mar 2024 17:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709831456; cv=none; b=FinvWPx+e7e5z2FhV9a/slX/T5d9Ry0VnXl/MH1a2WZ9GtOMESLUu46C2YUUJGzDG/cycWAjy6Jb9WbFbw6vquZhJ039rmBnRsX0WniehPUFv6PXMTN0REt5VSqr/N7YQg+E7Z26aK4M6/LF8hggj5z8ckYg/h7F+4nLi8QOsUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709831456; c=relaxed/simple;
	bh=Rqr8CX+V3hB8i92d3p2Xwev4uiTr+xRByBssc+tdt+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZTEMlLMSWLmKe6rAyfcdzv5WVjsyoLcYiCyI447akIHvHEoyNsaG0jzsdEcury+pwXck/kCkkAdOWB6ejf0u4mfK6x8FL+7kMA80rXg6o/j210ykobfL+wadqd/rKxUigmxRn4tt2SPhTniRlLkTVDViyoFny02MhGbOUYh2qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbJbiluV; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbJbiluV"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56715a6aa55so1130339a12.2
        for <netfilter@vger.kernel.org>; Thu, 07 Mar 2024 09:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709831453; x=1710436253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqj6y0AVGSc0uHYVq1og2W53l4CvRiSdTEeSl32EBQ8=;
        b=FbJbiluVBac1HSUNxvaXNbSMJqUwJsX5dhmDvdnGqVsJDFueanAz0iF8CLqWxt4fo9
         p+MIoCf3iB7elxsXW+pePiCqcENfabtsz3yMp4cr71zgiJvlJHFlyHvCkasPCkEKG2HK
         eP44Tai8n8mzzVG9TgxVo7dS40jiLcBtFJ9+80NJCTu4bnmHNRmB+MH7wTP98dXEO+Y7
         AIk2GtCiZnficwc3HNMHAXKMfh3UXmEZG9tNIha1Ds/x7gnGolDbeog9gusnayVX/JsX
         Fz/N7Zkjr9jFuFkz4Y6NsFFQVK4qobdXMBJRKGXBdglstV4tffcqOEdRXx1r+kGDlvPz
         7rkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709831453; x=1710436253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqj6y0AVGSc0uHYVq1og2W53l4CvRiSdTEeSl32EBQ8=;
        b=ilODYkHkoLn1yCZohE8LoYU+P6ZZE50DF6UuKyN0SPzSMhjGUWwLnjHKlRyx0ebN9f
         AtNPnxffkbymTM5GbZ9Df/ecwP+k/aMTbazzXaHYukQBnAKEXf0uNsYrCRDKIjgl4VN0
         b+hjajKlqP0/lHpB4qNZmC4ISGkVsemZtvK5qJm3qF+8HiH7LFY3fI3FAbbxJXfxH0eM
         117NxoBWOF0OQf/FRa/1gRMCjRhoAWuNR/JBNXY1i96z/uf2u0MB4pqBwTeWz4wtnZxu
         U8548GK6rJxdX5x5suqrKt70Sm2gK+qqJlE22aV+4sKs4Radht8SXVDSkOD6hAi4j/0L
         czBw==
X-Gm-Message-State: AOJu0YwzfZ+t/+0oC7ChBj+gx6N8kWjk8kPDGDpM6T/H26xlRb5nOi1e
	M63SB1FjrTk1VrLV0LkLkmfHluAi+hLOS98FXN2Pj9MeUCOrMRlPgCEjKOvwDJWdWuKiW3rs7fK
	dCoLLKxAM/yzcliiYT0OhvpBL7vU=
X-Google-Smtp-Source: AGHT+IEKKydA+3Em2z1dcwaA5tZ76BpyytqyD+Cx0rMJIeZ3wjHVl3tdMsFjTTS9lM2JKrEjbh7vHMq/j5TRw3ZoNJM=
X-Received: by 2002:a50:d69b:0:b0:566:d25e:b73c with SMTP id
 r27-20020a50d69b000000b00566d25eb73cmr294855edi.35.1709831453210; Thu, 07 Mar
 2024 09:10:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANvpR2BQ6--KT+aqTNXKO59VOVR9Bq_=JmXEaAL31ra1u_DZaA@mail.gmail.com>
 <20240306223923.a908a0e0cbfce4a77556ed34@plushkava.net> <CANvpR2CH-xmJ05dEou7h1PeBm498qwD0YfiDh_8u_2eQeQKL2g@mail.gmail.com>
 <c684a0b5-9e36-4d90-aa1e-af4dc99503fc@app.fastmail.com>
In-Reply-To: <c684a0b5-9e36-4d90-aa1e-af4dc99503fc@app.fastmail.com>
From: Sreedhar M <sreemtech@gmail.com>
Date: Thu, 7 Mar 2024 17:10:16 +0000
Message-ID: <CANvpR2B4NtYKUyEo29SbVNdGoKrRxBgzCVPhNdfmxgviZeZKrQ@mail.gmail.com>
Subject: Re: nftables rate limiting per multiple seconds
To: Kerin Millar <kfm@plushkava.net>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Kerin for the Info.

The workaround is not fulfilling . The use case for me is multiple
seconds combination.
I Wanted to keep new connections, at given every 10 seconds period I
don't won't to allow more than 15 connections

Let me explain , as I Wanted to accept new connections, at given every
10 seconds period I don't won't to allow more than 15 connections .

With the below rule, ex: say on a src client  If I run 15 connections
in one second because of 15 packets burst the rule will accept, from
2nd second onwards it accepts 1 each second until it reaches 10
seconds. basically the rule shouldn't accept any more until it reaches
10 seconds. this the problem with all two work around I said earlier.

The goal is at given every 10 seconds period I don't won't to allow
more than 15 connections. With burst say If accept 15 connections at
1st second, then the next connection shall be accepted only at 16th
second. This is where I am struck please.


table ip filter {
    set ratelimit {
         type ipv4_addr
         flags dynamic
         timeout 15s
    }

chain INPUT {
        type filter hook input priority filter; policy accept;
        tcp dport 8000 ct state new update @ratelimit { ip saddr limit
rate over 1/second burst 15 packets} drop
}

Thanks
Sreedhar

On Thu, Mar 7, 2024 at 12:30=E2=80=AFPM Kerin Millar <kfm@plushkava.net> wr=
ote:
>
> On Thu, 7 Mar 2024, at 10:08 AM, Sreedhar M wrote:
> > This is really inconvenient that we cant rate limit the packets for
> > multiple seconds , we have only the close enough but not 100% right in
> > edge cases.
> > "1/second burst 10 packets" should be close enough. The bucket will be
> > initialised with 10 tokens and refilled at a rate of 1 per second.
>
> I understand that it it is not precisely what you are asking for and am d=
efinitely not opposed to the idea of supporting more flexible intervals. At=
 the same time, I don't see what renders the suggested rule so very inconve=
nient. Should the bucket be drained through flooding, it will achieve the o=
verall aim of allowing for no more than 10 packets to pass over 10 seconds.
>
> Regardless, it is possible to implement more powerful rate limiting schem=
es through the use of dynamic sets, as should become clear momentarily.
>
> >
> > I really cant have an alternative for below please
> > iptables-translate  -A rms0  -p tcp --dport 8000 -m state --state NEW
> > -m recent --update --seconds 10 --hitcount 15 -j DROP
> > nft # -A rms0 -p tcp --dport 8000 -m state --state NEW -m recent
> > --update --seconds 10 --hitcount 15 -j DROP
>
> Since this is a different problem to the one that you initially described=
, it would be premature to infer that you can't have an alternative. Fortun=
ately, you can. Below is a small ruleset, demonstrating how it can be imple=
mented.
>
> table ip filter {
>     set ratelimit {
>         type ipv4_addr . inet_service
>         flags timeout
>     }
>
>     chain INPUT {
>         type filter hook input priority filter; policy accept;
>         tcp dport 8000 ct state new update @ratelimit { ip saddr . th dpo=
rt timeout 10s limit rate over 1/hour burst 15 packets } drop
>     }
> }
>
> It works by creating a dynamic, named set and leveraging the ability of n=
tables to update sets from the packet path. Each time the rule is matched, =
it adds or updates the set with an element consisting of both the source ad=
dress and destination port. Newly added elements bear the given rate limiti=
ng policy, along with a timeout of 10 seconds, thereby matching your --seco=
nds parameter. The capacity of the bucket is set to 15 tokens, thereby matc=
hing your --hitcount parameter. The buckets of elements that continue to su=
rvive the timeout will be credited with a single token every hour - a delib=
erately long interval (you may lengthen it further if you wish).
>
> I would suggest taking a look at the SET STATEMENT section of the nft(8) =
man page:
>
> LESS+=3D'+/SET STATEMENT' man nft
>
> There is also some information in the wiki:
>
> https://wiki.nftables.org/wiki-nftables/index.php/Meters
>
> --
> Kerin Millar



--=20
Best Regards
Sreedhar
