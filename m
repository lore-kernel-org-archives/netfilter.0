From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Redirecting ports in a bridge
Date: Fri, 18 Apr 2008 13:29:09 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804181328560.26385@fbirervta.pbzchgretzou.qr>
References: <48086990.5060000@juntadeandalucia.es> <alpine.LNX.1.10.0804181232400.26385@fbirervta.pbzchgretzou.qr> <48087E17.8080902@juntadeandalucia.es>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48087E17.8080902@juntadeandalucia.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?Javier_Prieto_Mart=C3=ADnez?= <javier.prieto.ext@juntadeandalucia.es>
Cc: netfilter@vger.kernel.org


On Friday 2008-04-18 12:55, Javier Prieto Mart=C3=ADnez wrote:
>>  =20
> You're right. I'll try again:
>
> * LAN1 (192.168.1.0/22)
>
> [CLIENTS]--- [ROUTER (.7)]
>
>
> * LAN2 (192.168.2.0/22)
>
> [ROUTER (.7)] -- [APPLIANCE (.40)] -- SERVERS (.1&.2)
>
>> IF you do bridge, then despite cabling being correct, you get
>> a NAT shortcircuit: jengelh.medozas.de/images/dnat-mistake.png
>>  =20
> That's probably the problem, as far as I've seen with TCPDump. The po=
int is,
> how can I fix that shortcut?

You do not seem to need a bridge.
