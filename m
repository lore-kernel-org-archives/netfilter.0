From: "Nicolas Ross" <rossnick-lists@cybercat.ca>
Subject: Re: Patch-o-matic : pptp connection tracking and Kernel 2.4.19
Date: Wed, 21 Jul 2004 10:29:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01ce01c46f2f$253df520$1a07a8c0@civic2k>
References: <01df01c46b6d$7d9a5490$1a07a8c0@civic2k> <200407162100.26975.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

> > I want to use the pptp_conntrack patch from the patch-o-matic extra
> > repository.
> >
> > If I use the kernel 2.4.24, it compiles great, but for some reason, I am
> > stuck on using the 2.4.19 kernel. But the patch fails on 2.4.19.
> >
> > Does anyone can help me make this patch work with 2.4.19 ?
>
> You will probably have to go back to an older version of p-o-m for such an
old
> kernel (August 2002!).   I'm not sure if there is an obvious archive of
old
> p-o-m versions.
>
> I would instead recommend finding out why you seem to be stuck with such
an
> outdated kernel and update that, as you will need to do so sooner or later
> anyway.
>
> Even 2.4.24 is six months old now.

Hi,

I compiled and re-compiled my 2 kernels (2.4.24 and 2.4.19), and I will be
stucked with 2.4.19.

The reason for that is that I have to use a binary modules (not gpl). I have
to use a specific version of that module that comes only for 2.4.19. I have
compatibility issue with more recent version of this module that comes for
up to 2.4.24.

That module is mandatory and is the purpose of the machine I am building. It
is a bandwith management tool.

I tried checking out old version of the p-o-m CVS, with no luck. I'll try
contacting the author of the pptp patch...

Thanks anyway !

Nicolas


