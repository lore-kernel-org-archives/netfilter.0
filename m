From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: Re[2]: netmeeting ?
Date: 16 Jun 2002 21:34:06 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1024256047.2736.44.camel@billy.demon.nl>
References: <17729088316.20020616195415@gmx.de>
	<200206161807.g5GI7DA29086@Networker.rockstone.co.uk> 
	<17730668368.20020616202035@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-CFh/prLOzdnnMDweIPf1"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <17730668368.20020616202035@gmx.de>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Corin Langosch <corinl@gmx.de>
Cc: IP-Tables Maillingliste <netfilter@lists.samba.org>


--=-CFh/prLOzdnnMDweIPf1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

s=F8n, 2002-06-16 kl. 20:20 skrev Corin Langosch:

> or does netmeeting use other protocols than tcp or udp which i
> also have to forward ??

Yes, h323. Do please take what antony said serioulsy.

Look at www.microsoft.com/netmeeting;

Consult "support" there. This is a known problem with all NAT providers,
not only iptables, but IPFilter (IPF used by old BSD and SCO Open Server
5.5 and above) and others (new BSD: PF). You are *not* the only person
in the world wanting this to work :-)

An awful lot has been done trying to make Netmeeting work for the
Netfilter people who want it, and it is only just beginning to work for
them!

Do consult the netfilter@lists.samba.org archive.

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



--=-CFh/prLOzdnnMDweIPf1
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9DOgt99dgUTvnuYERAnAxAKCSLXN+PFfhDYtiTQP5TZB/T1oqUwCgoD0m
0L0mltZD6jHRlH+sQFTM1yY=
=rG9t
-----END PGP SIGNATURE-----

--=-CFh/prLOzdnnMDweIPf1--


