From: Harald Welte <laforge@gnumonks.org>
Subject: Re: [netfilter-core] Iptables Stateful Failover
Date: Mon, 11 Nov 2002 15:39:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021111153912.I2174@sunbeam.de.gnumonks.org>
References: <OFC8C56C9B.170CF0F7-ONC1256C6E.002B3390-C1256C6E.002C99B8@tomware.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2E/hm+v6kSLEYT3h"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OFC8C56C9B.170CF0F7-ONC1256C6E.002B3390-C1256C6E.002C99B8@tomware.it>; from fgentili@ialeware.it on Mon, Nov 11, 2002 at 09:07:09AM +0100
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: fgentili@ialeware.it
Cc: netfilter@lists.netfilter.org, coreteam@netfilter.org, mgua@tomware.it


--2E/hm+v6kSLEYT3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2002 at 09:07:09AM +0100, fgentili@ialeware.it wrote:
> Hi,
>=20
> I would know if is possible to implement iptables failover using stateful
> inspection capabilities of iptables.

no.

> if I send this file to another fw, send alias ip (for natted address &
> routing) and replace /proc/net/ip_conntrack ( if it is writeble. If not, =
is
> it possible to do ?)

if it was _that_ easy, it would have been implemented already.=20
Please see the netfilter-devel archives and the netfilter-failover=20
archives http://lists.netfilter.org/pipermail/netfilter-failover/
as well as the paper at http://www.gnumonks.org/cgi-bin/cvsweb.cgi/presenta=
tion/netfilter-failover-ols2002/

> Gentili Filippo
--=20
- Harald Welte / laforge@gnumonks.org               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
"If this were a dictatorship, it'd be a heck of a lot easier, just so long
 as I'm the dictator."  --  George W. Bush Dec 18, 2000

--2E/hm+v6kSLEYT3h
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9z8EPXaXGVTD0i/8RAsTQAJ4iykUI+cRinkQG89HAkqh5oE8InwCgharz
H/tub7WXEN4c1vVtyqhvbnA=
=liej
-----END PGP SIGNATURE-----

--2E/hm+v6kSLEYT3h--

