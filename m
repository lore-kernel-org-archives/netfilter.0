From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Redirecting flows among one machine's interfaces
Date: Wed, 10 Nov 2010 09:47:23 +0100
Message-ID: <4CDA5C1B.5070901@plouf.fr.eu.org>
References: <764497.89064.qm@web31604.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <764497.89064.qm@web31604.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Kostas Pelechrinis <kpele_ntua@yahoo.com>
Cc: netfilter@vger.kernel.org

Hello,

Kostas Pelechrinis a =E9crit :
>=20
> I have a machine with two interfaces (let's say if1 -- with ip addres=
s
> a.b.c.d -- and if2 -- with ip address x.y.z.w) both connected to the
> internet. One of the two interfaces is the default interface (e.g., i=
f1).
>  Whatever flow is initiated towards a destination in the Internet is
> going out if1.  I want to use iptables in order to redirect some of t=
he
> flows to if2.  Is there a way to do this using iptables? =20

This is a FAQ. You will find useful information in the Linux Advanced
Routing and Traffic Control (LARTC) HOWTO.

> I have tried some rules (e.g., iptables -A FORWARD -d k.l.m.n -o if2
> -j ACCEPT // where k.l.m.n is the destination ip address of the flow =
I
> want to redirect) but with no luck.  From what I could figure out the
> rule FORWARD is mainly for packets that go through the machine and no=
t
> that much for packets originating from the machine.

Indeed. Besides, the rule justs matches packets going out through the
interface if2. It does not have any effect on the routing decision,
which took place before the FORWARD chain.

> another question is weather iptables changing the source ip address
> from a.b.c.d to x.y.z.w or not.

Iptables does not change the source address implicitly as a result of a
rerouting decision. You have to do it explicitly with rules using SNAT
or MASQUERADE.
