From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: make modules_install Error : Can't read private key
Date: Thu, 20 Aug 2015 20:28:11 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1508202024190.2398@blackhole.kfki.hu>
References: <CAA5aLPiSBfyEqymTJ0rBU2zjBV2k1ruw9x9N3tJuKWhF8vCe9Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA5aLPiSBfyEqymTJ0rBU2zjBV2k1ruw9x9N3tJuKWhF8vCe9Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Akshat Kakkar <akshat.1984@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, 20 Aug 2015, Akshat Kakkar wrote:

> I am on SL 7, kernel 3.10.0-229
> 
> I am installing ipset
> 
> everyrthing went fine, but just in the last step "make
> modules_install" I am geting o/p as
> 
> make -C /lib/modules/`uname -r`/build M=$PWD/kernel/net \
>                 KDIR=$PWD/kernel modules_install
> make[1]: Entering directory `/usr/src/kernels/3.10.0-229.11.1.el7.x86_64'
>   INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set.ko
> Can't read private key

I have no idea what's this, the ipset package handles no keys whatsoever. 
Run "strace -f make install_modules" and that may shed light on what kind 
of key can't be read by the system.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
