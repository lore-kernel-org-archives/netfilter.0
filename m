From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: Error when IPRANGE used on 2.4 Kernel
Date: Thu, 6 Nov 2008 16:15:59 +0100 (CET)
Message-ID: <alpine.DEB.2.00.0811061615050.29399@aurora.sdinet.de>
References: <13c27d00811060625v7da1b917t37b0dd8a84c58f71@mail.gmail.com>  <alpine.DEB.2.00.0811061552340.29399@aurora.sdinet.de> <13c27d00811060704p70f36b48hfb87dbaeaddbf717@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <13c27d00811060704p70f36b48hfb87dbaeaddbf717@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karthik V <karthikv.vk@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 6 Nov 2008, Karthik V wrote:

> I agree with the stupid IP part...it was just for the mail. I did try
> quite a few IP addresses.
> 
> But on the comment about it not being part of 2.4. I assumed that
> iprange is patched when I received the following message:
> Error: iprange: Bad IP Address ..... Pretty sure it entered
> libipt_iprange: parse_iprange function.

I think this message just means that your userspace iptables tool 
supports iprange, and does not say anything about the kernel side.


> 
> -Karthik
> 
> On Thu, Nov 6, 2008 at 8:24 PM, Sven-Haegar Koch <haegar@sdinet.de> wrote:
> > On Thu, 6 Nov 2008, Karthik V wrote:
> >
> >> I am faced with a weird error for IPTABLES version 1.2.9 on 2.4
> >> kernel. The following command:
> >>
> >> iptables -A INPUT -m iprange --src-range 192.168.0.0-192.168.0.0 -j ACCEPT
> >>
> >> - fails on 2.4 Kernel with Error: No chain/target/match by that name.
> >>
> >> - But the same command is working on other systems with 2.6 kernel
> >> viz., Fedora Core 6 Desktop and OpenWRT router.
> >
> > I think kernel 2.4 just does not support -m iprange at all, unless you
> > patched it to your kernel tree yourself.
> >
> > Also the range '192.168.0.0-192.168.0.0' looks quite stupid to me, as
> > this is just one address.
> >
> > c'ya
> > sven
> >
> > --
> >
> > The Internet treats censorship as a routing problem, and routes around
> > it. (John Gilmore on http://www.cygnus.com/~gnu/)
> >
> 
> 
> 
> 

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around
it. (John Gilmore on http://www.cygnus.com/~gnu/)
