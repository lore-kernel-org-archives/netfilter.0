From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: (?)Help me... install iptables
Date: 11 Jun 2002 10:40:04 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023784805.2050.6.camel@billy.demon.nl>
References: <20020611020735.24629.qmail@web21202.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-QVS4THp1AKNnIelTRlj6"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020611020735.24629.qmail@web21202.mail.yahoo.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Hai To Thanh <nguyenquocanh01@yahoo.com>
Cc: netfilter@lists.samba.org


--=-QVS4THp1AKNnIelTRlj6
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

tir, 2002-06-11 kl. 04:07 skrev Hai To Thanh:

>   "make: *** Warning: File "Rule.make" has
> modification time in the future ( 2001-08-06 01:50:21
> > 1998-01-01 02:26:21).

It seems that you either installed your whole system or simply the
kernel without setting the proper date on the machine. make thinks that
the date is early in the morning on 1 Jan 1998 and you're trying to
install stuff that is to be made in the future and the security doesn't
like that. Quite right too.

Reset the date on the machine to today's date, using 'date' ('man date')
and everything should work.

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



--=-QVS4THp1AKNnIelTRlj6
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9Bbdk99dgUTvnuYERAoDHAJ9OgDlQPvqtO4NxOD/kbdwxlH03rACeKKKZ
orHxpI8ItawAM8F2A/vkp1g=
=Yjyj
-----END PGP SIGNATURE-----

--=-QVS4THp1AKNnIelTRlj6--


