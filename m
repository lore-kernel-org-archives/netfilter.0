From: Stephen Frost <sfrost@snowman.net>
Subject: Re: Matching 10000's of IP ranges
Date: Mon, 3 Jan 2005 09:34:30 -0500
Message-ID: <20050103143430.GP10437@ns.snowman.net>
References: <20050102225028.83118.qmail@web41504.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4GAATbDXHfbycz3H"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050102225028.83118.qmail@web41504.mail.yahoo.com>
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
To: Brian Gunlogson <bmg300@yahoo.com>
Cc: netfilter@lists.netfilter.org


--4GAATbDXHfbycz3H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Brian Gunlogson (bmg300@yahoo.com) wrote:
> What is a reasonable way to match around 80000 IP ranges with iptables?

If there aren't too many actual *IP*s then you might look into
ipt_recent.  It does more than you actually need but I've put 1.5M IP
addresses in an ipt_recent hash before.  Many more than that and
ipt_recent runs into problems because it can't allocate enough memory w/
the default kernel memory setup.

	Stephen

--4GAATbDXHfbycz3H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB2Vf2rzgMPqB3kigRArYEAKCFuu/caKKoO8vjkvQ9cOGuCJY0KQCdE4io
zjaryqd/Cd6cbd0S2sFTc8o=
=szEw
-----END PGP SIGNATURE-----

--4GAATbDXHfbycz3H--

