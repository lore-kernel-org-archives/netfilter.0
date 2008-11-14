From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: The "badguy" example in the man page not working
	(-->"iptables: No chain/target/match by that name")
Date: Fri, 14 Nov 2008 14:15:32 -0600
Message-ID: <1226693732.11373.296.camel@grateful.d.umn.edu>
References: <gfk58b$qlv$1@ger.gmane.org>
	 <1226678430.11373.265.camel@grateful.d.umn.edu>
	 <gfkds5$ti4$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-jMvuzjXtrSC5uZlhvWWR"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <gfkds5$ti4$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Adem <for-gmane@alicewho.com>
Cc: netfilter@vger.kernel.org


--=-jMvuzjXtrSC5uZlhvWWR
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2008-11-14 at 18:48 +0100, Adem wrote:
> "Matt Zagrabelny" wrote:
> > On Fri, 2008-11-14 at 16:22 +0100, Adem wrote:
> > > The following example from the man page doesn't work on my box:
> > >=20
> > >   iptables -A FORWARD -m recent --name badguy --rcheck --seconds 60 -=
j DROP
> > >   iptables -A FORWARD -p tcp -i eth0 --dport 139 -m recent --name bad=
guy --set -j DROP
> >=20
> > I see 'eth0' in your rule, but below there is no eth0.
>=20
> Oops. that was just a cut&paste error, I actually had changed it,
> tried everything, but w/o success.
> Any other ideas what it might be?
>=20
> BTW, it is a virtual private server (VPS) box, there is nothing under /bo=
ot.
>=20
> Here the version info:
>=20
> # uname -r
> 2.6.9-023stab048.4-smp
>=20
> # iptables --version
> iptables v1.3.6

What GNU/Linux distro are you running?

I am running Debian Sid and here are my versions:

2.6.26-1-686
iptables v1.4.1.1

Here are the iptables rules that I have:
# if anybody from the list BADGUYS (and in the last 10 minutes) tries to
do anything, drop them
iptables -A INPUT --match recent --name BADGUYS --rcheck --seconds 600
-j DROP
# if anybody tries to connect to tcp:139 (windows filesharing), then add
them to the BADGUYS list and drop them
iptables -A INPUT -p tcp -i eth0 --dport 21 --match recent --name
BADGUYS --set -j DROP
iptables -A INPUT -p udp -i eth0 --dport 21 --match recent --name
BADGUYS --set -j DROP
iptables -A INPUT -p tcp -i eth0 --dport 139 --match recent --name
BADGUYS --set -j DROP
iptables -A INPUT -p tcp -i eth0 --dport 445 --match recent --name
BADGUYS --set -j DROP

Looks pretty similar to yours.


--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-jMvuzjXtrSC5uZlhvWWR
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkkd3GEACgkQU+eIf4TiLaIPqACgkWNK9kvL7AOhD8LJ4x+mIqyU
TmcAn3pKzBbeHkh3wlKgMIDnpEQJHfp9
=wUdU
-----END PGP SIGNATURE-----

--=-jMvuzjXtrSC5uZlhvWWR--

