From: Harald Welte <laforge@netfilter.org>
Subject: [ANNOUNCE] netfilter.org migrated to new server
Date: Wed, 25 Aug 2004 13:03:37 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040825110337.GG5824@sunbeam.de.gnumonks.org>
Reply-To: coreteam@netfilter.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>
Cc: coreteam@netfilter.org, Netfilter Mailinglist <netfilter@lists.netfilter.org>, Netfilter Announcement List <netfilter-announce@lists.netfilter.org>


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

For those of who who didn't notice it yet:=20

	{www,ftp,rsync,cvs,lists,people,bugzilla}.netfilter.org

has now been migrated to our new server, a=20

	Apple Dual G5 XServe ClusterNode

Apart from just switching old sparc64 against new ppc64 hardware, there
were some major software upgrades:

- Mailman was upgraded from 2.0.11 to 2.1.5
- Bugzilla was upgraded from 2.14.2 to 2.18rc2
- Apache was upgraded from 1.3.27 to 2.0.49

The new machine should significantly improve posting latency of the
mailinglist, and enable faster responses of dynamic content based
services such as bugzilla.

In the next couple of days, imap.netfilter.org and the upcoming
svn.netfilter.org service will also be moved to the new machine.

I have taken considerable time to verify that all services are running
again, and I'm monitoring the log files for any unexpected errors.

In case you still run into any problems, pleaes e-mail me at
my non-netfilter email address <laforge@gnumonks.org>.


The Netfilter Core Team wants to thank the generous donor Gert Hansen
for donating the new machine to the netfilter project.


Happy hacking,
	Harald for the Netfilter Core Team

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBLHIJXaXGVTD0i/8RAmqtAJ9dC+jHcZnqMs8SHrRrSazMYObKsACfZSKM
K6Qf4E09mXO0EfTA3Or0tng=
=+rrW
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--

