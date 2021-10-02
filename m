From: Kerin Millar <kfm@plushkava.net>
Subject: Re: testing if a named set exists?
Date: Sun, 3 Oct 2021 00:50:51 +0100
Message-ID: <20211003005051.b704c8386455400360bcc636@plushkava.net>
References: <CAOLfK3UBEvRg8AQbLibVo9xp6tZjaE7_S1+uDyhhbR7Nj_eYhA@mail.gmail.com>
        <20211002035707.bf92730b8f667517ba53dfad@plushkava.net>
        <CAOLfK3VJ28CLb5K-gbKVHO+F+vQh5wywb65wbFnAdsSpq2DQ-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        K+LNc8WZV8GVHrKKtD5y/iu5NQI6ztvABov1y/nLkUo=; b=ZZe9l5Ux7V1Acjcf
        Ec6oc9E3H5x3KRwE12P7Vwd388f001FvDHYWz4SOJwtN43z3wDMcfanFGp3vnR89
        M2P1lVrDwJ1Enxmk+OG07eXvWFhCKk2pWKG7NONKr+meKqC99IS7i1/stDF6VWXi
        qM1zzTE086w/yUs20SJyewokDyfolcrWRqjPdnhPWMwkd5jRxh1EOD+wLON2DQkK
        b4FZ4bDC+BadyC+7Mr0M+0qGxsJCPqo/HVy1VNpc/hsas6uvjvuHIpYdYH04RukH
        lvYqvWYB8cqbxPCFgITdwa7ugabSiX6I84L2J2EmpJOqL7dGcPjHoRd9AGWa8hF+
        tRgKnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=K+LNc8WZV8GVHrKKtD5y/iu5NQI6ztvABov1y/nLk
        Uo=; b=Dk2nFNK3g4Vvbn0bdL0peTfvMh1530MtneOF75GDCOJVWA8hKNS8OTCu3
        ioLzwgpUwP6zjM7BEkKcGknvaeVzObkWT+2pI8d99gHk/PPCBalqffmevH37qFsQ
        m6hSFjhayd6gtMRksg05aKoCpZ6lIV9gDCXpKH1td+SyxRgOaLMvtnuZwUNpa7OQ
        Yba65O9il+wQJCxKGc9T6J2Xa58d6szEgO9mFDzgiqz60SZc7YZlS6vPGAu7fSlz
        vJbvvNFS6Ta3VoEJtZ2BJTLvp6v2TuT74M3cHWLwwnbwyVnvqLdIzSxcI8UxaTwV
        L88uNZv+3Pg4eRTaSPld+mQhTotaA==
In-Reply-To: <CAOLfK3VJ28CLb5K-gbKVHO+F+vQh5wywb65wbFnAdsSpq2DQ-Q@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: netfilter <netfilter@vger.kernel.org>

On Sat, 2 Oct 2021 06:50:35 -0500
Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:

> Hey Kerin (and Duncan),
> 
> Thanks for the replies.
> 
> On Fri, Oct 1, 2021 at 9:57 PM Kerin Millar <kfm@plushkava.net> wrote:
> >
> > On Fri, 1 Oct 2021 20:16:17 -0500
> > Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:
> >
> > > I'd like to do something like the following:
> > >
> > > if exists $named_set
> > >     nft add rule ip filter output ip daddr $named_set accept
> > > else
> > >     nft add rule ip filter output ip daddr $default_set accept
> > >
> > > Does anyone know if I can accomplish this with nftables?
> > >
> >
> > The output of nft isn't particularly amenable to parsing unless it is instructed to produce JSON. The simplest way is to act upon the exit status value of a list set command.
> >
> > if nft --terse list set ip filter "$named_set" >/dev/null 2>&1; then ...
> 
> I should have been more specific...
> 
> I'm hoping to do this all in nft without hitting the shell. For
> example, from "man bash" we have:
> 
>        ${parameter:-word}
>               Use Default Values.  If parameter is unset or null, the
> expansion of word is  substituted.   Otherwise,
>               the value of parameter is substituted.
> 
> I was hoping for some sort of similar mechanism in nft. Like:
> 
> nft add rule ip filter output ip daddr
> ${named_set_does_not_exist:-default_named_set} accept

I see. As far as I'm aware, no such feature exists in nft at the current time.

-- 
Kerin Millar
