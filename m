From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Can I add a module to a prebuilt kernel?
Date: Thu, 3 Jun 2004 09:52:26 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406030949440.10743-100000@blackhole.kfki.hu>
References: <20040602190641.GQ18797@wellnow.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040602190641.GQ18797@wellnow.com>
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
To: Jeff Gordon <jeff.gordon@wellnow.com>
Cc: netfilter@lists.netfilter.org

On Wed, 2 Jun 2004, Jeff Gordon wrote:

> > Jeff Gordon wrote:
> > > I'm running a RH ES 3 system, and it appears _support_ for ipt_recent
> > > is included in the kernel but libipt_recent.so is nowhere to be found.
> > > Kernel source for the prebuilt kernel in the distribution is available.
> >
> > In general, if a kernel feature is built into the kernel there is no
> > appropriate module file. Because the functionality is in the kernel.
>
>  - If I do 'modprobe ipt_recent' and then 'lsmod |grep ip',
>    I see 'ipt_recent' at the top of listing.
>
>  - However, if I then add a rule with '-m recent' in it,
>    iptables complains it can't find libipt_recent.so.

That's the iptables shared library for recent match, which is missing from
your systems. In other words the iptables binary lacks the recent match
support and thus you cannot use the feature available in the kernel.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


