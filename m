From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Sun, 22 May 2011 00:49:53 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1105220044160.24174@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD83964.5050105@googlemail.com> <alpine.DEB.2.00.1105220018010.23769@blackhole.kfki.hu> <4DD83FDE.9000901@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD83FDE.9000901@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Sat, 21 May 2011, Mr Dash Four wrote:

> > The ipset-4.x packages support patching the kernel source tree, and in the 
> > kernel tree you can select module or static compiling. The ipset-6.x 
> > packages support only compiling as external modules.
> Fair enough, is there any reason why I can't include them as part of the 
> kernel (i.e. static) as I used to with 4.5?

I don't really understand what you mean here, sorry.

If you want the kernel part of the ipset package compiled statically, then 
that's not supported out of the box. Manually doable: get a kernel tree 
where ipset already included, copy over all *.[ch] files from 
ipset-6.x/kernel/ to the corresponding kernel subtrees and then continue 
configuring/compiling in the kernel tree.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
