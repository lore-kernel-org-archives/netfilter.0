From: =?iso-8859-2?Q?Kamil_Jo=F1ca?= <kjonca@op.pl>
Subject: Re: exclude named sets
Date: Fri, 20 May 2022 06:32:23 +0200
Message-ID: <87y1ywhlig.fsf@alfa.kjonca>
References: <CAMsxNkSkjBkwS=AhJpG+GPTfz1nYsH4YjLVJ56DxvW9hAVeoCg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
        t=1653021146; bh=jjVjL5UHgnP/CAz4Pi+Z6Js6iBzp3jH0WSMAkV1u9/E=;
        h=From:To:Subject:References:Date:In-Reply-To:From;
        b=Kzfp25RxUmxaO24jdnv0AE6wOYk4SfH7VVrqMbY4WQT2lNMkn2zg+2828DOdYb4Se
         v4nojzBDv69pPlMGwJlicR0S0Dv1lTD9b+Kaz4gfrcESP/g5qUr3CRULgMwEBwrhx2
         sqmYOpmlY2Cuz+RJFUOKMp951yIfjOffBblRB+gw=
In-Reply-To: <CAMsxNkSkjBkwS=AhJpG+GPTfz1nYsH4YjLVJ56DxvW9hAVeoCg@mail.gmail.com>
        (Andrew Clark's message of "Fri, 20 May 2022 06:49:10 +0300")
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Andrew Clark <andrewclarkii@gmail.com> writes:

> I use Debian 11 as my home router, and I have a script for workaround
> blocked addresses. Alas Roskomnadzor lists are getting bigger, so I
> came to the simple thought that it would be much easier to route all
> traffic in the TOR network, but I have a bunch of addresses which
> should be passed directly, without using TOR.
>
> This is valid rule: iifname $int_ifs ip daddr @rkn meta l4proto tcp
> redirect to :9051
> But this one is not: iifname $int_ifs ip daddr != { @akamai,
> @stormwall } meta l4proto tcp redirect to :9051

What do you mean "not valid?" You got error, or rule does not work as
expected?


Can you try:

--8<---------------cut here---------------start------------->8---
iifname $int_ifs ip daddr != @akamai meta l4proto tcp redirect to :9051
--8<---------------cut here---------------end--------------->8---
?
I suspect that problem is with "{ @akamai, @stormwall }" construct and not with
exclusion.

>
> How to exclude couple of named sets properly?
KJ

-- 
http://stopstopnop.pl/stop_stopnop.pl_o_nas.html
