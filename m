From: Dean Anderson <dean@av8.com>
Subject: Re: (no subject)
Date: Mon, 7 Feb 2005 19:10:09 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0502071858340.1540-100000@localhost.localdomain>
References: <45847.142.169.215.10.1107786429.squirrel@142.169.215.10>
Mime-Version: 1.0
In-Reply-To: <45847.142.169.215.10.1107786429.squirrel@142.169.215.10>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Jean <sj-netfilter@cookinglinux.org>
Cc: netfilter@lists.netfilter.org

On Mon, 7 Feb 2005, Samuel Jean wrote:
> > These patches were distributed by openwrt to be applied against the
> > linksys kernel:  The first one is pretty substantial.
> >
> > wc 100-revert_netfilter.patch
> >    5834   22128  179845 100-revert_netfilter.patch
> > wc 110-conntrack_setting.patch
> >      20      67     715 110-conntrack_setting.patch
> 
> Those are not from patch-o-matic, aren't they ?
> 
> Those are patches i've never heard of. They aren't part of netfilter
> (I guess) and obviously no warranty they will apply cleanly.

They aren't "official" patches. They look like the results of a previous
application of patch-o-matic.  After they were applied, further "official"
patches from patch-o-matic failed.

So, that was the cause for my question, where do I get "clean file" 
versions of netfilter. Patches are relative to something.

> >
> > I'm not sure what the openwrt folks and/or linksys was thinking with
> > these...  They worked on earlier versions of the linksys kernel... I
> > suspect a distribution/versioning problem caused by the netfilter group.
> 
> Because of the constant evolution with netfilter, the only things they care
> are :
> 
> o Keep compatibility with iptables userspace
> o Keep in-kernel modules synced with new netfilter behaviour.
> o And once this is done, some start syncing Patch-O-Matic patches,
>   which aren't official to Linux but official to Netfilter.
> 
> There's no precaution to keep compatibility with 3rd parties.

There doesn't appear to be any third party modifications except for 
previous applications of netfilter patches by those parties.

Neither openwrt nor linksys have any apparent interest in modifying 
netfilter. They just wanted to turn on some "extra" netfilter patches. 
After that, things are busted and there isn't any way to fix them.

Thats why you need to produce the kernel modules as complete files that 
are __copied__ and compiled.  Patches are insufficent.

> > There is very little documentation on the netfilter site about how the
> > netfilter kernel modules should get updated.
> 
> Official netfilter kernel modules are part of the linux kernel itself.
> That means, no kernel update, no netfilter update.

Thats just insane. Why have loadable modules or a kernel hooks interface 
if you are going to tie tightly to kernel versions?

> Again, Netfilter Linux kernel modules are distributed with Linux kernel.
> KIM, netfilter is a total part of the Linux kernel.

This needs to change then. Either that, or the kernel needs to start
including iptables source code as well, and it also needs to be __well__
documented that the iptables version can't be changed---it is tied to the
kernel version.

Probably this is the source of the confusion.

-- 
Av8 Internet   Prepared to pay a premium for better service?
www.av8.net         faster, more reliable, better service
617 344 9000   



