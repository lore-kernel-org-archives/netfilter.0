From: martin f krafft <madduck@madduck.net>
Subject: [solved] problem with recent match
Date: Sat, 11 Mar 2006 00:02:16 +0100
Message-ID: <20060310230216.GA28611@lapse.madduck.net>
References: <20060308130145.GA836@lapse.madduck.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20060308130145.GA836@lapse.madduck.net>
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


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This issue seems known and solved. Following is a clear explanation
I received elsewhere, included here with permission for
completeness:

  Sounds like you are experiencing the timer overflow bug in
  ipt_recent. On 32bit machines with HZ at 1000 (the default in 2.6),
  you'll hit the bug after ~25 days of uptime. This could explain why
  you're only seeing this on some of your machines.

  There are a couple of workarounds available [1] [2], but the
  consensus from the Netfilter maintainers is that a full rewrite is
  needed.

  [1] http://blog.blackdown.de/2005/05/09/fixing-the-ipt_recent-netfilter-m=
odule/
  [2] http://www.kd.cz/~martin/kernel-recent/

Apparently, patches exist and I have been told they have been
rejected by the maintainer as ipt_recent "needs a complete rewrite".
Could someone clue me in on the outlook? Is a rewrite already in
progress? Are there plans to remove the buggy module from the stable
kernel tree?

Cheers,

--=20
martin;              (greetings from the heart of the sun.)
  \____ echo mailto: !#^."<*>"|tr "<*> mailto:" net@madduck
=20
invalid/expired pgp (sub)keys? use subkeys.pgp.net as keyserver!
spamtraps: madduck.bogus@madduck.net
=20
micro$oft windows psychic edition:
we will tell you where you are going tomorrow.

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature (GPG/PGP)
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFEEgV4IgvIgzMMSnURAqa3AJ9piG5Yeop0QdHnP4uNvPccsJ0QegCgpo+y
Jzlb/sNEZnr43QRq6JP2iVY=
=OBZG
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--

