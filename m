From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: OFF??? POINT-TO-POINT
Date: Tue, 24 Aug 2010 19:55:05 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1008241954480.15005@obet.zrqbmnf.qr>
References: <4C740306.1010209@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C740306.1010209@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?G=C3=A1sp=C3=A1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter list <netfilter@vger.kernel.org>

On Tuesday 2010-08-24 19:36, G=C3=A1sp=C3=A1r Lajos wrote:

> auto vlan4094
> iface vlan4094 inet static
>    address 192.168.0.2
>    netmask 255.255.255.255
>    pointopoint 192.168.1.2
>    vlan_raw_device wan3
>    up /sbin/ifconfig vlan4094 up arp
>    up /sbin/route add -host 192.168.1.2 dev vlan4094
>    down /sbin/route del -host 192.168.1.2 dev vlan4094
>
> This works, however the interface just ignores the pointopoint line..=
=2E.
>
> My question is maybe offtopic, but anyone knows a good reason why the
> pointopoint feature is not available on "normal" interfaces?

So what's the output of `ip addr`?


