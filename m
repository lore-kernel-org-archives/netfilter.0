From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: connection tracking without iptables?
Date: 16 Oct 2004 14:30:12 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097857383.16630.32.camel@nostromo.bgsecm.com>
References: <7C9884991ADAE0479C14F10C858BCDF591E37C@alderaan.smgtec.com>
	<561dc326040930160476d839c7@mail.gmail.com>
	<1096587270.22962.24.camel@wolfpack.ljm.dom>
	<561dc326041014113163a6a9eb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <561dc326041014113163a6a9eb@mail.gmail.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El jue, 14 de 10 de 2004 a las 20:31, Jiann-Ming Su escribi=C3=B3:
> On Thu, 30 Sep 2004 19:34:30 -0400, Jason Opperisano <opie@817west.com>=
 wrote:
> >=20
> >   egrep 'ESTABLISHED|ASSURED' /proc/net/ip_conntrack | wc -l
> >=20
>=20
> We're finding that any read operation on /proc/net/ip_conntrack really
> locks the system until that operation is completed.  That is, it's
> almost as if the read prevents any writes, so the firewall locks up
> momentarily until the read is done.  Is there a less system intensive
> way to read ip_conntrack?  Or, is my observation completely wrong?

You can try to use libipq or libiptc to read the connection tracking
list, but I don't know if it's even possible. You can check the source
code of iptstate to see how they do it, maybe you can find a way of
reading the data more quickly or at least read only the data you
need.
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


