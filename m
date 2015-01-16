From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Fri, 16 Jan 2015 10:16:02 +0100
Message-ID: <54B8D6D2.2060701@plouf.fr.eu.org>
References: <CAJb3rWB_G6AkHAcTP2uCYFzL_VLPG5rgw5cnvyf+qCafF+QtXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJb3rWB_G6AkHAcTP2uCYFzL_VLPG5rgw5cnvyf+qCafF+QtXQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: The Media Server <info@themediaserver.com>
Cc: netfilter@vger.kernel.org

Hello,

The Media Server a =E9crit :
> Hi I can't get my PREROUTING iptables rule to mark my packets via
> --set-mark on Ubuntu
>=20
> iptables -t mangle -A PREROUTING -p tcp --sport 80 -j MARK --set-mark=
 2
> rule add fwmark 2 table 2
>=20
> iptables -t mangle -A PREROUTING -j MARK --set-mark 2
> iptables -t mangle -A INPUT -j MARK --set-mark 2
> iptables -t nat -A INPUT -j MARK --set-mark 2
> iptables -t nat -A PREROUTING -j MARK --set-mark 2
>=20
> None of the above pass trough the table2
>=20
> but this does pass trough the table 2 with this rule:
> ip rule add from 192.168.2.0/24 table 2

What do you want to achieve with these rules ?
