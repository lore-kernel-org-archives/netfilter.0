From: Yucong Sun <sunyucong@gmail.com>
Subject: Re: Recommended hardware for iptables based firewall/router
Date: Sat, 8 Nov 2014 16:49:13 -0800
Message-ID: <CAJygYd1FOu7XPbP00i_jjpMm_zWnuYJAiKXudBbQgjwBQ1rxGQ@mail.gmail.com>
References: <5455AA40.6050302@conversis.de> <201411021738.56897.neal.p.murphy@alum.wpi.edu>
 <545EB804.3080903@conversis.de> <CAJygYd07-y0bDSr8THXWjNEW-e1rK5ZhGiE8aeJ_jXYJpFiL2A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=r3B//glyeTLx1QXQHcOvPkn5nsnJxhgXpLzsPL9ooT4=;
        b=0TbOYQIG6YfIxISqJz1DQcProR6yY3/vOJLcND+MTJt40Gz4yD2gyF8kpQpwGZoxdz
         jXjzNPwqGnF95UBPORB/GMvlhcMAUTioPk8ADQx8ftD6uf/MxbJv5k+lJ/hsG/F8TtNh
         XsC8Y2sS+8ytdOK3obdGH/JctUW9FBIh+HnZa46tzG2BERUxYyxfAyAtYwkx4jV2R5by
         B/g09t790n0PvKMF/SNS6Ck4C7BKbe86onEfp5pFIZewsfT5BEeBaZsqPodjKoqQ6s+6
         uB1ocWGQFoDUb7WbPrOQYXGRGdHyr7k7OxKDy4EDY65nN65mawKL3tbfBUr98t9qVGJE
         LtYA==
In-Reply-To: <CAJygYd07-y0bDSr8THXWjNEW-e1rK5ZhGiE8aeJ_jXYJpFiL2A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dennis Jacobfeuerborn <dennisml@conversis.de>, Neal Murphy <neal.p.murphy@alum.wpi.edu>, netfilter@vger.kernel.org

Dennis Jacobfeuerborn <dennisml@conversis.de>

The EdgeRouter 's asic couldn't handle all use cases ,  Having some
special rule will make it go to "offload" disabled mode.  You should
research if that's the problem.

As for Linux as a router, the key thing you want to test for is PPS,
not BPS.  Commodity hardware should be able to handle up to 1Mpps. Buy
the best Xeon within your budget. Don't bother look at anything else.
(if your project is serious and need to survive a ddos attack)

Cheers.

On Sat, Nov 8, 2014 at 4:48 PM, Yucong Sun <sunyucong@gmail.com> wrote:
>
> The EdgeRouter 's asic couldn't handle all use cases , Having some special
> rule will make it go to "offload" disabled mode.
>
> You should research if that's the problem.
>
> As for Linux as a router, the key thing you want to test for is PPS, not
> BPS. Commodity hardware should be able to handle up to 1Mpps. Buy the best
> Xeon within your budget. Don't bother look at anything else. (if your
> project is serious and need to survive a ddos attack)
>
> Cheers
