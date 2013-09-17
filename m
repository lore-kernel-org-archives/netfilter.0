From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset 6.19 build fails on CentOS 6.4 64bits
Date: Tue, 17 Sep 2013 09:07:20 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1309170903010.15566@blackhole.kfki.hu>
References: <CADuigkUZx24ssKBsu21QxwShTHKmZn7dyXnhwsNwt4aLbM7Jcw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADuigkUZx24ssKBsu21QxwShTHKmZn7dyXnhwsNwt4aLbM7Jcw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ricardo Klein <klein.rfk@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Mon, 16 Sep 2013, Ricardo Klein wrote:

> I was trying to build ipset 6.19 on CentOS 6.4 bit it fails.
> I did a try on git version (the current one right?) and it fails too
> on make modules
> 
> [root@localhost ipset]# make modules
> make -C /lib/modules/`uname -r`/build M=$PWD/kernel/net V= \
> KCFLAGS="-DPACKAGE_VERSION=6.19" \
> IP_SET_MAX=256 KDIR=$PWD/kernel modules
> make[1]: Entering directory `/usr/src/kernels/2.6.32-358.18.1.el6.x86_64'
> Makefile:626: "WARNING: Appending $KCFLAGS (-DPACKAGE_VERSION=6.19)
> from command line to kernel $CFLAGS"
>   CC [M]  /root/ipset/kernel/net/netfilter/xt_set.o
> In file included from
> /root/ipset/kernel/include/linux/netfilter/ipset/ip_set.h:22,
>                  from /root/ipset/kernel/net/netfilter/xt_set.c:18:
> /root/ipset/kernel/include/linux/netfilter/ipset/ip_set_compat.h:42:
> error: redefinition of ?ether_addr_equal?
> include/linux/etherdevice.h:185: note: previous definition of
> ?ether_addr_equal? was here
> make[3]: *** [/root/ipset/kernel/net/netfilter/xt_set.o] Error 1
> make[2]: *** [/root/ipset/kernel/net/netfilter] Error 2
> make[1]: *** [_module_/root/ipset/kernel/net] Error 2
> make[1]: Leaving directory `/usr/src/kernels/2.6.32-358.18.1.el6.x86_64'
> make: *** [modules] Error 2

That's because apparently ether_addr_equal was backported to 2.6.32-358.
As a quick fix, comment out the definition of ether_addr_equal in
kernel/include/linux/netfilter/ipset/ip_set_compat.h.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
