From: Harald Welte <laforge@netfilter.org>
Subject: Re: iptables and SIP
Date: Thu, 16 Dec 2004 14:48:04 +0100
Message-ID: <20041216134803.GA10547@sunbeam.de.gnumonks.org>
References: <498D2534FBEB784686D402666966F6162540E9@sophia.crossbeamsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <498D2534FBEB784686D402666966F6162540E9@sophia.crossbeamsys.com>
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
To: "Zelmans, Bernard" <BZelmans@CROSSBEAMSYS.COM>
Cc: netfilter@lists.netfilter.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 14, 2004 at 12:18:41PM +0100, Zelmans, Bernard wrote:
> Is there some iptables code that supports SIP:
> -opening the pinhole
> -modify the IP address of the end point in the signaling so that the rtp
> channel is opened properly
> -closing the pinhole when the call is terminated
> -preventing DOS attacks

No, but contributions/patches are always welcome.

As for now, I think running siproxd (including rtp proxy) is the best
you can get.

> Thanks, b

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBwZITXaXGVTD0i/8RAo0hAKCARZaC6qOws9/y698D60L5XlOFUQCcCMFf
W6c2qLxr9aqJFSxzNza5A1I=
=tB17
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--

