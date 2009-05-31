From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: TCP simultaneous open using iptables NAT?
Date: Sun, 31 May 2009 15:08:03 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0905311506130.482@blackhole.kfki.hu>
References: <4ddb24250905271506qb50323etf3f7deb4e240ff72@mail.gmail.com>  <200905301849.58608.christoph.paasch@gmail.com>  <alpine.DEB.2.00.0905302005460.31469@blackhole.kfki.hu>  <200905302159.09851.christoph.paasch@gmail.com> 
 <alpine.DEB.2.00.0905302323400.32263@blackhole.kfki.hu> <4ddb24250905301509y163cc00av4ce7bbe0a50a4083@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ddb24250905301509y163cc00av4ce7bbe0a50a4083@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saatvik Agarwal <saatvik.agarwal@stanford.edu>
Cc: Christoph Paasch <christoph.paasch@gmail.com>, netfilter@vger.kernel.org

On Sat, 30 May 2009, Saatvik Agarwal wrote:

> Now I am confused. The behavior I am seeing is that despite the timing being
> correct, simultaneous open does not function as intended:
> 
> A's SYN reaches B's NAT *after* B's SYN has left B's NAT and the same is
> true of B - B's SYN reaches A's NAT *after* A's SYN has left A's NAT. This
> is the correct case for simultaneous open. What I was originally saying was
> that this does not work if one does iptables SNAT without DNAT (of course,
> with a full-cone NAT it works; you don't even have to do a simultaneous
> open).

Yes, because netfilter/conntrack currently does not support TCP 
simultaneous open. It's on the way.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
