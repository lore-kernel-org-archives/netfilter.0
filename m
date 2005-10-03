From: "Henning Riis Rasmussen" <hrr@hkkf.dk>
Subject: SV: Masquerade and dhcp lease renewal - what happens?
Date: Mon, 3 Oct 2005 20:50:09 +0200
Message-ID: <FBE2D879EA1A434D94659001D0C3647A045039@kbh1.hkkf>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Henrik Nordstrom <hno@marasystems.com>
Cc: netfilter@lists.netfilter.org

> Fra: Henrik Nordstrom [mailto:hno@marasystems.com]=20
> Sendt: 3. oktober 2005 20:00
> Til: Henning Riis Rasmussen
> Cc: netfilter@lists.netfilter.org
> Emne: Re: Masquerade and dhcp lease renewal - what happens?
>=20
> On Mon, 3 Oct 2005, Henning Riis Rasmussen wrote:
>=20
> > My ISP (Telia, Sweden) uses a DHCP lease time of 10 minutes=20
> leading to=20
> > constant renewal of the lease.
> >
> > If I use "-j masquerade" instead of "-j snat" I cannot have any=20
> > longlived connections (they all die with "new not syn" or=20
> "invalid").
>=20
> Seems your DHCP server is resetting interface (down/up) on=20
> each renewal then.
>=20
> Does "tcpdump -i eth0" surive a renewal? If not you should=20
> defeintely look into using another DHCP client.

Yes, tcpdump does survive and any longlived connections initiated by the
firewall itself (e.g. a large download) survives too, while the same
download attempted from any client on the LAN dies.

The DHCP client I'm using is the one from isc.org (but I suspect Gentoo
modifies its default behaviour).

>=20
> > What is supposed to happen to the masquerade nat entries=20
> when a dhcp=20
> > renewal happens, particularly one that doesn't actually=20
> change the IP=20
> > address to a new one?
>=20
> In 2.6.13 the connections is cleared from conntrack if the IP=20
> address is deleted or if the interface is brought down.

I just upgraded the kernel to 2.6.12.5 but that didn't change anything.

>=20
> Regards
> Henrik
>=20

