From: Robin Lynn Frank <rlfrank@paradigm-omega.com>
Subject: Dumb question
Date: Thu, 26 Aug 2004 17:48:30 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093567709.3959.15.camel@omega.paradigm-omega.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-kIaLlMHvae4HFZK+2gSc"
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: Netfilter Mail List <netfilter@lists.netfilter.org>


--=-kIaLlMHvae4HFZK+2gSc
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Apologies if this is a dumb question but I am new to manipulating
iptables directly.  There is a pest that has been routinely probing us.=20
While we simply drop them, I'd like to make it "uncomfortable" for them
to continue.  When I attempt the following, I get the response
indicated.  We are running Mandrake Linus 10.0 Official with a 2.6
kernel.

# /sbin/iptables -A INPUT -s ###.###.#.### -j TARPIT
iptables: No chain/target/match by that name

Any help is appreciated.
--=20
Robin Lynn Frank
Director of Operations
Paradigm-Omega, LLC

--=-kIaLlMHvae4HFZK+2gSc
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Sed quis custodiet ipsos custodes?

iD8DBQBBLoTco0pgX8xyW4YRArusAJwLczWjRzzFtfVB3X36nRg/tVs4IgCePPls
KF5zH5LZ7mvK9Bg6Zywim60=
=Tcpp
-----END PGP SIGNATURE-----

--=-kIaLlMHvae4HFZK+2gSc--

