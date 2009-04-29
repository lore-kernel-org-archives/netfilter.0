From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Select chain from set?
Date: Wed, 29 Apr 2009 11:11:44 +0300
Message-ID: <1240992704.4235.1.camel@casper.meteor.dp.ua>
References: <33be4bb30904280221x9156f26t43ddfff0f083925f@mail.gmail.com>
	 <1240921645.14474.141.camel@hsa.vpn.anti>
	 <1240925694.4256.32.camel@casper.meteor.dp.ua>
	 <1240933140.12894.366.camel@chichi>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1240933140.12894.366.camel@chichi>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: shinrich@ieee.org
Cc: Martin Millnert <millnert@csbnet.se>, Oskar Berggren <oskar.berggren@gmail.com>, netfilter@vger.kernel.org

=F7 =F7=D4=CF, 28/04/2009 =D7 10:39 -0500, Susan Hinrichs =D0=C9=DB=C5=D4=
:
> I also agree that a runtime structure to track traffic attributes and
> match them to targets would be great.  I created my own match-tree ta=
ble
> generator to achieve a similar effect.  It works, but updating large
> static structures can be rather time consuming and fragile.

Can you share details?

> I have a question about the '-g' terminology used by Casper and Oscar=
=2E
> Is this a new piece of functionality?  Or are you talking about the
> --goto option?

Personaly, I was talking about --goto.

> > > This all begs the question on how effective some tree structure w=
ith -g
> > > is implemented, to figure out how much of a performance benefit s=
uch a
> > > new target would have over a treelike chain structure. =20
> >=20
> > If we compare many linear -g with just one function gettarget(ip) t=
he
> > different is many/one. Tree-like -g structure would save most
> > comparitions, but is hard to write for every task. Function-like ta=
rget
> > is real fast and fully automatic, the only disadvantage is in fact =
it
> > doesn't exist :)
> >=20
>=20
>=20
--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

