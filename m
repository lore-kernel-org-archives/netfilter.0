From: Harald Welte <laforge@gnumonks.org>
Subject: Re: IRC commtrack module ques
Date: Sat, 25 Dec 2004 23:06:14 +0100
Message-ID: <20041225220614.GA28168@sunbeam.de.gnumonks.org>
References: <200412252026.iBPKQ8Kp004941@freddie.dsiaz.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200412252026.iBPKQ8Kp004941@freddie.dsiaz.com>
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
To: "Keven R. Pittsinger" <jamstar7@dsiaz.com>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 25, 2004 at 01:26:08PM -0700, Keven R. Pittsinger wrote:
>=20
> OK, I got a stoopid question for ya.  I've read the sourcecode in the ker=
nel=20
> sources for this module.  I know you can load it via your rc.local
> script.  My question is, what alias do I use to get it to list right
> in modules.conf?

there is no way to auto-load this module.  Howe would there be one?
What kind of event would trigger auto-loading?  The decision to use it
or not is only based on the policy of the system administrator.

If you want to use it permanently, either 'modprobe' it from a script,
or link it statically into your kernel.

> Thanxx
> Keven

--=20
- Harald Welte <laforge@gnumonks.org>               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Programming is like sex: One mistake and you have to support it your lifeti=
me

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBzeRWXaXGVTD0i/8RAqDRAJ9tIMWasfHacExA3QkVrRkIgMHrsACeKV5o
Nfd/O41l79Dvwq2xmxf5f9o=
=wB4J
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

