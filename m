From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: RE: Strange misunderstandings
Date: 01 Jun 2002 00:52:26 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1022885546.9726.25.camel@billy.demon.nl>
References: <001c01c208e8$68205720$6301a8c0@JJONES1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-b1ExctY33oGJ4zO+dsOG"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <001c01c208e8$68205720$6301a8c0@JJONES1>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: jjones@merlintechnologies.com
Cc: 'Iptables' <netfilter@lists.samba.org>


--=-b1ExctY33oGJ4zO+dsOG
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

fre, 2002-05-31 kl. 23:16 skrev John Jones:

> [gemini:~] iptables -C
> iptables v1.2.6a: Unknown arg `-C'
> Try `iptables -h' or 'iptables --help' for more information.

I don't know whether you noticed, but you finally got your answer from
Sascha. The funny thing is, is that all the answers were time-shuffeled,
like a pack of cards. Sascha is using a dial-in WinXP mail client to a
webmail Sendmail server, and is based in Germany. John's (your) mail
server is Sendmail and is based in North America. Adam's is a Postfix
server in the U.K.

The shuffeling has no doubt to do with a preference for European Union
vis a vis British origins by Samba.org, and quite right too. Maybe the
position of the sun at the time had something to do with it, as well. Or
Gemini in ascendence.

Had you done "man iptables", you'd never have had to ask the question,
but Sascha's analysis was witty and droll, so worth waiting for,
perhaps.

No-one gave you the answer to your second question. The latter is, that
you've established a path to the internal name server with PREROUTING
and DNAT, but none back again. So no packets get returned. Do that with
POSTROUTING and SNAT. Also, you haven't specified any interfaces, but
try that later if things don't work.

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



--=-b1ExctY33oGJ4zO+dsOG
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA89/6q99dgUTvnuYERAusbAJwJr9/cayqhPQC/8Ld/EZ6AQgkaWACbBYyY
vQAYm5wsGqowvy0GnJo7qzo=
=+TpH
-----END PGP SIGNATURE-----

--=-b1ExctY33oGJ4zO+dsOG--


