From: Harald Welte <laforge@netfilter.org>
Subject: Re: No anonymous ftp?
Date: Wed, 19 Mar 2003 01:29:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030319002935.GJ21904@sunbeam.de.gnumonks.org>
References: <200303190142.48949.warragul@hotkey.net.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JB7KW7Ey7eB5HOHs"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200303190142.48949.warragul@hotkey.net.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Harley <warragul@hotkey.net.au>
Cc: webmaster@netfilter.org, netfilter@lists.netfilter.org


--JB7KW7Ey7eB5HOHs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2003 at 01:42:48AM +1000, Harley wrote:
> Hi, I'm not sure this is the right address to send this to, but it's the=
=20
> closest I could find.

It's fine, thanks.

> I was trying to download ulogd from ftp.netfilter.org, as it's linked to =
from=20
> freshmeat and a few other places, but when I try to log in anonymously th=
e=20
> login fails (I just tried it again with command line ftp to make
> sure).

That's strange. the 'ftp' user account in /etc/passwd on our ftp server
somehow disappeared, making it impossible to use the ftp server.

It's fixed now.

> I really would like to try out ulogd but that's the only place I can
> find that has the tarball.


> Any advice or an alternate URL would be greatly appreciated.

Just use http instead of ftp:

http://ftp.netfilter.org/ :)

> Harley

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--JB7KW7Ey7eB5HOHs
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+d7nvXaXGVTD0i/8RAsioAKCFlmJTmuIN2NQB+LvJyYxUi+NOswCfWpqp
lXV3Wyk9+Rg/Ebxw3FMhdFI=
=sckG
-----END PGP SIGNATURE-----

--JB7KW7Ey7eB5HOHs--

