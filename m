From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: ebtables mac update
Date: Wed, 30 Jun 2010 12:09:02 +0300
Message-ID: <1277888942.4255.0.camel@casper.meteor.dp.ua>
References: <1277808205.3791.17.camel@casper.meteor.dp.ua>
	 <4C29E8B4.5060205@plouf.fr.eu.org>  <4C2A0703.5040007@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C2A0703.5040007@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

=F7 =F7=D4=CF, 29/06/2010 =D7 09:45 -0500, Grant Taylor =D0=C9=DB=C5=D4=
:
> On 06/29/10 07:36, Pascal Hambourg wrote:
> > The Linux bridge maintains a MAC-port table based on the source MAC=
=20
> > address in received frames. As expected, if a MAC address was=20
> > associated to a given port and a frame from that MAC address is=20
> > received on a different port, then the table is updated accordingly=
=2E=20
> > Besides, rebooting the modems and not the Linux box fixes the=20
> > problem. So I doubt that the Linux bridge causes the problem.
>=20
> I mostly agree.
>=20
> The only thing that I would wonder about is is it possible that Linux=
 is=20
> seeing the link go down on the physical NIC that is connected to the=20
> bridge, thus taking the logical port in the bridge down there by caus=
ing=20
> it's learned MAC addresses associated with that port to be lost.
>=20
> This could easily be tested by putting a hub (or similar) between the=
=20
> Linux box and the Zyxel bridge.  That way when the bridge is rebooted=
,=20
> the Linux box does not see the link go down.  If the problem still=20
> corrects its self, you have completely removed the Linux box from the=
=20
> tests, there by strongly pointing at the Zyxel bridge.

Worth trying.

> > Of course the update process requires that the moved box sends=20
> > traffic first. If it just sits there waiting then MAC-port tables=20
> > won't be updated, until the entry eventually expires.
>=20
> Agreed.
>=20
> Pining or broadcasting looking to see what devices are on the far end=
=20
> should accomplish the same thing.
>=20
> > Then may I ask what is the purpose of this box ?
>=20
> Remember that EBTables modifies how in kernel bridging behaves.  Thus=
=20
> the in kernel bridging will still behave like a normal bridge, even i=
f=20
> EBTables rules are not used.  (In fact it is possible to have bridgin=
g=20
> support in the kernel with out EBTables.)
>=20
> Bridges will still learn (and forget / expire) where MAC addresses ar=
e.=20
>   So even if there were not EBTables rules, the bridge its self will=20
> learn what hosts are on what side of the bridge there by intelligentl=
y=20
> forwarding (or not) frames across the link that don't need to be.
>=20
> I would have been tempted to put a bridge on both sides, not just the=
=20
> one.  Because as it is, broadcasts for the end with out the network a=
re=20
> still propagated across the link.

This is to be done. But there is no issue with this until now.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

