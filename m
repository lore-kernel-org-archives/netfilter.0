From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: two default routes
Date: Mon, 22 Mar 2010 16:47:50 +0100
Message-ID: <4BA79126.1040903@plouf.fr.eu.org>
References: <cfeab66d1003220335y1020f343u14097acc1ee50c09@mail.gmail.com>	 <4BA784B2.9030406@plouf.fr.eu.org> <cfeab66d1003220805t41853241jddfa85b54e745315@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1003220805t41853241jddfa85b54e745315@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

ratheesh k a =E9crit :
>=20
> suppose ip  8.8.8.8  is accessible thru gateway 10.232.18.5 and we
> configured the linux machine to accept
> icmp redirect messages ( if we set NET_IPV4_CONF_ACCEPT_REDIRECTS )  =
=2E

Do you mean sysctl net.ipv4.conf.<interface>.accept_redirects ?
Note that this settings is ignored (and so are ICMP redirects) when
forwarding is enabled, thus when Linux acts as a router.

> Linux will send packet to 8.8.8.8  thru 192.168.1.1 as per default
> route . The gateway machine  ( ip 192.168.1.1 ) will respond back wit=
h
> icmp redirect . (I think so )

If it is configured to do so. If it runs a Linux kernel, see sysctl
net.ipv4.conf.<interface>.send_redirects.

> So our linux machine can use the other route ?

Yes, a temporary redirect route to 8.8.8.8 will be created in the
routing cache. You can see it with "ip route show cache".

Note : This does not seem to be much related to netfilter.
