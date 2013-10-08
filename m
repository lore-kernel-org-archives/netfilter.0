From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset compile error
Date: Tue, 8 Oct 2013 10:29:03 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1310081008350.22464@blackhole.kfki.hu>
References: <5253A5F7.1090403@metu.edu.tr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5253A5F7.1090403@metu.edu.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Husnu Demir <hdemir@metu.edu.tr>
Cc: netfilter@vger.kernel.org

On Tue, 8 Oct 2013, Husnu Demir wrote:

> It is a working environment. I get the following error messages. Can
> anybody help me?
>
>  uname -a
> Linux neml 3.8.7 #2 SMP Mon Apr 15 14:09:02 EEST 2013 x86_64 GNU/Linux

The new kernel-compatibility checking part might missed something with 
this version, so...
 
> git clone  git://git.netfilter.org/ipset.git
> ./autogen.sh
> 
> make
> 
> configure: creating ./config.status

please include the output of the configure command too.
 
> ipset userspace tool configuration:
>     Dynamic module loading: disabled
>     Static modules:
>         ipset_bitmap_ip
>         ipset_bitmap_ipmac
>         ipset_bitmap_port
>         ipset_hash_ip
>         ipset_hash_ipport
>         ipset_hash_ipportip
>         ipset_hash_ipportnet
>         ipset_hash_net
>         ipset_hash_netiface
>         ipset_hash_netnet
>         ipset_hash_netport
>         ipset_hash_netportnet
>         ipset_list_set
>     Dynamic modules:
>  /bin/bash ./config.status
> config.status: creating Makefile
> config.status: creating include/libipset/Makefile
> config.status: creating lib/Makefile
> config.status: creating lib/libipset.pc
> config.status: creating src/Makefile
> config.status: creating
> kernel/include/linux/netfilter/ipset/ip_set_compat.h
> config.status: creating config.h
> config.status: config.h is unchanged
> config.status: executing depfiles commands
> config.status: executing libtool commands
> make  all-recursive
> make[1]: Entering directory `/usr/src/ipset'
> Making all in include/libipset
> make[2]: Entering directory `/usr/src/ipset/include/libipset'
> make[2]: Nothing to be done for `all'.
> make[2]: Leaving directory `/usr/src/ipset/include/libipset'
> Making all in lib
> make[2]: Entering directory `/usr/src/ipset/lib'
>   CC     ipset_bitmap_ip.lo
>   CC     ipset_bitmap_ipmac.lo
>   CC     ipset_bitmap_port.lo
>   CC     ipset_hash_ip.lo
>   CC     ipset_hash_ipport.lo
>   CC     ipset_hash_ipportip.lo
>   CC     ipset_hash_ipportnet.lo
>   CC     ipset_hash_net.lo
>   CC     ipset_hash_netnet.lo
>   CC     ipset_hash_netportnet.lo
>   CC     ipset_hash_netport.lo
>   CC     ipset_hash_netiface.lo
>   CC     ipset_list_set.lo
>   GEN    types_init.c
>   CC     data.lo
>   CC     errcode.lo
>   CC     icmp.lo
>   CC     icmpv6.lo
>   CC     mnl.lo
>   CC     parse.lo
>   CC     print.lo
>   CC     session.lo
>   CC     types.lo
>   CC     ui.lo
>   CC     types_init.lo
>   CCLD   libipset.la
> make  all-am
> make[3]: Entering directory `/usr/src/ipset/lib'
> make[3]: Nothing to be done for `all-am'.
> make[3]: Leaving directory `/usr/src/ipset/lib'
> make[2]: Leaving directory `/usr/src/ipset/lib'
> Making all in src
> make[2]: Entering directory `/usr/src/ipset/src'
>   CC     ipset.o
>   CC     ui.o
>   CCLD   ipset
> make[2]: Leaving directory `/usr/src/ipset/src'
> make[2]: Entering directory `/usr/src/ipset'
> make[2]: Leaving directory `/usr/src/ipset'
> make[1]: Leaving directory `/usr/src/ipset'
> 
> make modules
> ..
> ..
> /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c: In
> function ?hash_netnet4_kadt?:
> /usr/src/ipset/kernel/net/netfilter/ipset/ip_set_hash_netnet.c:141:
> error: unknown field ?cidr? specified in initializer

However this looks like a broken git tree at our side. Are you sure it's a 
fully syncronized/cloned git tree?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
