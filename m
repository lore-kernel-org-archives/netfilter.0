From: kernel_learner <kernel_learner@yahoo.com>
Subject: Re: AW: [despammed] Netfilter as an application.
Date: Thu, 22 Jan 2004 08:33:30 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040122163330.2132.qmail@web40304.mail.yahoo.com>
References: <NAENJKNIDEBCFOJEICJKOENACAAA.misiu_@gmx.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NAENJKNIDEBCFOJEICJKOENACAAA.misiu_@gmx.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Maybe I did say this in the wrong way..
No way I want a user to change the IPTABLE Rules..that
would be ..ahem..CRAZY!
Anyways what I really wanted was something that I can
use more like a benchmark which would read packet
inputs from a text-file....which was computationally
like the original netfilter..and would be free from
the networking stack and linux kernel hooks. This
would be a standalone benchmark that could be compiled
onto different architectures (embedded) for
performance metrics etc..

There..I hope I am clear now :|

Cheers
Learner!



--- misiu_@gmx.de wrote:
> Hi,
>=20
> you can use fwbuilder and sudo...
> so a normal user can use tables
> or did i miss something?
>=20
>=20
> -----Urspr=FCngliche Nachricht-----
> Von: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]Im
> Auftrag von
> Rakotomandimby Mihamina
> Gesendet: Samstag, 17. Januar 2004 21:32
> An: netfilter@lists.netfilter.org
> Betreff: Re: [despammed] Netfilter as an
> application.
>=20
>=20
> On Friday 16 January 2004 17:55, Andreas Kretschmer
> wrote:
> > > It would be a standard user program which
> > > a person with normal privelges could compile and
> run.
> > Very bad. Every can modify the rules. I think, you
> search 'Zonealarm for
> > Linux'.
>=20
> Iptables is already simple to use . there is also
> shorewall that can make
> the
> use easier ( for some )
>=20
> Just think what would be the weird if any user can
> add the firewall rule on
> a
> box . Do you really think something will work ?
>=20
> > > What would it do? It could do the same things
> that
> > > netfilter does...i.e. filter packets/NAT etc.
> However
> > Why?
>=20
> I think you should contribute to netfilter's
> documentation and give some
> simple and explained rules examples , you'll see
> that iptables will be
> simple
> ti use ... :-)
>=20
> > > Does such a thing exist?
> >
> > I hope: no.
>=20
> the same to me .
>=20
>=20
> --
> Rakotomandimby Mihamina Andrianifaharana
> Tel : +33 2 38 76 43 65
>
http://stko.dyndns.info/site_principal/Members/mihamina
>=20
>=20
>=20


__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/

