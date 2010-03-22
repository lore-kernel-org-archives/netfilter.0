From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: two default routes
Date: Mon, 22 Mar 2010 15:54:42 +0100
Message-ID: <4BA784B2.9030406@plouf.fr.eu.org>
References: <cfeab66d1003220335y1020f343u14097acc1ee50c09@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1003220335y1020f343u14097acc1ee50c09@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

ratheesh k a =E9crit :
>=20
>  i have two default routes  , I used below two commands to add routes=
 .
>=20
>  route add default gw 192.168.1.1  dev eth0 metric 0
>  route add default gw 10.232.18.5  dev eth1 metric 1
>=20
> So  10.232.18.5 will become the default route since it is added
> secondly . All packets are routed to this address.

No. Lower metric wins regardless of route order, so the default gateway
is 192.168.1.1. You can check with "ip route get <destination>".

> Suppose
> 10.232.18.5 machine is down  , will the packets will use the next
> default route ?

No, the kernel has no dead gateway detection AFAIK.
