From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Limiting bandwidth on router
Date: Fri, 23 Jul 2010 15:23:24 +0200
Message-ID: <4C4997CC.4010502@plouf.fr.eu.org>
References: <AANLkTik2ej_dxAnk8s5iq32BDC7YVPEZ+X7Sqr1xU+KH@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTik2ej_dxAnk8s5iq32BDC7YVPEZ+X7Sqr1xU+KH@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Elison Niven <elison.niven@gmail.com>
Cc: netfilter@vger.kernel.org, elison.niven@matrixcomsec.com

Hello,

Elison Niven a =E9crit :
> I have an ARM based board with 2 ethernet interfaces eth0 and eth1.
> eth0 - LAN interface. 192.168.2.149
> eth1 - WAN interface. 192.168.1.149
> I have setup a simple router using iptables that allows PCs on the LA=
N
> to browse the internet via the WAN.
> I want to limit incoming bandwidth on the LAN interface to about
> 8mbit/s as when there are massive data transfers initiating from the
> PCs on the LAN, the system is under heavy load and is not able to
> execute any applications.
>=20
> I tried to limit the bandwidth using tc's tbf and ingress but it isn'=
t
> really working well.
> For example from a PC on the LAN (ip 192.168.2.13, default gw 192.168=
=2E2.149)
> # ping -f -s 1000 192.168.1.3
> This is correctly limited and ping results show the loss.
>
> # ping -f -s 1 192.168.1.3
> Here the system is under heavy load and is not able to execute any
> applications. No loss in ping.

This result may indicate that the router's load depends more on the=20
packet rate than the bandwidth, which makes sense. So it may be more=20
efficient to limit the packet rate instead of the bandwidth.

> Also when I create a udp socket from this PC to an address on the WAN=
,
> the rate is not limited.
> #./udpclient 20000 192.168.1.3 20000 1000
> This utility sends 20000 packets of 1000 bytes each to 192.168.1.3.
> Here also the rate is not limited.

I did not understand well whether you want to limit incoming (WAN to=20
LAN) or outgoing (LAN to WAN) traffic. The ping test above does not tel=
l=20
whether incoming (echo reply) or outgoing (echo request) traffic is lim=
ited.

Also, remember that by definition received traffic rate cannot be=20
directly controlled. All you can do is drop incoming packets. Due to TC=
P=20
acknowledgement and congestion control mechanism, the sender will=20
interpret the packet loss as congestion and reduce the sending rate. Bu=
t=20
UDP has no such mechanism. Anyway, does this really matter ? If the=20
heavy data transfers use TCP, it should work. Did you test it ?


