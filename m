From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: www.adobe.com
Date: Thu, 13 Nov 2008 12:22:00 +0100
Message-ID: <491C0DD8.6080103@plouf.fr.eu.org>
References: <20081113075231.50345b2c@gmail.com>	<491BFB25.3000800@plouf.fr.eu.org> <20081113105205.7496faf5@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20081113105205.7496faf5@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

TheOldFellow a =E9crit :
>=20
> 10:45:28.932756 IP (tos 0x0, ttl 53, id 25304, offset 0, flags [none]=
, proto TCP (6), length 44)
>     192.150.18.101.80 > 192.168.1.2.2901:  tcp 24 [bad hdr length 0 -=
 too short, < 20]
[...]
> Allowing all input doesn't change a thing.

I thought so. The TCP header of the first reply packet from the server=20
seems to be malformed, so even though iptables accepted it, the TCP=20
stack would discard it.

The problem may lie in your router, your network interface card or its=20
driver. Anyway it does not seem to be related to netfilter/iptables, as=
=20
tcpdump sees the packet as malformed before it enters the netfilter=20
code. Can you try with another router, machine, kernel or network=20
interface ?
