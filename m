From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Subject: Re: Bug in the wiki
Date: Wed, 6 Jul 2022 11:09:01 +0100
Message-ID: <CAEXMXLRqUgFmME_8OKpAWRog3dqRCG+veHbJsZPKh9xOZ98D=Q@mail.gmail.com>
References: <CAEXMXLRwFcx4UdjFe_15Q26iuT4K=coZLvBgYfkow_8o9=iB9Q@mail.gmail.com>
 <600cead8-acad-0be6-bfe4-33cee996ccd9@fhmtech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1venBzRAE2flkzGgzEY8baHN9Ev8au+fXzU2tsW0TWc=;
        b=XuFHVvjUcoSRl8Yiz4k9aG8NZMHCLuAwme/9WRD2BN86VdHXLkW36NUDsHRW9TfAco
         67o8Oc05a7lcwkv1IykO1P3VKCrhybQtq+GEfgCaxt5Sg0kSiPupMYNV8KPQEyD1sAvO
         B9LVNNYCoLE74haPEFW4+sth8+zck1BpEBMR9HfnxfUGeAE+35h8xgndU0fYB61h2Omh
         ejleMfPeIrY9Mhu9Q68hj6YiS2OqqY2fvcskvToHG5KUU4ooZUNg54/6N+7VpqK6YQZu
         7r6KqQ0okzGtsboM+YCAteZHhD7bwXQ09kNZymVLFQHU1ui3yTERG/tZnI4zV769v/rU
         C3IA==
In-Reply-To: <600cead8-acad-0be6-bfe4-33cee996ccd9@fhmtech.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: netfilter@vger.kernel.org

On Wed, Jul 6, 2022 at 10:59 AM Frank Myhr <fmyhr@fhmtech.com> wrote:
> Hi Nuno,
>
> The icmp and icmpv6 rules you refer to are in regular chains, both
> called by base chain "inbound" that has policy drop and no other icmp /
> icmp6 rules. Therefore there is no need for the additional "drop" rules
> that you suggest; packets arriving faster than the limit rates will be
> dropped by the calling base chain's default policy.
>
> Best regards,
> Frank

I think ct (conntrack) will track it after the first accept and so the
rate limit becomes ignored.

This is what happens in reality. My understanding is that it's a bug
in this configuration. If the configuration is correct then it would
be bug (I'm on 5.18.9).

Can you give me a hint why you think ct wouldn't accept it forever
after the first accept?

Thanks!
