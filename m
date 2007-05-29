From: Eric Leblond <eric@inl.fr>
Subject: [Announce] NuFW 2.2 is available
Date: Tue, 29 May 2007 14:49:03 +0200
Message-ID: <1180442943.26407.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-gjFqyPAwN0oSa+Dbpf+B"
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


--=-gjFqyPAwN0oSa+Dbpf+B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

NuFW Core team is proud to announce the availability of NuFW 2.2.0,
first release of the new stable branch 2.2.

NuFW fully integrates with Netfilter and Iptables and adds
authentication capabilities. Its algorithm allows authenticated
filtering even on multiuser computers.

The set of new features is quiet impressive :
      * Full IPv6 support
      * Advanced marking policy for QoS and routing:
              * per user
              * per application
              * per OS name
      * Command mode for nuauth:
              * Display connected users
              * Disconnect selected users
              * List connected nufw firewalls
              * Change debug level and debug areas
      * Backward compatibility with NuFW 2.0
      * Protocol improvments:
              * Network interfaces information are available
              * Connection accounting

NuFW : http://www.nufw.org/
NuFW 2.2, what=E2=80=99s in the .2 ? :
http://www.nufw.org/NuFW-2-2-what-s-in-the-2.html

Best regards,
--=20
Eric Leblond <eric@inl.fr>

--=-gjFqyPAwN0oSa+Dbpf+B
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGXCE/nxA7CdMWjzIRAmoYAKCQd9yQV+BGJp1MTpihxkYgIFrZKgCdG9fh
M5o8xO57zoGBUarh8BO7c/0=
=mY7C
-----END PGP SIGNATURE-----

--=-gjFqyPAwN0oSa+Dbpf+B--


