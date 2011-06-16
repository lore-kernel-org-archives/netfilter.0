From: Pekka Enberg <penberg@kernel.org>
Subject: Re: [PATCH] slob: push the min alignment to long long
Date: Thu, 16 Jun 2011 09:59:19 +0300
Message-ID: <BANLkTikOM6=fWnUA1bNZOM-jwg=o=CL8Ug@mail.gmail.com>
References: <1308169466.15617.378.camel@calx>
	<BANLkTi=QG3ywRhSx=npioJx-d=yyf=o29A@mail.gmail.com>
	<1308171355.15617.401.camel@calx>
	<20110615.181148.650483947691740732.davem@davemloft.net>
	<1308178420.15617.447.camel@calx>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=w7qAOdNfQH9B1vCWk2vKEmfQ0opte01b0L4fW0bqEhI=;
        b=GrMgKlIl0yDvF1RwCMWxFFliWKmr0nivUQ6P4W9e/TByRXoul417apcnHNiFQ+C0mu
         OoKj4+nrIx7+idZp12lzgzva2g9DWFXbNOQRnUYX7L8KyeNjMwhxDRsg9lTyObWfpxpU
         cldmL+smXVMABb3EvG4bNZpo7k08xO/cFGBxs=
In-Reply-To: <1308178420.15617.447.camel@calx>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Mackall <mpm@selenic.com>
Cc: David Miller <davem@davemloft.net>, sebastian@breakpoint.cc, cl@linux-foundation.org, linux-mm@kvack.org, netfilter@vger.kernel.org

On Thu, Jun 16, 2011 at 1:53 AM, Matt Mackall <mpm@selenic.com> wrote:
>> Blink... because the compiler doesn't provide a portable way to
>> do this, right? :-)
>
> Because I, on x86, cannot deduce the alignment requirements of, say,
> CRIS without doing significant research. So answering a question like
> "are there any architectures where assumption X fails" is obnoxiously
> hard, rather than being a grep.
>
> I also don't think it's a given there's a portable way to deduce the
> alignment requirements due to the existence of arch-specific quirks. If
> an arch wants to kmalloc its weird crypto or SIMD context and those want
> 128-bit alignment, we're not going to want to embed that knowledge in
> the generic code, but instead tweak an arch define.
>
> Also note that not having generic defaults forces each new architectures
> to (nominally) examine each assumption rather than discover they
> inherited an incorrect default somewhere down the road.

I don't agree. I think we should either provide defaults that work for
everyone and let architectures override them (which AFAICT Christoph's
patch does) or we flat out #error if architectures don't specify
alignment requirements. The current solution seems to be the worst one
from practical point of view.

This doesn't seem to be a *regression* per se so I'll queue
Christoph's patch for 3.1 and mark it for 3.0-stable.

                            Pekka
