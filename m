From: Kim Emax <kimemax@gmail.com>
Subject: Re: 2 nics and traffic delayed/lost on LAN
Date: Sun, 28 Oct 2012 19:52:18 +0100
Message-ID: <CAG5MBdUoGwooO7VHy6ae+KyeRcypo2p9A2zxP+egLjkE_6H-KA@mail.gmail.com>
References: <CAG5MBdXsm-bD2diJKif3mF3p=h6YCfbV__SY55gjtas81ForqA@mail.gmail.com>
	<508D4FED.4040105@ngtech.co.il>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=/VMfguYuHJFzQphic36aBmtwuXJkE4fL3rns6r+up7Q=;
        b=bOOWz6S1GEyhzuPk0wDlo2RIq+sLoXknfNWy0alzwnXAbttT5hlYGtOvQ69JorRq17
         dOMcDmaHRIMSDBqHrQx0fFTZ49D4Mo1K7pwtHgi1dg9etqrcLlELWeWYTd4NLfOB/Oar
         YLGK5Etj5rdBRMeY4M3rCU1TYhUjp0MaZGQ7rEk6RMN/hXWJqabEbhAhGJ9stCwTaMYa
         CsVGW2o7o97gJ8WFlYsCRUbKyJFOZ5j919UFRQie2cw1x/Ot+nDjb4sfKsUnNayOrc60
         VlUBGMWnI8V0L3JGAoYpaPl13n2skkzlAHIgCUxGdtFI3LnpODQPHPIm0uv9aTDQWvH7
         h3pw==
In-Reply-To: <508D4FED.4040105@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

On Sun, Oct 28, 2012 at 4:31 PM, Eliezer Croitoru <eliezer@ngtech.co.il> wrote:

> Hello Kim,
>
> it seems to me like there nothing wrong with the FW software but something
> else lower in the chain.

That's nice to know. I consider myself no expert in iptables but do
know my way around and it's just fustrating that it does behave as
supposed to...

I did find, from googling that maybe i missed a single forward chain:

iptables -A FORWARD -i eth1 -j ACCEPT

But it didn't make a difference...

When you say lower, do you mean settings in for instance
/proc/sys/net/ipv4/ip_forward


> What Distro are you using?

Ubuntu 12.04

Kind regards.
Kim
