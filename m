From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: ebtables mac update
Date: Wed, 30 Jun 2010 12:24:09 +0300
Message-ID: <1277889849.4255.15.camel@casper.meteor.dp.ua>
References: <1277808205.3791.17.camel@casper.meteor.dp.ua>
	 <4C29E8B4.5060205@plouf.fr.eu.org>
	 <1277821770.4006.33.camel@casper.meteor.dp.ua>
	 <4C2A09DB.6030205@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C2A09DB.6030205@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

=D0=92 =D0=92=D1=82=D0=BE, 29/06/2010 =D0=B2 09:57 -0500, Grant Taylor =
=D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 06/29/10 09:29, =C3=B0=C3=8F=C3=8B=C3=8F=C3=94=C3=89=C3=8C=C3=85=C3=
=8E=C3=8B=C3=8F =C3=AB=C3=8F=C3=93=C3=94=C3=89=C3=8B wrote:
> > Linux box runs some services and have 3 interfaces, 2 of them are=20
> > bridged to br0 and one is left for separate local segment. So it is=
 a=20
> > router between br0 and eth2 and a bridge between eth0, eth1.
>=20
> Will you please clarify what interface the Zyxel bridge is connected =
to?=20
>    (I'm guessing that it's connected to either eth0 or eth1, but I'd=20
> like some clarification.)
>=20
> What is connected to the other two interfaces?

      +-- eth0: modem
br0 --+
      +-- eth1: local network

eth2: network of public access points

> > This is brctl showmacs, right?
>=20
> I don't know the command off the top of my head, but I know there is =
a=20
> command to have the bridge show what MAC addresses are associated wit=
h=20
> what bridge ports.
>=20
> > So, this is exactly the same logic that switches use, right?
>=20
> Should be, yes.
>=20
> > Can you confirm that if MAC (frame with source MAC) pops up on port=
=20
> > different from the one it was seen previous time then the port for=20
> > that MAC get updated?
>=20
> Should be, yes.

If so, the linux bridge should not be the point of problem.

> > What then "brctl setageing" for?
>=20
> That should set the aging / expire timer for MAC addresses that have =
not=20
> been seen in a while.  (How long the MAC has to be quite before it is=
=20
> flooded again.)

So this is to remove MACs that were not poped up for long to just not
waste momory.

> > It may happen that rebooting the modems brings port link down and t=
he=20
> > bridge may clear the MAC-port table on that port. This is similar t=
o=20
> > what Zyxel support told me.
>=20
> Agreed.  See my previous reply about a way to test this.

I'll consider.

> > In my case on moved box I'm unable to make connections or even ping=
=2E
>=20
> This is contrary to how every Linux bridge that I have used ever=20
> behaved.  I'm thinking that the Zyxel is at least part of the problem=
=2E=20
> That being said, it is very unlikely but there could be some sort of=20
> weird interaction between the Zyxel and Linux bridging that combined =
is=20
> causing a problem.

This is quite low probability.

> > Besides that it is a server, iptables is used to restrict access fo=
r=20
> > separate local segment at eth2 (allow access to Internet and not to=
=20
> > local net). Ebtables is empty now, but I wanted to be able to filte=
r=20
> > bridge traffic if that matters someday.
>=20
> Remember that it is possible for IPTables to filter bridged traffic.=20
> (It depends if an option is enabled in the kernel.)  So IPTables coul=
d=20
> be interfering with out you knowing it.

I know that. But some kind of matches in newer kernels are available
only in ebtables, like --phys-dev-[in|out]

> Will you please provide the output of "iptables-save" (sanitized if n=
eeded).

All rules have either "-i eth2" or "-o eth2". eth2 is public access
points network that should be restricted. br0(eth0: modem, eth1: local
network for this building): local network. Default policy is accept, so
there is no rules to restrict bridged traffic.

--=20
=D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=
=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>

