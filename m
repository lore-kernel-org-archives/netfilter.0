From: "Alexander W. Janssen" <yalla@ynfonatic.de>
Subject: Re: What does this mean?
Date: Wed, 5 Mar 2003 18:02:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030305170241.GC12124@ynfonatic.de>
References: <1046358409.11465.23.camel@raylinux.internal> <Pine.LNX.4.51.0302271645200.31492@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.51.0302271645200.31492@dns.toxicfilms.tv>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2003 at 04:48:30PM +0100, Maciej Soltysiak wrote:
> Note, some routers outthere are not ECN aware and violate RFC 3168 by
> dropping these packets. This causes interoperability problems, which
> should be resolved by vendors.

At http://urchin.earth.li/cgi-bin/ecn.pl?output=3Dip is a list with routers=
 with
are known to violate ECN. There is even a perl-script around wich uses the
--remove-ecn feature of the ECN target to create rules based on that list of
IP-addresses. Quite nice, since it sorts out the problem locally - but not =
in
a global sense. Call it self-defense.
=20
> > Ray
> Maciej
Alex

--=20
"Mr Data, when I said 'Fire at Will', I didn't mean for you to be so litera=
l."
Instructions for use of this post: Insert tounge in cheek. Read as normal.

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Weitere Infos: siehe http://www.gnupg.org

iEYEARECAAYFAj5mLbEACgkQEMMZKORQoYJv3QCfRLUAwR3hDOBHEQ3aY7Bb/0Ak
oFwAoIje0nHiyaSJMDNMf87ywema9kR7
=WDOR
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--

