From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: IP address to MAC address
Date: 11 Jun 2002 22:38:00 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023827880.4177.81.camel@billy.demon.nl>
References: <001601c2113a$aa85b560$0500a8c0@escritoriomundial.com.br>
	<004c01c21145$0d9a0b10$0601a8c0@sundaram> 
	<200206111253.g5BCrqU10699@vulcan.rissington.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-+pzKYa99WPtuhTSq8KCV"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206111253.g5BCrqU10699@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org


--=-+pzKYa99WPtuhTSq8KCV
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

tir, 2002-06-11 kl. 14:53 skrev Antony Stone:

> ping $IP -c1 >/dev/null 2>&1
> grep $IP /proc/net/arp | tr -s ' ' | cut -d' ' -f4

> (There's a single space in between each of those pairs of ' ', in case it=
's=20
> not obvious.)

Did you say 'arp -a'?

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



--=-+pzKYa99WPtuhTSq8KCV
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9Bl+o99dgUTvnuYERApPWAKChNT9TEnHU2NIdGl8WaNdrCMZFagCfcTC3
sx7PDUXwh9z4wf1r6Ft2dvo=
=+3RP
-----END PGP SIGNATURE-----

--=-+pzKYa99WPtuhTSq8KCV--


