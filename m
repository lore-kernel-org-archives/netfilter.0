From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Why --syn on tcp connlimit?
Date: Fri, 23 Jan 2009 20:58:11 +0100
Message-ID: <497A2153.7090502@plouf.fr.eu.org>
References: <1FDE2549-3F21-4BD7-BB37-06C971D32052@dancing.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1FDE2549-3F21-4BD7-BB37-06C971D32052@dancing.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Peter Renzland a =E9crit :
> I have often seen rules such as:
>=20
> iptables -I FORWARD -p tcp --syn -m iprange --src-range=20
> 192.168.1.10-192.168.1.250 -m connlimit --connlimit-above 150 -j DROP
>=20
> How is this, in effect, different from?:
>=20
> iptables -I FORWARD -p tcp       -m iprange --src-range=20
> 192.168.1.10-192.168.1.250 -m connlimit --connlimit-above 150 -j DROP

connlimit matches *any* TCP packet as soon as there are enough existing=
=20
TCP connections from the source address or prefix, including packets=20
belonging to established connections. --syn makes sure that the rule=20
matches only SYN packets creating a new connection, without disrupting=20
established connections. Another way to achieve this is to match only=20
packets in the state NEW, as explained by Nikolay.
