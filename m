From: Stefan Friedel <stefan.friedel@iwr.uni-heidelberg.de>
Subject: DNAT problem
Date: Mon, 2 Oct 2006 10:00:13 +0200
Message-ID: <20061002080013.GB23849@woyzeck>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Good Morning,
I have a problem after switching from an old 2.4.x installation to 2.6.17.3=
 - scenario:
- computer pool with central server, central server visible in the internet
- several nodes, two of them access nodes, private network
- the two access nodes in the pool get all external ssh connections via a r=
ule on the central server

iptables -t nat -A PREROUTING -p tcp -i eth3 -d <external IP> -j DNAT --dpo=
rt 22 --to-destination <firstprivip>-<lastprivip>

This worked fine with 2.4.29 (server+nodes). But after switching to 2.6 rou=
nd
robin is no longer working: only the node <lastprivip> is used. Changing the
rule and using the --to-destination <firstprivip> --to-destination <lastpri=
vip>
does not work at all: iptables is complaining about invalid arguments.

iptables on the server is v1.2.11, Debian sarge, 2.6.17.3

Any hint? Did I miss some changes in the behavior of netfilter/iptables?

Thanks and Regards, Stefan Friedel
--=20
Zentrale Dienste - Interdisziplin=E4res Zentrum f=FCr Wissenschaftliches
Rechnen der Universit=E4t Heidelberg - IWR - INF 368, 69120 Heidelberg
stefan.friedel@iwr.uni-heidelberg.de  Tel +49 6221 54-8240 Fax -5224
IWR: www.iwr.uni-heidelberg.de          HELICS: www.helics.uni-hd.de

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFFIMcN3umRt9zSRsQRAr4yAJ0eVuufSrf9TU+IcUgnjAUdZ6TyTgCfaC08
8iO9Pod/K49+TYT0THX5dks=
=m4Iv
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--

