From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: Controlling bandwith rate on port 80
Date: 11 Jun 2002 22:10:03 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023826204.4183.71.camel@billy.demon.nl>
References: <001501c1b33a$7b9238e0$0200a8c0@terr1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-Z8Mih/ys6k4WFmUbrb2f"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <001501c1b33a$7b9238e0$0200a8c0@terr1>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: iptables <iptables@linuxgeek.dk>
Cc: netfilter@lists.samba.org


--=-Z8Mih/ys6k4WFmUbrb2f
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

man, 2002-02-11 kl. 21:27 skrev iptables:
> Im using debian unstable, kernel 2.4.18, iptables 1.2.6a.
>  My max upload bandwith is 30kb, i want to limit the traffic
> on port 80 to around 25kb. Is this possible and how? any HOWTO's on
> this subject?`

Definitely. But not with iptables.

http://www.tldp.org/HOWTO/Adv-Routing-HOWTO.html

You might wish to bookmark this site. It's where many HOWTOs are at.

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



--=-Z8Mih/ys6k4WFmUbrb2f
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9Blkb99dgUTvnuYERAk5CAJ42qhaGSq5VcKwCu2MHxacF1L0qMACfafkZ
zmtO5/mJsF3zkAkvxPMDU4E=
=GfOn
-----END PGP SIGNATURE-----

--=-Z8Mih/ys6k4WFmUbrb2f--


