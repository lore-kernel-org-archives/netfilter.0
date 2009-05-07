From: Susan Hinrichs <shinrich@thought-mesh.net>
Subject: Re: Select chain from set?
Date: Thu, 07 May 2009 08:44:53 -0500
Message-ID: <1241703893.2778.297.camel@chichi>
References: <33be4bb30904280221x9156f26t43ddfff0f083925f@mail.gmail.com>
	 <1240921645.14474.141.camel@hsa.vpn.anti>
	 <1240925694.4256.32.camel@casper.meteor.dp.ua>
	 <1240933140.12894.366.camel@chichi>
	 <1240992704.4235.1.camel@casper.meteor.dp.ua>
	 <1241106752.2778.91.camel@chichi>
	 <1241690844.5166.3.camel@casper.meteor.dp.ua>
Reply-To: shinrich@ieee.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1241690844.5166.3.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: casper@meteor.dp.ua
Cc: Martin Millnert <millnert@csbnet.se>, Oskar Berggren <oskar.berggren@gmail.com>, netfilter@vger.kernel.org


On Thu, 2009-05-07 at 13:07 +0300, =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=
=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA wro=
te:
> =D0=92 =D0=A7=D1=82=D0=B2, 30/04/2009 =D0=B2 10:52 -0500, Susan Hinri=
chs =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, 2009-04-29 at 11:11 +0300, =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=
=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA =
wrote:
> > > =D0=92 =D0=92=D1=82=D0=BE, 28/04/2009 =D0=B2 10:39 -0500, Susan H=
inrichs =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > I also agree that a runtime structure to track traffic attribut=
es and
> > > > match them to targets would be great.  I created my own match-t=
ree table
> > > > generator to achieve a similar effect.  It works, but updating =
large
> > > > static structures can be rather time consuming and fragile.
> > >=20
> > > Can you share details?
> > >=20
> >=20
> > Sure, I have a tool that takes a list of IP's, MACs, or marks, and
> > builds a prefix-based binary tree of the data.  It generates the tr=
ee in
> > linked chains.  It operates in bulk and incremental model.
>=20
> What is the purpose of this?

The tree lets you efficiently match a packet and do something unique fo=
r
each "client" or "grouping".  So set a mark or set a class ID or update
a unique recent set. As was noted in this thread earlier, ipset lets yo=
u
efficiently match a packet basic on an address, but it doesn't let you
do anything unique for each match.=20

