From: Enrico Demarin <enricod@videotron.ca>
Subject: RE: Conntrack PPTP broken in 2.4.22 ?
Date: Sun, 14 Sep 2003 21:23:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008b01c37af5$bbca4f40$0440a8c0@SC2003002>
References: <3F650E9C.4060209@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <3F650E9C.4060209@snapgear.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Philip Craig' <philipc@snapgear.com>
Cc: netfilter@lists.netfilter.org

Thanks for the thorough explanation Craig, The info you sent

should be made part of the "help" section in the kernel configuration of
the GRE / PPTP modules.

Any idea if the PPTP conntrack module will make it into the mainstream
kernel ?=20


One more (unrelated?) question : is it possible to disable connection
tracking on a per interface basis ?

- Enrico

> -----Original Message-----
> From: Philip Craig [mailto:philipc@snapgear.com]=20
> Sent: luned=EC 15 settembre 2003 2.58
> To: Enrico Demarin
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Conntrack PPTP broken in 2.4.22 ?
>=20
>=20
> Enrico Demarin wrote:
> > I think at this point I miss the functionality of the=20
> pptp_conntrack=20
> > module ? When is it necessary to load it ?
>=20
> The module basically performs three tasks.
>=20
> 1. NAT of the callid
>=20
> This ensures that the PPTP callid is unique per client/server=20
> pair. This is only necessary when you have multiple clients=20
> that are NATed to the same source address.  Without it, the=20
> server will get confused.
>=20
> 2. Tracking of gre connections
>=20
> The gre connections are tracked as RELATED connections, which=20
> makes it easy to add a rule to let them through the firewall.
>=20
> 3. NAT of gre connections
>=20
> This ensures incoming gre packets are forwarded to the=20
> correct internal server/client.
>=20
> Since you typically only have one internal server, this is=20
> just a convenience which means you don't need to add a gre DNAT rule.
>=20
> However this is necessary if you have multiple clients that=20
> are NATed to the same source address, so that the firewall=20
> knows which client to forward the gre packet to.
>=20
> NAT of gre can also be helpful for a single client.  Without=20
> it, packets from the server may be dropped if the client=20
> hasn't sent a packet recently.  This is because you typically=20
> don't have a DNAT rule to forward gre to the client, so the=20
> client has to send the gre packet first to establish the=20
> conntrack, and this conntrack will timeout after 30-180=20
> seconds of inactivity.  You can workaround this problem by=20
> configuring PPP to send LCP echoes to keep the conntrack active.
>=20
> --=20
> Philip Craig - philipc@snapgear.com - http://www.SnapGear.com=20
> SnapGear - Custom Embedded Solutions and Security Appliances
>=20


