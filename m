From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: packets rejected as invalid, why?
Date: Mon, 02 Dec 2013 22:29:45 +0100
Message-ID: <529CFBC9.3000604@plouf.fr.eu.org>
References: <1c23a9c49af4cca75004123c0166f546@mail.zaplinski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1c23a9c49af4cca75004123c0166f546@mail.zaplinski.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Olaf Zaplinski a =E9crit :
>=20
> since Dec. 1st I see 60 rejected packets from well known and "good"=20
> SMTP hosts:
>=20
> Dec  2 12:12:02 binky kernel: [873572.327219] iptables-INVALID IN=3De=
th0=20
> OUT=3D MAC=3D00:f1:70:00:58:f0:fc:fb:fb:2d:55:48:08:00 SRC=3D213.165.=
67.104=20
> DST=3D109.75.188.214 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D58 ID=3D0 =
DF PROTO=3DTCP=20
> SPT=3D25 DPT=3D37022 SEQ=3D3171195917 ACK=3D0 WINDOW=3D0 RES=3D0x00 R=
ST URGP=3D0
>=20
> Why are these logged and rejected?

Because your rules below say so.

> The rules:
>=20
> $IPTABLES -A INPUT -m conntrack --ctstate INVALID -m limit \
> --limit 3/s -j LOG --log-prefix=3D"iptables-INVALID " \
> --log-tcp-sequence --log-tcp-options
>=20
> $IPTABLES -A INPUT -m conntrack --ctstate INVALID -j DROP
>=20
> I think this packet was part of the TCP closing handshake, so it shou=
ld=20
> have been ESTABLISHED and not INVALID. Am I wrong?

RST is not part of the normal TCP closing handshake (FIN+ACK, FIN+ACK,
ACK). My guess is that this packet is related to an old connection whic=
h
is considered already closed by conntrack.
