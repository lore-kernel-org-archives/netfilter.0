From: Tom Eastep <teastep@shorewall.net>
Subject: Re: xtables issue
Date: Sat, 04 Feb 2012 08:53:16 -0800
Message-ID: <4F2D627C.5010905@shorewall.net>
References: <4F2D2730.50205@cloudways.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig7472833C09D30C4B13FCF000"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F2D2730.50205@cloudways.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Azfar Hashmi <azfar.hashmi@cloudways.com>
Cc: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig7472833C09D30C4B13FCF000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 02/04/2012 04:40 AM, Azfar Hashmi wrote:

> I am getting following error with xtables.
>=20
> RTNETLINK answers: Invalid argument
> We have an error talking to the kernel
>    ERROR: Command "tc filter add dev eth0 protocol all parent 1:0 prio
> 276 handle 0 fw classid 1:10" Failed
>=20
> iptables-1.4.9.1
> xtables-1.41
> Shorewall-4.4.11.6
> kernel-2.6.32-5-686
> shorewall conf files:
>=20
> tcrules:

>=20
> Same setup working on other machines. Tried from module-assistant and
> source of different version of both xtables and iptables. Shorewall sho=
w
> capabilities showing all available and also shorewall check result ok.

This problem seems more appropriate for the Shorewall Users mailing
list. I suggest that you post it there.

-Tom
--=20
Tom Eastep        \ When I die, I want to go like my Grandfather who
Shoreline,         \ died peacefully in his sleep. Not screaming like
Washington, USA     \ all of the passengers in his car
http://shorewall.net \________________________________________________


--------------enig7472833C09D30C4B13FCF000
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk8tYnwACgkQO/MAbZfjDLJ3QQCfQcKvOBq/mGuE6ZKSyAu7bBYN
fzUAnjOnopwJcZeLlbg/NS4211zcoiHA
=mdbn
-----END PGP SIGNATURE-----

--------------enig7472833C09D30C4B13FCF000--
