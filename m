From: Sven Schuster <schuster.sven@gmx.de>
Subject: TTL target working with 2.6 kernel??
Date: Mon, 12 Jan 2004 21:57:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040112205754.GA6251@zion.homelinux.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hello list members,

has anybody been using the TTL target from the new patch-o-matic-ng
with kernel 2.6(.1) yet? I have patched my 2.6.1 kernel with this
target, recompiled iptables (1.2.9) and wanted to insert a rule
using the TTL target into mangle-table's FORWARD chain:

iptables -t mangle -A FORWARD -j TTL --ttl-inc 1

All I'm getting is a Segmentation fault. The ipt_TTL module can be
loaded into kernel, and everytime I try to add this rule (or try
to add this rule to the OUTPUT chain in mangle table) the used-
count shown by lsmod increments by 1.

But when I try

iptables -t mangle -nL FORWARD

I just get the following output:

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

So, the rule doesn't seem to be taken...although the module use
count increments.

Any idea? Maybe the TTL target isn't yet really ready for 2.6?
Maybe I should try at the developer's mailing list??=20
Any tips welcome!!

Sven

--=20
Linux zion 2.6.1 #2 Mon Jan 12 14:25:44 CET 2004 i686 athlon i386 GNU/Linux
 21:49:15  up  3:20,  4 users,  load average: 0.21, 0.18, 0.09

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAAwpSo4FAdB2PneQRAp6+AJ9zeEhzEpM0o0Wndh9luJYa9xusBQCfWdeD
SlXTrUeTJqGzxzcrQ8JKOXw=
=jmtG
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--

