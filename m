From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Error in IPSET : Unknown argument `skbinfo'
Date: Wed, 9 Aug 2017 20:52:42 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1708092049090.31706@blackhole.kfki.hu>
References: <CAA5aLPj4ZA-wDtsW7C+rt7a9X9_T+jrzxWV1pdfCUWYu7jiLTg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:references
        :message-id:in-reply-to:from:from:date:date:received:received
        :received; s=20151130; t=1502304763; x=1504119164; bh=NZ7GDYm02h
        McsSyXKKYsVvjHgieM5xXc8IubiN2NIec=; b=SgITJXIq7+XbZ+JO6GG6dLXSiC
        8MRd+auZJIMNfX3Tnkut4Qer6+Ogdu0UgB1Ec6dzWPIw34uL1Rb8hMdFDe+EKLKa
        nsfxp1PGA7N1L3bspR8buohpxdO7BBIim1LTNJGCl/NHuFkOZ1HYTsMI4a9MoLbu
        zpzwSYK1HnaEUF/8E=
In-Reply-To: <CAA5aLPj4ZA-wDtsW7C+rt7a9X9_T+jrzxWV1pdfCUWYu7jiLTg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Akshat Kakkar <akshat.1984@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, 9 Aug 2017, Akshat Kakkar wrote:

> my ipset version is 6.32. OS is CentOS 7.3. Kernel is 3.10
> 
> when I execute following command,
> 
>     ipset create foo hash:ip skbinfo
> 
> I get error as
> 
>    ipset v6.32: Unknown argument: `skbinfo'

It means that the kernel module does not support the skbinfo extension. 

What is revision in description line in the output of
`modinfo ip_set_hash_ip`? It should be 0-4 for skbinfo support. 0-3 or 
less means no skbinfo support in the kernel side.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
