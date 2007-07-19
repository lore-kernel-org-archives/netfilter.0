From: Thomas Jacob <jacob@internet24.de>
Subject: Re: need advice for high traffic network
Date: Fri, 20 Jul 2007 00:59:31 +0200
Message-ID: <20070719225931.GA17114@internet24.de>
References: <469FE2DC.90300@relevad.com>
	<Pine.LNX.4.63.0707191516340.23721@qynat.qvtvafvgr.pbz>
	<469FE85B.3010502@relevad.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <469FE85B.3010502@relevad.com>
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


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 19, 2007 at 03:40:27PM -0700, Konstantin Svist wrote:
> # cat /proc/sys/net/netfilter/nf_conntrack_max
> 65536
>=20
> somehow I doubt I have THAT many connections :)
>=20
> highest load right now is around 600 requests per second, and ~60%=20
> complete within 10ms - the rest complete within 200ms (unless the=20
> firewall is turned on - then some start timing out 3s and up)

600s * 120s ip_conntrack_tcp_timeout_time_wait =3D 72000 entries

( =3D>  http://www.isi.edu/touch/pubs/infocomm99/infocomm99-web/ )

You might want to try to reduce those timers or just push
up your hash bucket =3D max entry values to maybe twice that.

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFGn+zTgF9cFv867HwRAgY0AKCyoanzALgAVckZb0CfSjLPZN2v/gCfd2SC
rJWmd1I2KeOBCx+xq2To738=
=6UiL
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--

