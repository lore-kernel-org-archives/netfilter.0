From: Harald Welte <laforge@netfilter.org>
Subject: Re: [netfilter-core] Procedure for iptables upgradation from 1.2.4 to 1.2.8.
Date: Wed, 21 May 2003 08:45:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030521064530.GB28587@sunbeam.de.gnumonks.org>
References: <1053440065.5422.14.camel@ram>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RyOXVFQXzAE23HDB"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1053440065.5422.14.camel@ram>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Ram Devarayi <ram@innomedia.soft.net>
Cc: coreteam@netfilter.org, Netfilter Mailinglist <netfilter@lists.netfilter.org>


--RyOXVFQXzAE23HDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2003 at 07:44:25PM +0530, Ram Devarayi wrote:
> Hi Coreteam,
>=20
> Recently i came across netfolter.org. It is very informative and useful.
> Iam iam ATM world, quite new to IP world. Thanks a lot for this nobel
> job.

Pleae read http://www.netfilter.org/contact.html, this question is
better to be asked at the mailinglist(s)

> I would like to know the procedure for upgrading iptables from 1.2.4 to
> 1.2.8.

This depends on your linux distribution.  You can either compile+install
iptables manually (which works on all distributions) or try to rebuild a
the dpkg/rpm package for the new version.

> I tried Patch against 1.2.4 to incrementally go upto 1.2.8. I failed
> even to go from 1.2.4 to 1.2.5.
>=20
> Kindly let me know the procedure(very new to this patching stuff).
>=20
> My kernel path(KERNEL_DIR) is
> /home/ram/gateway.fresh/uClinux-dist/linux-2.4.x.

the iptables program is in userspace.  It just configures the kernel.=20

You can compile+install iptables-1.2.8 like most other free software
programs.  Please download the full 1.2.8 package and read the included
INSTALL file.

>  Best Regards
> Ram.D=20

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--RyOXVFQXzAE23HDB
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+yyCKXaXGVTD0i/8RAgvDAJ0Qajac7yNlcHWo+bO6HjJC+swhgQCeOb6W
YNHxWGUizD16EUmGsfB9Bng=
=F0X+
-----END PGP SIGNATURE-----

--RyOXVFQXzAE23HDB--

