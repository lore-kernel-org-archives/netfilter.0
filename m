From: Stephen Frost <sfrost@snowman.net>
Subject: ipt_recent 0.3.0 release
Date: Sun, 2 Mar 2003 15:14:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030302201422.GA2721@ns.snowman.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
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
To: Netfilter Users <netfilter@lists.netfilter.org>


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey all,

  Just letting you all know that I've released a new version of
  ipt_recent.  A patch against current netfilter CVS is at:
  http://snowman.net/projects/ipt_recent/ipt_recent-0.3.0-netfilter_update.patch
  (This has also been sent to Harald for inclusion in netfilter CVS)
  A tarball of the files is at:
  http://snowman.net/projects/ipt_recent/ipt_recent-0.3.0.tar.gz

  Official project site is at
  http://snowman.net/projects/ipt_recent/ ; along with a changelog.
  This is now also an ipt_recent mailing list since some people have
  shown interest in that.  You can get to the list page at:
  http://snowman.net/mailman/listinfo/ipt_recent

  This should fix the TTL, save/restore, kernel panic and probably some
  other bugs along the way, please let me know if anyone has any
  problems with it.

  	Stephen

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+YmYerzgMPqB3kigRAjd/AJ9SvWpyNKY8VhzKZJbzkQFWe1sVKQCghq+x
jFAAO3hnt+SE5FDHErg4AmU=
=hTlQ
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--

