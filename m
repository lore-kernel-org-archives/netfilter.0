From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: xt_ACCOUNT define many network by table
Date: Thu, 27 Jan 2011 23:24:44 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101272324020.6686@obet.zrqbmnf.qr>
References: <AANLkTik+=rifOKRpurA3da=OMe-Jp96Y=YMRC1itgmQ4@mail.gmail.com> <1296153825.2064.4727.camel@laplaplian> <AANLkTinYhMmnOJ1Kq9BBFcQfOB5p1kkmGXD=BvNf+2i1@mail.gmail.com> <alpine.LNX.2.01.1101272321210.26553@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1101272321210.26553@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: E2IA <e2ia.ci@gmail.com>
Cc: Bob Miller <bob@computerisms.ca>, netfilter@vger.kernel.org

On Thursday 2011-01-27 23:23, Jan Engelhardt wrote:

>On Thursday 2011-01-27 23:13, E2IA wrote:
>
>>Thank very much but it doesn't work because the 128.0.0.0/8 doesn't
>>pass through my box.
>
>Networks don't pass. Packets do. And from the looks of it, of course=20
>you _will_ get packets from 128.0.0.0/8.
>
>Simply because 192.168.2.0/24 and 172.16.2.0/24 is included in=20
>128.0.0.0/8.


Er, not for 128.0.0.0/8.  That should have been 128.0.0.0/1.


>>>> rule 1: =C2=A0iptables =C2=A0-t mangle =C2=A0 -A =C2=A0POSTROUTING=
 =C2=A0 -m mark --mark =C2=A0123
>>>> -j ACCOUNT --addr =C2=A0192.168.2.0/24 =C2=A0--tname http
>>>> rule 2: =C2=A0iptables =C2=A0-t mangle =C2=A0 -A =C2=A0POSTROUTING=
 =C2=A0 -m mark --mark =C2=A0123
>>>> -j ACCOUNT --addr =C2=A0172.16.2.0/24 =C2=A0 =C2=A0--tname http
