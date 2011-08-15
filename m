From: Tom Eastep <teastep@shorewall.net>
Subject: Re: Could Cogent be doing packet mangling that would confuse
 Netfilter about interfaces?
Date: Mon, 15 Aug 2011 14:10:33 -0700
Message-ID: <1313442633.20254.7.camel@sami.shorewall.net>
References: <20110723003617.GA17279@black.transpect.com>
	 <20110725000139.GA10041@black.transpect.com>
	 <20110815171353.GA15638@black.transpect.com>
	 <097A5326-A354-436E-9932-91D3A912494A@shorewall.net>
	 <20110815203335.GB27440@black.transpect.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-kDf7M2AyZhVKJALgnYbC"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110815203335.GB27440@black.transpect.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Whit Blauvelt <whit@transpect.com>
Cc: netfilter@vger.kernel.org


--=-kDf7M2AyZhVKJALgnYbC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-08-15 at 16:33 -0400, Whit Blauvelt wrote:
> On Mon, Aug 15, 2011 at 10:52:35AM -0700, Tom Eastep wrote:
>=20
> > On Aug 15, 2011, at 10:13 AM, Whit Blauvelt wrote:
>=20
> > > We're now seeing the same behavior from both iptables 1.4.8 on Debian
> > > Squeeze and 1.3.8 on Ubuntu 8.04 (on totally different hardware). The=
 common
> > > factor is that this is all traffic coming in via our Cogent pipe. Whe=
n
> > > traffic comes in via either of our two other Speakeasy/Megapath pipes
> > > Netfilter sees all the interface specifications correctly.
> >=20
> > This behavior is usually a sign that your Cogent external firewall
> > interface and and your internal firewall interface have accidentally
> > become part of the same broadcast domain. I would look for mis-cabling =
and
> > for erroneous VLAN configuration.

Whit,

I don't have time ATM to give you detailed help, but
http://www.shorewall.net/FoolsFirewall.html#id36131257 explains what
happens when two firewall interfaces are effectively connected to the
same ethernet network. That may help you figure out where the problem
is.

-Tom
--=20
Tom Eastep        \ When I die, I want to go like my Grandfather who
Shoreline,         \ died peacefully in his sleep. Not screaming like
Washington, USA     \ all of the passengers in his car
http://shorewall.net \________________________________________________


--=-kDf7M2AyZhVKJALgnYbC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk5Ji0kACgkQO/MAbZfjDLIHHgCfdyvvQXCtn054WVbISUjzgzsZ
69wAoIlMgR/3E2IucdZInDwg9PxriADn
=QD5d
-----END PGP SIGNATURE-----

--=-kDf7M2AyZhVKJALgnYbC--

