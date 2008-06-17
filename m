From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCEMENT] ipset-2.3.1 released
Date: Tue, 17 Jun 2008 15:55:46 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806171552200.8037@blackhole.kfki.hu>
References: <Pine.LNX.4.64.0806121135040.2250@blackhole.kfki.hu>   
 <20080614154353.GA24486@safeTpin.homeunix.org>   
 <Pine.LNX.4.64.0806171004170.8037@blackhole.kfki.hu>
 <41107.84.123.239.190.1213710233.squirrel@www.arcoscom.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <41107.84.123.239.190.1213710233.squirrel@www.arcoscom.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ArcosCom Linux User <linux@arcoscom.com>
Cc: netfilter@vger.kernel.org

On Tue, 17 Jun 2008, ArcosCom Linux User wrote:

> >> cc -O2 -Wall -Wunused -I/usr/src/linux/include -I.  -fPIC -o
> >> ipset_iphash.o -c ipset_iphash.c
> >> ipset_iphash.c: In function 'create_parse':
> >> ipset_iphash.c:71: error: 'UINT_MAX' undeclared (first use in this
> >> function)
> >> ipset_iphash.c:71: error: (Each undeclared identifier is reported only
> >> once
> >> ipset_iphash.c:71: error: for each function it appears in.)
> >> make: *** [ipset_iphash.o] Error 1

> Be carefull about 32/64 bits architectures, this macro value, perhaps, is
> diferent depending on it.

No, it holds the same value. ULONG_MAX (LONG_MIN/LONG_MAX) is different on 
32 and 64 bit modes.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
