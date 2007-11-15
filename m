From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: libnetfilter conntrack: problem in nfct_callback_register
Date: Thu, 15 Nov 2007 13:26:56 -0600
Message-ID: <1195154816.19115.289.camel@grateful.d.umn.edu>
References: <200711151235.52842.julien@linuxwall.info>
	 <1195150285.3480.5.camel@localhost>
	 <200711151416.37081.julien@linuxwall.info>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-/p7unt6fis+bLYz9GqWb"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200711151416.37081.julien@linuxwall.info>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Julien VEHENT <julien@linuxwall.info>
Cc: Eric Leblond <eric@inl.fr>, netfilter@vger.kernel.org


--=-/p7unt6fis+bLYz9GqWb
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


On Thu, 2007-11-15 at 14:16 -0500, Julien VEHENT wrote:
> On Thursday 15 November 2007 01:11:25 pm Eric Leblond wrote:
> > Hi,
> >
> > > I'm using the following libs on Debian Lenny:
> > > >libnetfilter-conntrack-dev    0.0.50-1
> > > >libnetfilter-conntrack1       0.0.50-1
> >
> > First of all, please update the libs. A major rewrite has occur and lot=
s
> > of bug have been fixed. Please also nota that the API has changed.
> >
> > Last version can be downloaded from:
> > http://netfilter.org/projects/libnetfilter_conntrack/downloads.html
>=20
> Hi,
>=20
> I'm probably asking too much, but do you have any .deb version of the=20
> library ?
> I would rather prefer to keep the integrity of my system.

It looks like the packages are getting close to being in 'sid', however
as of right now, are not. Once they are, you can use apt pinning to pull
them in, or wait for them to migrate from 'sid' to 'lenny'.

Otherwise, you could build from source and install to /usr/local/, which
is what I would do.

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-/p7unt6fis+bLYz9GqWb
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHPJ2AU+eIf4TiLaIRAjqVAKCOiN4mtUT/4L5IykTDPvYeqa0MUQCgrGbn
ioSScqw1ViZqnGC7/hxtPc0=
=z57t
-----END PGP SIGNATURE-----

--=-/p7unt6fis+bLYz9GqWb--

