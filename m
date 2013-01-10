From: Andreas Herz <andi@geekosphere.org>
Subject: Re: [ANNOUNCE] ipset 6.16.1 released
Date: Thu, 10 Jan 2013 10:55:40 +0100
Message-ID: <20130110095540.GT31644@workstation>
References: <alpine.DEB.2.00.1211271510180.15929@blackhole.kfki.hu>
 <20130109134804.GL31644@workstation>
 <alpine.DEB.2.00.1301092342440.10144@blackhole.kfki.hu>
 <alpine.LNX.2.01.1301100011360.21351@nerf07.vanv.qr>
 <20130110090725.GP31644@workstation>
 <alpine.DEB.2.00.1301101008570.11247@blackhole.kfki.hu>
 <20130110092619.GQ31644@workstation>
 <alpine.DEB.2.00.1301101044250.11492@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1301101044250.11492@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Jan Engelhardt <jengelh@inai.de>, netfilter@vger.kernel.org

On 10/01/13 at 10:46, Jozsef Kadlecsik wrote:
> On Thu, 10 Jan 2013, Andreas Herz wrote:
> 
> > On 10/01/13 at 10:16, Jozsef Kadlecsik wrote:
> > > On Thu, 10 Jan 2013, Andreas Herz wrote:
> > > 
> > > > On 10/01/13 at 00:12, Jan Engelhardt wrote:
> > > > > 
> > > > > On Wednesday 2013-01-09 23:44, Jozsef Kadlecsik wrote:
> > > > > >-			KCFLAGS="-DPACKAGE_VERSION=$(PACKAGE_VERSION)" \
> > > > > >+			KCFLAGS="-DPACKAGE_VERSION=$(PACKAGE_VERSION)-DINLINE=$(INLINE)" \
> > > > > 
> > > > > You seem to be missing a space before -DINL
> > > > 
> > > > I also changed this in the patch, but still:
> > > > 
> > > > /usr/src/redhat/BUILD/ipset-6.16.1/kernel/include/linux/netfilter/ipset/ip_set_ahash.h:
> > > > In function `hash_ip4_add':
> > > > /usr/src/redhat/BUILD/ipset-6.16.1/kernel/include/linux/netfilter/ipset/ip_set_ahash.h:444:
> > > > sorry, unimplemented: inlining failed in call to 'hash_ip4_data_next':
> > > > function body not available
> > > > /usr/src/redhat/BUILD/ipset-6.16.1/kernel/include/linux/netfilter/ipset/ip_set_ahash.h:485:
> > > > sorry, unimplemented: called from here
> > > 
> > > So in the generated config.h you can find the next, right?
> > > 
> > > /* Inline in prototype supported. */
> > > #define INLINE_IN_PROTOTYPE 1
> > 
> > Yes this part is in the config.h
> 
> OK, let's give one more try. Could you remove the previous one and try the 
> next one? (I don't have access to the given gcc version, so I cannot check 
> it myself.)

Same error message. But with your patch i will work on it and see if i
can update the patch to make it work.

Thanks!

-- 
Andreas Herz
