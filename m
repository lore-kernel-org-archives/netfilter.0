From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: Re: [ANNOUNCE] ipset 7.8 released
Date: Mon, 7 Dec 2020 15:54:42 +0100 (CET)
Message-ID: <alpine.DEB.2.23.453.2012071419590.30865@blackhole.kfki.hu>
References: <alpine.DEB.2.23.453.2011192141150.19567@blackhole.kfki.hu> <c4778467-3abe-b40f-c4f7-945576fa097f@wildgooses.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="110363376-800897950-1607347615=:30865"
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <c4778467-3abe-b40f-c4f7-945576fa097f@wildgooses.com>
Content-ID: <alpine.DEB.2.23.453.2012071553000.30865@blackhole.kfki.hu>
List-ID: <netfilter.vger.kernel.org>
To: Ed W <lists@wildgooses.com>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110363376-800897950-1607347615=:30865
Content-Type: text/plain; charset=UTF-8
Content-ID: <alpine.DEB.2.23.453.2012071553001.30865@blackhole.kfki.hu>
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 4 Dec 2020, Ed W wrote:

> Hi, I'm having some difficulty compiling ipset 7.9 in kernel 4.14.78 as=
=20
> provided by Variscite for an arm board
> =20
> I've trimmed the build log and errors, but it seems to revolve around:
>=20
> Pre kernel 4.18 the header
>=20
> =C2=A0=C2=A0=C2=A0 ./include/linux/ipc.h
>=20
> would include
>=20
> =C2=A0=C2=A0=C2=A0 ./include/linux/rhashtable.h
>=20
> (later it includes rhashtable-types.h)
>=20
> This in turn draws in the jhash.c copy, which in turn includes=20
> ip_set_compat.h, which then causes some errors due to drawing in things=
=20
> where we haven't yet finished reading all the header files
>=20
> I'm not sure how to work around the compile fail in ipset-7.9? I agree =
I=20
> can't rule it out to be a problem due to the vendor kernel, but the=20
> include tree seems to point clearly to the issue above in ipc.h=20
>=20
>=20
> Note: ipset7.7 gives me errors about =C2=A0=C2=A0=C2=A0
>=20
> =C2=A0=C2=A0=C2=A0 error: 'fallthrough' undeclared
>=20
> Which seems fair enough given the age of my kernel. I could probably fi=
x this

That is fixed in 7.9.

> ipset 7.6 compiles ok for me.
> =20
> Any guidance please?

Please give a try to the next patch on top of ipset 7.9: it separates the=
=20
compiler compatibility stuff from the kernel compatibility part and that=20
helps to resolve the include file issue.

diff --git a/.gitignore b/.gitignore
index 46a78dd..0e8a087 100644
--- a/.gitignore
+++ b/.gitignore
@@ -20,6 +20,7 @@ Makefile.in
 Module.symvers
 modules.order
 kernel/include/linux/netfilter/ipset/ip_set_compat.h
+kernel/include/linux/netfilter/ipset/ip_set_compiler.h
=20
 /aclocal.m4
 /autom4te.cache/
diff --git a/configure.ac b/configure.ac
index 1086de3..2f06590 100644
--- a/configure.ac
+++ b/configure.ac
@@ -851,7 +851,8 @@ dnl Checks for library functions.
 dnl Generate output
 AC_CONFIG_FILES([Makefile include/libipset/Makefile
 	lib/Makefile lib/libipset.pc src/Makefile utils/Makefile
-	kernel/include/linux/netfilter/ipset/ip_set_compat.h])
+	kernel/include/linux/netfilter/ipset/ip_set_compat.h
+	kernel/include/linux/netfilter/ipset/ip_set_compiler.h])
 AC_OUTPUT
=20
 dnl Summary
diff --git a/kernel/include/linux/jhash.h b/kernel/include/linux/jhash.h
index 8df77ec..d144e33 100644
--- a/kernel/include/linux/jhash.h
+++ b/kernel/include/linux/jhash.h
@@ -1,6 +1,6 @@
 #ifndef _LINUX_JHASH_H
 #define _LINUX_JHASH_H
-#include <linux/netfilter/ipset/ip_set_compat.h>
+#include <linux/netfilter/ipset/ip_set_compiler.h>
=20
 /* jhash.h: Jenkins hash support.
  *
diff --git a/kernel/include/linux/netfilter/ipset/ip_set_compat.h.in b/ke=
rnel/include/linux/netfilter/ipset/ip_set_compat.h.in
index 8f00e6a..bf99bc0 100644
--- a/kernel/include/linux/netfilter/ipset/ip_set_compat.h.in
+++ b/kernel/include/linux/netfilter/ipset/ip_set_compat.h.in
@@ -519,18 +519,5 @@ static inline void *kvzalloc(size_t size, gfp_t flag=
s)
 	return members;
 }
 #endif
-
-/* Compiler attributes */
-#ifndef __has_attribute
-# define __has_attribute(x) __GCC4_has_attribute_##x
-# define __GCC4_has_attribute___fallthrough__		0
-#endif
-
-#if __has_attribute(__fallthrough__)
-# define fallthrough			__attribute__((__fallthrough__))
-#else
-# define fallthrough			do {} while (0)  /* fallthrough */
-#endif
-
 #endif /* IP_SET_COMPAT_HEADERS */
 #endif /* __IP_SET_COMPAT_H */
diff --git a/kernel/include/linux/netfilter/ipset/ip_set_compiler.h.in b/=
kernel/include/linux/netfilter/ipset/ip_set_compiler.h.in
new file mode 100644
index 0000000..1b392f8
--- /dev/null
+++ b/kernel/include/linux/netfilter/ipset/ip_set_compiler.h.in
@@ -0,0 +1,15 @@
+#ifndef __IP_SET_COMPILER_H
+#define __IP_SET_COMPILER_H
+
+/* Compiler attributes */
+#ifndef __has_attribute
+# define __has_attribute(x) __GCC4_has_attribute_##x
+# define __GCC4_has_attribute___fallthrough__		0
+#endif
+
+#if __has_attribute(__fallthrough__)
+# define fallthrough			__attribute__((__fallthrough__))
+#else
+# define fallthrough			do {} while (0)  /* fallthrough */
+#endif
+#endif /* __IP_SET_COMPILER_H */
diff --git a/kernel/net/netfilter/ipset/ip_set_core.c b/kernel/net/netfil=
ter/ipset/ip_set_core.c
index dcbc400..85961fc 100644
--- a/kernel/net/netfilter/ipset/ip_set_core.c
+++ b/kernel/net/netfilter/ipset/ip_set_core.c
@@ -21,6 +21,7 @@
 #include <linux/netfilter/x_tables.h>
 #include <linux/netfilter/nfnetlink.h>
 #include <linux/netfilter/ipset/ip_set.h>
+#include <linux/netfilter/ipset/ip_set_compiler.h>
=20
 static LIST_HEAD(ip_set_type_list);		/* all registered set types */
 static DEFINE_MUTEX(ip_set_type_mutex);		/* protects ip_set_type_list */

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
--110363376-800897950-1607347615=:30865--
