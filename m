From: Sebastian Classen <sebastian.classen@freenet.ag>
Subject: Re: TEE target
Date: Thu, 15 Nov 2007 12:04:30 +0100
Message-ID: <1195124670.17107.10.camel@basti79.freenet-ag.de>
References: <000401c82770$f90872c0$0b0ffe0a@NS006819>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-Y8vCp5r/rHW5CwLhXTc2"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000401c82770$f90872c0$0b0ffe0a@NS006819>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@vger.kernel.org, Jan Engelhardt <jengelh@computergmbh.de>


--=-Y8vCp5r/rHW5CwLhXTc2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 15.11.2007, 11:19 +0100 schrieb Rob Sterenborg:
> Hi,
>=20
> Searching around I found mention of a TEE target.
> (http://www.gossamer-threads.com/lists/iptables/devel/68781)
>=20
> Does anyone know if there's a complete set of files (if yes: where) I
> can test with?
>=20
>=20
> Thanks,
> Rob

Hi,

We are now using the TEE-Target in production environment for a few
weeks now and it seems to work well.

@Jan: Find attached a patch with some little final bug fixes. Now it
compiles with current stable 2.6.23.1 kernel. Please add this to your
SVN.

@Rob: I guess the best idea is to fetch it from
http://dev.computergmbh.de/wsvn/misc_kernel/xt_TEE/ but after Jan adds
the patches ;)

Any change of getting with into pom-ng?

Greets
  Sebastian.

--=20
Mit freundlichen Gr=FC=DFen / Yours sincerely

Sebastian Cla=DFen
Postmaster
----------------------------------------------------------------------
Telefon: + 49 (0) 211 53087 522
Telefax: + 49 (0) 211 5381573
E-Mail:  sebastian.classen@freenet.ag
Website: www.freenet.de; www.mobilcom.de
----------------------------------------------------------------------
freenet AG
Willst=E4tterstr. 13
40549 D=FCsseldorf
----------------------------------------------------------------------
Vorsitzender des Aufsichtsrates: Prof. Dr. Helmut Thoma
Vorstand: Eckhard Spoerr (Vors.), Axel Krieger, Stephan Esch, Eric Berger
Sitz: B=FCdelsdorf
Amtsgericht Kiel HRB 7306 KI

--=-Y8vCp5r/rHW5CwLhXTc2
Content-Disposition: attachment; filename=xt_TEE.diff
Content-Type: text/x-patch; name=xt_TEE.diff; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

diff -pruN xt_TEE.orig/iptables/libxt_TEE.c xt_TEE/iptables/libxt_TEE.c
--- xt_TEE.orig/iptables/libxt_TEE.c	2007-10-05 13:23:03.000000000 +0200
+++ xt_TEE/iptables/libxt_TEE.c	2007-10-09 15:33:49.000000000 +0200
@@ -38,7 +38,7 @@ static const struct option libxt_TEE_opt
 };
 
 /* Initialize the target. */
-static void libxt_TEE_init(struct xt_entry_target *t, unsigned int *nfcache)
+static void libxt_TEE_init(struct xt_entry_target *t)
 {
 	struct xt_TEE_info *info = (void *)t->data;
 	info->gw = 0;
@@ -71,7 +71,7 @@ static int libxt_TEE_parse(int c, char *
 
 static void libxt_TEE_check(unsigned int flags)
 {
-	if (flags & XT_TEE_OPT_GW)
+	if (!(flags & XT_TEE_OPT_GW))
 		exit_error(PARAMETER_PROBLEM, "TEE target: gw option required");
 }
 
@@ -100,6 +100,7 @@ static void libxt_TEE_save(const void *i
 }
 
 static struct xtables_target libxt_TEE_reg = {
+	.family        = AF_INET,
 	.name          = "TEE",
 	.version       = IPTABLES_VERSION,
 	.size          = XT_ALIGN(sizeof(struct xt_TEE_info)),
diff -pruN xt_TEE.orig/iptables/.TEE-testx xt_TEE/iptables/.TEE-testx
--- xt_TEE.orig/iptables/.TEE-testx	2007-10-05 13:23:03.000000000 +0200
+++ xt_TEE/iptables/.TEE-testx	2007-10-05 14:37:10.000000000 +0200
@@ -1,2 +1,2 @@
 #!/bin/sh
-[ -f "$KERNEL_DIR/net/netfilter/xt_TEE.h" ] && echo TEE
+[ -f "$KERNEL_DIR/net/netfilter/xt_TEE.c" ] && echo TEE
diff -pruN xt_TEE.orig/kernel/Makefile.ladd xt_TEE/kernel/Makefile.ladd
--- xt_TEE.orig/kernel/Makefile.ladd	2007-10-05 13:23:03.000000000 +0200
+++ xt_TEE/kernel/Makefile.ladd	2007-10-08 15:56:21.000000000 +0200
@@ -1 +1,2 @@
+# targets
 obj-$(CONFIG_NETFILTER_XT_TARGET_TEE) += xt_TEE.o
diff -pruN xt_TEE.orig/kernel/xt_TEE.c xt_TEE/kernel/xt_TEE.c
--- xt_TEE.orig/kernel/xt_TEE.c	2007-10-05 13:23:03.000000000 +0200
+++ xt_TEE/kernel/xt_TEE.c	2007-10-09 13:53:28.000000000 +0200
@@ -16,7 +16,7 @@
 #include <net/icmp.h>
 #include <net/ip.h>
 #include <net/route.h>
-#ifdef CONFIG_NETFILTER_XTABLES_TARGET_TEE
+#ifdef CONFIG_NETFILTER_XT_TARGET_TEE
 #	include <linux/netfilter/xt_TEE.h>
 #else
 #	include "xt_TEE.h"

--=-Y8vCp5r/rHW5CwLhXTc2--

