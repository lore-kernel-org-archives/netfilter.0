From: cirrus <cirrus@the-penguin.org.uk>
Subject: iptables -m owner target problem kernel 2.4.20
Date: Wed, 2 Apr 2003 00:14:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304020014.32757.cirrus@the-penguin.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Description: clearsigned data
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello there
I've just upgraded my main server to 2.4.20 using iptables v1.2.6a
With 2.4.19 I used to be able to do a:
iptables -t nat -I POSTROUTING -m owner --uid-owner 501 -o ppp0 -j SNAT=20
=2D --to-source xxx.xxx.xxx.xxx.xxx
just fine.
With the 2.4.20 I get:
iptables: Target problem

There is another post related with this problem but no answer can be found:
http://lists.netfilter.org/pipermail/netfilter/2003-January/041198.html
and there is also
http://lists.netfilter.org/pipermail/netfilter/2002-December/040592.html

Anyone know anything about this problem or a way to solve it?(keeping my=20
2.4.20 kernel if possible)

Any help would be appreciated.

Cirrus
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+ih1GokjvoBETKB0RAlMUAKDBPnot+4GNmq4cGzDU/jVNfSc1rACgjXN+
mhGdCBDDZsJkem6aAJNWi5Q=3D
=3Dn1Gk
=2D----END PGP SIGNATURE-----

