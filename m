From: Matt Ryanczak <ryanczakm@arin.net>
Subject: RE: Stopping greedy http clients!
Date: 26 Sep 2002 11:51:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1033055519.27083.9.camel@vegeta>
References: <Pine.LNX.4.44.0209241639480.8352-100000@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-JUa6vvWtaYKf2fq3ZjEX"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0209241639480.8352-100000@dns.toxicfilms.tv>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Cc: Rob Sterenborg <r.sterenborg@hsl-brabantzuid.nl>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>


--=-JUa6vvWtaYKf2fq3ZjEX
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Checkout mod_bandwidth for apache @=20
http://www.snert.com/Software/mod_throttle/

On Tue, 2002-09-24 at 10:41, Maciej Soltysiak wrote:
> > Or use something (not netfilter related) like CBQ or HTB which implemen=
t
> > bandwidth throttling.
> > I found CBQ more difficult to setup than HTB, but the choice is yours.
> There is a 3rd party module to apache, that allows to setup bandwidth and
> concurrent connections, without making classes for traffic via tc.
> I do not remember the nam right now, but it exists :)
>=20
> Regards,
> Maciej Soltysiak
--=20
Matt Ryanczak
System Administrator
American Registy of Internet Numbers
ryanczakm@arin.net
(o)703.227.9869
(m)703.926.2595

--=-JUa6vvWtaYKf2fq3ZjEX
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9ky0e4rWUM5pQQm0RAk+vAKCTMl3fbg9lsIx3EsC7R9cY/GSOuwCg3POj
FA11/VHiac1sij0vPEX1CxI=
=Kjf1
-----END PGP SIGNATURE-----

--=-JUa6vvWtaYKf2fq3ZjEX--


