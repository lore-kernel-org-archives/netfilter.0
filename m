From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: linux-2.6.9-rc1 compilation and configuration issue (fwd)
Date: Wed, 08 Sep 2004 15:46:24 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <413F6FA0.7020407@pbl.ca>
References: <200409072333.i87NXJZA012251@bassett.home.org>	<413F12D1.3050108@pbl.ca>	<1094665198.23966.21.camel@nostromo.bgsecm.com>	<413F4E20.9040807@pbl.ca>	<1094667545.11117.30.camel@nostromo.bgsecm.com>	<413F56CB.2090509@pbl.ca>
	<1094672264.23966.37.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094672264.23966.37.camel@nostromo.bgsecm.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Jose Maria Lopez wrote:
> But then we won't have so many upgrades in the kernel, and some of
> this upgrades are needed, because some of them are for bugs. What
> does Sun do when they found a bug in the kernel? They probably give
> their customers a kernel upgrade. The same can be said for Linux, but
> with more frequent upgrades. You have to choose, having stability in
> the kernel structures to have third party modules easy to deliver or
> having new features more frequently.

Sun produces a patch for a bug that doesn't break existing third party 
modules (and, usually, same is true for Linux).  And it doesn't require 
you to recompile any third party modules after you install it.  Sun 
kernel patches include the kernel core itself, and if bugs were in 
modules, it also includes the modules that need to be patched (for bugs, 
not for changes in kernel core).

As for the other issue, in production environment I'd choose stability 
over bleeding edge features anytime.  Updating kernel on my home machine 
is one thing (if something gets screwed up, no web surfing for one 
afternoon, big deal).  Updating tens or hundreds or thousands of 
production machines is something completely different.  Anyhow, what I 
was aruging is that since SunOS is closed source, they were forced to do 
modularization of kernel "the right way".  Linux being open source had 
freedom of not doing it the right way (well, from developers perspective 
it might be also called the right way, but not from the end-user's 
perspective).  And Linux abused that freedom...  So now, instead of just 
getting tcp_windows_trackign.c, compiling against linux26 kernel header 
files (that would be static for entire 2.6.x tree) and dropping 
resulting tcp_window_tracking.ko into /lib/kernel26/net/ipv4/netfilter 
(with kernel26 being shared by all 2.6.x kernels), I need to recompile 
and reinstall entire damn kernel.  Not to mention downloading the entire 
kernel source that I really don't need...

In SunOS/Solaris world, Netfilter developers would be forced to use that 
approach/design.  In Linux world they unfortunately had Linux source 
code available ;-)

The way it is now, I first need to discover to which kernel version I 
can actually apply tcp_window_tracking patch.  Tried several, failed on 
all of them.  At the end I just gave up, and am waiting for stable 
kernel that will have it already applied...  Darn...

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

