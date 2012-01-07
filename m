From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Extracting info from frag packet in pre route hook
Date: Sat, 7 Jan 2012 04:21:36 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201070421240.21818@frira.zrqbmnf.qr>
References: <CAKbcA9KrD4eR0tcHG4_g7JvfOZv0MH+UinESt+GNRJb4YiquRQ@mail.gmail.com> <alpine.LNX.2.01.1201052218330.26877@frira.zrqbmnf.qr> <CAKbcA9JpK7z0CteJCDinY06Afmu2daT9EPygVcaPUjpjXjar9g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKbcA9JpK7z0CteJCDinY06Afmu2daT9EPygVcaPUjpjXjar9g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: vivek rajagopalan <vivvek.r@gmail.com>
Cc: netfilter@vger.kernel.org

On Saturday 2012-01-07 03:36, vivek rajagopalan wrote:

>On Thu, Jan 5, 2012 at 1:21 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
>> You need
>>
>> =C2=A0struct udphdr *udph =3D skb_header_pointer(...)
>>
>
>This solved the problem, what offset to use was not clear to me
>initially but it eventually turned out to be 20. Thanks so much

The offset to use is of course ip_hdrlen(skb), not 20.

