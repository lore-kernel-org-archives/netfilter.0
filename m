From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: string and u32 modules
Date: Sat, 2 Oct 2010 00:55:06 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010020051300.26371@obet.zrqbmnf.qr>
References: <AANLkTin8Uvd7z0ty6urts2oy53mL=TCE0=r7O7g902HH@mail.gmail.com> <AANLkTim4g7nUd1PV=1Dnwybr=t_DVh4cT9iuZP6xESrO@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTim4g7nUd1PV=1Dnwybr=t_DVh4cT9iuZP6xESrO@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Greg Oliver <oliver.greg@gmail.com>
Cc: netfilter@vger.kernel.org


On Saturday 2010-09-25 20:12, Greg Oliver wrote:
>> 19:40:13.666679 IP ghost.29364 > ccs1.25862: UDP, length 13
>> =C2=A0 =C2=A0 =C2=A0 =C2=A00x0000: =C2=A045b8 0029 95cd 0000 3d11 9c=
86 c0a8 6476 =C2=A0E..)....=3D.....dv
>> =C2=A0 =C2=A0 =C2=A0 =C2=A00x0010: =C2=A0c0a8 64f1 72b4 6506 0015 bb=
c9 800d 9f6b =C2=A0..d.r.e........k
>> =C2=A0 =C2=A0 =C2=A0 =C2=A00x0020: =C2=A07c06 b562 a690 c613 6400 00=
00 0000 =C2=A0 =C2=A0 =C2=A0 |..b....d.....
>>
>> 800d is what I want to catch in bytes 27,28...

But 800D is at position 0x1C =3D 28 (counting from 0), so

>> -A INPUT -m u32 --u32 "0>>22&0x3C@6=3D0x800D" -j LOG --log-prefix "C=
NOISE: "
>> -A INPUT -m u32 --u32 "26&0xFFFF=3D0x800D" -j LOG --log-prefix "CNOI=
SE: "

 --u32 "28 >> 16 & 0xFFFF =3D 0x800D"

or with the IPv4 header,

 --u32 "0 >> 22 & 0x3C @ 8 >> 16 & 0xFFFF =3D 0x800D"
