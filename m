From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: NTP forwarding
Date: Sun, 06 Mar 2016 21:42:25 +0100
Message-ID: <56DC9631.7010702@plouf.fr.eu.org>
References: <56DAEA15.409@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56DAEA15.409@gmx.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tobias Andresen <tobiasarp@gmx.de>
Cc: netfilter@vger.kernel.org

Tobias Andresen a =E9crit :
>=20
> i have following network structure:
>=20
>=20
>      NTP-Server (62.214.6.29)
>                |
>                |
>                |
>       (eth0: 10.0.0.95)
>         Embedded board
>     (eth1: 192.168.31.95)
>                |
>                |
>                |
>         Ethernet-Switch
>          |        |    |
>          |        |    |
>         PC1       |   PC3 (192.168.31.98)
> (192.168.31.96)  |
>                   |
>                  PC2
> (192.168.31.97)
>=20
>=20
> The 3 PCs shall be able to connect to the NTP server (62.214.6.29)
> to update their time but i cannot figure out how to configure the=20
> iptables rules
> on the embedded board to achieve this.

Why do you think you need iptables rules ? Isn't plain routing enough ?

> I have tried to forward port 123 but it does not work.

This statement does not contain any useful information. It does not
describe what you did and what happened.
