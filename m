From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: Error in IPSET : Unknown argument `skbinfo'
Date: Thu, 10 Aug 2017 12:16:15 +0530
Message-ID: <CAA5aLPjcUqWruCHoHEdh+sn4ND+VYKeLx7ZCc371DunL9gPP-w@mail.gmail.com>
References: <CAA5aLPj4ZA-wDtsW7C+rt7a9X9_T+jrzxWV1pdfCUWYu7jiLTg@mail.gmail.com>
 <alpine.DEB.2.11.1708092049090.31706@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=BOsa3O1v3EIj4Z4WdgsvKuV/k3MXLLf5fUuTs/afdH0=;
        b=Eylbep4Ui/HgYXya5H0fDUWz/tU3nocnQw9htpyH4Q9Ppr6kObKLkxRmYgi1z52NBs
         cKHOU4FIlvHCiFSolS8s+xVjZqTA5Pka8ktNKwiuO3eDJ+ppLM2+sDfW0XGRQMb+CQO5
         z8p3O8IpH9jkAAfShfQ7h1cwKyWUVGIdWnzCzhDTc4zyU4W5b46AH+FzYyWC0O1a1PcH
         SYyZ9eJgrQ1m+NNPYurPWVMNY2djknoLlPB8Z3rDxDU9IKuR70al79WFXxKqZU3/5t7m
         KlVWPmRBNhxsgipcn90cIED+UbJStonGThewYMEd/euU4QH0iy73paXx+z+c7dMS0c9g
         pFuA==
In-Reply-To: <alpine.DEB.2.11.1708092049090.31706@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Yes. You are right. Its 0-1 for me.

How can I upgrade?

On Thu, Aug 10, 2017 at 12:22 AM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Wed, 9 Aug 2017, Akshat Kakkar wrote:
>
>> my ipset version is 6.32. OS is CentOS 7.3. Kernel is 3.10
>>
>> when I execute following command,
>>
>>     ipset create foo hash:ip skbinfo
>>
>> I get error as
>>
>>    ipset v6.32: Unknown argument: `skbinfo'
>
> It means that the kernel module does not support the skbinfo extension.
>
> What is revision in description line in the output of
> `modinfo ip_set_hash_ip`? It should be 0-4 for skbinfo support. 0-3 or
> less means no skbinfo support in the kernel side.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
