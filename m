From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Using ipset 6.26 with kernel 3.12.47
Date: Tue, 29 Sep 2015 21:13:07 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1509292108340.8315@blackhole.kfki.hu>
References: <560AA874.1000400@siteground.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <560AA874.1000400@siteground.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikolay Borisov <n.borisov@siteground.com>
Cc: netfilter@vger.kernel.org, "Ivan.K" <ivan.k@siteground.com>, SiteGround Operations <operations@siteground.com>

On Tue, 29 Sep 2015, Nikolay Borisov wrote:

> I'd like to have ipset with net namespace support and to have that I
> need at least ipset 6.20. I'm using the latest public release 6.26 and
> when I try to compile it against kernel 3.12.47 I get the following
> error when compiling the em_ipset.c:
> 
> /home/projects/ipset-6.26/kernel/net/sched/em_ipset.c: In function
> ?em_ipset_match?:
> /home/projects/ipset-6.26/kernel/net/sched/em_ipset.c:116: error:
> ?struct tcf_ematch? has no member named ?net?
> make[3]: *** [/home/projects/ipset-6.26/kernel/net/sched/em_ipset.o] Error 1

em_ipset.c is for "tc".

> Isn't the ipset supposed to be cleanly compilable against any kernel
> which is >= 2.6.32 (according to http://ipset.netfilter.org/install.html) ?

The ipset package aims to support all kernels from 2.6.32 upwards, which 
is not an easy task. I'll tune this part further.

> Basically the 'net' member of the 'struct tcf_ematch' has been
> introduced in kernel 3.18 in
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=82a470f1119eb7d2e4941b915bf9cd6fd8d54494
>  
> which is not easily backportable to 3.12 since it carries dependencies
> of its own. So what would be the easiest way to get net namespace
> support for ipset for kernel 3.12?

If you don't need ipset matching from "tc", then you can already use all 
the other compiled modules.

> On a slightly different note I also get multiple warnings of the
> following form I know it is not critical but I guess there is a bug
> since the RCU_INIT_POINTER is not recognised from rcupdate:
> 
> In file included from
> /home/projects/ipset-6.26/kernel/net/netfilter/ipset/ip_set_getport.c:24:
> /home/projects/ipset-6.26/kernel/include/linux/netfilter/ipset/ip_set_compat.h:78:1:
> warning: "RCU_INIT_POINTER" redefined
> In file included from include/linux/srcu.h:33,
>                  from include/linux/notifier.h:15,
>                  from
> /home/projects/linux-stable/arch/x86/include/asm/uprobes.h:26,
>                  from include/linux/uprobes.h:35,
>                  from include/linux/mm_types.h:14,
>                  from include/linux/kmemcheck.h:4,
>                  from include/linux/skbuff.h:18,
>                  from include/linux/ip.h:20,
>                  from
> /home/projects/ipset-6.26/kernel/net/netfilter/ipset/ip_set_getport.c:14:
> include/linux/rcupdate.h:949:1: warning: this is the location of the
> previous definition

Thanks for reporting the issues.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
