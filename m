From: "Alexander W. Janssen" <yalla@ynfonatic.de>
Subject: Re: iptables grep problems
Date: Mon, 3 Feb 2003 17:16:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030203171613.A2170@ynfonatic.de>
References: <1044279746.9027.55.camel@juna.cypherworld.org> <GNECIOACDBCPDCMNJLJJEEMHCBAA.kkilgore@wt.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <GNECIOACDBCPDCMNJLJJEEMHCBAA.kkilgore@wt.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Ken Kilgore <kkilgore@wt.net>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Put "set -x" direct under "#!/bin/bash" in your script. This will show every
command on stdout before it's executed. This will show you why the errors
occur.

HTH, Alex.

--=20
"Mr Data, when I said 'Fire at Will', I didn't mean for you to be so litera=
l."
Instructions for use of this post: Insert tounge in cheek. Read as normal.

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Weitere Infos: siehe http://www.gnupg.org

iEYEARECAAYFAj4+lcwACgkQEMMZKORQoYJxlQCeLZLh47oDadG8Ys8zE5HrXPqC
oCsAniHnxPq29HfW5zfqoH0EQpyqdrET
=OReh
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--

