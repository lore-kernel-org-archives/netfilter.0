From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: Fw: iptables - if you can find the time, I am stuck
Date: 14 Jun 2002 14:57:51 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1024059471.1625.73.camel@billy.demon.nl>
References: <009a01c21381$97f2dce0$6501a8c0@multisofteducation.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-HIj4/il0i8y+lZTkGyjA"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <009a01c21381$97f2dce0$6501a8c0@multisofteducation.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Oskar Andreasson <blueflux@koffein.net>
Cc: netfilter@lists.samba.org, maltec@tiscali.dk


--=-HIj4/il0i8y+lZTkGyjA
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

fre, 2002-06-14 kl. 10:58 skrev Oskar Andreasson:

> Sorry to say, but I am simply too swamped to even read through this.=20
> CC maltec@tiscali.dk since he is not on the list.

>> I appreciated your iptables tutorial.

Using Oskar's rc.firewall and rulesets as a guide:

From the Internet: INPUT -> tcp_packets -> allowed

Your rules are:

#
# TCP rules
#
$IPTABLES -A tcp_packets -p TCP -s 0/0 -j LOG --log-prefix "IPT
tcp_packets :"
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 25 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 113 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 1810 -j allowed

But you say:

"I wish to allow ports 80, 8888, 8080, ssh, dcc from outside",

So, allow them then. You've already loaded ip_conntrack, so more
shouldn't be necessary.

Further, you say:

"(I wish to allow) almost anything coming IN from 192.168.1.2-10"

You don't allow -m state --state NEW packets out from your LAN (you
allow established etc. packets back in, but you don't allow new
connections out).

Oskar writes:

$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT

I.e., accept new connections out.

This is just to be getting on with.

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



--=-HIj4/il0i8y+lZTkGyjA
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9CehO99dgUTvnuYERAsFiAJ9SpjqheDd/jLmqFBtl0ZpyuUiggQCfXxcZ
Iyixs79yRNGDez0X9PGampo=
=0wBN
-----END PGP SIGNATURE-----

--=-HIj4/il0i8y+lZTkGyjA--


