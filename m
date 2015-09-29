From: Nikolay Borisov <n.borisov@siteground.com>
Subject: Using ipset 6.26 with kernel 3.12.47
Date: Tue, 29 Sep 2015 18:04:20 +0300
Message-ID: <560AA874.1000400@siteground.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org
Cc: "Ivan.K" <ivan.k@siteground.com>, SiteGround Operations <operations@siteground.com>

Hello,

I'd like to have ipset with net namespace support and to have that I
need at least ipset 6.20. I'm using the latest public release 6.26 and
when I try to compile it against kernel 3.12.47 I get the following
error when compiling the em_ipset.c:

/home/projects/ipset-6.26/kernel/net/sched/em_ipset.c: In function
=E2=80=98em_ipset_match=E2=80=99:
/home/projects/ipset-6.26/kernel/net/sched/em_ipset.c:116: error:
=E2=80=98struct tcf_ematch=E2=80=99 has no member named =E2=80=98net=E2=
=80=99
make[3]: *** [/home/projects/ipset-6.26/kernel/net/sched/em_ipset.o] Er=
ror 1

Isn't the ipset supposed to be cleanly compilable against any kernel
which is >=3D 2.6.32 (according to http://ipset.netfilter.org/install.h=
tml) ?

Basically the 'net' member of the 'struct tcf_ematch' has been
introduced in kernel 3.18 in
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D82a470f1119eb7d2e4941b915bf9cd6fd8d54494


which is not easily backportable to 3.12 since it carries dependencies
of its own. So what would be the easiest way to get net namespace
support for ipset for kernel 3.12?


On a slightly different note I also get multiple warnings of the
following form I know it is not critical but I guess there is a bug
since the RCU_INIT_POINTER is not recognised from rcupdate:

In file included from
/home/projects/ipset-6.26/kernel/net/netfilter/ipset/ip_set_getport.c:2=
4:
/home/projects/ipset-6.26/kernel/include/linux/netfilter/ipset/ip_set_c=
ompat.h:78:1:
warning: "RCU_INIT_POINTER" redefined
In file included from include/linux/srcu.h:33,
                 from include/linux/notifier.h:15,
                 from
/home/projects/linux-stable/arch/x86/include/asm/uprobes.h:26,
                 from include/linux/uprobes.h:35,
                 from include/linux/mm_types.h:14,
                 from include/linux/kmemcheck.h:4,
                 from include/linux/skbuff.h:18,
                 from include/linux/ip.h:20,
                 from
/home/projects/ipset-6.26/kernel/net/netfilter/ipset/ip_set_getport.c:1=
4:
include/linux/rcupdate.h:949:1: warning: this is the location of the
previous definition

Regards,
Nikolay


