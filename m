From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: linux-2.6.9-rc1 compilation and configuration issue (fwd)
Date: 08 Sep 2004 21:37:45 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094672264.23966.37.camel@nostromo.bgsecm.com>
References: <200409072333.i87NXJZA012251@bassett.home.org>
	<413F12D1.3050108@pbl.ca>
	<1094665198.23966.21.camel@nostromo.bgsecm.com>
	<413F4E20.9040807@pbl.ca>
	<1094667545.11117.30.camel@nostromo.bgsecm.com>
	<413F56CB.2090509@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <413F56CB.2090509@pbl.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El mié, 08 de 09 de 2004 a las 21:00, Aleksandar Milivojevic escribió:
> Jose Maria Lopez wrote:
> [snip]
> > there are things simply impossible.
> 
> Impossible? There's no such thing ;-)
> 
> > I don't see the difference with Solaris. If you want to upgrade your
> > Solaris you have to apply a lot of upgrades, also to the kernel. That's
> > the impression I have from the little contact I had with Solaris.
> 
> Not really.  Solaris (well, SunOS actually) has "disadvantage" of being 
> closed-source.  So Sun had to publish API and document data structures 
> garanteed not to change in set period of time (as defined in Solaris 
> device driver development guides).  That allows for a third party to 
> provide loadable kernel module that works with current version of 
> Solaris kernel (both generic and patched), and possibly future versions 
> of Solaris kernel (up to some point).  Of course, if developer doesn't 
> wonder into the undocumented land ;-)  More than once I used kernel 
> module compiled for previous version of Solaris (one was driver for 
> Sun's unfortunate BigMac ethernet card, don't remember exatly what the 
> others were).
> 

The same can be said for the Linux kernel, for a version of the kernel
you can have binary modules given by any vendor. The kernel structures
doesn't change much between the same kernel tree. Normally a distributor
can give source code for a kernel module that can be compiled for any
of the versions of the same kernel tree. One example of this is VMWare
and the kernel modules it needs, they give you some compiled binary
modules for some kernel versions, and the source code that can be
compiled.

> If there was such a thing in Linux kernel, bringing some of the new 
> features might be a bit slower and harder task for core Linux developers 
> (you can't just change that function call, or data structure), but on 
> the other hand some of the "impossible" to implement features would 
> become "possible"...
> 

But then we won't have so many upgrades in the kernel, and some of
this upgrades are needed, because some of them are for bugs. What
does Sun do when they found a bug in the kernel? They probably give
their customers a kernel upgrade. The same can be said for Linux, but
with more frequent upgrades. You have to choose, having stability in
the kernel structures to have third party modules easy to deliver or
having new features more frequently.

> Becoming way off topic, anyhow...
-- 
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPAÑA

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


