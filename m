From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.16.1 released
Date: Wed, 9 Jan 2013 23:44:09 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1301092342440.10144@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1211271510180.15929@blackhole.kfki.hu> <20130109134804.GL31644@workstation>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130109134804.GL31644@workstation>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Herz <andi@geekosphere.org>
Cc: netfilter@vger.kernel.org

Hi Andreas,

On Wed, 9 Jan 2013, Andreas Herz wrote:

> On 27/11/12 at 15:16, Jozsef Kadlecsik wrote:
> > I'm happy to announce ipset 6.16.1. The most important part is the patch 
> > from Florian Westphal, which fixes netiface set name overflow in the 
> > kernel. The RCU handling of the automating increase of the maximal sets 
> > feature introduced in 6.15 is also fixed.
> 
> It works fine on new machines, but i got this compiler error with some
> older system:
> 
> In file included from
> /usr/src/redhat/BUILD/ipset-6.16.1/kernel/net/netfilter/ipset/ip_set_hash_ip.c:115:
> 
> /usr/src/redhat/BUILD/ipset-6.16.1/kernel/include/linux/netfilter/ipset/ip_set_ahash.h:
> In function `hash_ip4_add':
> 
> /usr/src/redhat/BUILD/ipset-6.16.1/kernel/include/linux/netfilter/ipset/ip_set_ahash.h:448:
> sorry, unimplemented: inlining failed in call to 'hash_ip4_data_next':
> function body not available
> 
> /usr/src/redhat/BUILD/ipset-6.16.1/kernel/include/linux/netfilter/ipset/ip_set_ahash.h:489:
> sorry, unimplemented: called from here
> 
> make[3]: ***
> [/usr/src/redhat/BUILD/ipset-6.16.1/kernel/net/netfilter/ipset/ip_set_hash_ip.o]
> Error 1
> 
> gcc version 3.4.5 20051201 (Red Hat 3.4.5-2)
> 
> Yes it's old and i know gcc update may fix this. But still, is there
> another way to fix it? removing the "inline" in front of
> type_pf_data_next resolves it somehow as it's compiling through and
> seems to work just fine. It "just" results in this warning:
> 
> /usr/src/redhat/BUILD/ipset-6.16.1/kernel/include/linux/netfilter/ipset/ip_set_ahash.h:448:
> warning: 'hash_ip4_data_next' declared inline after being called
> 
> /usr/src/redhat/BUILD/ipset-6.16.1/kernel/include/linux/netfilter/ipset/ip_set_ahash.h:448:
> warning: previous declaration of 'hash_ip4_data_next' was here

Does the next patch solve the compilation issue with your old gcc version?

diff --git a/Makefile.am b/Makefile.am
index 9e2d59b..a912b38 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -15,13 +15,19 @@ else
 IP_SET_MAX=$(MAXSETS)
 endif
 
+if INLINE_IN_PROTOTYPE
+INLINE=inline
+else
+INLINE=
+endif
+
 SUBDIRS		= include/libipset lib src
 
 modules_sparse:
 if WITH_KMOD
 	${MAKE} -C $(KBUILD_OUTPUT) M=$$PWD/kernel/net/netfilter \
 			V=$V C=2 CF=-D__CHECK_ENDIAN__ \
-			KCFLAGS="-DPACKAGE_VERSION=$(PACKAGE_VERSION)" \
+			KCFLAGS="-DPACKAGE_VERSION=$(PACKAGE_VERSION)-DINLINE=$(INLINE)" \
 			IP_SET_MAX=$(IP_SET_MAX) KDIR=$$PWD/kernel modules
 else
 	@echo Skipping kernel modules due to --with-kmod=no
@@ -30,7 +36,7 @@ endif
 modules:
 if WITH_KMOD
 	${MAKE} -C $(KBUILD_OUTPUT) M=$$PWD/kernel/net/netfilter V=$V \
-			KCFLAGS="-DPACKAGE_VERSION=$(PACKAGE_VERSION)" \
+			KCFLAGS="-DPACKAGE_VERSION=$(PACKAGE_VERSION) -DINLINE=$(INLINE)" \
 			IP_SET_MAX=$(IP_SET_MAX) KDIR=$$PWD/kernel modules
 else
 	@echo Skipping kernel modules due to --with-kmod=no
diff --git a/configure.ac b/configure.ac
index 4c9fcad..60443c1 100644
--- a/configure.ac
+++ b/configure.ac
@@ -206,6 +206,26 @@ AX_CFLAGS_GCC_OPTION(-Wunused)
 AX_CFLAGS_GCC_OPTION(-Wvla)
 AX_CFLAGS_GCC_OPTION(-Wwrite-strings)
 fi
+
+AC_MSG_CHECKING([whether compiler supports inline in prototype])
+	AC_TRY_RUN([ /* inline check */
+static inline int foo(void);
+static inline int foo(void) { return 1; }
+main() {
+	int a = foo();
+	exit(0);
+}
+],
+[ AC_MSG_RESULT(yes)
+  AC_DEFINE(INLINE_IN_PROTOTYPE, [1], [Inline in prototype supported.])
+  inline_in_prototype=yes],
+[ AC_MSG_RESULT(no)
+  inline_in_prototype=no],
+[ AC_MSG_RESULT(not when cross-compiling)
+  inline_in_prototype=no]
+)
+AM_CONDITIONAL(INLINE_IN_PROTOTYPE, test "$inline_in_prototype" == "yes")
+
 dnl Checks for library functions.
 
 dnl Generate output
diff --git a/kernel/include/linux/netfilter/ipset/ip_set_ahash.h b/kernel/include/linux/netfilter/ipset/ip_set_ahash.h
index df6eb04..3696a87 100644
--- a/kernel/include/linux/netfilter/ipset/ip_set_ahash.h
+++ b/kernel/include/linux/netfilter/ipset/ip_set_ahash.h
@@ -440,7 +440,7 @@ retry:
 	return 0;
 }
 
-static inline void
+static INLINE void
 type_pf_data_next(struct ip_set_hash *h, const struct type_pf_elem *d);
 
 /* Add an element to a hash and update the internal counters when succeeded,
diff --git a/kernel/net/netfilter/ipset/ip_set_hash_ip.c b/kernel/net/netfilter/ipset/ip_set_hash_ip.c
index 5c0b785..df595e7 100644
--- a/kernel/net/netfilter/ipset/ip_set_hash_ip.c
+++ b/kernel/net/netfilter/ipset/ip_set_hash_ip.c
@@ -114,7 +114,7 @@ nla_put_failure:
 #define HOST_MASK	32
 #include <linux/netfilter/ipset/ip_set_ahash.h>
 
-static inline void
+static INLINE void
 hash_ip4_data_next(struct ip_set_hash *h, const struct hash_ip4_elem *d)
 {
 	h->next.ip = d->ip;
@@ -298,7 +298,7 @@ nla_put_failure:
 #define HOST_MASK	128
 #include <linux/netfilter/ipset/ip_set_ahash.h>
 
-static inline void
+static INLINE void
 hash_ip6_data_next(struct ip_set_hash *h, const struct hash_ip6_elem *d)
 {
 }
diff --git a/kernel/net/netfilter/ipset/ip_set_hash_ipport.c b/kernel/net/netfilter/ipset/ip_set_hash_ipport.c
index 6283351..e8b9eaf 100644
--- a/kernel/net/netfilter/ipset/ip_set_hash_ipport.c
+++ b/kernel/net/netfilter/ipset/ip_set_hash_ipport.c
@@ -129,7 +129,7 @@ nla_put_failure:
 #define HOST_MASK	32
 #include <linux/netfilter/ipset/ip_set_ahash.h>
 
-static inline void
+static INLINE void
 hash_ipport4_data_next(struct ip_set_hash *h,
 		       const struct hash_ipport4_elem *d)
 {
@@ -348,7 +348,7 @@ nla_put_failure:
 #define HOST_MASK	128
 #include <linux/netfilter/ipset/ip_set_ahash.h>
 
-static inline void
+static INLINE void
 hash_ipport6_data_next(struct ip_set_hash *h,
 		       const struct hash_ipport6_elem *d)
 {
diff --git a/kernel/net/netfilter/ipset/ip_set_hash_ipportip.c b/kernel/net/netfilter/ipset/ip_set_hash_ipportip.c
index 6a21271..7ceb813 100644
--- a/kernel/net/netfilter/ipset/ip_set_hash_ipportip.c
+++ b/kernel/net/netfilter/ipset/ip_set_hash_ipportip.c
@@ -132,7 +132,7 @@ nla_put_failure:
 #define HOST_MASK	32
 #include <linux/netfilter/ipset/ip_set_ahash.h>
 
-static inline void
+static INLINE void
 hash_ipportip4_data_next(struct ip_set_hash *h,
 			 const struct hash_ipportip4_elem *d)
 {
@@ -361,7 +361,7 @@ nla_put_failure:
 #define HOST_MASK	128
 #include <linux/netfilter/ipset/ip_set_ahash.h>
 
-static inline void
+static INLINE void
 hash_ipportip6_data_next(struct ip_set_hash *h,
 			 const struct hash_ipportip6_elem *d)
 {
diff --git a/kernel/net/netfilter/ipset/ip_set_hash_ipportnet.c b/kernel/net/netfilter/ipset/ip_set_hash_ipportnet.c
index 2d5cd4e..8473a01 100644
--- a/kernel/net/netfilter/ipset/ip_set_hash_ipportnet.c
+++ b/kernel/net/netfilter/ipset/ip_set_hash_ipportnet.c
@@ -174,7 +174,7 @@ nla_put_failure:
 #define HOST_MASK	32
 #include <linux/netfilter/ipset/ip_set_ahash.h>
 
-static inline void
+static INLINE void
 hash_ipportnet4_data_next(struct ip_set_hash *h,
 			  const struct hash_ipportnet4_elem *d)
 {
@@ -493,7 +493,7 @@ nla_put_failure:
 #define HOST_MASK	128
 #include <linux/netfilter/ipset/ip_set_ahash.h>
 
-static inline void
+static INLINE void
 hash_ipportnet6_data_next(struct ip_set_hash *h,
 			  const struct hash_ipportnet6_elem *d)
 {
diff --git a/kernel/net/netfilter/ipset/ip_set_hash_net.c b/kernel/net/netfilter/ipset/ip_set_hash_net.c
index 29e94b9..309e7a0 100644
--- a/kernel/net/netfilter/ipset/ip_set_hash_net.c
+++ b/kernel/net/netfilter/ipset/ip_set_hash_net.c
@@ -152,7 +152,7 @@ nla_put_failure:
 #define HOST_MASK	32
 #include <linux/netfilter/ipset/ip_set_ahash.h>
 
-static inline void
+static INLINE void
 hash_net4_data_next(struct ip_set_hash *h,
 		    const struct hash_net4_elem *d)
 {
@@ -382,7 +382,7 @@ nla_put_failure:
 #define HOST_MASK	128
 #include <linux/netfilter/ipset/ip_set_ahash.h>
 
-static inline void
+static INLINE void
 hash_net6_data_next(struct ip_set_hash *h,
 		    const struct hash_net6_elem *d)
 {
diff --git a/kernel/net/netfilter/ipset/ip_set_hash_netiface.c b/kernel/net/netfilter/ipset/ip_set_hash_netiface.c
index 45a1014..3997f51 100644
--- a/kernel/net/netfilter/ipset/ip_set_hash_netiface.c
+++ b/kernel/net/netfilter/ipset/ip_set_hash_netiface.c
@@ -273,7 +273,7 @@ nla_put_failure:
 #define HOST_MASK	32
 #include <linux/netfilter/ipset/ip_set_ahash.h>
 
-static inline void
+static INLINE void
 hash_netiface4_data_next(struct ip_set_hash *h,
 			 const struct hash_netiface4_elem *d)
 {
@@ -576,7 +576,7 @@ nla_put_failure:
 #define HOST_MASK	128
 #include <linux/netfilter/ipset/ip_set_ahash.h>
 
-static inline void
+static INLINE void
 hash_netiface6_data_next(struct ip_set_hash *h,
 			 const struct hash_netiface6_elem *d)
 {
diff --git a/kernel/net/netfilter/ipset/ip_set_hash_netport.c b/kernel/net/netfilter/ipset/ip_set_hash_netport.c
index 7ef700d..c1ff1de 100644
--- a/kernel/net/netfilter/ipset/ip_set_hash_netport.c
+++ b/kernel/net/netfilter/ipset/ip_set_hash_netport.c
@@ -172,7 +172,7 @@ nla_put_failure:
 #define HOST_MASK	32
 #include <linux/netfilter/ipset/ip_set_ahash.h>
 
-static inline void
+static INLINE void
 hash_netport4_data_next(struct ip_set_hash *h,
 			const struct hash_netport4_elem *d)
 {
@@ -452,7 +452,7 @@ nla_put_failure:
 #define HOST_MASK	128
 #include <linux/netfilter/ipset/ip_set_ahash.h>
 
-static inline void
+static INLINE void
 hash_netport6_data_next(struct ip_set_hash *h,
 			const struct hash_netport6_elem *d)
 {

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
