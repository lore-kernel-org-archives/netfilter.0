From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: bandwidth monitoring
Date: 26 Jan 2005 21:00:42 +0100
Message-ID: <1106769641.8524.4.camel@nostromo.bgsecm.com>
References: <200501061128.04741.patrick.leduc@novipro.com>
	<20050126183331.GA25316@ranjeet-pc2.zultys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050126183331.GA25316@ranjeet-pc2.zultys.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El mi=C3=A9, 26 de 01 de 2005 a las 19:33, Ranjeet Shetye escribi=C3=B3:
> * patrick.leduc@novipro.com (patrick.leduc@novipro.com) wrote:
> > Hello
> >=20
> > Does somebody know a program for monitoring bandwidth by ip? I have o=
ne=20
> > internet interface and I must monitor many ips adresses on this inter=
face. I=20
> > tried Ipac-ng and, I worked a lot to do this config but it seems not =
working=20
> > this way.
> >=20
> > thanx
> >=20
>=20
> Long term bandwidth usage can be tracked using MRTG. (stored data +
> daemon + http server + web based gui)
>=20
> Instantaneous bandwidth usage can be tracked using iftop. (ncurses)

You can try our bastion-firewall-stats-addon, it's GPL and it uses
rrdtool to do the graphical stats. It's very easy to use, but you
have to use bastion-firewall to use it.

Another good option it's using something like Cacti to have an
interface to Rrdtool. It has scripts to monitor interfaces and
can do all kind of graphs.

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


