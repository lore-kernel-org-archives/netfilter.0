From: Franck Joncourt <franck.joncourt@wanadoo.fr>
Subject: Re: Error using MARK
Date: Mon, 9 Apr 2007 23:15:27 +0200
Message-ID: <20070409211527.GN13330@toystory.lan>
References: <482D4DF4-6CE2-4F90-9387-02268CB5DE34@iacookie.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dPW7zu3hTOhZvCDO"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <482D4DF4-6CE2-4F90-9387-02268CB5DE34@iacookie.net>
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


--dPW7zu3hTOhZvCDO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 09, 2007 at 04:58:08PM -0400, cookie wrote:
>=20
> Hello-
>   Can anyone tell me the error of my ways using
>=20
> /sbin/iptables -v -t mangle -I SHAPER -p tcp --sport 8118 -j MARK --=20
> set-mark 0x14
> MARK  tcp opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  tcp spt:8118 =20
> MARK set 0x14
> iptables: Invalid argument
>=20
> I was sure that I had the correct syntax, but it keeps coming up =20
> Invalid argument.
> Thanks
> Brian
>=20

iptables -t mangle -A traffic_shaping -p ! tcp -j CONNMARK --set-mark
0x81

I set mark 0x81 on non tcp paquets from a user defined chain
"traffic_shaping"

--=20
Franck Joncourt
http://www.debian.org
http://smhteam.info/wiki/
GPG server : pgpkeys.mit.edu
Fingerprint : C10E D1D0 EF70 0A2A CACF 9A3C C490 534E 75C0 89FE

--dPW7zu3hTOhZvCDO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGGqzvxJBTTnXAif4RAm8VAJ9wf2JUKG/cHZLsDnvw1L7/3SWF9QCfUin/
43RhU9QP34gYZa00+Y8/iI8=
=axWS
-----END PGP SIGNATURE-----

--dPW7zu3hTOhZvCDO--


