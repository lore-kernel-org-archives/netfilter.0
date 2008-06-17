From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [ANNOUNCEMENT] ipset-2.3.1 released
Date: Tue, 17 Jun 2008 16:38:12 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806171636510.32473@fbirervta.pbzchgretzou.qr>
References: <Pine.LNX.4.64.0806121135040.2250@blackhole.kfki.hu>    <20080614154353.GA24486@safeTpin.homeunix.org>    <Pine.LNX.4.64.0806171004170.8037@blackhole.kfki.hu> <41107.84.123.239.190.1213710233.squirrel@www.arcoscom.com>
 <Pine.LNX.4.64.0806171552200.8037@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0806171552200.8037@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: ArcosCom Linux User <linux@arcoscom.com>, netfilter@vger.kernel.org


On Tuesday 2008-06-17 15:55, Jozsef Kadlecsik wrote:

>On Tue, 17 Jun 2008, ArcosCom Linux User wrote:
>
>> >> cc -O2 -Wall -Wunused -I/usr/src/linux/include -I.  -fPIC -o
>> >> ipset_iphash.o -c ipset_iphash.c
>> >> ipset_iphash.c: In function 'create_parse':
>> >> ipset_iphash.c:71: error: 'UINT_MAX' undeclared (first use in this
>> >> function)
>> >> ipset_iphash.c:71: error: (Each undeclared identifier is reported only
>> >> once
>> >> ipset_iphash.c:71: error: for each function it appears in.)
>> >> make: *** [ipset_iphash.o] Error 1
>
>> Be carefull about 32/64 bits architectures, this macro value, perhaps, is
>> diferent depending on it.
>
>No, it holds the same value.

The same value... currently, and on selected systems ;-)
(UINT_MAX is implementation dependent.)

Also, -I/usr/src/linux looks *very* wrong to me, there is reason
we have /usr/include/linux...
