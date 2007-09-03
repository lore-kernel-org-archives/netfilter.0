From: Eric Leblond <eric@inl.fr>
Subject: [Announce] Nulog 2.0-alpha1, log analysis tool for Netfilter
Date: Mon, 03 Sep 2007 23:34:09 +0200
Message-ID: <1188855249.4004.19.camel@ghlodit.inl.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-9mP0RWULVvbMifJXf8FZ"
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Cc: progs@inl.fr


--=-9mP0RWULVvbMifJXf8FZ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

INL Devel Team is proud to announce the availability of the first
preview of Nulog2.

Nulog2 is a complete rewrite of Nulog the historical filtering log
analysis solution from INL. Nulog2 is an application build upon Twisted,
an advanced Python framework.

Nulog2 has all Nulog features:
      * Index page with a summary of firewall activity:=20
              * Packet dropped per host
              * Packets dropped per UDP port
              * Packets dropped per TCP port
              * Packets dropped per user (NuFW only)
      * Fully browsable tables
      * Search capability

It also has exclusive new features:
      * Graphing capabilities (display array, histogram or pie for a
        dataset)
      * SOAP request system for integration with other systems
      * IPv6 support.

More informations and download:
Nulog2:	http://software.inl.fr/trac/trac.cgi/wiki/EdenWall/NuLog2
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/

Thanks to Romain Bignon for his work.

Best regards,
--=20
Eric Leblond <eric@inl.fr>
INL SARL

--=-9mP0RWULVvbMifJXf8FZ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBG3H3RnxA7CdMWjzIRApXrAJ413j9h1e2ewFa0/Uc3IJN5Bag8tACdGJu6
fXkePVapWNfzTO1G2cJGJXs=
=1lOn
-----END PGP SIGNATURE-----

--=-9mP0RWULVvbMifJXf8FZ--


