From: Harald Welte <laforge@gnumonks.org>
Subject: Re: pptp conntrack in cvs
Date: Wed, 12 Feb 2003 10:18:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030212091827.GG13814@sunbeam.de.gnumonks.org>
References: <001301c2d25a$27614190$0440a8c0@SC2003002>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5xSkJheCpeK0RUEJ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001301c2d25a$27614190$0440a8c0@SC2003002>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Enrico Demarin <enricod@videotron.ca>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--5xSkJheCpeK0RUEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2003 at 09:46:56PM -0800, Enrico Demarin wrote:
> Hi Harald,
>=20
> =20
>=20
> I am trying to get your pptp conntrack module to work , trying to
> connect to a linux poptop server and a win2k vpn through a linux
> masquerading gateway running the latest netfilter cvs +
> ip_conntrack_pptp, the client gets stuck in "Verifying username and
> password", then after a while it times out. The old PPTP patch (by Brian
> Kuschak),

are you sure you have loaded ip_conntrack_proto_gre as well?  And which
particular version of the pptp-conntrack-nat.patch are you using?  Also,
sure that you ruleset allows for -p gre -m state --state ESTABLISHED,RELATE=
D ?

> Let me know if I can be of help to get your patch to work.

There are lots of users running the patch in a SNAT / MASQUERADE
environment, and at least one commercial vendor is shipping the
pptp-patch with its products.

Please move further discussion of this subject to the netfilter
list [with cc to me], where it belongs.

> - Enrico

--=20
- Harald Welte <laforge@gnumonks.org>               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
"If this were a dictatorship, it'd be a heck of a lot easier, just so long
 as I'm the dictator."  --  George W. Bush Dec 18, 2000

--5xSkJheCpeK0RUEJ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+ShFjXaXGVTD0i/8RAhDcAJ90XnGBfdZuFpE7+rQT0TIW0Irm2gCfdLLO
reOtSjAIy7gPHZxnDdrSBWg=
=qxon
-----END PGP SIGNATURE-----

--5xSkJheCpeK0RUEJ--

