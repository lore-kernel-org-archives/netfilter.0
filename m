From: Jeff Gordon <jeff.gordon@wellnow.com>
Subject: Re: Can I add a module to a prebuilt kernel?
Date: Wed, 2 Jun 2004 15:06:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040602190641.GQ18797@wellnow.com>
References: <20040602073846.GO18797@wellnow.com> <40BE09B2.90501@web.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <40BE09B2.90501@web.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Jun 02, 2004 at 07:09:06PM +0200, Florian Boelstler wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> Jeff Gordon wrote:
> > I'm running a RH ES 3 system, and it appears _support_ for ipt_recent
> > is included in the kernel but libipt_recent.so is nowhere to be found.
> > Kernel source for the prebuilt kernel in the distribution is available.
> 
> In general, if a kernel feature is built into the kernel there is no
> appropriate module file. Because the functionality is in the kernel.


(Thanks, Florian. :-)  Here's what I'm seeing:

 - If I do 'modprobe ipt_recent' and then 'lsmod |grep ip',
   I see 'ipt_recent' at the top of listing.
 
 - However, if I then add a rule with '-m recent' in it,
   iptables complains it can't find libipt_recent.so.


> > Is there a simple way to build ipt_recent from source and have it
> > function with this kernel, without compiling a kernel from scratch?
> 
> I never tried it, but if you got an appropriate kernel config for your
> running kernel you could start by "make modules && make modules_install"
> (regarding 2.4.x series)
> 
> This only works of course if
> - - you just miss the module file
> - - it is _not_ build into the kernel
> - - and your kernel is prepared to load that feature through a module


I guess I don't know. :-)  The result of 'modprobe' seems to suggest
the kernel understands what I'm saying -- but iptables expects to find
a loadable file that isn't present.  Should I be thinking to leave the
kernel as-is but compile iptables itself from scratch...?  Details:

iptables v1.2.8

/lib/modules/2.4.21-15.ELsmp/kernel/net/ipv4/netfilter/ipt_recent.o

...but no /lib/iptables/libipt_recent.so

> Good luck,

(Thanks. :-)

-- 

 -- Jeff --   <http://www.wellnow.com>

 "There's nothing left in the world to prove.  All that's worth doing
  is to love one another, using whatever means are available to serve."

