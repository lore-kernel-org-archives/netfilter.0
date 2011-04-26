From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset maximal/minimal revision conflict
Date: Tue, 26 Apr 2011 20:11:06 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1104262007050.2868@blackhole.kfki.hu>
References: <4DB6A9A5.5070301@googlemail.com> <alpine.DEB.2.00.1104261558430.1834@blackhole.kfki.hu> <4DB6DF66.6040009@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DB6DF66.6040009@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, 26 Apr 2011, Mr Dash Four wrote:

> > The hash:*port* types have got a new revision due to the introduced SCTP and
> > UDPLITE support. The ipset package contains the matching kernel modules, the
> > kernel tree is a little bit behind.
> >   
> I see, the ipset files in the kernel version and the kernel files in the ipset
> package are out of sync then, right?
> 
> Would I be able to successfully split this up by using the source files in the
> kernel/ directory of the ipset 6.4 package and move them over to the ipset
> kernel source directory, whilst keeping all the make/configuration files in
> the ipset kernel directory (Kbuild and alike) intact?
> 
> Would that solve the above problem (keeping/building the ipset package as a
> whole is *not* an option for me, before you ask)? I also assume that the
> kernel files in the ipset package are newer as the above error suggests,
> right?

You can copy over the files (header files too) from the ipset package to 
the kernel tree.

If I dropped supporting kernels between 2.6.34-2.6.37, the sources would 
be identical in the ipset package and an updated kernel tree.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
