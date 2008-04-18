From: =?UTF-8?B?SmF2aWVyIFByaWV0byBNYXJ0w61uZXo=?= 
	<javier.prieto.ext@juntadeandalucia.es>
Subject: Re: Redirecting ports in a bridge
Date: Fri, 18 Apr 2008 12:55:19 +0200
Message-ID: <48087E17.8080902@juntadeandalucia.es>
References: <48086990.5060000@juntadeandalucia.es> <alpine.LNX.1.10.0804181232400.26385@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804181232400.26385@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jan Engelhardt <jengelh@computergmbh.de>, netfilter@vger.kernel.org

Jan Engelhardt escribi=C3=B3:
> your ascii art is broken
>  =20
You're right. I'll try again:

* LAN1 (192.168.1.0/22)

[CLIENTS]--- [ROUTER (.7)]


* LAN2 (192.168.2.0/22)

[ROUTER (.7)] -- [APPLIANCE (.40)] -- SERVERS (.1&.2)

> IF you do bridge, then despite cabling being correct, you get
> a NAT shortcircuit: jengelh.medozas.de/images/dnat-mistake.png
>  =20
That's probably the problem, as far as I've seen with TCPDump. The poin=
t=20
is, how can I fix that shortcut?

Thanks!
