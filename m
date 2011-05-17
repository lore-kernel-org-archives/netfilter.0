From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset, IP6_NF_IPTABLES
Date: Tue, 17 May 2011 19:25:07 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105171923540.1798@blackhole.kfki.hu>
References: <ffc7edfebc6396f9754b6327b0523d27@visp.net.lb> <alpine.DEB.2.00.1105171831430.1545@blackhole.kfki.hu> <64614d657f8b9c38d783b2e2ecea1fc0@visp.net.lb>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <64614d657f8b9c38d783b2e2ecea1fc0@visp.net.lb>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denys Fedoryshchenko <denys@visp.net.lb>
Cc: netfilter@vger.kernel.org

On Tue, 17 May 2011, Denys Fedoryshchenko wrote:

> On Tue, 17 May 2011 18:34:34 +0200 (CEST), Jozsef Kadlecsik wrote:
> > On Tue, 17 May 2011, Denys Fedoryshchenko wrote:
> > 
> > > I am using IPv4-only kernel, and getting
> > > "The kernel build directory /lib/modules/2.6.39-rc7-git4-devel2/build is
> > > not
> > > configured with IP6_NF_IPTABLES support"
> > > while compiling latest ipset 6.5 (and previous version 6.4 too)
> > > Is there any way to compile ipset without IPv6?
> > 
> > Could you write down exactly what do you do, which results in the message
> > above?
> > 
> > I disabled IPv6 in the kernel source tree (not exactly the same one as
> > yours) and running "make modules" in the ipset source tree ran without any
> > error message.
> > 
> libmnl-1.0.1 installed
> 
> wget http://ipset.netfilter.org/ipset-6.5.tar.bz2
> tar jxf ipset-6.5.tar.bz2
> cd ipset-6.5
> ./autogen.sh
> ./configure
> checking build system type... i686-pc-linux-gnu
> checking host system type... i686-pc-linux-gnu
> checking for a BSD-compatible install... /usr/bin/install -c
> checking whether build environment is sane... yes
> checking for a thread-safe mkdir -p... /bin/mkdir -p
> checking for gawk... gawk
> checking whether make sets $(MAKE)... yes
> checking for grep that handles long lines and -e... /bin/grep
> configure: error: The kernel build directory
> /lib/modules/2.6.39-rc7-git4-devel2/build is not configured with
> IP6_NF_IPTABLES support (ip6tables)

Ahh, thanks. That's an outdated checking in configure, I remove it.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
