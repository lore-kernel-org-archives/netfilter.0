From: Nishit Shah <nsshah.82@gmail.com>
Subject: Re: arptables ruleset not working when compiling on 
	fedora6,7,8/centos 5/redhat 5
Date: Wed, 8 Jul 2009 12:27:17 +0530
Message-ID: <b2d58cb80907072357p55cc6bbbt81b107be50d5c46@mail.gmail.com>
References: <b2d58cb80906290712k33c1ebbvfc8e661cb34c502c@mail.gmail.com>
	 <b2d58cb80906290818t66616f70k2fe7596b906a8a4e@mail.gmail.com>
	 <4A48E14A.3060708@trash.net>
	 <b2d58cb80906290918q2da5af1ap87772755b3363032@mail.gmail.com>
	 <b2d58cb80906300108q2ee5a060gf8013a88560d8820@mail.gmail.com>
	 <4A4B32C4.8050800@trash.net> <4A50A3BA.8060905@pandora.be>
	 <alpine.LSU.2.00.0907051758550.22722@fbirervta.pbzchgretzou.qr>
	 <4A52567A.3080202@pandora.be>
	 <alpine.LSU.2.00.0907062200500.27775@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=e9+JyP2lC4IcJUtzUua7zUzC6Alr+KbzYOWVCVnuQX8=;
        b=K27FotVg5IdjTPM+IitVe9DArJuDnw8J7ujvPu8SkbOeoPEisl13xgu0nzPvzZ7O8K
         pRDxskabrAvSXS15A+wiWcn9gVeExDF8ltsjKowTZMIQOEkig60aKMlBFruLp2bSFw3y
         fcjsosb/tlhd77InKoO9p6naH9HdRittRs9k4=
In-Reply-To: <alpine.LSU.2.00.0907062200500.27775@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bart De Schuymer <bdschuym@pandora.be>, Jan Engelhardt <jengelh@medozas.de>
Cc: Patrick McHardy <kaber@trash.net>, Richard Horton <arimus.uk@googlemail.com>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Should I wait for another version to test ?

Rgds,
Nishit Shah.

On Tue, Jul 7, 2009 at 1:31 AM, Jan Engelhardt<jengelh@medozas.de> wrot=
e:
> On Monday 2009-07-06 21:54, Bart De Schuymer wrote:
>
>> Jan Engelhardt schreef:
>>>> Nishit, please try the attached file. It uses more recent kernel h=
eaders that
>>>> use x_tables. I prefer that approach...
>>>>
>>>
>>> You need to use the unifdef'ed headers or funny things like
>>> compiler complaining about __user might pop up.
>>>
>> The tarball I sent compiled fine on my (old) system. Does it give su=
ch warnings
>> on your system?
>
> You bet. iptables was also cursed by this [our own lack of using
> unifdefed headers from the start] before:
>
>
> $ make
> cc -O2 -Wall -Wunused -I.//include/ -Iinclude/ -DARPTABLES_VERSION=3D=
\"0.0.3-4\"
> -c -o arptables-standalone.o arptables-standalone.c
> In file included from .//include/libarptc/libarptc.h:6,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from .//include/arptables.h:5,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from arptables-standalone.c:38:
> .//include/linux/netfilter_arp/arp_tables.h:19:28: error: linux/compi=
ler.h: No
> such file or directory
> In file included from .//include/libarptc/libarptc.h:6,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from .//include/arptables.h:5,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from arptables-standalone.c:38:
> .//include/linux/netfilter_arp/arp_tables.h:183: error: expected `:',=
 `,', `;',
> `}' or `__attribute__' before `*' token
> make: *** [arptables-standalone.o] Error 1
>
