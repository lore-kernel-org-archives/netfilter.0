From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: spoofing client IP configuration
Date: 13 Mar 2003 14:39:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047559187.1453.9.camel@raylinux.internal>
References: <5.2.0.9.0.20030313071936.03245590@yeagerautomation.com>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-IpLBDK0qqjXCvgdOJzxa"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.0.9.0.20030313071936.03245590@yeagerautomation.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-IpLBDK0qqjXCvgdOJzxa
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-03-13 at 14:19, Doug Yeager wrote:
> o.k.,
> managing a public WLAN, people have all sorts of IP configurations preset=
=20
> on their clients (not all are dhcp clients enabled).
> i am currently running a DHCP server and it works *MOST* of the time.  th=
e=20
> ultimate solution would be to somehow ignore the client ip configuration=20
> and map to the clients on the server side based on their mac address, or=20
> something like that.  i know this is possible because there are hotels th=
at=20
> do this kind of thing.....some terms like "nomadic server" have popped up=
.
>=20
> i want the server to route based on local addresses, so this service=20
> hopefully would run at the mac level.
> the public wlan currently runs:
> nocat gateway
> HostAP
> Iptables firewall
> DHCPD  (server in question by this email)
>=20
> any alternatives to DHCP that do this would be great....i just want peopl=
e=20
> configured to their work ip configs to be able to get on.  would moving t=
o=20
> 802.11 auth help?  i don't think so because after authentication you stil=
l=20
> need an IP to do anything...unless i'm thinking about this wrong.
>=20
The dhcpd that ships with most distros can do ip allocation based on mac
addresses. There are sample configs in the docs.

Mixing fixed ips and dhcp is always a messup. You will endlessly be
maintaining the reserved lists on the dhcp server.

Define an ip strategy AND stick to it ...
e.g.=20
xxx.xxx.xxx.1-9		routers
xxx.xxx.xxx.10-50	servers
xxx.xxx.xxx.51-100	printers, coffee machines, etc.
xxx.xxx.xxx.101-254	workstations, pda's, etc.

HTH

Ray
> thx,
> doug=20

--=-IpLBDK0qqjXCvgdOJzxa
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+cHwTh1fuR/Bv+ygRAiORAJ9mprKUi4fAmMIadCOkJMOxuXh7rwCePOfP
z9T5i8srnRXG+7rN9M9JvQs=
=jj8b
-----END PGP SIGNATURE-----

--=-IpLBDK0qqjXCvgdOJzxa--


