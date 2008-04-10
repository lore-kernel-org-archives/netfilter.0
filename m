From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Ranges and Single IPs
Date: Thu, 10 Apr 2008 09:21:47 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0804100918210.2089@blackhole.kfki.hu>
References: <d95317090804091138t3f12f5feo51d16968715ede7b@mail.gmail.com> 
 <d95317090804091140l3643357fj79ffe44128202ef6@mail.gmail.com> 
 <alpine.LNX.1.10.0804092113260.17930@fbirervta.pbzchgretzou.qr>
 <d95317090804091217y339b9361vad400ef810c1157b@mail.gmail.com>
 <alpine.LNX.1.10.0804092226520.17930@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804092226520.17930@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: Gilad Benjamini <gilad.benjamini@gmail.com>, netfilter@vger.kernel.org

On Wed, 9 Apr 2008, Jan Engelhardt wrote:

> On Wednesday 2008-04-09 21:17, Gilad Benjamini wrote:
> 
> >True, but I am looking for a more optimized solution
> 
> I assume ipset's iptree is smart enough to do short-circuiting
> if you have /24, /16 or /8 networks.

If you have got whole networks (/n), then ipset is smart enough to handle 
it (nethash type). If you have got ranges, then iptreemap type is the best 
choice.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
