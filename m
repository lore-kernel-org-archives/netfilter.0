From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Subject: Re: Bug in the wiki
Date: Wed, 6 Jul 2022 11:27:59 +0100
Message-ID: <CAEXMXLSGWtT_6JrCEFhRgvG4-Ssj1jnVUs_r4JjoFzwjiip=mA@mail.gmail.com>
References: <CAEXMXLRwFcx4UdjFe_15Q26iuT4K=coZLvBgYfkow_8o9=iB9Q@mail.gmail.com>
 <600cead8-acad-0be6-bfe4-33cee996ccd9@fhmtech.com> <CAEXMXLRqUgFmME_8OKpAWRog3dqRCG+veHbJsZPKh9xOZ98D=Q@mail.gmail.com>
 <16130a18-e4c1-a1b7-1414-7025389efca0@fhmtech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=38zrSWAnqWDtKMJknz//Vwbhqiin6bmCuROu3PaTLuI=;
        b=i3sUdALLomkuK79yTtFUNtmmIXI+zF9TtWCTtvlbpiHl7TZ4Vt20dFL0HEFBlIStRj
         F/UxRZb9D3p8CHrR5CvAa/7UY9obQWuF7KBTa/cGK09mbZgSFhF1T+Yj/GJv88uPGX7h
         ImbnrMoEkkCEa7GEfGByGOKCCFaNkl8Y1gkSghTGDF4iYftthuKQC+9cFKGaVmr5zutQ
         8iuWunH2Gf61iUuuj/JmNi9a+xt5TpeE29zjEivmpbb7/ITHEFm8zbA0ulFhzdxigOaZ
         VjLrJ8A5g7Pz+si6iUNF4IT77zQau4U1MSNM8feI8g9k8Sg0pk39js+KVbJ7OOD6E9gy
         50Cw==
In-Reply-To: <16130a18-e4c1-a1b7-1414-7025389efca0@fhmtech.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: netfilter@vger.kernel.org

On Wed, Jul 6, 2022 at 11:22 AM Frank Myhr <fmyhr@fhmtech.com> wrote:
> To be clear: you're testing this example ruleset and seeing unlimited
> echo requests being allowed in despite the limit rule?
>
>
> > Can you give me a hint why you think ct wouldn't accept it forever
> > after the first accept?
>
> I'm going to have to defer to others with in-depth knowledge of ct. I
> suspect that if all of your echo requests come from the same source ip
> address, *maybe* the limit is ineffective as you suggest. I'd be very
> surprised if echo requests from multiple ip addresses are also immune to
> the limit.

Yes. I am testing and always and the bug is exposed with a flood ping,
for example, so from the same IP.

Yes, I agree that this should accept 5 new sources per second, but
each can then do unlimited requests.

That is why I suggest the wiki to be updated.

Thanks
