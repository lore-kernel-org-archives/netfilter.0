From: "John Paul" <john@pinoylinux.sytes.net>
Subject: Re: Nat problem with GRE (Solved!)
Date: Wed, 4 Jun 2003 18:14:17 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003101c32a82$0ec78e20$fd00a8c0@homes>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D9F@wardrive.citadelcomputer.com.au> <005901c32a2d$c661d0e0$fd00a8c0@homes> <1054714668.454.3.camel@xbox>
Reply-To: "John Paul" <john@pinoylinux.sytes.net>
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
To: Filip Sneppe <filip.sneppe@cronos.be>
Cc: George Vieira <georgev@citadelcomputer.com.au>, Esteban <esteban@alstec.fr>, netfilter@lists.netfilter.org

Thanks to those who responded to this email. What i did actually is;

1. patched the kernel with ip_pptp_* P.O.M. (KERNEL_DIR=/usr/src/linux
./runme bla bla bla)
2. recompile iptables (source)
3. recompile the kernel (make menuconfig; make dep; make bzImage, make
modules; make modules_install)
4. reboot machine

viola! works like a charm.

cheers!


----- Original Message -----
From: "Filip Sneppe" <filip.sneppe@cronos.be>
To: "John Paul" <john@pinoylinux.sytes.net>
Cc: "George Vieira" <georgev@citadelcomputer.com.au>; "Esteban"
<esteban@alstec.fr>; <netfilter@lists.netfilter.org>
Sent: Wednesday, June 04, 2003 4:17 PM
Subject: Re: Nat problem with GRE


> On Wed, 2003-06-04 at 02:10, John Paul wrote:
> > George, et al.
> >
> > I actually have the same problem. I successfully patched my
kernel(2.4.20)
> > with ip_pptp_conntrack (P-O-M) but after recompiling my kernel, iptables
> > doesnt recognize  NAT  anymore. How could this happen?
> >
> Hi,
>
> Recompile your iptables userspace program against those
> patched kernel sources & reinstall it.
>
> Regards,
> Filip
>
>


