From: Harald Welte <laforge@gnumonks.org>
Subject: Re: TTL mangling problems...
Date: Fri, 21 Jan 2005 21:55:50 +0100
Message-ID: <20050121205550.GS14460@sunbeam.de.gnumonks.org>
References: <4147.192.168.3.47.1106333417.squirrel@192.168.3.47>
	<20050121184732.GR14460@sunbeam.de.gnumonks.org>
	<4442.192.168.3.47.1106336951.squirrel@192.168.3.47>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zOr5JpMIiGv/Oaxu"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4442.192.168.3.47.1106336951.squirrel@192.168.3.47>
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
To: wency@comelsoft.com
Cc: netfilter@lists.netfilter.org


--zOr5JpMIiGv/Oaxu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 21, 2005 at 09:49:11PM +0200, Ventsyslav Vassilev wrote:
> This is correct - i have searched in /usr/lib/iptables for that file and
> libipt_TTL.so is NOT here.
>=20
> The command you send me returns the iptables help info, nothing more.
>=20
> OK....
> So - can i ask you how to add the libipt_TTL.so plug-in?

please read what patch-o-matic told you.  After appyling the patch, it
should have told you to recompile the kernel and the iptables userspace
program.  The iptables compile will notice that the kernel supoprts TTL
target and build the required plugin.

--=20
- Harald Welte <laforge@gnumonks.org>               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)

--zOr5JpMIiGv/Oaxu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB8WxWXaXGVTD0i/8RAireAJ9rLVjp6wys/brjwBGc/hxLNwKTpQCfSRyD
YKeaP6Uz92vCPUphVo91bnM=
=6kSd
-----END PGP SIGNATURE-----

--zOr5JpMIiGv/Oaxu--

