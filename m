From: Radu Anghel <eu@celuloza.ro>
Subject: -m owner & -j MARK problem
Date: Fri, 09 Jan 2004 16:14:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073657669.1103.1.camel@bubursuc.celuloza.ro>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-vWIlMqPIfYLrIQogUi+g"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--=-vWIlMqPIfYLrIQogUi+g
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

what's wrong with the following command?

[root:pts/5][~]# iptables -t mangle -A PREROUTING -i eth0 -m owner
--gid-owner 101 -j MARK --set-mark 101
iptables: Invalid argument

[root:pts/5][~]# uname -r
2.6.1
[root:pts/5][~]# iptables -V
iptables v1.2.9


--=-vWIlMqPIfYLrIQogUi+g
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQA//rdFzEN+vLL1CukRAlunAJsEnQmoytgrwKFvRcfJlExmap3KPQCfdauI
qAcHNdDb0KuidRFDNLyxxo4=
=kG2n
-----END PGP SIGNATURE-----

--=-vWIlMqPIfYLrIQogUi+g--


