From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: dns server
Date: 09 Jun 2002 09:40:41 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023608443.8429.56.camel@billy.demon.nl>
References: <1420507267.20020606152231@gmx.de>
	<1023372279.8475.27.camel@billy.demon.nl> 
	<20020608105857.I2090@funkyjesus.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-A++WRWnIb2DuX3RH+gXh"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020608105857.I2090@funkyjesus.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Nick Drage <nickd@funkyjesus.org>
Cc: netfilter@lists.samba.org


--=-A++WRWnIb2DuX3RH+gXh
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

l=F8r, 2002-06-08 kl. 11:58 skrev Nick Drage:

> > It depends what you want to do with it. And what DNS software you're
> > running. I.e., if it's BIND, you can do more with BIND 9 than you can
> > with BIND 8, more with BIND 8 than with BIND4.

> > Many security people might say that if you're running BIND 4 or 8, then
> > you shouldn't be. Some of them again might say that you should be
> > running BIND 9.2.

> I believe that the latest BIND 8.something is still OK, and version 8 is
> being maintained as far as security patches go.

Yes, but as I wrote: You can do more with BIND 9 than with BIND 8.

> As for the rest of the thread, you're best restricting that kind of acces=
s
> using named.conf as the problem is at layer 7 - the BIND application, not
> layer 3 - where netfilter mostly lives.

Again yes, but if you have a blanket DROP policy, you're going to have
to open up ports, aren't you? The question is, what ports and for which
protocols and using what policies and what tools that iptables places at
your disposition?

Have a look at hping2 (and most probably other tools and craftsmanship,
but hping2 is my favorite of all favorites) and see what nasty things
you can do with it, if you want to, and then have a look at what you can
drop with Netfilter, that BIND simply isn't capable of.

Best,

Tony
=20
--=20

Tony Earnshaw

e-post:		tonni@billy.demon.nl
www:		http://www.billy.demon.nl
gpg public key:	http://www.billy.demon.nl/tonni.armor

Telefoon:	(+31) (0)172 530428
Mobiel:		(+31) (0)6 51153356

GPG Fingerprint =3D 3924 6BF8 A755 DE1A 4AD6 FA2B F7D7 6051 3BE7 B981
3BE7B981



--=-A++WRWnIb2DuX3RH+gXh
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9AwZ599dgUTvnuYERAicqAJwKZL1cb0znorv9Z2AP05hjVbdmKgCcCydp
c0NtlILot0XsGiakHlEzZxo=
=jWoC
-----END PGP SIGNATURE-----

--=-A++WRWnIb2DuX3RH+gXh--


