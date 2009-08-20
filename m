From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: [ANNOUNCEMENT] ipset-3.1
Date: Thu, 20 Aug 2009 11:09:29 +0200
Message-ID: <000b01ca2175$ed66fbc0$c834f340$@info>
References: <alpine.DEB.2.00.0908182049460.3452@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_000C_01CA2186.B0EFCBC0"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0908182049460.3452@blackhole.kfki.hu>
Content-language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: 'Jozsef Kadlecsik' <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org

This is a multi-part message in MIME format.

------=_NextPart_000_000C_01CA2186.B0EFCBC0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

> Hello,
> 
> I'm happy to announce ipset release 3.1. A few minor bugs were
> fixed and some cleanups added:

I'm a few errors when compiling this version on Centos 5.3, kernel
2.6.18-128.4.1.el5.centos.plus-i686.

/usr/local/src/ipset/ipset-3.1/kernel/ip_set_iptree.c: In function
'iptree_create':
/usr/local/src/ipset/ipset-3.1/kernel/ip_set_iptree.c:285: warning:
format '%lu' expects type 'long unsigned int', but argument 2 has type
'unsigned int'
/usr/local/src/ipset/ipset-3.1/kernel/ip_set_iptree.c:285: warning:
format '%zu' expects type 'size_t', but argument 3 has type 'long
unsigned int'

When I switched arguments 2 and 3 for function ip_set_printk(),these
errors are gone.

> - Fix the definition of 'bool' for kernels <= 2.6.18 (Jan
> Engelhardt)

This also generates an error for me.

/usr/local/src/ipset/ipset-3.1/kernel/ip_set_setlist.c:20: error:
redefinition of typedef 'bool'
include/linux/types.h:36: error: previous declaration of 'bool' was here
/usr/local/src/ipset/ipset-3.1/kernel/ip_set_setlist.c:21: error:
redeclaration of enumerator 'false'
include/linux/stddef.h:16: error: previous definition of 'false' was
here
/usr/local/src/ipset/ipset-3.1/kernel/ip_set_setlist.c:21: error:
redeclaration of enumerator 'true'
include/linux/stddef.h:18: error: previous definition of 'true' was here

When I changed <= into < it compiled fine.

I am by no means a C developer, so please correct me if I'm doing the
wrong thing. I just played around and with these small changes I have
ipset compiling cleanly. Don't know if the changes are correct and
didn't test yet if everything works though.

I attached one diff for both files.


Grts,
Rob


------=_NextPart_000_000C_01CA2186.B0EFCBC0
Content-Type: application/octet-stream;
	name="ipset-3.1-centos-53-2.6.18-128.4.1.el5.centos.plus-i686.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="ipset-3.1-centos-53-2.6.18-128.4.1.el5.centos.plus-i686.diff"

diff -ru ipset-3.1/kernel/ip_set_iptree.c =
ipset-3.1-centos-53-2.6.18-128.4.1.el5.centos.plus-i686/kernel/ip_set_ipt=
ree.c
--- ipset-3.1/kernel/ip_set_iptree.c	2009-08-18 19:39:43.000000000 +0200
+++ =
ipset-3.1-centos-53-2.6.18-128.4.1.el5.centos.plus-i686/kernel/ip_set_ipt=
ree.c	2009-08-20 10:29:58.000000000 +0200
@@ -283,8 +283,8 @@
=20
 	if (size !=3D sizeof(struct ip_set_req_iptree_create)) {
 		ip_set_printk("data length wrong (want %lu, have %zu)",
-			      sizeof(struct ip_set_req_iptree_create),
-			      (unsigned long)size);
+			      (unsigned long)size,
+			      sizeof(struct ip_set_req_iptree_create));
 		return -EINVAL;
 	}

diff -ru ipset-3.1/kernel/ip_set_setlist.c =
ipset-3.1-centos-53-2.6.18-128.4.1.el5.centos.plus-i686/kernel/ip_set_set=
list.c
--- ipset-3.1/kernel/ip_set_setlist.c	2009-08-18 19:49:35.000000000 =
+0200
+++ =
ipset-3.1-centos-53-2.6.18-128.4.1.el5.centos.plus-i686/kernel/ip_set_set=
list.c	2009-08-20 10:33:42.000000000 +0200
@@ -16,7 +16,7 @@
 #include <linux/netfilter_ipv4/ip_set_bitmaps.h>
 #include <linux/netfilter_ipv4/ip_set_setlist.h>
=20
-#if LINUX_VERSION_CODE <=3D KERNEL_VERSION(2, 6, 18)
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 6, 18)
 typedef _Bool bool;
 enum { false =3D 0, true =3D 1, };
 #endif

------=_NextPart_000_000C_01CA2186.B0EFCBC0--

