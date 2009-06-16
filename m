From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: workaround for no DROP in table nat ?
Date: Tue, 16 Jun 2009 10:08:11 +0300
Message-ID: <1245136091.4045.0.camel@casper.meteor.dp.ua>
References: <20090615165904.GA29477@regulus.madore.org>
	 <m33aa1v29x.fsf@neo.luffy.cx>
	 <778caabff9c5013ee945219bcae424c6@mail.treenet.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <778caabff9c5013ee945219bcae424c6@mail.treenet.co.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Amos Jeffries <squid3@treenet.co.nz>
Cc: Vincent Bernat <bernat@luffy.cx>, David Madore <david+ml@madore.org>, netfilter@vger.kernel.org

=D0=92 =D0=92=D1=82=D0=BE, 16/06/2009 =D0=B2 16:29 +1200, Amos Jeffries=
 =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Mon, 15 Jun 2009 19:24:10 +0200, Vincent Bernat <bernat@luffy.cx> =
wrote:
> > OoO Lors de la soir=C3=A9e naissante du lundi 15 juin 2009, vers 18=
:59, David
> > Madore <david+ml@madore.org> disait :
> >=20
> >> Recent versions of iptables have forbidden the use of DROP in the =
nat
> >> table.  I can't understand, however, how one is supposed to work
> >> around this limitation: is there a howto or some kind of documenta=
tion
> >> somewhere which explains how to deal with this change?
> >=20
> >> Suppose my current rules look something like this:
> >=20
> >> -t nat -A OUTPUT -p tcp -d somenetwork -m tcp --syn --dport 80 -j
> >> CONTROLLED
> >> -t nat -A CONTROLLED -m limit --limit 10/hour -j RETURN
> >> -t nat -A CONTROLLED -p tcp -m statistic --mode random --probabili=
ty 0.1
> >> -j REDIRECT --to-ports 80
> >> -t nat -A CONTROLLED -j DROP
> >=20
> > You can DROP in the mangle table instead.
> >=20
> > -t mangle -A OUTPUT -p tcp -d ... -j CONTROLLED
> > -t mangle -j CONTROLLED -m limit --limit ... -j RETURN
> > -t mangle -j CONTROLLED -p tcp -m statistic --mode random --probabi=
lity
> 0.9
> > -j DROP
> > -t mangle -j CONTROLLED -j MARK --set-mark 1
> > -t nat -A OUTPUT -m mark --mark 1 -j REDIRECT --to-ports 80
> >=20
> > You can also  DROP in the raw table,  but I think you cannot  set a=
 mark
> > here.
>=20
> Would this not begin to drop n% packets instead of n% connections? du=
e to
> the nat table only receiving NEW packets and mangle receiving all.
>=20
> I think you may also need to add state NEW to the rule somehow.

Anyways, what is the reason for a such big change?

--=20
=D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=
=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>

