From: Harald Welte <laforge@gnumonks.org>
Subject: Re: netfilter extensions
Date: Tue, 25 Feb 2003 10:03:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030225090307.GV24960@sunbeam.de.gnumonks.org>
References: <NGBBJEDAELGDCOJBKMHKEEBGCHAA.jcorbit@cox-internet.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qnK4RqISe3HuYx1/"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <NGBBJEDAELGDCOJBKMHKEEBGCHAA.jcorbit@cox-internet.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jeffrey Corbit <jcorbit@cox-internet.com>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--qnK4RqISe3HuYx1/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2003 at 05:32:05PM -0600, Jeffrey Corbit wrote:
> Hi!
>=20
> I'm needing to install some files that are listed under netfiler-extensio=
ns,
> helpers, pptp.  I have successfully downloaded the files but am unsure as=
 to
> how I incorporate them into my kernel.

this is wrong.

> I've been reading the netfiler.org site most of the day and it appears th=
at
> the patch-o-matic is the preferred way to install these files.  However, I
> have no clue as to what 'patch' includes my needed files.  These are the
> files I downloaded:

yes. Please read the file README contained in the patch-o-matic package.

And before cntacting me in private, please read
http://www.netfilter.org/contact.html

> ipconntrack_pptp.c
> ip_conntrack_pptp.h
> ip_conntrack_proto_gre.c
> ip_conntrack_proto_gre.h
> ip_nat_pptp.c
> ip_nat_pptp.h
> ip_nat_proto_gre.c

downloading them is not necessarry. please use patch-o-matic.

> Jeff

--=20
- Harald Welte <laforge@gnumonks.org>               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Programming is like sex: One mistake and you have to support it your lifeti=
me

--qnK4RqISe3HuYx1/
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+WzFLXaXGVTD0i/8RAlmjAJ4jAzoKFqssmHk57xV2G5BfudCgOgCeMx2u
x+9z3VszuShDCnCliMgHvNo=
=Uq42
-----END PGP SIGNATURE-----

--qnK4RqISe3HuYx1/--

