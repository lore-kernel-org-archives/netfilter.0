From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Why REJECT target  is not supported with MANGLE ?
Date: Thu, 10 Jan 2008 09:46:36 +0100
Message-ID: <4785DB6C.7020305@freemail.hu>
References: <478548BA.2020903@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <478548BA.2020903@zensoluciones.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-2?Q?S=3F=E9bastien_Cramatte?= <scramatte@zensoluciones.com>
Cc: netfilter@vger.kernel.org

S?=E9bastien Cramatte =EDrta:
> Hello,
>
> Why REJECT target  is not supported with MANGLE ?
>
>
> My server is running debian etch4 with 2.6.22 kernel  and setuped as=20
> traffic shaper + transparent bridge
>
> The command with connlimit  bellow won't work and return me "Invalid=20
> Argument"
>
> iptables  -t mangle -N mytable
> iptables --table mangle --append POSTROUTING --out-interface br0=20
> --match physdev --physdev-is-bridged --physdev-out eth0 --jump  mytab=
le
>
> iptables  -t mangle -A mytable --proto tcp --match connlimit=20
> --connlimit-above 15 --connlimit-mask 32 --jump REJECT
> iptables  -t mangle -A mytable --jump CLASSIFY --set-class 1:10
>
> How can I achieve this kind of setup ?
I would drop those packets in a filter table...

INPUT/filter
OUTPUT/filter
=46ORWARD/filter


Is there any good reason not to do that?

Swifty

