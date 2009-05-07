From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Select chain from set?
Date: Thu, 07 May 2009 16:01:15 +0200
Message-ID: <1241704875.12279.13.camel@enterprise.ims-firmen.de>
References: <33be4bb30904280221x9156f26t43ddfff0f083925f@mail.gmail.com>
	 <1240921645.14474.141.camel@hsa.vpn.anti>
	 <1240925694.4256.32.camel@casper.meteor.dp.ua>
	 <1240933140.12894.366.camel@chichi>
	 <1240992704.4235.1.camel@casper.meteor.dp.ua>
	 <1241106752.2778.91.camel@chichi>
	 <1241690844.5166.3.camel@casper.meteor.dp.ua>
	 <1241703893.2778.297.camel@chichi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1241703893.2778.297.camel@chichi>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: shinrich@ieee.org
Cc: casper@meteor.dp.ua, Martin Millnert <millnert@csbnet.se>, Oskar Berggren <oskar.berggren@gmail.com>, netfilter@vger.kernel.org

On Thu, 2009-05-07 at 08:44 -0500, Susan Hinrichs wrote:
> On Thu, 2009-05-07 at 13:07 +0300, =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=
=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA wro=
te:
> > =D0=92 =D0=A7=D1=82=D0=B2, 30/04/2009 =D0=B2 10:52 -0500, Susan Hin=
richs =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > On Wed, 2009-04-29 at 11:11 +0300, =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=
=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA=
 wrote:
> > > > =D0=92 =D0=92=D1=82=D0=BE, 28/04/2009 =D0=B2 10:39 -0500, Susan=
 Hinrichs =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > > I also agree that a runtime structure to track traffic attrib=
utes and
> > > > > match them to targets would be great.  I created my own match=
-tree table
> > > > > generator to achieve a similar effect.  It works, but updatin=
g large
> > > > > static structures can be rather time consuming and fragile.
> > > >=20
> > > > Can you share details?
> > > >=20
> > >=20
> > > Sure, I have a tool that takes a list of IP's, MACs, or marks, an=
d
> > > builds a prefix-based binary tree of the data.  It generates the =
tree in
> > > linked chains.  It operates in bulk and incremental model.
> >=20
> > What is the purpose of this?
>=20
> The tree lets you efficiently match a packet and do something unique =
for
> each "client" or "grouping".  So set a mark or set a class ID or upda=
te
> a unique recent set. As was noted in this thread earlier, ipset lets =
you
> efficiently match a packet basic on an address, but it doesn't let yo=
u
> do anything unique for each match.=20

Nftables will let you do that in the future

http://lwn.net/Articles/324251/

