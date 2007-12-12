From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: Multihomed Problem
Date: Wed, 12 Dec 2007 13:35:12 -0600
Message-ID: <1197488112.19486.135.camel@grateful.d.umn.edu>
References: <475EFFF8.1010606@nwcascades.com>
	 <475F095A.7040003@riverviewtech.net>
	 <1197412206.19486.115.camel@grateful.d.umn.edu>
	 <475F1562.7060207@riverviewtech.net>  <47603204.8060200@nwcascades.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-pTwsiSCQ/wbDJPLVWRWF"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47603204.8060200@nwcascades.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jack Lauman <jlauman@nwcascades.com>
Cc: Grant Taylor <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@vger.kernel.org>


--=-pTwsiSCQ/wbDJPLVWRWF
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


On Wed, 2007-12-12 at 11:09 -0800, Jack Lauman wrote:
> Hi,
>=20
> IP forwarding is turned on.  I've tried several different routing=20
> statements but none seemed to work.
>=20
> What's the correct procedure to do this?

What is the correct procedure to do what? You just said that IP
forwarding is turned on. Is it?

cat /proc/sys/net/ipv4/ip_forward

You aren't giving the list much to work with. Maybe give us the output
of 'route -n' for each host that is involved plus a diagram of your
network.

Also,

You said that you want to print. Have you checked to make sure the
network is working, ie. ping, nmap, and that there isn't just a problem
with your application?

Maybe do some tcpdump'ing on the linux box. Also, you could do some
logging within iptables.

Lastly, you should be posting inline and not top-posting.

Cheers,

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-pTwsiSCQ/wbDJPLVWRWF
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHYDfwU+eIf4TiLaIRAoYQAKCImFctD1ivV4nJfuFXXDriYRNqZACfZalC
U66bmrOiYD1E/cI9RJM/MQQ=
=8ong
-----END PGP SIGNATURE-----

--=-pTwsiSCQ/wbDJPLVWRWF--

