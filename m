From: "Alessandro Suardi" <alessandro.suardi@gmail.com>
Subject: Re: iptables is complaining with bogus unknown error 18446744073709551615
Date: Sat, 22 Apr 2006 02:05:12 +0200
Message-ID: <5a4c581d0604211705k6fa253at658fe8c321f1bc13@mail.gmail.com>
References: <a06230910c06e2510acfa@129.98.90.227> <20060421111530.GE5286@rama>
	 <a06230913c06e96f75f32@129.98.90.227>
	 <7c3341450604211126g7e431307q251f9ea49c0ebf91@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750774AbWDVAFP@vger.kernel.org>
In-Reply-To: <7c3341450604211126g7e431307q251f9ea49c0ebf91@mail.gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: nick@linicks.net
Cc: Maurice Volaski <mvolaski@aecom.yu.edu>, Harald Welte <laforge@netfilter.org>, linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org

On 4/21/06, Nick Warne <nick.warne@gmail.com> wrote:
> I also ask the same - this 'config' problem/option has been posted on
> the list previously, I believe.
>
> I was about to update my gateway box to 2.6.16.9 this weekend, and I
> do not build modules on that - so what do I need to do to ensure this
> xt_tcpudp is built in?
>
> Is '> make oldconfig' enough to pull this in?
>
> Nick

Hmm, let's see:

[asuardi@donkey src]$ grep tcpudp linux-2.6.17-rc1-git4/net/netfilter/Makefile
obj-$(CONFIG_NETFILTER_XTABLES) += x_tables.o xt_tcpudp.o

OK, I recall configuring this a while ago when still using FC3,
 as I was bitten too by iptables complaining with the bogus
 error code which I eventually tracked back to the XTABLES
 stuff (no - make oldconfig didn't do it for me and I had to go
 through the config options by hand enabling what I thought
 was useful). That was since...

[asuardi@donkey src]$ grep -i XTABLES /fc3/usr/src/.config-2.6.1[0-7]*
/fc3/usr/src/.config-2.6.15-git10:CONFIG_NETFILTER_XTABLES=m
/fc3/usr/src/.config-2.6.15-git11:CONFIG_NETFILTER_XTABLES=m
/fc3/usr/src/.config-2.6.16-rc1-git4:CONFIG_NETFILTER_XTABLES=m
/fc3/usr/src/.config-2.6.16-rc2-git7:CONFIG_NETFILTER_XTABLES=m

And without any special tricks, my bittorrent box (which also
 has peerguardian running) loads xt_tcpudp automatically,
 as it should be...

[asuardi@donkey src]$ lsmod
Module                  Size  Used by
xt_tcpudp               3200  0
iptable_filter          3072  1
ip_tables              13960  1 iptable_filter
x_tables               14468  2 xt_tcpudp,ip_tables
sd_mod                 18000  2
usb_storage            35588  1
scsi_mod              101064  2 sd_mod,usb_storage
floppy                 58052  0
ehci_hcd               30984  0
uhci_hcd               22792  0
psmouse                38280  0
parport_pc             28644  0
parport                26496  1 parport_pc
8139too                25920  0
8139cp                 21824  0

> On 21/04/06, Maurice Volaski <mvolaski@aecom.yu.edu> wrote:
> > Thank you for your reply.
> >
> > >Hi Maurice.
> > >
> > >Didn't you report this bug already to bugzilla.netfilter.org (and maybe
> > >eben to the bugme.osdl.org)?  Reporting a bug in three distinct places,
> > >even though it has been replied to at one place is not really going to
> > >use developer resources efficiently, don't you think?
> >
> > Sorry, to post it multiple times. Actually, two places netfilter and
> > then kernel bugzilla. I made the second report after it appeared
> > there'd would be no feedback to the first one and another kernel
> > revision had been issued with the problem still evident. (The first
> > feedback on the netfilter report crossed in the mail with the kernel
> > report.)
> >
> > >However, your problem seems to be something different.  I suspect that
> > >all rules with '-p tcp' or '-p udp' don't work, whereas others do.  You
> > >seem to be missing the xt_tcpudp.ko module, which implements that
> > >feature in 2.6.17-rcX kernels.
> >
> > Yep, that's it. How could one know that there is such a module called
> > xt_tcpudp.ko, especially since there is no corresponding config
> > option? Wouldn't up-to-date and complete documentation explain how to
> > set up the kernel config and indicate which modules should be loaded?
> >
> > On the other hand, shouldn't this module be loading automatically?

--alessandro

 "Dreamer ? Each one of us is a dreamer. We just push it down deep because
   we are repeatedly told that we are not allowed to dream in real life"
     (Reinhold Ziegler)
