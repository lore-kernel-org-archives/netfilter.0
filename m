From: Sven Schuster <schuster.sven@gmx.de>
Subject: 2 NICs on same subnet
Date: Fri, 5 Nov 2004 13:38:43 +0100
Message-ID: <20041105123843.GB11016@zion.homelinux.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi everybody,

I have a problem which I'm quite sure can be resolved easily, but
at the moment I'm lacking the "how" :-)
I have a machine (RH ES 3) with two Intel e1000 cards attached to
a gigabit switch, each interface is assigned an IP address on the
same subnet (say 1.2.3.4 on eth0 and 1.2.3.5 on eth1).
What's happening is that if a connection to either of these addresses
is made, it's always received via the same interface (eth1 most of the
time), and the replies go out via this interface, too. But what I'd
like is that packets to 1.2.3.4 come in via eth0 and packets to 1.2.3.5
come in via eth1 and that replies from 1.2.3.4 leave via eth0, from
1.2.3.5 via eth1.
I've already tried to resolve this issue with arptables, doing

arptables -N eth0
arptables -A eth0 -d 1.2.3.4 -j ACCEPT
arptables -A eth0 -j DROP
arptables -N eth1
arptables -A eth1 -d 1.2.3.5 -j ACCEPT
arptables -A eth1 -j DROP
arptables -A IN -i eth0 -j eth0
arptables -A IN -i eth1 -j eth1

and additionally limiting traffic in the same way by iptables, but
that doesn't work unfortunately.
Has anybody done this?? Is a solution to this problem known??


Thanks in advance!!

Sven

--=20
Linux zion 2.6.9-rc1-mm4 #1 Tue Sep 7 12:57:19 CEST 2004 i686 athlon i386 G=
NU/Linux
 13:30:13 up 1 day, 16:58,  1 user,  load average: 0.08, 0.02, 0.01

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFBi3RTo4FAdB2PneQRAhK3AJ0cDNvP4YIVf8wk9GXOo+nKiIYdrgCfbPce
CpG9xerja1Mj5Nisn2/PmPc=
=ANGg
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--

