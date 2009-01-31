From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Problem with getting reply packets
Date: Sat, 31 Jan 2009 11:32:29 +0100
Message-ID: <498428BD.2000609@plouf.fr.eu.org>
References: <4983937B.4060200@bartk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4983937B.4060200@bartk.us>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Bart Kus a =E9crit :
>=20
> Setup:  Inet -> Netgear -> WifiRouter -> CoreRouter
>=20
> Connection comes from inet to Netgear's public IP.  DMZ on Netgear ta=
kes=20
> it to WifRouter's IP within the internal net of Netgear.  DMZ on=20
> WifiRouter takes it to CoreRouter's IP.  CoreRouter is running sshd a=
nd=20
> replies to WifiRouter.  WifiRouter does NOT forward the packet to=20
> Netgear.  A state is established in ip_conntrack but never matures=20
> beyond SYN_RECV status.  Here's the iptables of WifiRouter:
[...]
> And here's the relevant ip_conntrack entry of WifiRouter after a SYN =
has=20
> been sent, and CoreRouter has properly transmitted a SYN+ACK back @=20
> WifiRouter:
>=20
> tcp      6 59 SYN_RECV src=3D98.233.248.36 dst=3D192.168.1.200 sport=3D=
50587=20
> dport=3D22 src=3D192.168.44.17 dst=3D98.233.248.36 sport=3D22 dport=3D=
50587 use=3D1
[...]
> Why is the reply (SYN+ACK) not being associated with this SYN_RECV st=
ate=20
> entry

It is. The SYN_RECV states indicates that the SYN+ACK was successfully=20
associated to the connection. Otherwise the conntrack entry would show=20
SYN_SENT and [UNREPLIED] instead.

> and being propagated back out to the internet?

No clue, sorry. Did you try to trace it through the iptables chains ?
