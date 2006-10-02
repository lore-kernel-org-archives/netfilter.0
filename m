From: Stefan Friedel <stefan.friedel@iwr.uni-heidelberg.de>
Subject: Re: DNAT problem
Date: Mon, 2 Oct 2006 16:18:00 +0200
Message-ID: <20061002141800.GE23849@woyzeck>
References: <BAY103-F25ED7B9242FA2718CEF385B21F0@phx.gbl>
	<4520ED15.5090205@plouf.fr.eu.org> <20061002120137.GD23849@woyzeck>
	<452110C1.2010203@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6e7ZaeXHKrTJCxdu"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <452110C1.2010203@plouf.fr.eu.org>
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
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org


--6e7ZaeXHKrTJCxdu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Pascal Hambourg,
>=20
> One question : did you test this from only one single source IP address=
=20
> of from several source IP addresses ? SAME is designed to always give=20
> the same mapping to a given source address, and it seems that DNAT/SNAT=
=20
> do the same in kernels >=3D 2.6.11.
ah, great. I just tested a few (3 different source ips, to be honest) accou=
nts
before with SAME - after your last mail I asked some colleagues to test: it=
 is
working indeed (obviously using some statistical method to choose the
destination ip. The destination ip did not change until we opened ~ 10
connections from different source ips...)

Thank you for your hint! and best regards, Stefan Friedel
--=20
Zentrale Dienste - Interdisziplin=E4res Zentrum f=FCr Wissenschaftliches
Rechnen der Universit=E4t Heidelberg - IWR - INF 368, 69120 Heidelberg
stefan.friedel@iwr.uni-heidelberg.de  Tel +49 6221 54-8240 Fax -5224
IWR: www.iwr.uni-heidelberg.de          HELICS: www.helics.uni-hd.de

--6e7ZaeXHKrTJCxdu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFFIR+Y3umRt9zSRsQRAkXgAJ4x/LlMiB361/tUm/yTqjOr4KaJ5ACfaO5K
q0bUuxKJMIHn5YOFqllU+w0=
=T+m5
-----END PGP SIGNATURE-----

--6e7ZaeXHKrTJCxdu--

