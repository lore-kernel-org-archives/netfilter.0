From: Harald Welte <laforge@netfilter.org>
Subject: Re: Netfilter and SCTP
Date: Sat, 3 May 2003 17:14:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030503151439.GD29373@sunbeam.de.gnumonks.org>
References: <Law8-F94rhYQYx3G5aY000150f0@hotmail.com> <1051712682.8215.135.camel@tux.rsn.bth.se>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1051712682.8215.135.camel@tux.rsn.bth.se>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: Cyrille Colin <shishico@hotmail.com>, Netfilter <netfilter@lists.netfilter.org>


--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2003 at 04:24:42PM +0200, Martin Josefsson wrote:
> iptables doesn't have support for SCTP yet, noone has sent a patch for
> it :)

yes, but I am very interested in SCTP (I've read all the specs some time
ago)... unfortunately there is way too much high-priority stuff on my
TODO list, so I don't think that I'll be able to provide a patch soon.

What we would need is an implementation of the following modules:

ip_conntrack_sctp.c
ip_nat_sctp.c
ipt_sctp.c
libipt_sctp.c

> /Martin

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+s9zfXaXGVTD0i/8RAt0iAJsE1kquhMpjqhwkRkhdRntpJLz8SACeIHlv
Xu+z+z/9QLSJYvAAjl9dt38=
=acEw
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--

