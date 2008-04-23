From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: IPTables : How to force data coming from ethX being output by
 the same device
Date: Wed, 23 Apr 2008 17:17:51 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804231717190.13697@fbirervta.pbzchgretzou.qr>
References: <c4ecb9830804230703q3f3cc02doc03c34a293d6014c@mail.gmail.com> <480F49BE.60600@solutti.com.br> <alpine.LNX.1.10.0804231641310.13697@fbirervta.pbzchgretzou.qr> <480F4CD9.4020006@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480F4CD9.4020006@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?Leonardo_Rodrigues_Magalh=C3=A3es?= <leolistas@solutti.com.br>
Cc: ML netfilter <netfilter@vger.kernel.org>


On Wednesday 2008-04-23 16:51, Leonardo Rodrigues Magalh=C3=A3es wrote:
> Jan Engelhardt escreveu:
>> On Wednesday 2008-04-23 16:37, Leonardo Rodrigues Magalh=C3=A3es wro=
te: =20
>>  =20
>> >   This is not iptables related, this is ROUTING related.
>> >
>> >   iptables does not route packages.
>> >    =20
>>
>> apt/smart routes packages :p
>
>   hmmmm i use Fedora, so i'll stick with yum :)
>
>   sorry for that, i mean 'packets' and not 'packages'.
>
>   iptables does not route network packets, that's done by kernel base=
d on the
> routing table entries. it's completly NOT iptables related.

It is not completely not related. By changing things such as
nfmark, TOS field, source or destination address, routing can
be influenced, so I would not say it's totally unrelated :)
