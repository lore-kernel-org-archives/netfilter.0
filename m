From: Neutron Soutmun <neo.neutron@gmail.com>
Subject: Re: [ANNOUNCE] ipset 7.8 released
Date: Fri, 20 Nov 2020 20:18:55 +0700
Message-ID: <CAMQP0sn9NuE=Kg-Qf3FWkoSM-7hTtcj9whDbxn29NcrmnT7F4w@mail.gmail.com>
References: <alpine.DEB.2.23.453.2011192141150.19567@blackhole.kfki.hu>
 <45rqn0n5-5385-o997-rn9q-os784nqrn9p@vanv.qr> <alpine.DEB.2.23.453.2011192237290.19567@blackhole.kfki.hu>
 <83oq5412-o0sq-5q31-s7o5-s0q28s12844@vanv.qr> <CAMQP0skDvG-vOAGmcx2kn21KYS9UgMfxND7NTi_X75GOnx_izw@mail.gmail.com>
 <alpine.DEB.2.23.453.2011200904550.19567@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TxPJXOKPX6TEaOhaf1CzmpADx+XCWdAGqJGhJLYHnrE=;
        b=Mo3RuKvEWvcHEXrY3Hv5Q4ughhU2edtK1+78rHSQpGhpdGjuSZNiMvmm0CO3OLZ08C
         DTe78IO0oUw9Nb4DW8MUSontVYRzraq5KTJtFVoJ71pz+ZABmHGiTaHJxUH+H9o+OQJ/
         jXm58g6/3YmfV0chn4d3GfGItcbm4xzvU81HiKkp3ngy4LZIgh6+77Cwy72GWLZNkfO3
         s1W3SwGDJn9fH9MWcZVGECPKlcsxrO4K/C2azxQfFYGWReikWt6eAI6O36djqdOTQEl0
         Ei0c5ryJ+Xi56GOyJHQqvDqAxkt9EF8TsdE99k6RX/BKvBhbpNSe9oZxfrLLmrYEb2+y
         LZAA==
In-Reply-To: <alpine.DEB.2.23.453.2011200904550.19567@blackhole.kfki.hu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@netfilter.org>
Cc: Jan Engelhardt <jengelh@inai.de>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

On Fri, Nov 20, 2020 at 3:07 PM Jozsef Kadlecsik <kadlec@netfilter.org> wrote:
>
> Hi,
>
> On Fri, 20 Nov 2020, Neutron Soutmun wrote:
>
> > For the ipset 7.9, I found the released download url is
> > http://ipset.netfilter.org/ipset-7.9.tar.bz2, however, it's previous
> > releases are in http://ftp.netfilter.org/pub/ipset/
> >
> > The Debian has the tool to detect the new release with package watch [1]
> > file. Could you please consider uploading the new release to the
> > fpt.netfiler.org/pub/ipset also.
>
> It has been fixed. Please note, I switched from md5 to sha512 at
> generating the checksum file, so the filename is changed accordingly to
> <packagename>.sha512sum.txt.

Noted and thanks a lot.

Best regards,
Neutron Soutmun
