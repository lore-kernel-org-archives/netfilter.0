From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Subject: Re: How to drop an idle connection with iptables?
Date: Wed, 23 Nov 2011 07:37:00 -0500
Message-ID: <jaipdd$irr$1@dough.gmane.org>
References: <4ECCCF70.1080701@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigC6F52B7A67648185690C3B53"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ECCCF70.1080701@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigC6F52B7A67648185690C3B53
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11-11-23 05:48 AM, lu zhongda wrote:
>=20
>     I felt the scenario you described is not really what I want to know=
=2E

Probably because your request was unclear.

>     I want to know if there is any way to set up iptables so
>     that it will drop a connection after that connection has been idle
> for a specified period of time?

Define "drop", "connection" and "idle".  And why do you feel you need to
"drop" them?

>    I have tried connection tracking function of iptables, however it
> seems not work for my case.

Please explain why it doesn't.  What are you trying to achieve exactly?
 Perhaps a real-world use-case might help us understand.

b.


--------------enigC6F52B7A67648185690C3B53
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk7M6O0ACgkQl3EQlGLyuXD6FgCg+6r0GZsLx1vLOOKpTisSgeMt
op8An20q9XcAPoLZzLsCH/5kVqkbTEvi
=jrv2
-----END PGP SIGNATURE-----

--------------enigC6F52B7A67648185690C3B53--

