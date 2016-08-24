From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset version
Date: Wed, 24 Aug 2016 11:22:18 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1608241118320.814@blackhole.kfki.hu>
References: <57BD60A0.5070407@metu.edu.tr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:references
        :message-id:in-reply-to:from:from:date:date:received:received
        :received; s=20151130; t=1472030538; x=1473844939; bh=eg9nAihn/2
        wuYKzm8qMx5H9if4Mh4+/pZMF9EPiLjPw=; b=bh+rACWA1PB0HJdfafKlokAkYb
        i78pc2lxLOd04ocNMVVw2cG31h++56Fe6QsepTq70EqraxSvTfVXVdu60pYa9Y+v
        ZeMzcEwbqA7DvAvXMVUTkGQXpcXINVAGf5fQkYrBj5Zc/jSiW+c4V7bHE+vGtKPh
        1Qqqsxy5gViM+wD7Q=
In-Reply-To: <57BD60A0.5070407@metu.edu.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Husnu Demir <hdemir@metu.edu.tr>
Cc: netfilter@vger.kernel.org

On Wed, 24 Aug 2016, Husnu Demir wrote:

> How can I see ipset version? From the kernel modules, I mean,
> 
> modinfo ip_set_bitmap_ip
> filename:       /lib/modules/4.6.6/extra/netfilter/ipset/ip_set_bitmap_ip.ko
> alias:          ip_set_bitmap:ip
> description:    bitmap:ip type of IP sets, revisions 0-3
> author:         Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
> license:        GPL
> depends:        ip_set
> vermagic:       4.6.6 SMP mod_unload modversions
> 
> There is no version field? I have been compiling from the source, build 
> daily.

There is no version field and that's intentional. The revisions tells 
which ipset userspace type revisions are supported by the kernel module.

"ipset h" outputs the revisions supported by the userspace and what new 
feature was introduced compared to the previous revision.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
