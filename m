From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: ip_conntrack and ipt_conntrack
Date: Sat, 24 Jan 2004 00:13:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040123231343.GA20789@zion.homelinux.com>
References: <BAY10-F46m2m2XkO28Q0000cf3b@hotmail.com> <200401231948.22760.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200401231948.22760.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2004 at 07:48:22PM +0000, Antony Stone told us:
>=20
>  - Unless anyone else around here can give a good answer to this???

Hmmm...don't know if this is a good answer ;-)

The state match "just" allows you to match the well known states NEW,
ESTABLISHED, RELATED and INVALID. The conntrack match gives you some
more insight on the information, e.g. you have additional states=20
SNAT and DNAT, or you can match by original source or dest address,
or use the in-kernel conntrack's internal states (ASSURED...).

Never needed this myself, just looked it up in the iptables(8) manpage.

>=20
> Regards,
>=20

HTH

Sven

--=20
Linux zion 2.6.1 #2 Mon Jan 12 14:25:44 CET 2004 i686 athlon i386 GNU/Linux
 00:08:24  up 11 days,  5:39,  3 users,  load average: 0.00, 0.02, 0.00

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAEaqno4FAdB2PneQRAudsAJ95yiMn0CmjsYcVyhLR12Z/M3W0cACfT5u0
Kc+1yMTlckJ9mjckFP6QzR4=
=t8qY
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--

