From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset, IP6_NF_IPTABLES
Date: Tue, 17 May 2011 13:25:14 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105171321190.31927@blackhole.kfki.hu>
References: <ffc7edfebc6396f9754b6327b0523d27@visp.net.lb> <alpine.DEB.2.00.1105171000560.31927@blackhole.kfki.hu> <4DD256F7.7050007@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD256F7.7050007@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Denys Fedoryshchenko <denys@visp.net.lb>, netfilter@vger.kernel.org

On Tue, 17 May 2011, Mr Dash Four wrote:

> > No, that's not possible. ipset needs the IPv6 support in the kernel.
> >   
> That can't be accurate - I have administratively disabled IPv6 on my system
> (both via sysctl as well as via the kernel command line)  - and ipset 6.5 runs
> just fine. I am not using any IPv6 sets though so that might be the reason why
> it is not complaining.

You can of course disable IPv6. But the functionality of IPv6 is required.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
