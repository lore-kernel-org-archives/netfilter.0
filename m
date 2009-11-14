From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables/when loading a webpage, get subsequent firewall block(s)?
Date: Sat, 14 Nov 2009 19:17:59 +0100
Message-ID: <4AFEF457.6080208@plouf.fr.eu.org>
References: <alpine.DEB.2.00.0911140807540.27423@p34.internal.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0911140807540.27423@p34.internal.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Justin Piszcz a =E9crit :
>=20
> When I load [some] web pages I get firewall blocks after the page has=
=20
> loaded, for example:
[...]
> Firewall block:
> Nov 14 08:13:19 p34 INPUT_BLOCK IN=3Deth1 OUT=3D MAC=3D00:1b:21:43:7b=
:9e:00:13:f7:5e:77:56:08:00 SRC=3D69.41.161.35 DST=3D75.144.35.66 LEN=3D=
43 TOS=3D00 PREC=3D0x20 TTL=3D17 ID=3D0 PROTO=3DTCP SPT=3D80 DPT=3D3858=
2 SEQ=3D3671564445 ACK=3D0 WINDOW=3D0 ACK RST URGP=3D0

That's a RST (reset) from the web server. If it does not match an
existing connection, the connection tracking classifies it in the
INVALID state.

> The last few packets of a tcpdump:
> # tcpdump -XX -S -s 0 -vv -i eth1 -n host 69.41.161.35
>=20
> 08:13:08.482191 IP (tos 0x0, ttl 64, id 27054, offset 0, flags [DF], =
proto TCP (6), length 40)
>      75.144.35.66.38582 > 69.41.161.35.80: Flags [F.], cksum 0x8d3c (=
correct), seq 4037481634, ack 2462267876, win 25728, length 0

That's an outgoing FIN, closing the connection.

> 08:13:08.533200 IP (tos 0x20, ttl 49, id 25885, offset 0, flags [DF],=
 proto TCP (6), length 40)
>      69.41.161.35.80 > 75.144.35.66.38582: Flags [.], cksum 0xd89c (c=
orrect), seq 2462267876, ack 4037481635, win 6432, length 0

That's an incoming ACK (acknowledge) of the previous FIN packet. Now th=
e
connection is really closed.

> 08:13:19.123062 IP (tos 0x20, ttl 17, id 0, offset 0, flags [none], p=
roto TCP (6), length 43)
>      69.41.161.35.80 > 75.144.35.66.38582: Flags [R.], cksum 0x7bc7 (=
correct), seq 3671564445:3671564448, ack 0, win 0, length 3 [RST cki]

That's a RST for an already closed connection -> state INVALID.

> This last packet at 08:13:19 appears to be what gets blocked by iptab=
les,
> even though ESTABLISHED,RELATED is in effect.

As expected.
