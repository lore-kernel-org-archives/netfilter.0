From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: Too scared....
Date: 11 Jun 2002 11:39:55 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023788396.2050.21.camel@billy.demon.nl>
References: <E17HVTU-00062d-00@pooh.kjernsmo.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-6T5k35HvvsE/pxr5BLRw"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <E17HVTU-00062d-00@pooh.kjernsmo.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Kjetil Kjernsmo <kjetil@kjernsmo.net>
Cc: netfilter@lists.samba.org


--=-6T5k35HvvsE/pxr5BLRw
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

man, 2002-06-10 kl. 22:07 skrev Kjetil Kjernsmo:

> I hope someone can take my paw and help me through the iptables setup,=20
> because I'm a bit scared of the possibility of locking myself out of my=20
> box...=20

Den som intet v=E5ger, intet vinner :c)

Do it.=20

1: Make sure that you have a cron/at job running that kills and restarts
your firewall scripts at intervals known to you. If you only have a
minimum of services, they are patched up to the last version and all is
more or less safe, then a ten-minute gap now and then can't hurt until
your routine is established;

2: If you're using ssh (which you are) to get to the machine, and since
no-one can see what you're doing, cut out ftp and use scp - which also
goes to port 22 and is *much* safer and better;

3: In your firewall script, build in a rule that only lets in your IP
number - or, even better, if your admin machine uses Ethernet for the
connection, your MAC number.

I've done all this out of Utrecht in Holland to a slave DNS name server
in Dortmund, Germany, including weekly scp backups and goodness knows
what else. I had no possibility of getting to that machine, once it was
placed, and everything worked perfectly for months - never ever went
wrong.

Just leave yourself a back door, if you need it, until you've gained the
confidence you need.

Best,

Tonni

Sogning

--=20

Tony Earnshaw

e-post:		tonni@billy.demon.nl
www:		http://www.billy.demon.nl
gpg public key:	http://www.billy.demon.nl/tonni.armor

Telefoon:	(+31) (0)172 530428
Mobiel:		(+31) (0)6 51153356

GPG Fingerprint =3D 3924 6BF8 A755 DE1A 4AD6 FA2B F7D7 6051 3BE7 B981
3BE7B981



--=-6T5k35HvvsE/pxr5BLRw
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9BcVr99dgUTvnuYERAg3yAJoDHErDaBFi3fSwTBxvUQMnJPZ3ZQCbBuvb
zSC/ZJKJwDhVRG6Txc4QS08=
=3hat
-----END PGP SIGNATURE-----

--=-6T5k35HvvsE/pxr5BLRw--


