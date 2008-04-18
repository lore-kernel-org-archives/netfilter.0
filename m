From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Redirecting ports in a bridge
Date: Fri, 18 Apr 2008 12:35:03 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804181232400.26385@fbirervta.pbzchgretzou.qr>
References: <48086990.5060000@juntadeandalucia.es>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48086990.5060000@juntadeandalucia.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?Javier_Prieto_Mart=C3=ADnez?= <javier.prieto.ext@juntadeandalucia.es>
Cc: netfilter@vger.kernel.org


On Friday 2008-04-18 11:27, Javier Prieto Mart=C3=ADnez wrote:

> Hi.
> I have a linux appliance from Eneo Tech. (http://www.eneotecnologia.c=
om/) with
> the following setup:
>
>  (192.168.1.x)        192.168.1.7
> ---- SERVER1 192.168.2.1
>   [ LAN1 ] ----------- [ ROUTER ] ---------- [ APPLIANCE ] -------- [=
 LAN 2 ]
> --------|
>                       192.168.2.7            192.168.2.140
> (192.168.2.x)       ---- SERVER2 192.168.2.2

your ascii art is broken

> The appliance has 4 ethernet cards, and a br0 bridge which includes a=
ll them.
> ETH2 is connected to the router, ETH3 is connected to LAN2, and BR0 h=
as an IP
> address of LAN2.
>
> I've tried the following rule:
>
>   iptables -t nat -A PREROUTING -p tcp -d 192.168.2.1 --dport 80
> --to-destination 192.168.2.2:80 -j DNAT

IF you do bridge, then despite cabling being correct, you get
a NAT shortcircuit: jengelh.medozas.de/images/dnat-mistake.png

>   2) I have to use ebtables, as I'm using a bridge.

Not always.
