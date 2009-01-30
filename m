From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: icmp forward
Date: Fri, 30 Jan 2009 12:42:43 +0100
Message-ID: <4982E7B3.40300@plouf.fr.eu.org>
References: <4982B7F3.4020603@cetrtapot.si> <200901300949.39955.christoph.paasch@gmail.com> <4982C494.50505@cetrtapot.si> <4982DC10.6020903@plouf.fr.eu.org> <4982E363.6070005@cetrtapot.si> <4982E5E7.1060803@cetrtapot.si>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4982E5E7.1060803@cetrtapot.si>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Cc: netfilter@vger.kernel.org

Hinko Kocevar a =E9crit :
>=20
> My bad, should be:
> iptables -A FORWARD -p icmp --icmp-type echo-request -j ACCEPT
> iptables -t nat -A PREROUTING -d 172.31.64.121 -p icmp -j DNAT --to-d=
estination 10.1.1.2

Actually both rules should contain "--icmp-type echo-request", as you=20
want to redirect only the ICMP echo request type (aka ping).

However, I'm wondering... It seems the gateway has private addresses on=
=20
both sides, so why do you bother with NAT ? Why not just ping the actua=
l=20
device address 10.1.1.2 instead ?
