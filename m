From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip_conntrack_tcp Errors - backing a patch
Date: Wed, 30 Jun 2004 14:58:48 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406301444380.25868-100000@blackhole.kfki.hu>
References: <1088587533.13926.332.camel@spudgun.dhcp.internal>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088587533.13926.332.camel@spudgun.dhcp.internal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeni Vachkov <evgeni.vachkov@investis.com>
Cc: netfilter@lists.netfilter.org

On 30 Jun 2004, Evgeni Vachkov wrote:

> On Mon, 2004-06-28 at 13:30, Dimitar Katerinski wrote:
> > > Is that a problem with conntrack and its tunning or I am missing some
> > > patch? ...Or perhaps it is some other problem with other parts of the
> > > kernel?
> > My advice is if you have applied this patch, to remove it, and test the load on the
> > firewall again.
>
> I would like to remove the patch, but unfortunately the person who
> compiled last time didnt leave the code.

That's bad: with pom-ng, you can remove installed patches as well.

> Would it be possible to compile the relevent modules only (is it
> conntrack only?) from scratch and to insmod them into the kernel?

Download the kernel source code and compile it, that's all. If there were
other pom-ng patches applied, figure out which one are required in your
setup and apply them before compiling the kernel.

> Or there are parts of the kernel that I would need to recompile?

Because you want to leave out the TCP window tracking patch, therefore no.
In the case of other way around, because the patch requires a new feature
in the networking stack, you'd need to recompile (and install) the whole
kernel.

> In ideal situation I'd like to have a few versions of the conntrack (and
> other related?) and be able to insmod them on the fly.

Usually it's doable, sometimes it's not. You have to know on which
services offered by the networking core do the given patches depend.
You can find the relevant info in the pom-ng info files, but otherwise
it's not documented.

> Also can I just rmmod the conntrack module or I need to unload iptables
> and all the rest before I can insmod the new ones?

You can rmmod ip_conntrack anytime with the price of losing the conntrack
info.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary



