From: Harald Welte <laforge@netfilter.org>
Subject: Re: iptables NAT with "policy routing?"
Date: Tue, 27 Jan 2004 02:47:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040127014701.GO19250@sunbeam.de.gnumonks.org>
References: <400F7264.1080201@palaver.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kynn+LdAwU9N+JqL"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <400F7264.1080201@palaver.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Brian Capouch <brianc@palaver.net>
Cc: netfilter@lists.netfilter.org


--Kynn+LdAwU9N+JqL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2004 at 01:49:08AM -0500, Brian Capouch wrote:
> I have had to temporarily use a table-based route for one of my networks=
=20
> for administrative reasons, e.g.

this should work just fine.

> I suspect though, that this mode of routing (as opposed to using the=20
> "regular" table via "route add default") is somehow hosing my iptables NA=
T?
>=20
> At least sniffing the egress interface now shows the traffic heading out=
=20
> with its NATted address of 192.168.1.10.

did you try that with a connection that was established before you
inserted the new NAT rule (also, if you test with a ping, you need to
stop it to be recognized as new connection).

LARTC mailinglist might give you some better feedback.

> Thx.
> B.

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--Kynn+LdAwU9N+JqL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAFcMVXaXGVTD0i/8RAiYcAKClJcJuG01XgYi5yW/Wu25YvqyLEwCeJHDs
6B5XN2MPjANSSOTJAqzcOu8=
=3CDh
-----END PGP SIGNATURE-----

--Kynn+LdAwU9N+JqL--

