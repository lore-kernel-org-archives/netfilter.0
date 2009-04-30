From: Susan Hinrichs <shinrich@thought-mesh.net>
Subject: Re: Select chain from set?
Date: Thu, 30 Apr 2009 10:52:32 -0500
Message-ID: <1241106752.2778.91.camel@chichi>
References: <33be4bb30904280221x9156f26t43ddfff0f083925f@mail.gmail.com>
	 <1240921645.14474.141.camel@hsa.vpn.anti>
	 <1240925694.4256.32.camel@casper.meteor.dp.ua>
	 <1240933140.12894.366.camel@chichi>
	 <1240992704.4235.1.camel@casper.meteor.dp.ua>
Reply-To: shinrich@ieee.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1240992704.4235.1.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: casper@meteor.dp.ua
Cc: Martin Millnert <millnert@csbnet.se>, Oskar Berggren <oskar.berggren@gmail.com>, netfilter@vger.kernel.org


On Wed, 2009-04-29 at 11:11 +0300, =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=
=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA wro=
te:
> =D0=92 =D0=92=D1=82=D0=BE, 28/04/2009 =D0=B2 10:39 -0500, Susan Hinri=
chs =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > I also agree that a runtime structure to track traffic attributes a=
nd
> > match them to targets would be great.  I created my own match-tree =
table
> > generator to achieve a similar effect.  It works, but updating larg=
e
> > static structures can be rather time consuming and fragile.
>=20
> Can you share details?
>=20

Sure, I have a tool that takes a list of IP's, MACs, or marks, and
builds a prefix-based binary tree of the data.  It generates the tree i=
n
linked chains.  It operates in bulk and incremental model.

I didn't consider the gotos in generating the output, but I can see now
that it might simplify the tree flow quite a bit.

I've done some very basic latency tests using ping, and the tree
introduced less than 2/3 the latency vs the a linear case for around 80=
0
elements, and just 20% more latency than an empty iptable policy.

