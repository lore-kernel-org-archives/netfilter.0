From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Double NAT port forward
Date: Fri, 15 Jan 2010 12:44:43 +0100
Message-ID: <4B50552B.5090608@plouf.fr.eu.org>
References: <6bc5618e1001141233k5cd1513fnbd5a41902aff12c6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6bc5618e1001141233k5cd1513fnbd5a41902aff12c6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Henno T=E4ht a =E9crit :
>=20
> Is it possible to make double nat port forward?

Sure it is.

> SOME INTERNET MACHINE
> 1.1.1.1 (real public IP)
>=20
>        V
>=20
> OUTER_GW
> eth0: 2.2.2.228/27 (real public IP)
> eth1: 192.168.1.1/24
>=20
>         V
>=20
> INNER_GW
> eth0: 192.168.1.2/24
> eth1: 2.2.2.225/27 (fake public IP)
>=20
>         V
>=20
> HOST
> eth0: 2.2.2.249/27 (fake public IP)

Consider using addresses in the special range 192.0.2.0/24 reserved for
examples and documentation instead of random addresses that are not
allocated to you. See RFC 3330.

> While OUTER_GW forwards port 222 to INNER_GW just fine, INNER_GW sees
> the SYN packet the OUTER_GW has passed it but doesn't forward it to
> HOST:
>=20
> root@pm-inner-gw:~# tshark -Nm -i eth0 host ! 192.168.1.1
> Running as user "root" and group "root". This could be dangerous.
> Capturing on eth0
>   0.000000 1.1.1.1 -> 192.168.1.2  TCP 1271 > 222 [SYN] Seq=3D0
> Win=3D65535 Len=3D0 MSS=3D1460
>   0.439790  192.168.1.2 -> 1.1.1.1 ICMP Destination unreachable (Host
> unreachable)

ICMP host unreachable usually indicates an ARP failure for the next hop
address. What happens on INNER_GW's eth1 and HOST's eth0 (IP or ARP) ?

> Is there some sort of "security feature" in the kernel that doesn't
> allow packets to be forwarded from IANA's "private IP" to a "public
> IP"?

Not AFAIK.
