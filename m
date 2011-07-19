From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: netfilter periodically thinks local traffic is FORWARDed
Date: Tue, 19 Jul 2011 16:10:15 -0400
Message-ID: <4E25E4A7.5070203@interlinx.bc.ca>
References: <j03nj6$sql$1@dough.gmane.org> <alpine.LNX.2.01.1107191305580.31431@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigBA81C506B03C570250DB2090"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1107191305580.31431@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigBA81C506B03C570250DB2090
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11-07-19 07:07 AM, Jan Engelhardt wrote:
>=20
> Uh better use `ip addr`.

Sure, next time since your hints helped me resolve this issue.

> Routing determines whether it is forwarded or not - cf.
> `ip route show table all`, not Netfilter or Xtables.

Makes sense.  That drove me to looking closer at the routing tables and
it seemed that the scripts that bring up the ipv6 interface didn't plumb
a local route so I restarted the interface and it seems to be there now.

Thanx for the friendly poke in the right direction.  It was all I needed
to figure out the problem.

b.


--------------enigBA81C506B03C570250DB2090
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk4l5KcACgkQl3EQlGLyuXDCtQCgnT6qQ07FyoryS7MKzuc3/MXU
fukAn1ZkYx8g/qoseWAooMeibxmgPboJ
=5Asz
-----END PGP SIGNATURE-----

--------------enigBA81C506B03C570250DB2090--

