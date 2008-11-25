From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: Allow client only 1 connect per 20 seconds
Date: Tue, 25 Nov 2008 14:20:14 -0600
Message-ID: <1227644414.11373.559.camel@grateful.d.umn.edu>
References: <gghgq9$33t$1@ger.gmane.org>  <gghm16$qal$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-gF96+92shuKTGt0ufZMO"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <gghm16$qal$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Adem <for-gmane@alicewho.com>
Cc: netfilter@vger.kernel.org


--=-gF96+92shuKTGt0ufZMO
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-11-25 at 21:07 +0100, Adem wrote:
> "Adem" wrote:
> >
> > How would you code this rule in iptables:
> >=20
> > If anybody tries to do more than 1 connection to port 8191
> > within 20 seconds, regardless of the protocol, then DROP=20
> > it and ignore any further connect attempts on that port
> > from that source for 20 seconds.
>=20
> The following should work, but it somehow doesn't work in iptables v1.4.1=
.1:
>  ...
>   # if anybody from the list WATCHLIST, and in the last 20 sec, tries to =
do new connect attempts then DROP them!
>   /sbin/iptables -A INPUT --match recent --name WATCHLIST --rcheck --seco=
nds 20 -j DROP
>=20
>   # accept client at port 8191 (all protocols) and register in WATCHLIST
>   # BUG: if "-p XXX" is left out or if instead "-p all" is used then the =
rule gets eliminated!
>   /sbin/iptables -A INPUT -p all --dport 8191 --match recent --name WATCH=
LIST --set -j DROP
>  ...
>=20
> It works only if "-p tcp" is specified.

=46rom the man page:

These extensions can be used if =E2=80=98--protocol tcp=E2=80=99 is specifi=
ed.
These extensions can be used if =E2=80=98--protocol udp=E2=80=99 is specifi=
ed.

Hence, these extensions cannot be used with '--protocol all'.
So, it looks like you will need to double the number of rules you have.

> Isn't that a bug in iptables?

Doesn't look like it.

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-gF96+92shuKTGt0ufZMO
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkksXf0ACgkQU+eIf4TiLaLT8QCfdEVit6013cAMIPtMFuQXbaKp
fNoAoIC5vMRKrlJPyq5GhyuA+H4Et72U
=1+46
-----END PGP SIGNATURE-----

--=-gF96+92shuKTGt0ufZMO--

