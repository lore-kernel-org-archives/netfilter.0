From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Dropping network "noise"
Date: Sun, 13 Feb 2005 14:56:26 +0100
Message-ID: <1108302986.10876.40.camel@nostromo.bgsecm.com>
References: <200502130928.41225.e-boogie@yandex.ru>
	<1108296226.10876.16.camel@nostromo.bgsecm.com>
	<420F5186.5060703@hotpop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <420F5186.5060703@hotpop.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

El dom, 13-02-2005 a las 15:09 +0200, Georgi Alexandrov escribi=C3=B3:
> Jose Maria Lopez Hernandez wrote:
>=20
> >El dom, 13-02-2005 a las 09:28 +0300, Mikhail Zotov escribi=C3=B3:
> > =20
> >
> >>Hello everybody,
> >>
> >>I have a Linux machine (with a static routable IP address)
> >>connected to a windoops LAN.  As is known, there is certain
> >>"noise" in windoops networks, which can be silently dropped
> >>by a rule like this:
> >>
> >>iptables -A INPUT -p udp --dport 135:139 -j DROP
> >>   =20
> >>
> >
> >That's OK, but also DROP port 445 because there's also a great
> >amount of traffic in that port.
> >
> > =20
> >
> How exactly is that OK ? i guess you don't have anything listening on=20
> 135-139/udp, right ?

The OP *wanted* to DROP that ports, and their rules were OK. That's
all I said. And have in mind that even if you are not listening in
those ports you are responding RST-ACK packets if you don't DROP the
connections. I have to DROP the 445 packets from the Internet because
they cause my machine to send traffic I don't want to be sent.

> So you won't "save" any traffic with a rule like that, that's how=20
> ethernet works.

You save the RST-ACK responses, if I'm not wrong.

> The only point in a rule like that maybe is - if you are logging not=20
> matched packets at the end of the filter table/INPUT chain and don't=20
> want your logs flooded by that broadcast traffic.

That's right. But if you want to DROP the Netbios packets also
there's nothing wrong with it.

> >If you are don't want to receive traffic your broadcast it's OK.
> > =20
> >
> same thing here ... you will receive that broadcast traffic no matter=20
> what. dropping it won't help.

Same reason that before. You receive the packets, but you don't
answer to them.

> regards,
> Georgi Alexandrov

Regards.

--=20

Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"



