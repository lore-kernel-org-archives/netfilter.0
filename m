From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: ip_conntrack_max vs ip_conntrack
Date: Tue, 28 Sep 2004 11:19:35 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409281119.36045.Alistair@nerdnet.ca>
References: <4154A112.20308@suse.cz>
	<1096376802.28905.38.camel@nostromo.bgsecm.com>
	<1403218a040928074868a3a36@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1403218a040928074868a3a36@mail.gmail.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On September 28, 2004 10:48 am, Mohamed Eldesoky wrote:
> Well, I want to make sure that it remembers only connections that
> passes THROUGH it !!

	Are you saying you don't want to track local connections?

	This file keeps track of anything that *_conntrack_* would watch.
	As far as I know this includes local connections --=20

	If you are accepting any connections locally, they are very likely in this
	table. =20

	I've seen at least one discussion about breaking this up into different=20
files.  That gets messy very quicky from a code point of view, as well as=20
from a logic point of view.  I certainly prefer the idea of having one plac=
e=20
to track connections.

	Alistair Tonner

=09
>
> On 28 Sep 2004 16:27:53 +0200, Jose Maria Lopez <jkerouac@bgsec.com> wrot=
e:
> > El mar, 28 de 09 de 2004 a las 09:59, Mohamed Eldesoky escribi=F3:
> > > But still,
> > > The /proc/net/ip_conntrack should contain all connections tracked by
> > > that firewall (ie, passing through the firewall), am I right ??
> >
> > Yes, and it will remember the connections made for a time. It's
> > a list of all the connections the conntrack system have seen, and
> > it's used to check the established and related connections.
> >
> >
> >
> > --
> > Jose Maria Lopez Hernandez
> > Director Tecnico de bgSEC
> > jkerouac@bgsec.com
> > bgSEC Seguridad y Consultoria de Sistemas Informaticos
> > http://www.bgsec.com
> > ESPA=D1A
> >
> > The only people for me are the mad ones -- the ones who are mad to live,
> > mad to talk, mad to be saved, desirous of everything at the same time,
> > the ones who never yawn or say a commonplace thing, but burn, burn, burn
> > like fabulous yellow Roman candles.
> >                 -- Jack Kerouac, "On the Road"

