From: "David C. Hart" <DCH@TQMcube.com>
Subject: Re: IPT Still Driving Me Nuts
Date: Sun, 02 Nov 2003 13:57:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067799467.18241.12.camel@main.tqmcube.com>
References: <1067796031.18240.5.camel@main.tqmcube.com>
	 <1067796995.26406.10.camel@wookie.shorewall.net>
	 <1067797945.18250.8.camel@main.tqmcube.com>
	 <1067798390.26406.16.camel@wookie.shorewall.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-QfuIZTHtZQFwTBhMxbEW"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1067798390.26406.16.camel@wookie.shorewall.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: iptables mailing list <netfilter@lists.netfilter.org>
Cc: Tom Eastep <teastep@shorewall.net>


--=-QfuIZTHtZQFwTBhMxbEW
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sun, 2003-11-02 at 13:39, Tom Eastep wrote:

> Such a setup is pure "security by obscurity" since the firewall can be
> bypassed by hosts on your external subnet. Having both interfaces
> connected to the same HUB/switch also means that either interface can
> answer ARP "who-has" requests for addresses assigned to either
> interface. That's why you see the "wrong" interface accepting input
> traffic.
>=20
OK. I reconfigured and pulled the plug on eth1 to the router. Let's see
what happens.

--=-QfuIZTHtZQFwTBhMxbEW
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/pVOqol4OE0cpGaIRAtd2AJ9wfpeT8yDcMNtMcW1Mtu2+HsOjgQCdF/Qz
QqFJios38zJvZwUvjW7tyAU=
=MsUL
-----END PGP SIGNATURE-----

--=-QfuIZTHtZQFwTBhMxbEW--


