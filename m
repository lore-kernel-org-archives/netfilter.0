From: Alexander Samad <alex@samad.com.au>
Subject: Re: Correct syntax prob. NAT src ip address based on dst port.
Date: Thu, 28 Apr 2005 12:09:36 +1000
Message-ID: <20050428020936.GH11176@samad.com.au>
References: <001801c54b95$f77e0a50$0510a8c0@cornerpc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qM81t570OJUP5TU/"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001801c54b95$f77e0a50$0510a8c0@cornerpc>
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


--qM81t570OJUP5TU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2005 at 01:29:52PM +1130, Sylvan Andrew wrote:
>=20
> Hello,
>=20
>  Could somebody please tell me if this is the correct syntax ? I am tryin=
g to make it so that any local traffic gets natted to a specific IP if it i=
s destined to a HTTPS port.
>=20
> iptables -t nat -A POSTROUTING -p tcp --dport 443 -j SNAT --to 197.15.12.=
12
>=20
> A tcpdump show the replies are coming back in fine but when you actually =
browse to a https site nothings happening.

might have to show us the rest of the tables/chains, there might be
another rule that it matches before this ?

>=20
> Thanks very much !
>=20
> Sylvan
>=20

--qM81t570OJUP5TU/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCcEXgkZz88chpJ2MRAgXRAKCPUwpvvP9wjXVhb9bSol/3V0AJowCg7Ruy
o7NpNsgx2NZxli7aQuHjJ1o=
=YBXN
-----END PGP SIGNATURE-----

--qM81t570OJUP5TU/--

