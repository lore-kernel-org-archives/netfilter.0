From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Checking line status
Date: Wed, 02 Sep 2009 16:29:02 +0200
Message-ID: <4A9E812E.2060601@plouf.fr.eu.org>
References: <4A93CC1C.3070100@infoservices.in> <58261217A1E14FCCB2F0CF27FA977252@squarepi.com> <4A93DDA0.6000900@trash.net> <591B070B9C3D465CA4CCE1B11024DBEA@squarepi.com> <1251895652.23708.37.camel@enterprise.ims-firmen.de> <0DB67FCC2A774AFCA834C6CD4BE5DB12@squarepi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0DB67FCC2A774AFCA834C6CD4BE5DB12@squarepi.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: John Lister <john.lister@kickstone.com>
Cc: netfilter@vger.kernel.org

Hello,

John Lister a =E9crit :
> I thought local packets went through this chain
>=20
> mangle(OUTPUT) -> nat (OUTPUT) -> OUTPUT -> routing decision -> mangl=
e=20
> (POSTROUTING) -> nat (POSTROUTING)

Actually there is an initial decision routing when the packet is create=
d
before the OUTPUT chains, in order to select the output interface and
source address. Also after "nat (OUTPUT)" it should be "filter (OUTPUT)=
".

[...]
> ip rule add fwmark 111 table 111
> ip rule add fwmark 222 table 222
>=20
> iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark
> iptables -t mangle -A OUTPUT -m mark --mark 0 -m state --state NEW -m=
=20
> statistic --mode nth --every 2 --packet 0 -j MARK --set-mark 111
> iptables -t mangle -A OUTPUT -m mark --mark 0 -m state --state=20
>     -j MARK --set-mark 111

Isn't something missing in that rule ?
Also, I can see no iptables rule setting mark 222.

> I would hope that the first set of iptables rules mark the packets be=
fore=20
> the routing rules forward them on their way

This is normally what happens.
