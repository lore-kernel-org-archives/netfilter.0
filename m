From: florin@iucha.net (Florin Iucha)
Subject: [PATCH] [TRIVIAL] Fix ipt_helper compilation. Was: Linux v2.6.0-test2
Date: Sun, 27 Jul 2003 22:05:06 -0500
Sender: linux-net-owner@vger.kernel.org
Message-ID: <20030728030506.GB7280@iucha.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Return-path: <linux-net-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
To: linux-net@vger.kernel.org, netfilter@lists.netfilter.org


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 27, 2003 at 10:08:40AM -0700, Linus Torvalds wrote:
[snip]
>   o [NETFILTER]: Fix ip_nat_ftp in 2.6.0-test1
>   o [NETFILTER]: Re-sync ipt_REJECT with 2.4.x
>   o [NETFILTER]: Fix a bug in the IRC DCC command parser of
>     ip_conntrack_irc
>   o [NETFILTER]: Fix typo in ipt_MIRROR.c
>   o [NETFILTER]: Make REJECT target compliant with RFC 1812
>   o [NETFILTER]: Fix various problems with MIRROR target
>   o [NETFILTER]: Fix issues with REJECT and MIRROR targets wrt. policy
>     routing
>   o [NETFILTER]: Fix locking of ipt_helper
>   o [NETFILTER]: Drop reference to conntrack after removing confirmed
>     expectation

One of these broke the compilation of net/ipv4/netfilter/ipt_helper.o:
  CC [M]  net/ipv4/netfilter/ipt_helper.o
In file included from net/ipv4/netfilter/ipt_helper.c:13:
include/linux/netfilter_ipv4/ip_conntrack_core.h: In function `ip_conntrack=
_confirm':
include/linux/netfilter_ipv4/ip_conntrack_core.h:46: error: `NF_ACCEPT' und=
eclared (first use in this function)
include/linux/netfilter_ipv4/ip_conntrack_core.h:46: error: (Each undeclare=
d identifier is reported only once
include/linux/netfilter_ipv4/ip_conntrack_core.h:46: error: for each functi=
on it appears in.)

This trivial patch fixes it:

--- net/ipv4/netfilter/ipt_helper.c.orig	2003-07-27 15:19:49.000000000 -0500
+++ net/ipv4/netfilter/ipt_helper.c	2003-07-27 15:07:55.000000000 -0500
@@ -9,6 +9,7 @@
  */
 #include <linux/module.h>
 #include <linux/skbuff.h>
+#include <linux/netfilter.h>
 #include <linux/netfilter_ipv4/ip_conntrack.h>
 #include <linux/netfilter_ipv4/ip_conntrack_core.h>
 #include <linux/netfilter_ipv4/ip_conntrack_helper.h>

florin

--=20

"NT is to UNIX what a doughnut is to a particle accelerator."

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/JJLiNLPgdTuQ3+QRAmrEAJsHhf2TsxkNOB+4zrcpmyY+EGui4QCcDjxc
loSw+KAJ7IpNgOXb7ZkX59U=
=iMmP
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
