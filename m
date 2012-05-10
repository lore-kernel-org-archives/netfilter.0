From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.12 released
Date: Thu, 10 May 2012 16:30:13 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1205101627180.19418@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1205101211080.18562@blackhole.kfki.hu> <4FABCF96.7080105@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4FABCF96.7080105@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Thu, 10 May 2012, Mr Dash Four wrote:

> >  - Add dynamic module support to ipset userspace tool
> >    (Neutron Soutmun)
> >   
> Could you elaborate a bit on this please Jozsef? By "modules" I am assuming
> you mean the kernel modules, right?

No, it's for the userspace tool. The set types can be compiled as dynamic 
modules (shared libraries), instead of statically compiling into the 
"ipset" binary.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
