From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: TCP simultaneous open using iptables NAT?
Date: Sat, 30 May 2009 20:16:11 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0905302005460.31469@blackhole.kfki.hu>
References: <4ddb24250905271506qb50323etf3f7deb4e240ff72@mail.gmail.com> <alpine.DEB.2.00.0905301726540.31323@blackhole.kfki.hu> <200905301849.58608.christoph.paasch@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200905301849.58608.christoph.paasch@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Paasch <christoph.paasch@gmail.com>
Cc: netfilter@vger.kernel.org, Saatvik Agarwal <saatvik.agarwal@stanford.edu>

On Sat, 30 May 2009, Christoph Paasch wrote:

> one question about that:
> How can the host receive the SYN packet (and afterwards send the RST), if 
> conntrack does not support TCP simultaneous open?

The first SYN (if the firewall rules allow it) are let through the 
firewall and will reach the destination. If that hasn't sent SYN yet, then 
it'll respond with RST, which will pass the firewall too.

But running tcpdump on both interfaces of the firewall would help most.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
