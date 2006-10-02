From: Stefan Friedel <stefan.friedel@iwr.uni-heidelberg.de>
Subject: Re: DNAT problem
Date: Mon, 2 Oct 2006 14:01:37 +0200
Message-ID: <20061002120137.GD23849@woyzeck>
References: <BAY103-F25ED7B9242FA2718CEF385B21F0@phx.gbl>
	<4520ED15.5090205@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LTeJQqWS0MN7I/qa"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4520ED15.5090205@plouf.fr.eu.org>
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


--LTeJQqWS0MN7I/qa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,
>=20
> OK, SNAT and DNAT do not support multiple --to any more in kernels above=
=20
> 2.6.10. But it is unclear to me whether they still support one IP=20
> address *range* (with round robin) or only one single IP address.
The range is still accepted as option for iptables 1.3.6, but it has no eff=
ect
with 2.6.17.3 (so I assume that it is indeed the "NAT+round robin" capabili=
ty
which has gone in Kernels > 2.6.10/11). It doesn't matter if I use the SAME=
 or
the DNAT target in PREROUTING -
>=20
> The SAME target won't do round robin for the same source address. It=20
> will only do round robin for separate source addresses.
>=20
> What about the BALANCE target ? It's in the man page, but I had never=20
> heard of it.
In iptables 1.3.6 BALANCE is not available (nor is it available in the 2.6.=
17.3
source). Obsolete? And I fear that it would not help, because the problem is
the missing round robin/load balancing in the Kernel.

Maybe LVS is a solution -

Thanks and Best Regards, Stefan Friedel
--=20
Zentrale Dienste - Interdisziplin=E4res Zentrum f=FCr Wissenschaftliches
Rechnen der Universit=E4t Heidelberg - IWR - INF 368, 69120 Heidelberg
stefan.friedel@iwr.uni-heidelberg.de  Tel +49 6221 54-8240 Fax -5224
IWR: www.iwr.uni-heidelberg.de          HELICS: www.helics.uni-hd.de

--LTeJQqWS0MN7I/qa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFFIP+h3umRt9zSRsQRAkBrAJ9ZYjANQ2w6oMnOYRP1hpfdsFek8gCdHseI
2y05ItU/BGcBY17Vd2Iu8/w=
=PLIp
-----END PGP SIGNATURE-----

--LTeJQqWS0MN7I/qa--

