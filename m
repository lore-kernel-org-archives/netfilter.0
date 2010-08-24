From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: OFF??? POINT-TO-POINT
Date: Tue, 24 Aug 2010 21:05:53 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1008242105460.17980@obet.zrqbmnf.qr>
References: <4C740306.1010209@freemail.hu> <alpine.LNX.2.01.1008241954480.15005@obet.zrqbmnf.qr> <4C740940.9080707@freemail.hu> <alpine.LNX.2.01.1008242017450.17980@obet.zrqbmnf.qr> <4C74133D.3020100@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C74133D.3020100@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?G=C3=A1sp=C3=A1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter list <netfilter@vger.kernel.org>

On Tuesday 2010-08-24 20:45, G=C3=A1sp=C3=A1r Lajos wrote:

>
>>> 21: vlan4094@wan3:<BROADCAST,MULTICAST,UP,LOWER_UP>  mtu 1500 qdisc=
 noqueue
>>> state UP
>>>    link/ether 00:19:e0:0b:ac:fc brd ff:ff:ff:ff:ff:ff
>>>    inet 192.168.0.2/32 scope global vlan4094
>>>    inet6 fe80::219:e0ff:fe0b:acfc/64 scope link
>>>       valid_lft forever preferred_lft forever
>> Tricky :)
>>
>> And `ip route`?
>>
> 192.168.1.2 dev vlan4094  scope link

So everything is correct.

