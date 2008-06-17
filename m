From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCEMENT] ipset-2.3.1 released
Date: Tue, 17 Jun 2008 22:29:37 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806172219180.9392@blackhole.kfki.hu>
References: <Pine.LNX.4.64.0806121135040.2250@blackhole.kfki.hu>   
 <20080614154353.GA24486@safeTpin.homeunix.org>   
 <Pine.LNX.4.64.0806171004170.8037@blackhole.kfki.hu>
 <41107.84.123.239.190.1213710233.squirrel@www.arcoscom.com>
 <Pine.LNX.4.64.0806171552200.8037@blackhole.kfki.hu>
 <alpine.LNX.1.10.0806171636510.32473@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0806171636510.32473@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: ArcosCom Linux User <linux@arcoscom.com>, netfilter@vger.kernel.org

On Tue, 17 Jun 2008, Jan Engelhardt wrote:

> >> Be carefull about 32/64 bits architectures, this macro value, perhaps, is
> >> diferent depending on it.
> >
> >No, it holds the same value.
> 
> The same value... currently, and on selected systems ;-)
> (UINT_MAX is implementation dependent.)

I'm not going to port ipset to other systems. Or do you imply UINT_MAX is 
implementation dependent on Linux? (Anyway, the successor of ipset is on 
the way... ;-)
 
> Also, -I/usr/src/linux looks *very* wrong to me, there is reason
> we have /usr/include/linux...

From the purists point of you, you are quite right. But ipset (userspace 
part + kernelspace part) - as it's "based" on patch-o-matic-ng - cannot be 
compiled without the kernel source. So -I/usr/src/linux is there as a 
fallback if the kernel source path is not defined explicitely.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
