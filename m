From: Eric Leblond <eric@inl.fr>
Subject: Nuface 1.0, firewall configuration interface
Date: Tue, 11 Apr 2006 11:52:25 +0200
Message-ID: <1144749145.21344.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-wNxxBhqlpjwacubUGOcf"
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
To: nufw-announces@nongnu.org, netfilter@lists.netfilter.org
Cc: nufw-users@nongnu.org


--=-wNxxBhqlpjwacubUGOcf
Content-Type: text/plain; charset=iso-8859-7
Content-Transfer-Encoding: quoted-printable

Hi,

INL is proud to announce the availability of the Nuface 1.0 branch
(latest release 1.0.3).

Nuface is an intuitive firewall configuration interface for
EdenWall/NuFW as well as for Netfilter. It lets you use high level
objects, agglomerate objects into ACLs, and deals with generating
Netfilter rules as well as LDAP Acls for NuFW.

Nuface uses an XML abstraction of filtering rules, as well as an XML
definition of the network topology. This leads to automatic
auti-spoofing rules (ie, the web interface does not show the notion of
physical network interface to the admins, but deals with it internally).

Nuface is distributed under the terms of the GPL v2 license.

You can test nuface at the Nuface demo site :
	https://nuface.inl.fr/
Of course you won=A2t be able to generate or apply firewall rules on this
demo.

Happy filtering to all,
--
Eric Leblond for the INL development team


--=-wNxxBhqlpjwacubUGOcf
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBEO3xYnxA7CdMWjzIRAlWFAJ4v42JT2kl2hAzf44mHjSUXsyyeyQCfb2nN
5gMZml6Ckl0hrwlqWOTnIWk=
=/NzT
-----END PGP SIGNATURE-----

--=-wNxxBhqlpjwacubUGOcf--


