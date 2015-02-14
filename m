From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: how to bind NF_ARP family in netfilter queue
Date: Sat, 14 Feb 2015 21:40:32 +0100
Message-ID: <54DFB2C0.8020608@familie-kuntze.de>
References: <CA+HxBUK5wPU69xV+xvtFKMk9qyVbiDxcz0O=vqx+t7Tg3hibuA@mail.gmail.com> <54DF9E7F.9020205@familie-kuntze.de> <54DFB100.4000700@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54DFB100.4000700@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>, netfilter@vger.kernel.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello Pascal,

It is correct that neither have nfqueue support.
I specifically checked the arptables and ebtables man pages for nflog t=
hough
and found it for ebtables.
The versions I checked were 0.0.4 for arptables
and 2.0.10_4 for ebtables. The kernel version was 3.14.32.

Mit freundlichen Gr=C3=BC=C3=9Fen/Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
=46ingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658

Am 14.02.2015 um 21:33 schrieb Pascal Hambourg:
> Noel Kuntze a =C3=A9crit :
>>
>> You need to use ebtables to get arp messages.
>
> Or arptables. ebtables only works with a bridge. But AFAICS neither
> arptables nor ebtables seems to have a queue or nfqueue target.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU37K+AAoJEDg5KY9j7GZYeGQP/iV6iktFAR8T9q2WWFMTcMwA
DoP5zGUiwwGMNX2gSTl/RbJq/JA5ClBEfpV9sitdm7aPTm3Et4cZ0oGUMtq9QfBY
p7TBUZOvgynbMiTVOlcbRp5uQlrRiqXmXYsnr6VgpLHN2E0SKXZQCzSEn4jmi+J3
bn7p2MSjH9UmB2LCd3KcYexkszPz3DZk4ckvF/hoExH6ZzF5yVLhRgDFLctSe0Nz
OV2qApWHdGc3Cq6b8jXAkd2auFSq2lrzmcqdL+ppWEAjHVE/n65JuebU6jwbcbqm
cksOFGKCaR9fkO4kppYd3Dg7iMrWcyNzX2JPVoWmk77GGARFUj8pTDqGAdmfoQD2
OBhlyXfaGb0O0ok5O9ytC3fcwuGHTyGZtg1tBh4K0gRXfoupufSsYLOho8m8lnP+
hENhDQ9K4Izf7xcWmemTtLGNXlUddvt8p2ofGETmayQbk3iLLMqQzjKywOQlB5qm
o3SGJne0gMy/Im553FLMWegjX1QTDUDnxVE6Rmel0JiH0O4rgS8kHbVvMBnJlLyC
C31xjy56tANhWZtDFwnNQZeZlml4pcCyU+jnza2bmJTpAfA6Hj74JoBuBYo2KfX+
zJJXvLmzBKgR2Tq2a3cyoWStggbxxBvHL62l1PWeCapiHWwmCBhCmr7fr6ASyOLT
8f4qAYr1EEd74psZmkb8
=3DzXwD
-----END PGP SIGNATURE-----

