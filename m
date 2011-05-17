From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset, IP6_NF_IPTABLES
Date: Tue, 17 May 2011 10:07:56 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105171000560.31927@blackhole.kfki.hu>
References: <ffc7edfebc6396f9754b6327b0523d27@visp.net.lb>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ffc7edfebc6396f9754b6327b0523d27@visp.net.lb>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denys Fedoryshchenko <denys@visp.net.lb>
Cc: netfilter@vger.kernel.org

On Tue, 17 May 2011, Denys Fedoryshchenko wrote:

> I am using IPv4-only kernel, and getting
> "The kernel build directory /lib/modules/2.6.39-rc7-git4-devel2/build is not
> configured with IP6_NF_IPTABLES support"
> while compiling latest ipset 6.5 (and previous version 6.4 too)
> Is there any way to compile ipset without IPv6?

No, that's not possible. ipset needs the IPv6 support in the kernel.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
