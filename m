From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Select chain from set?
Date: Thu, 07 May 2009 13:07:24 +0300
Message-ID: <1241690844.5166.3.camel@casper.meteor.dp.ua>
References: <33be4bb30904280221x9156f26t43ddfff0f083925f@mail.gmail.com>
	 <1240921645.14474.141.camel@hsa.vpn.anti>
	 <1240925694.4256.32.camel@casper.meteor.dp.ua>
	 <1240933140.12894.366.camel@chichi>
	 <1240992704.4235.1.camel@casper.meteor.dp.ua>
	 <1241106752.2778.91.camel@chichi>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1241106752.2778.91.camel@chichi>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: shinrich@ieee.org
Cc: Martin Millnert <millnert@csbnet.se>, Oskar Berggren <oskar.berggren@gmail.com>, netfilter@vger.kernel.org

=F7 =FE=D4=D7, 30/04/2009 =D7 10:52 -0500, Susan Hinrichs =D0=C9=DB=C5=D4=
:
> On Wed, 2009-04-29 at 11:11 +0300, =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =
=EB=CF=D3=D4=C9=CB wrote:
> > =F7 =F7=D4=CF, 28/04/2009 =D7 10:39 -0500, Susan Hinrichs =D0=C9=DB=
=C5=D4:
> > > I also agree that a runtime structure to track traffic attributes=
 and
> > > match them to targets would be great.  I created my own match-tre=
e table
> > > generator to achieve a similar effect.  It works, but updating la=
rge
> > > static structures can be rather time consuming and fragile.
> >=20
> > Can you share details?
> >=20
>=20
> Sure, I have a tool that takes a list of IP's, MACs, or marks, and
> builds a prefix-based binary tree of the data.  It generates the tree=
 in
> linked chains.  It operates in bulk and incremental model.

What is the purpose of this?

> I didn't consider the gotos in generating the output, but I can see n=
ow
> that it might simplify the tree flow quite a bit.
>=20
> I've done some very basic latency tests using ping, and the tree
> introduced less than 2/3 the latency vs the a linear case for around =
800
> elements, and just 20% more latency than an empty iptable policy.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

