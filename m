From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: [ANNOUNCEMENT] ipset-3.1
Date: Fri, 21 Aug 2009 16:08:59 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0908211537020.6879@blackhole.kfki.hu>
References: <alpine.DEB.2.00.0908182049460.3452@blackhole.kfki.hu> <000b01ca2175$ed66fbc0$c834f340$@info>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000b01ca2175$ed66fbc0$c834f340$@info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@vger.kernel.org

Hi Rob,

On Thu, 20 Aug 2009, Rob Sterenborg wrote:

> > Hello,
> > 
> > I'm happy to announce ipset release 3.1. A few minor bugs were
> > fixed and some cleanups added:
> 
> I'm a few errors when compiling this version on Centos 5.3, kernel
> 2.6.18-128.4.1.el5.centos.plus-i686.
> 
> /usr/local/src/ipset/ipset-3.1/kernel/ip_set_iptree.c: In function
> 'iptree_create':
> /usr/local/src/ipset/ipset-3.1/kernel/ip_set_iptree.c:285: warning:
> format '%lu' expects type 'long unsigned int', but argument 2 has type
> 'unsigned int'
> /usr/local/src/ipset/ipset-3.1/kernel/ip_set_iptree.c:285: warning:
> format '%zu' expects type 'size_t', but argument 3 has type 'long
> unsigned int'
> 
> When I switched arguments 2 and 3 for function ip_set_printk(),these
> errors are gone.

I could not catch that when compiling/testing the new release. But 
you're right, the formats (or the arguments) are mixed up.
 
> > - Fix the definition of 'bool' for kernels <= 2.6.18 (Jan
> > Engelhardt)
> 
> This also generates an error for me.
> 
> /usr/local/src/ipset/ipset-3.1/kernel/ip_set_setlist.c:20: error:
> redefinition of typedef 'bool'
> include/linux/types.h:36: error: previous declaration of 'bool' was here
> /usr/local/src/ipset/ipset-3.1/kernel/ip_set_setlist.c:21: error:
> redeclaration of enumerator 'false'
> include/linux/stddef.h:16: error: previous definition of 'false' was
> here
> /usr/local/src/ipset/ipset-3.1/kernel/ip_set_setlist.c:21: error:
> redeclaration of enumerator 'true'
> include/linux/stddef.h:18: error: previous definition of 'true' was here
> 
> When I changed <= into < it compiled fine.

Hm, 2.6.18 was released at Sep 19 2006 and the generic boolean type was 
added at Sep 30 2006. So it seems to me as a centos kernel issue.

For the time being, the best for me to avoid using bool then.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
