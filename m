From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: netfilter access control
Date: 06 Jun 2002 09:18:03 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023347885.4299.159.camel@billy.demon.nl>
References: <3.0.1.16.20020606080648.252f8bd0@s-net-04.besancon.org> 
	<1023346651.254.0.camel@ADMIN>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-qfth49nMRRUgyHkQ2eEv"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1023346651.254.0.camel@ADMIN>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Frank Schaefer <frank.schafer@setuza.cz>
Cc: netfilter@lists.samba.org


--=-qfth49nMRRUgyHkQ2eEv
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

tor, 2002-06-06 kl. 08:57 skrev Frank Schaefer:

> we solved this task using mod_auth. There wasn't any problem for UNIX
> clients/ users. Doing some Gooooooooooogle we found a Windooooooze
> identd too.

I can't see how continuing to use what's basically a Socks 4 proxy can
help with those other protocols.

I used to use NEC's reference Socks 5 proxy for a subset of what Thierry
wants. There are 2 or 3 kinds of authorization possible.

Using HummingBird's (does HummingBird still exist?) Socks client,
Windows machines get completely transparent access. Otherwise, there's
NEC's SocksCap.

See: http://www.socks.nec.com/socksfaq.html

I haven't used it for years, though.

Best,

Tony

--=20

Tony Earnshaw

e-post:		tonni@billy.demon.nl
www:		http://www.billy.demon.nl
gpg public key:	http://www.billy.demon.nl/tonni.armor

Telefoon:	(+31) (0)172 530428
Mobiel:		(+31) (0)6 51153356

GPG Fingerprint =3D 3924 6BF8 A755 DE1A 4AD6 FA2B F7D7 6051 3BE7 B981
3BE7B981



--=-qfth49nMRRUgyHkQ2eEv
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA8/wyr99dgUTvnuYERAr7PAJ4sj3m5ktzCbYHAAfhPG1qs+4h13ACeMO59
Agx87IvlHr08coqfVME8GDI=
=XvMs
-----END PGP SIGNATURE-----

--=-qfth49nMRRUgyHkQ2eEv--


