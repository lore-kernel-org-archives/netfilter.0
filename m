From: Eric Leblond <eric-n3uEIhE4P3g@public.gmane.org>
Subject: [Announce] NuFW 2.4.0 is available
Date: Tue, 02 Mar 2010 19:30:22 +0100
Message-ID: <1267554622.21904.36.camel@khasse.inl.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0708361599=="
Return-path: <nufw-users-bounces+gcsfnu-nufw-users=m.gmane.org-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.nongnu.org/mailman/listinfo/nufw-users>,
	<mailto:nufw-users-request-qX2TKyscuCcdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/pipermail/nufw-users>
List-Post: <mailto:nufw-users-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:nufw-users-request-qX2TKyscuCcdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/nufw-users>,
	<mailto:nufw-users-request-qX2TKyscuCcdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: nufw-users-bounces+gcsfnu-nufw-users=m.gmane.org-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
Errors-To: nufw-users-bounces+gcsfnu-nufw-users=m.gmane.org-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
To: NuFW devel <nufw-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, nufw-announces <nufw-announces-qX2TKyscuCcdnm+yROfE0A@public.gmane.org>, nufw-users-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
Cc: netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--===============0708361599==
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-WXwyRDYtpj/s0BdZTa5O"


--=-WXwyRDYtpj/s0BdZTa5O
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

NuFW development team is really excited to announce the availability of
NuFW 2.4.0. This first version of the new stable branch is the result of
almost two years of development. It contains a bunch of new features and
improvements:
      * Evolutive and optimized protocol
      * Filtering capabilities improvements
      * Plugin support in client library
      * Major code refactactoring
      * And a new website: http://www.nufw.org/projects/nufw/wiki

For record, NuFW adds user-based filtering to Netfilter. Its algorithm
allows authenticated filtering even on multiuser computers. NuFW can be
seen as an Identity access management solution, at the network level.

The main new features and major improvements are as follows:
      * Extensible protocol: NuFW protocol between authentication server
        and clients has evolved and it is now possible to extend the
        protocol via plugin (on both client and nuauth side).
      * Optimized protocol: Client to authentication server protocol has
        been heavily optimized for laggy network and computer used
        simultaneously by multiple users. For example, on a 1 sec delay
        network, authentication is done at worst in 1.2 sec which is
        only 0.2 sec more than non authenticated flow. With previous
        protocol authentication was done in more than 3 sec...
      * Filtering capabilities improvements: Client is now computing
        hash of application binary for advanced filtering. It is also
        possible to use an authentication quality in filtering rules.
        For example, this mean it is possible to accept a packet if and
        only if the authentication of the user has been done via
        certificate.
      * Rewrite and code factorization: A huge code factorization and
        rewrite has been done. Convenience libraries are now shared
        between the different components. Cryptography can now be done
        via openssl or gnutls and all components now share the same
        configuration file parser.

The main changes are as follows:=20
      * Support for plugin in libnuclient
      * Improved client-server protocol=20
      * Protocol extension via plugin
              * Better performances on bad network
              * Better error handling
              * Filtering capabilities improvements:=20
      * Client compute hash of application for advanced filtering
              * Authentication quality support
              * Configuration file for nufw and client
      * New convenience libraries:
              * nussl: TLS abstraction library (gnutls or openssl)
              * nuconfparser: Configuration library
              * nubase: Common use library
      * log_ulogd2 module: log packet via ulogd2
      * postauth_localuser module: sample postauthentication protocol
        modification
      * nufw: switch libnetfilter_conntrack code to new API
      * client proto: negotiate protocol version

Best regards,
--=20
=C3=89ric Leblond <eric-n3uEIhE4P3g@public.gmane.org>
EdenWall, http://www.edenwall.com/
NuFW, http://www.nufw.org

--=-WXwyRDYtpj/s0BdZTa5O
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkuNWTwACgkQnxA7CdMWjzIwcACfQ8/U73WhlsDssZsRUQn3SAUn
tfkAnjQhbV4kbTA3KVLAJBQCJk9S3kz5
=UH+r
-----END PGP SIGNATURE-----

--=-WXwyRDYtpj/s0BdZTa5O--




--===============0708361599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============0708361599==--
