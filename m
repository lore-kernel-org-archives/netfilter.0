From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: learning firewall
Date: 05 Sep 2004 18:35:40 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094393906.3726.2.camel@nostromo.bgsecm.com>
References: <20040902191645.GA28800@omega.lacnic.net.uy>
	<20040903102543.GI3755@metastasis.org.uk>	<1094215486.3029.4.camel@Quark>
	<1094222078.25616.17.camel@nostromo.bgsecm.com>
	<413A34EC.3040507@mail.co.gilchrist.fl.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <413A34EC.3040507@mail.co.gilchrist.fl.us>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: Eric Ellis <eellis@mail.co.gilchrist.fl.us>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El s=C3=A1b, 04 de 09 de 2004 a las 23:34, Eric Ellis escribi=C3=B3:
> Jose Maria Lopez wrote:
> > El vie, 03 de 09 de 2004 a las 14:44, Miguel Angel Amador L escribi=C3=
=B3:
> >=20
> >>Hi All,
> >> I have a questions, what module i must be install for the P2P
> >>conections ? (sorry for my english, is very slow)
> >> Thnx a lot=20
> >>
> >>Regards
> >> Miguel Amador L.
> >>
> >=20
> >=20
> > The port I use to block P2P (or to allow them if you want) are:
> >=20
> > KAZAA 1214/tcp
> > NAPSTER 8888/tcp 7777/tcp 8875/tcp
> > EDONKEY/EMULE 4662/tcp 4663/tcp
> > WINMX 6699/tcp
> >=20
> > But have in mind that some of this programs can use SOCKS proxies or
> > even standard ports like port 80/tcp to send or receive traffic. It
> > can be a little tricky to stop them (easier to allow them, just open
> > this ports and they will run).
> >=20
> >=20
> I will be the first of many to say the following:
>=20
> Don't allow everything and drop what you don't want to get in.  This is=
=20
> bad form from a security standpoint, as there will almost always be new=
=20
> things that use different ports.  Best practice is to drop everything,=20
> and allow what you want through explicitly.  The initial set up might b=
e=20
> more difficult, and your rule list probably longer than the other way,=20
> but in the end, your network security is what matters, and this practic=
e=20
> will help ensure that much better.

I totally agree with that. If you look at our project bastion-firewall
you should note that it always uses a deny policy and then open the
ports you want to. What I was referring to it was that many people want
to allow P2P, and that allowing P2P it's easier than blocking them, but
of course the default policy in any modern firewall should be to deny
all ports and then allow the traffic in some of them.


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


