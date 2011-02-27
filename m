From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset preformance
Date: Sun, 27 Feb 2011 21:02:50 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1102272100340.24539@blackhole.kfki.hu>
References: <AANLkTimNBPsd-a2YbM9Bf755WRrUnchXT7P31U83Txb3@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimNBPsd-a2YbM9Bf755WRrUnchXT7P31U83Txb3@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anatoly Muliarski <x86ever@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, 27 Feb 2011, Anatoly Muliarski wrote:

> I did oprofile test on our router and I found strange things with
> ipset performance.
> Using a single check of a nethash set with 3 nets in it consumes 1.88%
> of CPU, using a single check of an ipportiphash with zero items
> consumes 3.39% and ip_set module itself  consumes 4.9%.
> Currently I am using 2.6.25.17 kernel with ipset v2.4.9.

That is a really-really old version of ipset.

> Is it worth to upgrade to ipset v4.5 to resolve this issue?

I believe so. But please note, I stopped the development of the 4.x branch 
and the currently maintained release is 6.x.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
