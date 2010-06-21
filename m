From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: noob question howto using iptables limit ip access times
Date: Mon, 21 Jun 2010 14:02:39 +0200
Message-ID: <4C1F54DF.5090802@plouf.fr.eu.org>
References: <AANLkTimidapf_oJzL3tN2U275oX-nubojD5YRC6mwS-H@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimidapf_oJzL3tN2U275oX-nubojD5YRC6mwS-H@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Zhu Jing <shadowarrx@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Zhu Jing a =E9crit :
>=20
>  My aim is limit ip access to my squid server with 1000 times per day=
=2E
> If this ip connections counts more then 1000,iptables will drop it.
>=20
>  I have google a lot,and write a wired scripts :P
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     #!/bin/sh
>    iptables -F
>    iptables -X
>    iptables -Z
>    iptables -N squid
>    iptables -A INPUT -p tcp --dport 80 -j squid
>    iptables -A squid -m limit --limit 1/hour --limit-burst 1000 -j RE=
TURN
>    iptables -A squid -j DROP
>    service iptables save
>   service iptables restart
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>    iptables -A squid -m limit --limit 1/hour --limit-burst 1000 -j RE=
TURN
>=20
>    IMO: this rule means ,the limit-burst token bucket is set to 1000
> initially, for each hour token count goes up by 1, when token bucket
> is empty---> not match --> go next rule
>    But,  I tested it by using IE refresh my server , when i refresh
> more then 7 or 8 times ,iptables going to drop my connections, why?

Because your rule limits packets, not connections. A single TCP
connection involves multiple packets.
