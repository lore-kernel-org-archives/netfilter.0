From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: Routing SMTP problem
Date: 14 Jun 2002 10:06:17 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1024041977.1777.14.camel@billy.demon.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-spHZ9yoiLZMD5HYCU2pk"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Ian Pollock <ianp@highsun.com.au>
Cc: netfilter@lists.samba.org


--=-spHZ9yoiLZMD5HYCU2pk
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

fre, 2002-06-14 kl. 05:19 skrev Ian Pollock:

> Can anyone tell me if this is possible, we upgraded our internet access
>  from isdn (small isp) to broadband (telstra). We had a static ip of
> eg:210.20.20.20 from our small isp on the isdn, with the new cable
> connection we get dhcp ip address which makes it hard for mail
> routing. Ok the big question can I alias the old static ip (small isp)
> we own of 210.20.20.20 to my external etho dhcp (from telstra) device
> (ip of 211.50.50.50) on my cable connection and route my mail through
> this way.

I don't think so. Not if your ISDN setup worked normally. Your ISP
(ECN?) would route to, say 203.22.70.236, back over a dial-in ppp router
and would have to be willing to route to that address over an Internet
router. If he's very amenable, and you kept on paying him, then you
could ask him. If you don't arrange this with him, there's no way you
could do this. As soon as you stop paying him, he'll take his IP number
back.

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



--=-spHZ9yoiLZMD5HYCU2pk
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9CaP599dgUTvnuYERAgLJAJ9xIz/pfEDdwTbK0etg2QMXZ2USSQCcCCLR
u3+TKHQ7+JYa45EGpo3/R0c=
=Ee72
-----END PGP SIGNATURE-----

--=-spHZ9yoiLZMD5HYCU2pk--


