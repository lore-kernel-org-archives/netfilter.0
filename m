From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Source NAT in  POSTROUTING chain for locally generated packets
Date: Fri, 29 Aug 2014 00:08:38 +0200
Message-ID: <53FFA866.6020908@plouf.fr.eu.org>
References: <1613016.CfItKYvQAW@nb003>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1613016.CfItKYvQAW@nb003>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ms@sys4.de
Cc: netfilter@vger.kernel.org

Hello,

Michael Schwartzkopff a =E9crit :
>=20
> For some special reasons I want to alter the IP address of outgoing p=
ackets=20
> that are generated locally to a secondary IP address on my machine. F=
or a test=20
> I use the udp/echo service. Without any rules a tcpdump looks like th=
is:
>=20
> 192.168.56.101 is the primary address of the echo server and 192.168.=
56.16 is=20
> the secondary address of the interface.
>=20
> 08:24:04.063987 IP 192.168.56.1.48462 > 192.168.56.16.echo: UDP, leng=
th 6
> 08:24:04.064522 IP 192.168.56.101.echo > 192.168.56.1.48462: UDP, len=
gth 6
>=20
> So I add the iptables rule:
>=20
> iptables -t nat -I POSTROUTING -p udp -s 192.168.56.101 --sport 7 \
>   -j SNAT --to-source 192.168.56.16
>=20
> now tcpdump shows that no answer packet is sent out any more:
>=20
> 08:24:16.851095 IP 192.168.56.1.55362 > 192.168.56.16.echo: UDP, leng=
th 6
>=20
>=20
> With iptables -t nat -L POSTROUTING I can see that the rule is hit si=
nce the=20
> counter increases. Also a iptables TRACE shows me that the rule is hi=
t. No=20
> filter appears in the TRACE log.
>=20
> Any ideas where the packet vanished?

Clash with an existing connection entry (the one created by the incomin=
g
packet) -> source port changed or packet dropped.
What was the full tcpdump command used ? Any filters ?

