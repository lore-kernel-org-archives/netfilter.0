From: "ArcosCom Linux User" <linux@arcoscom.com>
Subject: Re: [ANNOUNCEMENT] ipset-2.3.1 released
Date: Tue, 17 Jun 2008 15:43:53 +0200 (CEST)
Message-ID: <41107.84.123.239.190.1213710233.squirrel@www.arcoscom.com>
References: <Pine.LNX.4.64.0806121135040.2250@blackhole.kfki.hu>
    <20080614154353.GA24486@safeTpin.homeunix.org>
    <Pine.LNX.4.64.0806171004170.8037@blackhole.kfki.hu>
Reply-To: linux@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0806171004170.8037@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Be carefull about 32/64 bits architectures, this macro value, perhaps, =
is
diferent depending on it.

Regards

El Mar, 17 de Junio de 2008, 10:07, Jozsef Kadlecsik escribi=F3:
> On Sat, 14 Jun 2008, pud wrote:
>
>> thanks for that, but maybe it still needs a fix for building with
>> glibc-2.8:
>>
>> cc -O2 -Wall -Wunused -I/usr/src/linux/include -I.  -fPIC -o
>> ipset_iphash.o -c ipset_iphash.c
>> ipset_iphash.c: In function 'create_parse':
>> ipset_iphash.c:71: error: 'UINT_MAX' undeclared (first use in this
>> function)
>> ipset_iphash.c:71: error: (Each undeclared identifier is reported on=
ly
>> once
>> ipset_iphash.c:71: error: for each function it appears in.)
>> make: *** [ipset_iphash.o] Error 1
>>
>> including limits.h fixes it of cause, but i'm not sure if that is a
>> proper fix
>
> I added the limits.h to the files which uses UINT_MAX. svn holds the =
fixed
> version, thank you the report.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


