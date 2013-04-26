From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Increasing the number of ipsets
Date: Fri, 26 Apr 2013 12:50:08 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1304261247510.29520@blackhole.kfki.hu>
References: <CAEoHOkBB7kWTOxtQT3k_kKyatGuRT2H1D5HmUhukAE0tGNbvjg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAEoHOkBB7kWTOxtQT3k_kKyatGuRT2H1D5HmUhukAE0tGNbvjg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Greenwood <bilco105@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, 26 Apr 2013, Rob Greenwood wrote:

> I'm trying to increase the number of ipsets which are available. I'm
> therefore compiling ipsets from source and specifying
> --with-maxsets=1024 and installing.

Did you install the recompiled kernel modules as well from the package?
 
> However, this doesn't seem to have any affect. Do I need to recompile
> the kernel with a certain parameter as well? - struggling to find any
> documentation anywhere.

In recent ipset versions the max number of sets is auto-increased when 
needed. Older releases have the parameter hardcoded in the kernel module 
and need a recompiling/reinstalling for an increased set number to take 
effect.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
