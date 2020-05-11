From: b38911 Zxc <b38911@gmail.com>
Subject: Re: Correct usage of nf_ct_get
Date: Mon, 11 May 2020 13:59:06 +0200
Message-ID: <CACWCkhCZ_q5sZ=m4phVLhcO0bXb1PWpgyYwsfOghdzPrVHLTdg@mail.gmail.com>
References: <CACWCkhDssWGr3qg73T+Ft_f8jWDaA7wway=so0URwiDRK6hiTQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=bd8UCjD49knXYsaUt++QDTzT/KchZ5dupMr7xCrHvC8=;
        b=PzRKSDk9aQHC8HgfCE8wVi7YKBlQhrWfd/kcnLNTeWbZiKcZJY6s3fJGdtfvsFpTCS
         df6sxvvoe/fEw6vPGWoGeGc2UZeirwqu+ePYRmU5UCE0JQLwK0ewgUMbT5Uecl3ayXkE
         eaA3rMSspDXvhl1ggkzEoVtqt7hKaFnaQSxWe4u+vFpuRCW//7hKabEML/Ds/1wB+4Qh
         UpjnZahSwuVkfsB3G1H5kFkDzvQAmP3RybABvElSZO+qkEfrP6OYXJMJkyPYG0KYRusW
         SYSS8nD2pS1hC2UOERW6o+CTVRc+/gO8Wo5/gGG+KUJLR1INvUi9QYtqoVP8vgTDmMiX
         WPHw==
In-Reply-To: <CACWCkhDssWGr3qg73T+Ft_f8jWDaA7wway=so0URwiDRK6hiTQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello.

I did some additional investigations: it looks that what I'm looking
for can be accomplished with the call to

nf_ct_l3proto_try_module_get

But this looks valid only for some 4.x kernel versions. From more
recent versions it looks this has been removed.
Anyone can point me to how to approach this on newer kernels?

Thanks so much

Il giorno ven 8 mag 2020 alle ore 10:10 b38911 Zxc <b38911@gmail.com>
ha scritto:
>
> I have a doubt on the correct usage of the conntrack func "nf_ct_get".
>
> I'm calling it in this way in my netfilter, to track UDP traffic:
>
> -----<Code snippet>-----
>
>       ct = nf_ct_get(skb, &ctinfo);
>       if (ct == NULL)
>       ...
>
> -----<Code snippet>-----
>
> On some systems it just work. In some others I get the result as NULL
> until I do something like
>
> # iptables -A OUTPUT -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT
>
> I understand that this is due to some module missing. My question is:
> is this the only way to do it?
> Can I force this programmatically (or by loading/registering specific modules)?
> If I'm not wrong, the modules insertion is not enough to get this
> working, an additional action is required.
> Thanks a lot for your help!
>
> CC
