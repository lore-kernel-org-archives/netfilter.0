From: Harald Welte <laforge@gnumonks.org>
Subject: Re: Bug in manpage or ECN target
Date: Sat, 11 Jan 2003 21:00:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030111200030.GI24488@naboo.de.gnumonks.org>
References: <200212310028.56152@zmi.at>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="smOfPzt+Qjm5bNGJ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200212310028.56152@zmi.at>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Michael Zieger <m.zieger@zmi.at>
Cc: rv@wallfire.org, Netfilter Mailinglist <netfilter@lists.netfilter.org>


--smOfPzt+Qjm5bNGJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2002 at 12:28:56AM +0100, Michael Zieger wrote:
> Hi,
>=20
> I just found in the man page the "ECN" target, which should allow to=20
> drop ECN flags. I tried this simple rule:
>=20
> iptables -A OUTPUT -o eth0 -p tcp -j ECN --ecn-tcp-remove
>=20
> But the error is: "iptables: Invalid argument"
>=20
> What is wrong there? Or is it a bug in the ECN target? I use the latest=
=20
> iptables v1.2.7a.

You cannot use the ECN target from the filter table.  You have to use it=20
from the 'mangle' table.  Packet filtering is done in 'filter', packet
modification in 'mangle'.

> BTW, there is also a typo bug in libipt_ECN.c line 112, it should be:
> "ECN target: Parameter --ecn-tcp-remove is required");
> but you wrote "--ecn-remove"...

Thanks, I will correct this before the iptables-1.2.8 release.

> regards, zmi

--=20
Live long and prosper
- Harald Welte / laforge@gnumonks.org               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
GCS/E/IT d- s-: a-- C+++ UL++++$ P+++ L++++$ E--- W- N++ o? K- w--- O- M-=
=20
V-- PS+ PE-- Y+ PGP++ t++ 5-- !X !R tv-- b+++ DI? !D G+ e* h+ r% y+(*)

--smOfPzt+Qjm5bNGJ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+IHfeXaXGVTD0i/8RAvcKAJwLHyAHLetIF8j3F1gVRQ0S+uB74QCgqXNA
UkVeiWyTXsmUgMHcYyf1Q6M=
=LhQY
-----END PGP SIGNATURE-----

--smOfPzt+Qjm5bNGJ--

