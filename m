From: Harald Welte <laforge@gnumonks.org>
Subject: Re: TTL mangling problems...
Date: Fri, 21 Jan 2005 19:47:32 +0100
Message-ID: <20050121184732.GR14460@sunbeam.de.gnumonks.org>
References: <4147.192.168.3.47.1106333417.squirrel@192.168.3.47>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CMx2Qe8y1jN1ar4Y"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4147.192.168.3.47.1106333417.squirrel@192.168.3.47>
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


--CMx2Qe8y1jN1ar4Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 21, 2005 at 08:50:17PM +0200, Ventsyslav Vassilev wrote:
> Helo, Mr. Welte,
> may be this is not the place where i must ask the question below, but i'm
> unable to find the right place on the Net.

netfilter@lists.netfilter.org or netfilter-devel@lists.netfilter.org

> iptables v1.2.7a: Unknown arg `--ttl-set'
>=20
> Can you tell me where is my error, please?

your iptables userspace program seems to lack the libipt_TTL.so plugin.

What does 'iptables -j TTL -h' tell you? (last 6 lines)=20

--=20
- Harald Welte <laforge@gnumonks.org>               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)

--CMx2Qe8y1jN1ar4Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB8U5EXaXGVTD0i/8RAvpDAKChX49233Gjn+lDTUEBwRh9/CVaiACdGldS
3ImxKkpzXz3i49oYAi2W3tI=
=seGy
-----END PGP SIGNATURE-----

--CMx2Qe8y1jN1ar4Y--

