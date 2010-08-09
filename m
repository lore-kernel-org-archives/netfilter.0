From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: netfilter: add xt_cpu match
Date: Mon, 9 Aug 2010 22:08:37 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008092207180.29628@obet.zrqbmnf.qr>
References: <201008042011.o74KBSlB026488@hera.kernel.org> <AANLkTi=ffogSPifiTg7tofEvbpFcpAsfM_bm2DCASvs1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=ffogSPifiTg7tofEvbpFcpAsfM_bm2DCASvs1@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, Patrick McHardy <kaber@trash.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, netfilter@vger.kernel.org


On Monday 2010-08-09 21:52, Geert Uytterhoeven wrote:
>>
>> +config NETFILTER_XT_MATCH_CPU
>> + =C2=A0 =C2=A0 =C2=A0 tristate '"cpu" match support'
>> + =C2=A0 =C2=A0 =C2=A0 depends on NETFILTER_ADVANCED
>> + =C2=A0 =C2=A0 =C2=A0 help
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPU matching allows you to match packe=
ts based on the CPU
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 currently handling the packet.
>
>Shouldn't this depend on SMP? Or does it make sense to have it on UP, =
too?

Well one thing to consider is that you certainly would not want to
make one ruleset willingly unloadable on another machine (think
automatic code/rule generators).
