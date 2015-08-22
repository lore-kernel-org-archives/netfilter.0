From: Soroosh Sardari <soroosh.sardari@gmail.com>
Subject: Re: ipset v6.25.1 does not recognize 'counters' as option
Date: Sat, 22 Aug 2015 09:23:21 +0430
Message-ID: <CAFUsPDaRjqd8LA2iNqdwGXwH9VUVaixJDznRNFKRKLPtvrogCg@mail.gmail.com>
References: <CAFUsPDZw6uGSsNvoZN3TKm=NHdUJTQ79QakYvxP1OyHMzZDzmQ@mail.gmail.com>
 <CAEzD07KL6CaBq8dHsPVLQH-R=Em76iiS=ErNOXFsVMd4Gygsfw@mail.gmail.com>
 <CAFUsPDZjpkKSgdv29kH0snwm=-XOBXPVF4JUhmU2B-U=dCFBbw@mail.gmail.com> <alpine.DEB.2.10.1508211959110.7784@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=dQ3b/Amy5qBaM5oS5TVvTnGQfB+LcPH1sk4TT9zf/Dw=;
        b=eLQ9yBU111m5yDLUUcDebG+LGPYA1cs6TtFq61wGHhn8viR13QuHVQN03vym9TSpRn
         ZyHIIq73nHtGSWj0DU0YIGUC+wLj8YtzurMmRtkU/98R4I9wKkjF+JkHOpyzMQt6T31M
         4KQKvg4WpB4G5e/RF2PlBpBTj6Ms25167kP4+WxhswDErLVtsUmgA65Z8XjnKD32LXHp
         c24LQ1mS3oRUBMo7GLuS5OgPWvSmki91MRW79ZPgC5Ln3A3cj9CUfYc8Ai0etEwhcu9D
         4szZiz5axeQnK0gEQDnK+EkZJLnZA1b8eJx+oByM8tnpBJltF7PIU9zPa0ONEFWqKeD7
         FCtg==
In-Reply-To: <alpine.DEB.2.10.1508211959110.7784@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Anton Danilov <littlesmilingcloud@gmail.com>, netfilter@vger.kernel.org

On Fri, Aug 21, 2015 at 10:31 PM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Fri, 21 Aug 2015, Soroosh Sardari wrote:
>
>> Thanks, this is the output of ipset help | counters:
>>
>>     list:set 1 counters support
>>     hash:net,iface 3 counters support
>>     hash:net,port 4 counters support
>>     hash:net 3 counters support
>>     hash:ip,port,net 4 counters support
>>     hash:ip,port,ip 2 counters support
>>     hash:ip,port 2 counters support
>>     hash:ip 1 counters support
>>     bitmap:port 1 counters support
>>     bitmap:ip,mac 1 counters support
>>     bitmap:ip 1 counters suppor
>>
>> Seems I'm using the new kernel modules. Is there any make option to
>> enable counters in ipset user space tool?!
>
> No, the output above means that the ipset userspace utility supports the
> counters. Your kernel still may use the old ip_set* modules, without
> counters support. You can check it out by "modinfo ip_set_hash_net": it
> should support revision 3 too.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary

modinfo ip_set_hash_net
filename:
/lib/modules/3.2.0-4-amd64/extra/netfilter/ipset/ip_set_hash_net.ko
alias:          ip_set_hash:net
description:    hash:net type of IP sets, revisions 0-6
author:         Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
license:        GPL
depends:        ip_set,ip_set
vermagic:       3.2.0-4-amd64 SMP mod_unload modversions

This is the ko file that i just compiled from latest source codes.
