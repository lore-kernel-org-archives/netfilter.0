From: Psyspy 22 <psyspy2020@gmail.com>
Subject: Re: libnetfilter_queue : Parsing payload
Date: Sat, 20 Feb 2021 11:40:15 -0700
Message-ID: <CAFqmWq8PqEu8wX3zUyKzCs6WPiydMn2WHjkPK23XD7kepzyrNA@mail.gmail.com>
References: <CAFqmWq-LNUpD0OFtxaz-KxUJ0nA_pPBRn_B_P2_UhfnzU=JcvA@mail.gmail.com>
 <20210220082716.GC2979@dimstar.local.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=mOONzSobiTGySx6E5QRjEhA56cgEMTUCLnQKAcDOq4w=;
        b=ZEkJ/WHL9sDIlps/85fDcWPwblKuUNAaG79NXOSJ51NVpNdnCkPrv36HObUNHu5elI
         pXt1q2n6P+KEKODcxyX2z2Cz4RkboWFcdbsxS14Xmc6EcsdaU+LeHAKfsIYwFDNpNTIb
         NUEaFcZyP7dwu6t5nwETjhoRG9cG+uDyOo80fcMgi/NtagMSpKaXv9yxVmU2KqWbFuCp
         80dxos2Zry0bRA45fCu1GBo+yjeHGDWaMa7/3QMBb3i9VK2lJeeTNuRlMuDlP2Zc8fyL
         exTdPfwXiyA83vbrRjjVlIDOLnyLeytg6LSx/YvSZVKefC4cfUa+HNahs1vmbG6XjDDf
         TUHQ==
In-Reply-To: <20210220082716.GC2979@dimstar.local.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Psyspy 22 <psyspy2020@gmail.com>, netfilter@vger.kernel.org

Thanks again, Duncan! Have a wonderful weekend.

On Sat, Feb 20, 2021 at 1:27 AM Duncan Roe <duncan_roe@optusnet.com.au> wrote:
>
> On Fri, Feb 19, 2021 at 08:38:14AM -0700, Psyspy 22 wrote:
> > Hello,
> >
> > I am using the example in the library's git repo.
> >
> > 1. Do I need to copy the payload to another buffer? I saw a few
> > examples (using the deprecated API) that use pktb_alloc to allocate
> > memory and then copy payload to it.
>
> At the moment, yes.
> >
> > 2. How do I parse the payload? Let's say the IP and TCP headers. Can I
> > use the nfq_ip_get_hdr helper function or is it deprecated too?
>
> nfq_ip_get_hdr is part of the modern interface. Anything using struct pkt_buff
> is (the old ones use struct nfq_data).
>
> https://netfilter.org/projects/libnetfilter_queue/doxygen/html/modules.html
> documents all functions and whether they are deprecated
> >
> > Thanks,
> > psyspy
>
> Cheers ... Duncan.
