From: Franck Joncourt <franck.joncourt@wanadoo.fr>
Subject: Re: stateful UDP with unknown source port on INPUT?
Date: Sun, 1 Apr 2007 15:24:00 +0200
Message-ID: <20070401132400.GJ7936@toystory.lan>
References: <460C4667.1090406@rtij.nl>
	<BAY121-F1848947AF48B36B0E9D801A9610@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkEkAx9hr54EJ73W"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BAY121-F1848947AF48B36B0E9D801A9610@phx.gbl>
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


--vkEkAx9hr54EJ73W
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 01, 2007 at 03:39:30PM +0300, noa levy wrote:
> Thanks!
> I forgot to mention, though, that my source port for the SNMP informs is=
=20
> also random, so I can't match against the destination port for the incomi=
ng=20
> packet - does the recent target also maintain a port list or is it IP=20
> addresses only?
>=20

=46rom the iptables tutorial :

iptables -A INPUT -m recent --name example --rsource
The --rsource match is used to tell the recent match to save the source
address and port in the recent list. This is the default behavior of the
recent match.

iptables -A INPUT -m recent --name example --rdest
The --rdest match is the opposite of the --rsource match in that it
tells the recent match to save the destination address and port to the
recent list.

http://iptables-tutorial.frozentux.net/iptables-tutorial.html#RECENTMATCH


--=20
Franck Joncourt
http://www.debian.org
http://smhteam.info/wiki/
GPG server : pgpkeys.mit.edu
Fingerprint : C10E D1D0 EF70 0A2A CACF 9A3C C490 534E 75C0 89FE

--vkEkAx9hr54EJ73W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGD7JwxJBTTnXAif4RAmrpAKCXWVOtMtoTI9b3WKTRRj1q77+CIwCgnAU0
v8H4mFyfClSpGXuWoFs9kqA=
=u7Xm
-----END PGP SIGNATURE-----

--vkEkAx9hr54EJ73W--


