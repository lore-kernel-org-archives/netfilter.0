From: Eric Leblond <eric@regit.org>
Subject: bridge netfilter patch
Date: Thu, 08 Jan 2004 15:18:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073571538.20576.17.camel@tech004.alphalink.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-b0GPuzfMjgpVh3aKnQ0C"
Return-path: <netfilter-admin@lists.netfilter.org>
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


--=-b0GPuzfMjgpVh3aKnQ0C
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

I was used to patch my kernel with :
	bridge-nf-0.0.7-against-2.4.19.diff
to be able to use iptables on bridge device.

But it does not apply cleanly to 2.4.24 (p-o-m treated)

I've try other bridge-nf patch available on the ebtables site but none
was working  and as I don't want to use ebtables I can not apply all
patches.

Where can I found working patches for this kernel ?

BR,
--=20
Eric Leblond
NuFW, Now User Filtering Works (http://www.nufw.org)

--=-b0GPuzfMjgpVh3aKnQ0C
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e=2E?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA//WbSnxA7CdMWjzIRAocZAJ4yPtGhgwr8qaR/MiPm1Y2TL3gTEwCfbxft
g01t9MvX8/Z51Mk7TPGMwRs=
=FsIB
-----END PGP SIGNATURE-----

--=-b0GPuzfMjgpVh3aKnQ0C--


