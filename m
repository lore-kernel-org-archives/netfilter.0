From: Neutron Soutmun <neo.neutron@gmail.com>
Subject: Re: [ANNOUNCE] ipset 7.8 released
Date: Fri, 20 Nov 2020 10:01:31 +0700
Message-ID: <CAMQP0skDvG-vOAGmcx2kn21KYS9UgMfxND7NTi_X75GOnx_izw@mail.gmail.com>
References: <alpine.DEB.2.23.453.2011192141150.19567@blackhole.kfki.hu>
 <45rqn0n5-5385-o997-rn9q-os784nqrn9p@vanv.qr> <alpine.DEB.2.23.453.2011192237290.19567@blackhole.kfki.hu>
 <83oq5412-o0sq-5q31-s7o5-s0q28s12844@vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JPhNPKtFRMqdIBM7nTGH/SqOjVL2v13M9KwRX/ticv4=;
        b=qIqK2sHBWDww/yNKBkfTe4FNeInkAsB/ayOybMgYkQ44CPoXGo6c4h7vhTZO0ttjp2
         zj9OtlN86iekUYB55AE/DGpzuX0Ta0C03LHycjKQE0tv0xNqaj9vhrRlAGTb8TOMAum3
         PyCndT2jwziPmCFGBvdZLzaqolZwhDOEcVj/qlZ4c++4EoykdBvrU+r1KrjVyFYIWtHd
         51HE6AYMxfv18UyR4xlcnqtbzOK7Qi64OKdp68r78W+WcQc5UgX5EOF3cpwM3ol3vSaL
         mzhP/zDvDajJ53g4RNr9K8WtZYxoqEPb3JOa2R6ZueWcfkhoSu9sJB3rHHSCoXlYi61J
         ov2A==
In-Reply-To: <83oq5412-o0sq-5q31-s7o5-s0q28s12844@vanv.qr>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

For the ipset 7.9, I found the released download url is
http://ipset.netfilter.org/ipset-7.9.tar.bz2,
however, it's previous releases are in http://ftp.netfilter.org/pub/ipset/

The Debian has the tool to detect the new release with package watch [1] file.
Could you please consider uploading the new release to the
fpt.netfiler.org/pub/ipset also.

Best regards,
Neutron Soutmun

---
[1] https://salsa.debian.org/pkg-netfilter-team/pkg-ipset/-/blob/debian/master/debian/watch

On Fri, Nov 20, 2020 at 5:09 AM Jan Engelhardt <jengelh@inai.de> wrote:
>
> On Thursday 2020-11-19 22:46, Jozsef Kadlecsik wrote:
>
> >Hi Jan,
> >
> >On Thu, 19 Nov 2020, Jan Engelhardt wrote:
> >
> >> LIBVERSION changed from 14:0:1 (ipset 7.6) to 14:1:2,
> >> producing libipset.so.13 (7.6) and now libipset.so.12
> >>
> >> That seems incorrect! It should have been
> >> - 14:0:1 (no changes)
> >> - 15:0:2 (compatible changes)
> >> - 15:0:0 (incompatible changes)
> >
> >Oh, my. It should be 15:0:2 (compatible changes). I dunno how many times I
> >can mix it up, this numbering scheme is simply alien to my brain wiring.
>
> If in doubt, always use :0:0 --- and make a mental note of exactly the
> :0:0 requirement in Make_global.am. :-)
>
> Distros can always rebuild transitively. They have to do that anyway for
> things like /usr/lib64/libbfd-2.35.0.20200915-1.so (with a date, it
> could change daily anyway). But recovering from a backjumping lib...
