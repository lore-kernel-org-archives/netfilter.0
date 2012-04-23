From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Kernel panic with ipset 6.11
Date: Mon, 23 Apr 2012 23:49:40 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1204232347510.23601@blackhole.kfki.hu>
References: <jmni05$12j$1@dough.gmane.org> <alpine.DEB.2.00.1204190853050.30547@blackhole.kfki.hu> <CAJSTwE5EU5-W5PrPrEWuHNn+uNkipxTh9E2EO66sVJucY+M6rQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJSTwE5EU5-W5PrPrEWuHNn+uNkipxTh9E2EO66sVJucY+M6rQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Seblu <seblu@seblu.net>
Cc: netfilter@vger.kernel.org

On Mon, 23 Apr 2012, Seblu wrote:

> On Thu, Apr 19, 2012 at 9:10 AM, Jozsef Kadlecsik
> <kadlec@blackhole.kfki.hu> wrote:
> > No, definitely not. Did you use exactly the same kernel in both cases and
> > only the ipset binary was different?
> Same except architecture. Panic on i686 and error on x86_64.
> 
> You can find config file of i686 here:
> https://projects.archlinux.org/svntogit/packages.git/tree/trunk/config?h=packages/linux&id=316a5f1f9ae26763aa1b4d4ef694c938ec974345
> You can find config file of x86_64:
> https://projects.archlinux.org/svntogit/packages.git/tree/trunk/config.x86_64?h=packages/linux&id=316a5f1f9ae26763aa1b4d4ef694c938ec974345
> 
> >
> > If ipset.conf.0 is the file you attached, then that's absolutely strange,
> > because the set was to be created as
> Yes, config file is from example in man pages.
> 
> I tested in a vm and physical host and in both case panic on i686.
> 
> I tested again with a kernel 3.3.3
> # uname -a
> Linux archibal 3.3.3-1-ARCH #1 SMP PREEMPT Mon Apr 23 09:33:32 UTC
> 2012 i686 Intel(R) Core(TM) i7 CPU M 620 @ 2.67GHz GenuineIntel
> GNU/Linux
> # ipset restore < ipset/ipset.conf.0
> Connection to archibal closed.
> 
> Same issue (hash is full) with x86_64.
> 
> # ipset restore < /root/ipset/ipset.conf.0
> ipset v6.11: Error in line 1: Cannot open session to kernel.
> 
> I recompiled ipset 6.11 with gcc 4.6 and kernel doesn't panic anymore
> and works on x86_64.
> It's maybe not so simple, but kernel panic with ipset builded with gcc
> 4.7 and works correctly with gcc 4.6.
> 
> Previous kernel panic traceback don't help you? Do you need more information?

Could you recompile your kernel and ipset with gcc 4.7 and 
CFLAGS=-fno-optimize-strlen and re-run the test? Does it help?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
