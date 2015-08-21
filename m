From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset v6.25.1 does not recognize 'counters' as option
Date: Fri, 21 Aug 2015 20:01:20 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1508211959110.7784@blackhole.kfki.hu>
References: <CAFUsPDZw6uGSsNvoZN3TKm=NHdUJTQ79QakYvxP1OyHMzZDzmQ@mail.gmail.com> <CAEzD07KL6CaBq8dHsPVLQH-R=Em76iiS=ErNOXFsVMd4Gygsfw@mail.gmail.com> <CAFUsPDZjpkKSgdv29kH0snwm=-XOBXPVF4JUhmU2B-U=dCFBbw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFUsPDZjpkKSgdv29kH0snwm=-XOBXPVF4JUhmU2B-U=dCFBbw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Soroosh Sardari <soroosh.sardari@gmail.com>
Cc: Anton Danilov <littlesmilingcloud@gmail.com>, netfilter@vger.kernel.org

On Fri, 21 Aug 2015, Soroosh Sardari wrote:

> Thanks, this is the output of ipset help | counters:
> 
>     list:set 1 counters support
>     hash:net,iface 3 counters support
>     hash:net,port 4 counters support
>     hash:net 3 counters support
>     hash:ip,port,net 4 counters support
>     hash:ip,port,ip 2 counters support
>     hash:ip,port 2 counters support
>     hash:ip 1 counters support
>     bitmap:port 1 counters support
>     bitmap:ip,mac 1 counters support
>     bitmap:ip 1 counters suppor
> 
> Seems I'm using the new kernel modules. Is there any make option to
> enable counters in ipset user space tool?!

No, the output above means that the ipset userspace utility supports the 
counters. Your kernel still may use the old ip_set* modules, without 
counters support. You can check it out by "modinfo ip_set_hash_net": it 
should support revision 3 too.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
