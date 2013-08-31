From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: DNAT on loopback
Date: Sat, 31 Aug 2013 12:33:58 +0200
Message-ID: <5221C696.4070301@plouf.fr.eu.org>
References: <87vc38taw7.fsf@wintermute.ptsecurity.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87vc38taw7.fsf@wintermute.ptsecurity.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Serge Kosyrev <skosyrev@ptsecurity.ru>
Cc: netfilter@vger.kernel.org

Hello,

Serge Kosyrev a =E9crit :
>=20
> Is it possible to DNAT locally-originated, locally-destined packets t=
o a
> non-local destination?

Sometimes, but not alway.

> The use-case is port forwarding to a locally-routed VM guest.
> For externally originating access the following is adequate:
>=20
> iptables -t nat -A PREROUTING -d external.iface.ip -p tcp --dport 80 =
-j DNAT --to-destination target.ip.add.ress
>=20
> A logical complement for locally originating accesses would have been=
:
>=20
> iptables -t nat -A OUTPUT     -d 127.0.0.0/16      -p tcp --dport 80 =
-j DNAT --to-destination target.ip.add.ress
>=20
> ..but all I can observe is silent packet disappearance, which I presu=
me
> takes place during routing decision-making immediately following the
> processing by the OUTPUT chain of the nat table.

Yes, packets are discarded because the output interface is non-loopback
and the source address is within 127.0.0.0/8, which is restrited to
loopback. Unfortunately you can only change the source address in
POSTROUTING, which comes too late.

> So, is it possible at all, or should I go the userspace port forwardi=
ng way?

It is possible if the original source adress is not within 127.0.0.0/8.

=46or local destinations the default source adresse is the same as the
destination, but some applications allow to specify a different address=
=2E

However why don't you use the same destination address external.iface.i=
p
as in the PREROUTING rule, so that the default source adress would not
be a loopback address ?
