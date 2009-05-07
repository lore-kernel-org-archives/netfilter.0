From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Select chain from set?
Date: Thu, 07 May 2009 18:48:20 +0300
Message-ID: <1241711300.5166.10.camel@casper.meteor.dp.ua>
References: <33be4bb30904280221x9156f26t43ddfff0f083925f@mail.gmail.com>
	 <1240921645.14474.141.camel@hsa.vpn.anti>
	 <1240925694.4256.32.camel@casper.meteor.dp.ua>
	 <1240933140.12894.366.camel@chichi>
	 <1240992704.4235.1.camel@casper.meteor.dp.ua>
	 <1241106752.2778.91.camel@chichi>
	 <1241690844.5166.3.camel@casper.meteor.dp.ua>
	 <1241703893.2778.297.camel@chichi>
	 <1241704875.12279.13.camel@enterprise.ims-firmen.de>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1241704875.12279.13.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Thomas Jacob <jacob@internet24.de>
Cc: shinrich@ieee.org, Martin Millnert <millnert@csbnet.se>, Oskar Berggren <oskar.berggren@gmail.com>, netfilter@vger.kernel.org

=F7 =FE=D4=D7, 07/05/2009 =D7 16:01 +0200, Thomas Jacob =D0=C9=DB=C5=D4=
:
> On Thu, 2009-05-07 at 08:44 -0500, Susan Hinrichs wrote:
> > On Thu, 2009-05-07 at 13:07 +0300, =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF=
 =EB=CF=D3=D4=C9=CB wrote:
> > > =F7 =FE=D4=D7, 30/04/2009 =D7 10:52 -0500, Susan Hinrichs =D0=C9=DB=
=C5=D4:
> > > > On Wed, 2009-04-29 at 11:11 +0300, =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=
=CF =EB=CF=D3=D4=C9=CB wrote:
> > > > > =F7 =F7=D4=CF, 28/04/2009 =D7 10:39 -0500, Susan Hinrichs =D0=
=C9=DB=C5=D4:
> > > > > > I also agree that a runtime structure to track traffic attr=
ibutes and
> > > > > > match them to targets would be great.  I created my own mat=
ch-tree table
> > > > > > generator to achieve a similar effect.  It works, but updat=
ing large
> > > > > > static structures can be rather time consuming and fragile.
> > > > >=20
> > > > > Can you share details?
> > > > >=20
> > > >=20
> > > > Sure, I have a tool that takes a list of IP's, MACs, or marks, =
and
> > > > builds a prefix-based binary tree of the data.  It generates th=
e tree in
> > > > linked chains.  It operates in bulk and incremental model.
> > >=20
> > > What is the purpose of this?
> >=20
> > The tree lets you efficiently match a packet and do something uniqu=
e for
> > each "client" or "grouping".  So set a mark or set a class ID or up=
date
> > a unique recent set. As was noted in this thread earlier, ipset let=
s you
> > efficiently match a packet basic on an address, but it doesn't let =
you
> > do anything unique for each match.=20
>=20
> Nftables will let you do that in the future
>=20
> http://lwn.net/Articles/324251/

This might save our world :)
I would say from the anounce this is what you have wanted from iptables=
=2E

Thanks for link.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

