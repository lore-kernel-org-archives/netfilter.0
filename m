From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Kernel panic with ipset 6.11
Date: Thu, 26 Apr 2012 09:51:31 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1204260949570.32237@blackhole.kfki.hu>
References: <jmni05$12j$1@dough.gmane.org> <alpine.DEB.2.00.1204190853050.30547@blackhole.kfki.hu> <CAJSTwE5EU5-W5PrPrEWuHNn+uNkipxTh9E2EO66sVJucY+M6rQ@mail.gmail.com> <alpine.DEB.2.00.1204232347510.23601@blackhole.kfki.hu>
 <CAJSTwE7dmbf8y7oB8hVLRHneEOYtq9ySMnM=Gg6mqpoSXC=LPg@mail.gmail.com> <alpine.DEB.2.00.1204242211490.26110@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1204242211490.26110@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Seblu <seblu@seblu.net>
Cc: netfilter@vger.kernel.org

On Tue, 24 Apr 2012, Jozsef Kadlecsik wrote:

> On Tue, 24 Apr 2012, Seblu wrote:
> 
> > On Mon, Apr 23, 2012 at 11:49 PM, Jozsef Kadlecsik
> > <kadlec@blackhole.kfki.hu> wrote:
> > > On Mon, 23 Apr 2012, Seblu wrote:
> > >> On Thu, Apr 19, 2012 at 9:10 AM, Jozsef Kadlecsik
> > >> Previous kernel panic traceback don't help you? Do you need more information?
> > >
> > > Could you recompile your kernel and ipset with gcc 4.7 and
> > > CFLAGS=-fno-optimize-strlen and re-run the test? Does it help?
> > 
> > Kernel 3.3.2 and ipset recompiled with gcc 4.7 and 
> > CFLAGS=-fno-optimize-strlen. Same panic on i686.
> 
> Thanks - it seems I have to get gcc 4.7 installed on my machine then.

With gcc 4.7 I was able to reproduce the problem - now what remains is to 
fix the issue ;-).

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
