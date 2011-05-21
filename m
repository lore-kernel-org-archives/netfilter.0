From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sun, 22 May 2011 01:25:03 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105220115100.24174@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD83964.5050105@googlemail.com> <alpine.DEB.2.00.1105220018010.23769@blackhole.kfki.hu> <4DD83FDE.9000901@googlemail.com> <alpine.DEB.2.00.1105220044160.24174@blackhole.kfki.hu>
 <4DD84349.5040407@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD84349.5040407@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Sat, 21 May 2011, Mr Dash Four wrote:

> >> Fair enough, is there any reason why I can't include them as part of the 
> >> kernel (i.e. static) as I used to with 4.5?
> > 
> > I don't really understand what you mean here, sorry.
> > 
> > If you want the kernel part of the ipset package compiled statically, then 
> > that's not supported out of the box. Manually doable: get a kernel tree 
> > where ipset already included, copy over all *.[ch] files from 
> > ipset-6.x/kernel/ to the corresponding kernel subtrees and then continue 
> > configuring/compiling in the kernel tree.
> OK, as you know I compile ipset - userspace and kernel modules - in two 
> separate building streams. The kernel part of ipset I compile as part of 
> the kernel itself - via the make oldconfig, make menuconfig or by simply 
> copying already pre-defined .config file (I obviously apply the ipset 
> 6.5 patches as well - as you know).

I haven't time yet to look at the packages you sent me, so I don't know 
the exact details of your build process.

> With ipset 4.5 I was able to include all ipset "modules" as part of the 
> kernel (i.e. all ipset-related options in my .config were "y" as oppose 
> to "m").
> 
> In ipset 6.5 I cannot do that - the only choice I seem to have is "m" or 
> not include them at all. So, I was wondering why that is, that's all?

I think you have got NETFILTER_NETLINK_QUEUE, NETFILTER_NETLINK_LOG or 
NF_CT_NETLINK selected as module, and in consequence NETFILTER_NETLINK as 
module too. And because the ipset kernel modules depend on 
NETFILTER_NETLINK, then those can be selected as modules only too.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
