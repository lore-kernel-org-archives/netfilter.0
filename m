From: Tom Eastep <teastep@shorewall.net>
Subject: Re: filter by application name
Date: Fri, 22 Jun 2007 15:00:29 -0700
Message-ID: <467C467D.8060002@shorewall.net>
References: <467C452A.1050303@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig3841CBDD924276A6BAED6237"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <467C452A.1050303@gmail.com>
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
To: Deb ian <debian70@gmail.com>
Cc: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig3841CBDD924276A6BAED6237
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Deb ian wrote:
> Hello,
>=20
> I want to build a firewall with iptable, and i need to filtre by
> application name. I see it's possible with
>=20
> iptables -A INPUT -m owner --cmd-owner sshd
>=20
> But --cmd-owner is not integred since 2.6.15 kernel, and i'am on debian=

> etch (kernel 2.6.18).
>=20
> How can i do this, a path exist for it? Or over solution?

tuxguardian.sf.net

-Tom
--=20
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net
PGP Public Key   \ https://lists.shorewall.net/teastep.pgp.key


--------------enig3841CBDD924276A6BAED6237
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGfEZ9O/MAbZfjDLIRAslnAJ4njDOUKkDjNEKFXNbKXBUWqaj4FQCgyCx7
AXryFVw8hOwK9lsEl8WQGd4=
=OEMW
-----END PGP SIGNATURE-----

--------------enig3841CBDD924276A6BAED6237--

