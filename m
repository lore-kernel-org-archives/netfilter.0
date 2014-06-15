From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset patch for kernel 2.6.32
Date: Sun, 15 Jun 2014 23:36:37 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1406152333120.20098@blackhole.kfki.hu>
References: <391517ef78db0128516f4964cd6454c4.squirrel@mail.netsis.lt>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <391517ef78db0128516f4964cd6454c4.squirrel@mail.netsis.lt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vm@vdx.lt
Cc: netfilter@vger.kernel.org

On Sun, 15 Jun 2014, vm@vdx.lt wrote:

> I am missing a ipset patch for kernel source, ex 2.6.32.62 version.
> As I know a version ipset-6.21.1 is compatible with kernel 2.6.32.62, but
> without a patch there is no options on kernel menuconfig for ipset.
> 
> What am I missing?

The "netlink.patch" in the source tree adds the missing netfilter netlink 
id to the kernel source, that's all. The kernel modules of ipset can be 
compiled in the ipset source tree itself, see  the README file.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
