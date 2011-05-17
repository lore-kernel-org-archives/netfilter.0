From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset, IP6_NF_IPTABLES
Date: Tue, 17 May 2011 18:31:34 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105171830100.1545@blackhole.kfki.hu>
References: <ffc7edfebc6396f9754b6327b0523d27@visp.net.lb> <alpine.DEB.2.00.1105171000560.31927@blackhole.kfki.hu> <4DD256F7.7050007@googlemail.com> <fbc9abc624824c8e6f973c342e81fe51@visp.net.lb> <alpine.DEB.2.00.1105171325180.31927@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1105171325180.31927@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denys Fedoryshchenko <denys@visp.net.lb>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, netfilter@vger.kernel.org

On Tue, 17 May 2011, Jozsef Kadlecsik wrote:

> On Tue, 17 May 2011, Denys Fedoryshchenko wrote:
> 
> > On Tue, 17 May 2011 12:07:35 +0100, Mr Dash Four wrote:
> > > > No, that's not possible. ipset needs the IPv6 support in the kernel.
> > > >   That can't be accurate - I have administratively disabled IPv6 on my
> > > > system (both via sysctl as well as via the kernel command line)  - and
> > > > ipset 6.5 runs just fine. I am not using any IPv6 sets though so that
> > > > might be the reason why it is not complaining.
> > 
> > Well, i compile ipset on host with ipv6 enabled kernel, and just copied to
> > host without ipv6. It is seems problem only during compilation i guess
> > (headers?), and it is not right IMO.
> > Especially it is a problem for source based distributions, like gentoo,
> > because i cannot compile ipset at all on most of my ipv4-only machines.
> 
> The ip_set_core module depends on the ipv6 module (or functionality, if 
> compiled into the kernel). The host does not need to have IPv6 address 
> assigned or IPv6 enabled at all. But the functionality must be there.
> 
> At compile time IPv6 support must be enabled.

Actually, I'm wrong: since 6.0 ipset can be configured and compiled with 
CONFIG_IPV6=n. Sorry, somehow I was blind.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
