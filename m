From: Alpt <alpt@freaknet.org>
Subject: Re: Different routes for different src addresses
Date: Thu, 8 Jul 2004 07:52:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040708055256.GA31304@nihil>
References: <20040707120502.GA23120@nihil> <200407071410.02752.Antony@Soft-Solutions.co.uk> <Pine.GSU.4.58.0407071653430.21043@adore.lightlink.com> <200407072236.32644.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200407072236.32644.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 07, 2004 at 10:36:32PM +0100, Antony Stone after a spiritual ca=
ll wrote  :
~> > This is true, but misleading.  Netfilter does provide a nice interface=
 to
~> > iproute2 with the fwmark feature.
~>=20
~> This is true, but unnecessary :)

Btw, It's always better to know more (^_+)

~> If all you want to match on is source IP (which is what the original pos=
ter=20
~> asked about), then iproute2 can do it quite neatly on its own.
~>=20
~> Mixing netfilter MARKs and iproute2 tables is a neat solution to some=20
~> problems, but not required for the simple ones.

In the end, Thanks to all for your replies.

Best Regards

--=20
:wq!
"I don't know nothing" The One Who reached the Thinking Matter   '.'

[ Alpt --- Freaknet Medialab ]
[ GPG Key ID 441CF0EE ]
[ Key fingerprint =3D 8B02 26E8 831A 7BB9 81A9  5277 BFF8 037E 441C F0EE ]

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFA7OE4v/gDfkQc8O4RAtIlAKCgbPIu0OMh/HZkhnA7QEE6ntGGkgCgloU1
ltE4/BiMLX3yKIx45yIs2qg=
=jNF4
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--

