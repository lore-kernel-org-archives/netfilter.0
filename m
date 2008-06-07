From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ipp2p segfault with kernel 2.6.24.7
Date: Sat, 7 Jun 2008 09:46:57 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806070945360.20733@fbirervta.pbzchgretzou.qr>
References: <4849A942.9030204@zensoluciones.com> <alpine.LNX.1.10.0806062322340.20733@fbirervta.pbzchgretzou.qr> <4849BB1E.7060704@zensoluciones.com> <alpine.LNX.1.10.0806070131140.20733@fbirervta.pbzchgretzou.qr> <484A3918.1080806@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <484A3918.1080806@zensoluciones.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?S=C2=8E=C3=A9bastien_Cramatte?= <scramatte@zensoluciones.com>
Cc: netfilter@vger.kernel.org


On Saturday 2008-06-07 09:30, S?=C3=A9bastien Cramatte wrote:
>>  =20
> Thank your for your answer
>
> I've downloaded the lastest 2.6.25.5 kernel  and applied  l7-filter
> patch. I must build a debian kernel package and xtables-addons
> seems doesn't act as a patch ...

Well is not that wonderful - running it without patching
or recompiling the kernel!

> so I don't know how can I include
> it in my main kernel package.  I will take a look in depth to see
> how can I achieve this.

It builds as external modules, much like ati/nvidia/madwifi,
and works for a large range of older kernels, down to 2.6.18.5.
