From: Mark Vevers <mark@vevers.net>
Subject: Re: problem with ip_connlimit modul
Date: Mon, 23 Feb 2004 16:57:28 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402231657.29970.mark@vevers.net>
References: <32094483.1077552403980.JavaMail.ngmail@webmail02.arcor-online.net>
Reply-To: mark@vevers.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <32094483.1077552403980.JavaMail.ngmail@webmail02.arcor-online.net>
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
To: cky@arcor.de, netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Monday 23 Feb 2004 4:06 pm, cky@arcor.de wrote:
> I try to compile the new 2.4.25 kernel with patch-o-matic-20031219 and I'=
ve
> a little problem.
>
> All iptables works fine, but just the ipt_connlimit module makes trouble,
> when I try to compile it.

Check the latest CVS for the connlimit module ....  ip_conntrack_module
is no longer used and the lines using it are deleted ... I think this is
related to refcount fixing mentioned in the 2.4.25 change log.

The following patch if applied as patch -lp0 < connlimit.patch in
<KERNEL_DIR>/net/ipv4/netfilter will do just that ....=20
(save the text between the lines as connlimit.patch)

cheers
Mark
=2D -----------------------------------------------------------------------=
=2D-----------------------
=2D --- ipt_connlimit.c     2004-02-23 12:12:55.000000000 +0000
+++ ipt_connlimit.c     2004-02-23 12:13:49.000000000 +0000
@@ -216,7 +216,4 @@
 static int __init init(void)
 {
=2D -	/* NULL if ip_conntrack not a module */
=2D -	if (ip_conntrack_module)
=2D -		__MOD_INC_USE_COUNT(ip_conntrack_module);
	return ipt_register_match(&connlimit_match);
 }
@@ -225,6 +222,4 @@
 {
	ipt_unregister_match(&connlimit_match);
=2D -	if (ip_conntrack_module)
=2D -		__MOD_DEC_USE_COUNT(ip_conntrack_module);
 }

=2D -----------------------------------------------------------------------=
=2D------------------------
=2D --=20
Mark Vevers.    mark@ifl.net / mark@vevers.net
Principal Internet Engineer, Internet for Learning,
Research Machines Plc. (AS5503)
=2D --
GPG Key: http://pgp.mit.edu:11371/pks/lookup?op=3Dget&search=3D0xB08F3CA3
=46ingerprint: 85BA 30C4 9EC8 1792 4C8C   C31E 58B5 3D1C B08F 3CA3
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAOjD4WLU9HLCPPKMRAlbeAKCKVikbwOt/UzqKzXHCbg8//uHT4gCfWI4n
1EHcVx12skVBs1ewm7DeRok=3D
=3DExXE
=2D----END PGP SIGNATURE-----


