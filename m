From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: quota display in iptables -L
Date: Fri, 09 Mar 2012 18:21:13 +0100
Message-ID: <4F5A3C09.3090404@freemail.hu>
References: <CAL2t0L4JR-kPUogudF+vWaypYjQmCPureZE6yM4PjYEVV+XhTg@mail.gmail.com> <CAL2t0L4r5ANvRyM=7Spnx68=wMcQCTR7qDH94V4-TRbXCKA-Gg@mail.gmail.com> <CAL2t0L4AjXx8QR22Q5cdh6ndPpmmrr58x-t6HG7kHZ6UadtOBg@mail.gmail.com> <CAL2t0L5bnu9pX_h01HtvEaurdhDa_QHdc6OeVfy3e4hoKe893g@mail.gmail.com> <4F5A0EB6.9000604@freemail.hu> <CAL2t0L5=eg8xe3C5zUs1e9+xdNg9U_YNa64V65je81fYoHv_4A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAL2t0L5=eg8xe3C5zUs1e9+xdNg9U_YNa64V65je81fYoHv_4A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: James Anderson <japanwikidonate@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

Well... Check out these links:

http://en.wikipedia.org/wiki/Byte
http://www.unitjuggler.com/convert-memory-from-GB-to-GiB.html

2012-03-09 17:35 keltez=E9ssel, James Anderson =EDrta:
>> 31997506400-31997506128=3D272
>> You are under the quota!
> Thank you for your reply. By discrepancy I mean iptables -L -v showin=
g
> 32GB and iptables-save showing the correct point where it stopped, at
> the quota. That's a 2.2GB difference.

29.8GiByte (binary) =3D 31 997 506 355.2 Byte  =3D 31.997 506 355 GByte=
 (SI)=20
(nearly 32 000 000 000 Byte =3D 32 GByte)

There is no 2.2 GB difference... :D You are mixing prefixes... :D GiByt=
e=20
!=3D GByte

See below:

29.8GiByte (binary) =3D 29.8*1024*1024*1024 =3D 31 997 506 355.2 Byte
29.8GByte (SI) =3D 29.8*1000*1000*1000 =3D 29 800 000 000 Byte

32GiByte (binary) =3D 32*1024*1024*1024 =3D 34 359 738 368 Byte
32GByte (SI) =3D 32*1000*1000*1000 =3D 32 000 000 000 Byte

31 997 506 400 Byte =3D 31.997 506 400 GByte (SI)
31 997 506 400 Byte =3D 29.8000000417232513427734375 GiByte (binary)

32 000 000 000 Byte =3D 32GByte (SI)
32 000 000 000 Byte =3D 29.802322387695 GiByte (binary)

Swifty

