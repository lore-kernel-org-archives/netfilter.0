From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [ANNOUNCEMENT] ipset-3.2
Date: Sat, 22 Aug 2009 15:57:22 +0200 (CEST)
Message-ID: <alpine.LSU.2.00.0908221549540.11168@fbirervta.pbzchgretzou.qr>
References: <alpine.DEB.2.00.0908211609150.6879@blackhole.kfki.hu> <alpine.LSU.2.00.0908212012250.24079@fbirervta.pbzchgretzou.qr> <alpine.DEB.2.00.0908221527190.7819@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0908221527190.7819@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


On Saturday 2009-08-22 15:35, Jozsef Kadlecsik wrote:
>On Fri, 21 Aug 2009, Jan Engelhardt wrote:
>
>>=20
>> On Friday 2009-08-21 16:12, Jozsef Kadlecsik wrote:
>> >
>> >- Mixed up formats in ip_set_iptree.c fixed (Rob Sterenborg)
>> >- Don't use 'bool' for backward compatibility reasons (Rob Sterenbo=
rg)
>>=20
>> What actually is it that bool can't be used?
>
>The 'bool' typedef was introduced in 2.6.19. However, some centos kern=
el=20
>releases versioned as 2.6.18 included the patch too. So without=20
>autoconfig it is not possible to figure out, just by checking the kern=
el=20
>version numbers, whether the kernel supports bool or not.

Ah right. CentOS. Should have known. The platform where you can't
deploy any modules, because during their backport spree, they failed
to realize that external modules do rely on, say, <=C2=A02.6.22 _not_
having skb_*_header(), but skb->nh. I've given up on them.

But thanks for the reminder. :)
--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
