From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.16.1 released
Date: Thu, 10 Jan 2013 10:16:47 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1301101008570.11247@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1211271510180.15929@blackhole.kfki.hu> <20130109134804.GL31644@workstation> <alpine.DEB.2.00.1301092342440.10144@blackhole.kfki.hu> <alpine.LNX.2.01.1301100011360.21351@nerf07.vanv.qr> <20130110090725.GP31644@workstation>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130110090725.GP31644@workstation>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Herz <andi@geekosphere.org>
Cc: Jan Engelhardt <jengelh@inai.de>, netfilter@vger.kernel.org

On Thu, 10 Jan 2013, Andreas Herz wrote:

> On 10/01/13 at 00:12, Jan Engelhardt wrote:
> > 
> > On Wednesday 2013-01-09 23:44, Jozsef Kadlecsik wrote:
> > >-			KCFLAGS="-DPACKAGE_VERSION=$(PACKAGE_VERSION)" \
> > >+			KCFLAGS="-DPACKAGE_VERSION=$(PACKAGE_VERSION)-DINLINE=$(INLINE)" \
> > 
> > You seem to be missing a space before -DINL
> 
> I also changed this in the patch, but still:
> 
> /usr/src/redhat/BUILD/ipset-6.16.1/kernel/include/linux/netfilter/ipset/ip_set_ahash.h:
> In function `hash_ip4_add':
> /usr/src/redhat/BUILD/ipset-6.16.1/kernel/include/linux/netfilter/ipset/ip_set_ahash.h:444:
> sorry, unimplemented: inlining failed in call to 'hash_ip4_data_next':
> function body not available
> /usr/src/redhat/BUILD/ipset-6.16.1/kernel/include/linux/netfilter/ipset/ip_set_ahash.h:485:
> sorry, unimplemented: called from here

So in the generated config.h you can find the next, right?

/* Inline in prototype supported. */
#define INLINE_IN_PROTOTYPE 1

> Don't bother too much, as i can build it on another machine, but i'm
> curious why it won't work and how it should be fixed.

The old gcc does not accept the "inline" keyword in the function 
prototype. The patch attempted to detect it and depending on the result, 
the keyword is used or not.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
