From: Husnu Demir <hdemir@metu.edu.tr>
Subject: Re: ipset version
Date: Wed, 24 Aug 2016 13:41:11 +0300
Message-ID: <57BD79C7.7010308@metu.edu.tr>
References: <57BD60A0.5070407@metu.edu.tr>
 <alpine.DEB.2.10.1608241118320.814@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.10.1608241118320.814@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Thanks for the tip.

Best regards.

Husnu Demir.
Network.



Jozsef Kadlecsik wrote:
> On Wed, 24 Aug 2016, Husnu Demir wrote:
> 
>> How can I see ipset version? From the kernel modules, I mean,
>>
>> modinfo ip_set_bitmap_ip
>> filename:       /lib/modules/4.6.6/extra/netfilter/ipset/ip_set_bitmap_ip.ko
>> alias:          ip_set_bitmap:ip
>> description:    bitmap:ip type of IP sets, revisions 0-3
>> author:         Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
>> license:        GPL
>> depends:        ip_set
>> vermagic:       4.6.6 SMP mod_unload modversions
>>
>> There is no version field? I have been compiling from the source, build 
>> daily.
> 
> There is no version field and that's intentional. The revisions tells 
> which ipset userspace type revisions are supported by the kernel module.
> 
> "ipset h" outputs the revisions supported by the userspace and what new 
> feature was introduced compared to the previous revision.
> 
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
