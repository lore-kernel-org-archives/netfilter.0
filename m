From: Eric Leblond <eric@inl.fr>
Subject: NuFW 1.0-rc1 is available
Date: Wed, 16 Feb 2005 00:13:08 +0100
Message-ID: <1108509188.5026.20.camel@porky>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-wk8pIUwx7DrSNYEbR6i9"
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
To: netfilter@lists.netfilter.org


--=-wk8pIUwx7DrSNYEbR6i9
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

The NuW core team proudly announces the availability of NuFW 1.0-rc1.

NuFW (http://www.nufw.org) is an authenticating firewall for GNU/Linux
which extends the capabilities of Netfilter.

It brings the notion of user to the level of packet filtering. Policy
such as :
- john can connect to serveur imap if he uses evolution on Linux.
can now be securely achieved by a single Acls and this, even on
multiuser systems.

This release is the first of a new stable branch, which performs
encryption of all flows : nufw-nuauth flows as well as client-nuauth
ones. The cache system is now considered stable and tested, and greatly
improves performances, compared to the older 0.8.

For an almost detailed list of new features see :
	http://nufw.org/proto2_and_more.html

For a quick testing of this release please read the following page :
	http://nufw.org/testing.html

BR,=20
--=20
Eric Leblond <eric@regit.org>
NuFW, Now User Filtering Works : http://www.nufw.org

--=-wk8pIUwx7DrSNYEbR6i9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCEoIDnxA7CdMWjzIRApkZAKCNEYF/vC2t1I35Cx7Rs3CdvWu9OACdHClZ
IGA1fzm55hFImj6oe4nIv8w=
=yOi4
-----END PGP SIGNATURE-----

--=-wk8pIUwx7DrSNYEbR6i9--


