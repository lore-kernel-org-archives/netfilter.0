From: Alexander Samad <alex@samad.com.au>
Subject: RAW table and TARPIT
Date: Sat, 3 Jul 2004 16:18:27 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040703061827.GB6126@samad.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I understand one of the downsides of using the TARPIT target is that is
uses resources in conntrack.  What if I used the raw table to also flag
them for exclusion of the conntrack would tarpit still work

A

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFA5k+zkZz88chpJ2MRAhJfAKDNUh+akzUcJ6tUzGtYqrfj461KnACguucA
l+02ev+7E58RHpbvLizD1zM=
=NZC6
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--

