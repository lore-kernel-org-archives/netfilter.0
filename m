From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: IPIP decapsulation
Date: Fri, 07 Dec 2007 18:00:53 +0100
Message-ID: <47597C45.4060606@plouf.fr.eu.org>
References: <CC12CD48AEDA1E4B8A3F626DA84E927209CD49CD@ka-cap-sr-3601.xb.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CC12CD48AEDA1E4B8A3F626DA84E927209CD49CD@ka-cap-sr-3601.xb.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Please do not reply to a message when you start a new discussion. This=20
disrupts the existing thread and makes your message less visible.

Shaun Mccullagh a =E9crit :
>=20
>                           Director A (62.101.52.99)
>                               |    Virtual Server (62.101.52.106)
>                               |
>                               |
> 				Iptables Firewall (62.101.15.9)
>                               |
> 			Real Server B (10.1.60.10)
>=20
> The idea is Browser Requests are sent to the Web Director. This then
> encapsulates the datagrams using IPIP and tunnels them to the IPtable
> Firewall which is on the same LAN as Real Server B
>=20
> I've setup a tunnel on the IP Tables firewall so that it can return t=
he
> datagrams to the client browser with the same source address as the
> Director
>=20
> The IP Addresses used on the Director are
>=20
> eth0: inet 62.101.52.99/28 brd 62.101.52.111 scope global eth0
>       inet 62.101.52.106/28 scope global secondary eth0 =20
>       (This is used as a Virtual Server IP)
>=20
> Ipvsadm looks like this on the Director:
>=20
> Prot LocalAddress:Port Scheduler Flags
>   -> RemoteAddress:Port           Forward Weight ActiveConn InActConn
> TCP  62.101.52.106:80 wlc persistent 86400
>   -> 62.101.15.9:80               Tunnel  1      4          0        =
=20
>=20
> IPtables firewall uses
>     inet 62.101.15.9/24 scope global secondary eth1.11
>     inet 10.1.60.5/24 eth0.60
>=20
> and
>=20
> tun0@NONE: <POINTOPOINT,NOARP,UP> mtu 1480 qdisc noqueue=20
>     link/ipip 62.101.15.9 peer 62.101.52.99
>     inet 62.101.52.106 peer 62.101.52.255/32 scope global tun2
>=20
> This almost works.
>=20
> The problem is I cannot figure out how to get the IPtables firewall t=
o
> forward the decapsulated datagrams to Real Server B. I believe this c=
an
> be done with mangling but I can't quite figure this out.
>=20
> Here is my current NAT table
>=20
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination        =20
> DNAT       tcp  --  0.0.0.0/0            62.101.15.9  dport 80
> to:10.1.60.10

If I understand correctly (I have never used IPVS), IPIP encapsulating=20
tunneling packets have source 62.101.52.99 and destination 62.101.15.9,=
=20
and encapsulated TCP packets have source [the client address] and=20
destination 62.101.52.106. So in the -d option I would put 62.101.52.10=
6=20
instead of 62.101.15.9.

> Input chain look like this
>=20
> Chain INPUT (policy DROP)
> target     prot opt source               destination        =20
> ACCEPT     tcp  --  62.101.52.106         62.101.15.9   dport 80

In the filter/INPUT chain you must allow IPIP tunneling (protocol 4)=20
instead of TCP. You must accept TCP port 80 from any to 10.1.6.10 in th=
e=20
filter/FORWARD chain, and symmetric return traffic from the server of=20
course.

You may also need to disable source validation (rp_filter) on the tunne=
l=20
interface tun0.
