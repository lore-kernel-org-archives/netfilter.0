From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: PaX killing conntrackd (strange "execution attempt")
Date: Sun, 23 Nov 2008 15:24:41 +0100
Message-ID: <492967A9.90105@netfilter.org>
References: <20081113100309.GH26975@bla.fasel.org>, <491D9AED.12969.1657939B@pageexec.freemail.hu>, <49216734.9080505@netfilter.org> <49255C80.8215.1C8E5CB2@pageexec.freemail.hu>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090103070501000509030808"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49255C80.8215.1C8E5CB2@pageexec.freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: pageexec@freemail.hu
Cc: netfilter@vger.kernel.org, Wolfram Schlich <lists@wolfram.schlich.org>

This is a multi-part message in MIME format.
--------------090103070501000509030808
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

pageexec@freemail.hu wrote:
> On 17 Nov 2008 at 13:44, Pablo Neira Ayuso wrote:
> 
>>> ok, here's the rest of the story:
>>>
>>> (gdb) x/16x $sp
>>> 0x7fffffffb398: 0xf7ba28b5      0x00007fff      0x00000001      0x00000000
>>> (gdb) x/8i 0x00007ffff7ba28b5-3
>>> 0x7ffff7ba28b2 <__build_protoinfo+450>: callq  *(%rdx,%rax,8)
>>> 0x7ffff7ba28b5 <__build_protoinfo+453>: mov    $0x1,%eax
>>> 0x7ffff7ba28ba <__build_protoinfo+458>: mov    %ebp,%ecx
>>> 0x7ffff7ba28bc <__build_protoinfo+460>: shl    %cl,%rax
>>> 0x7ffff7ba28bf <__build_protoinfo+463>: or     %eax,(%r14,%rbx,4)
>>> 0x7ffff7ba28c3 <__build_protoinfo+467>: cmp    $0x37,%r12d
>>> 0x7ffff7ba28c7 <__build_protoinfo+471>: jle    0xfffffffff7ba287f
>>> 0x7ffff7ba28c9 <__build_protoinfo+473>: mov    0x10(%rsp),%rdx
>>> (gdb) i r rdx rax
>>> rdx            0x7ffff7db5000   140737351733248
>>> rax            0x37     55
>>> (gdb) x/8x $rdx+8*$rax
>>> 0x7ffff7db51b8: 0x00000000      0x00000000      0xf7ba9468      0x00007fff
>>> 0x7ffff7db51c8: 0xf7ba94b1      0x00007fff      0xf7ba9505      0x00007fff
>>>
>>> so that's a null function pointer in whatever structure __build_protoinfo dereferences
>>> there. is it of any help to you or do you need me to dig out more?
>> Hm, that code belongs to libnetfilter_conntrack (src/conntrack/build.c). 
>> The annoying thing is that I see no structure with function pointers in 
>> that piece of bits. There are only calls to libnfnetlink functions to 
>> build the netlink message that is sent to kernel-space.
> 
> sorry, gdb used the wrong symbols, i decoded it by hand now and the failing
> code is nfct_copy calling through copy_attr_array[] and it so happens that
> the array has no function defined for index ATTR_HELPER_NAME, the last entry
> in enum nf_conntrack_attr so i guess it was added without the person being
> aware of its uses elsewhere... maybe check your tree for similar issues and
> also add some big fat comment to the enum definition to remind yourselves to
> update other places when adding a new enum there ;)

Thanks for the detailed report and your time. I'm going to push the
following patches to git. One of them is a rudimentary test file for
automated checking of unset function pointers, this should be better
that the big-fat-comment elsewhere :)

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers

--------------090103070501000509030808
Content-Type: text/x-diff;
 name="fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="fix.patch"

helper: fix missing copy function for helper name

From: Pablo Neira Ayuso <pablo@netfilter.org>

This patch fixes a NULL dereference to a function pointer in
nfct_copy() that is triggered when you try to copy the helper
name. This patch also adds an assertion to easily report similar
problems in the future.

Thanks to <pageexec@freemail.hu> for his detailed debugging report.

Reported-by: Wolfram Schlich <lists@wolfram.schlich.org>
Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
---

 src/conntrack/api.c  |    5 +++++
 src/conntrack/copy.c |    7 +++++++
 2 files changed, 12 insertions(+), 0 deletions(-)


diff --git a/src/conntrack/api.c b/src/conntrack/api.c
index a5ddbc2..6dae83f 100644
--- a/src/conntrack/api.c
+++ b/src/conntrack/api.c
@@ -892,6 +892,7 @@ void nfct_copy(struct nf_conntrack *ct1,
 	if (flags == NFCT_CP_ALL) {
 		for (i=0; i<ATTR_MAX; i++) {
 			if (test_bit(i, ct2->set)) {
+				assert(copy_attr_array[i]);
 				copy_attr_array[i](ct1, ct2);
 				set_bit(i, ct1->set);
 			}
@@ -917,6 +918,7 @@ void nfct_copy(struct nf_conntrack *ct1,
 	if (flags & NFCT_CP_ORIG) {
 		for (i=0; i<__CP_ORIG_MAX; i++) {
 			if (test_bit(cp_orig_mask[i], ct2->set)) {
+				assert(copy_attr_array[i]);
 				copy_attr_array[cp_orig_mask[i]](ct1, ct2);
 				set_bit(cp_orig_mask[i], ct1->set);
 			}
@@ -938,6 +940,7 @@ void nfct_copy(struct nf_conntrack *ct1,
 	if (flags & NFCT_CP_REPL) {
 		for (i=0; i<__CP_REPL_MAX; i++) {
 			if (test_bit(cp_repl_mask[i], ct2->set)) {
+				assert(copy_attr_array[i]);
 				copy_attr_array[cp_repl_mask[i]](ct1, ct2);
 				set_bit(cp_repl_mask[i], ct1->set);
 			}
@@ -947,6 +950,7 @@ void nfct_copy(struct nf_conntrack *ct1,
 	if (flags & NFCT_CP_META) {
 		for (i=ATTR_TCP_STATE; i<ATTR_MAX; i++) {
 			if (test_bit(i, ct2->set)) {
+				assert(copy_attr_array[i]),
 				copy_attr_array[i](ct1, ct2);
 				set_bit(i, ct1->set);
 			}
@@ -967,6 +971,7 @@ void nfct_copy_attr(struct nf_conntrack *ct1,
 		    const enum nf_conntrack_attr type)
 {
 	if (test_bit(type, ct2->set)) {
+		assert(copy_attr_array[type]);
 		copy_attr_array[type](ct1, ct2);
 		set_bit(type, ct1->set);
 	}
diff --git a/src/conntrack/copy.c b/src/conntrack/copy.c
index 45633f2..21511f9 100644
--- a/src/conntrack/copy.c
+++ b/src/conntrack/copy.c
@@ -370,6 +370,12 @@ static void copy_attr_repl_off_aft(struct nf_conntrack *dest,
 		orig->tuple[__DIR_REPL].natseq.offset_after;
 }
 
+static void copy_attr_helper_name(struct nf_conntrack *dest,
+				  const struct nf_conntrack *orig)
+{
+	memcpy(dest->helper_name, orig->helper_name, 30);
+}
+
 copy_attr copy_attr_array[ATTR_MAX] = {
 	[ATTR_ORIG_IPV4_SRC]		= copy_attr_orig_ipv4_src,
 	[ATTR_ORIG_IPV4_DST] 		= copy_attr_orig_ipv4_dst,
@@ -426,4 +432,5 @@ copy_attr copy_attr_array[ATTR_MAX] = {
 	[ATTR_SCTP_STATE]		= copy_attr_sctp_state,
 	[ATTR_SCTP_VTAG_ORIG]		= copy_attr_sctp_vtag_orig,
 	[ATTR_SCTP_VTAG_REPL]		= copy_attr_sctp_vtag_repl,
+	[ATTR_HELPER_NAME]		= copy_attr_helper_name,
 };

--------------090103070501000509030808
Content-Type: text/x-diff;
 name="max.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="max.patch"

src: set specific array size for the API

From: Pablo Neira Ayuso <pablo@netfilter.org>

This patch adds the size of the arrays to set to NULL unset
elements. This helps to spot unset functions for new attributes.

Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
---

 src/conntrack/copy.c       |    2 +-
 src/conntrack/filter.c     |    2 +-
 src/conntrack/getter.c     |    2 +-
 src/conntrack/grp_getter.c |    2 +-
 src/conntrack/grp_setter.c |    2 +-
 src/conntrack/objopt.c     |    4 ++--
 src/conntrack/setter.c     |    2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)


diff --git a/src/conntrack/copy.c b/src/conntrack/copy.c
index 92866fb..45633f2 100644
--- a/src/conntrack/copy.c
+++ b/src/conntrack/copy.c
@@ -370,7 +370,7 @@ static void copy_attr_repl_off_aft(struct nf_conntrack *dest,
 		orig->tuple[__DIR_REPL].natseq.offset_after;
 }
 
-copy_attr copy_attr_array[] = {
+copy_attr copy_attr_array[ATTR_MAX] = {
 	[ATTR_ORIG_IPV4_SRC]		= copy_attr_orig_ipv4_src,
 	[ATTR_ORIG_IPV4_DST] 		= copy_attr_orig_ipv4_dst,
 	[ATTR_REPL_IPV4_SRC]		= copy_attr_repl_ipv4_src,
diff --git a/src/conntrack/filter.c b/src/conntrack/filter.c
index 952cbba..7966e54 100644
--- a/src/conntrack/filter.c
+++ b/src/conntrack/filter.c
@@ -38,7 +38,7 @@ static void filter_attr_dst_ipv4(struct nfct_filter *filter, const void *value)
 	filter->l3proto_elems[1]++;
 }
 
-filter_attr filter_attr_array[] = {
+filter_attr filter_attr_array[NFCT_FILTER_MAX] = {
 	[NFCT_FILTER_L4PROTO]		= filter_attr_l4proto,
 	[NFCT_FILTER_L4PROTO_STATE]	= filter_attr_l4proto_state,
 	[NFCT_FILTER_SRC_IPV4]		= filter_attr_src_ipv4,
diff --git a/src/conntrack/getter.c b/src/conntrack/getter.c
index 658d010..65661d4 100644
--- a/src/conntrack/getter.c
+++ b/src/conntrack/getter.c
@@ -287,7 +287,7 @@ static const void *get_attr_helper_name(const struct nf_conntrack *ct)
 	return ct->helper_name;
 }
 
-get_attr get_attr_array[] = {
+get_attr get_attr_array[ATTR_MAX] = {
 	[ATTR_ORIG_IPV4_SRC]		= get_attr_orig_ipv4_src,
 	[ATTR_ORIG_IPV4_DST] 		= get_attr_orig_ipv4_dst,
 	[ATTR_REPL_IPV4_SRC]		= get_attr_repl_ipv4_src,
diff --git a/src/conntrack/grp_getter.c b/src/conntrack/grp_getter.c
index adfd903..60e0b7e 100644
--- a/src/conntrack/grp_getter.c
+++ b/src/conntrack/grp_getter.c
@@ -92,7 +92,7 @@ static void get_attr_grp_repl_ctrs(const struct nf_conntrack *ct, void *data)
 	this->bytes = ct->counters[__DIR_REPL].bytes;
 }
 
-get_attr_grp get_attr_grp_array[] = {
+get_attr_grp get_attr_grp_array[ATTR_GRP_MAX] = {
 	[ATTR_GRP_ORIG_IPV4]		= get_attr_grp_orig_ipv4,
 	[ATTR_GRP_REPL_IPV4]		= get_attr_grp_repl_ipv4,
 	[ATTR_GRP_ORIG_IPV6]		= get_attr_grp_orig_ipv6,
diff --git a/src/conntrack/grp_setter.c b/src/conntrack/grp_setter.c
index 16f0a10..99ae4f8 100644
--- a/src/conntrack/grp_setter.c
+++ b/src/conntrack/grp_setter.c
@@ -140,7 +140,7 @@ static void set_attr_grp_do_nothing(struct nf_conntrack *ct, const void *value)
 {
 }
 
-set_attr_grp set_attr_grp_array[] = {
+set_attr_grp set_attr_grp_array[ATTR_GRP_MAX] = {
 	[ATTR_GRP_ORIG_IPV4]		= set_attr_grp_orig_ipv4,
 	[ATTR_GRP_REPL_IPV4]		= set_attr_grp_repl_ipv4,
 	[ATTR_GRP_ORIG_IPV6]		= set_attr_grp_orig_ipv6,
diff --git a/src/conntrack/objopt.c b/src/conntrack/objopt.c
index 682cba1..d678f2d 100644
--- a/src/conntrack/objopt.c
+++ b/src/conntrack/objopt.c
@@ -72,7 +72,7 @@ static void setobjopt_setup_repl(struct nf_conntrack *ct)
 	__autocomplete(ct, __DIR_REPL);
 }
 
-setobjopt setobjopt_array[] = {
+setobjopt setobjopt_array[__NFCT_SOPT_MAX] = {
 	[NFCT_SOPT_UNDO_SNAT] 		= setobjopt_undo_snat,
 	[NFCT_SOPT_UNDO_DNAT] 		= setobjopt_undo_dnat,
 	[NFCT_SOPT_UNDO_SPAT] 		= setobjopt_undo_spat,
@@ -122,7 +122,7 @@ static int getobjopt_is_dpat(const struct nf_conntrack *ct)
 		ct->tuple[__DIR_ORIG].l4dst.tcp.port);
 }
 
-getobjopt getobjopt_array[] = {
+getobjopt getobjopt_array[__NFCT_GOPT_MAX] = {
 	[NFCT_GOPT_IS_SNAT] = getobjopt_is_snat,
 	[NFCT_GOPT_IS_DNAT] = getobjopt_is_dnat,
 	[NFCT_GOPT_IS_SPAT] = getobjopt_is_spat,
diff --git a/src/conntrack/setter.c b/src/conntrack/setter.c
index 3291bd1..6e275ab 100644
--- a/src/conntrack/setter.c
+++ b/src/conntrack/setter.c
@@ -316,7 +316,7 @@ static void set_attr_helper_name(struct nf_conntrack *ct, const void *value)
 
 static void set_attr_do_nothing(struct nf_conntrack *ct, const void *value) {}
 
-set_attr set_attr_array[] = {
+set_attr set_attr_array[ATTR_MAX] = {
 	[ATTR_ORIG_IPV4_SRC]	= set_attr_orig_ipv4_src,
 	[ATTR_ORIG_IPV4_DST] 	= set_attr_orig_ipv4_dst,
 	[ATTR_REPL_IPV4_SRC]	= set_attr_repl_ipv4_src,

--------------090103070501000509030808
Content-Type: text/x-diff;
 name="test.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="test.patch"

qa: add test file to check for missing indirect function calls

From: Pablo Neira Ayuso <pablo@netfilter.org>

This patch adds a rudimentary test file to check for possible unset
indirect function calls. This automated test should be run after
adding a new attribute.

Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
---

 Makefile.am    |    2 +
 configure.in   |    2 +
 qa/Makefile.am |    7 ++++
 qa/test_api.c  |  102 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 111 insertions(+), 2 deletions(-)
 create mode 100644 qa/Makefile.am
 create mode 100644 qa/test_api.c


diff --git a/Makefile.am b/Makefile.am
index 262028c..f31ebb4 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -2,7 +2,7 @@ include $(top_srcdir)/Make_global.am
 
 AUTOMAKE_OPTIONS = foreign dist-bzip2 1.6
 
-SUBDIRS	= include src utils
+SUBDIRS	= include src utils qa
 
 man_MANS = #nfnetlink_conntrack.3 nfnetlink_conntrack.7
 
diff --git a/configure.in b/configure.in
index 6768235..0aa9c40 100644
--- a/configure.in
+++ b/configure.in
@@ -78,5 +78,5 @@ LIBNFCONNTRACK_LIBS="$LIBNFNETLINK_LIBS"
 AC_SUBST(LIBNFCONNTRACK_LIBS)
 
 dnl Output the makefile
-AC_OUTPUT(Makefile src/Makefile include/Makefile utils/Makefile include/libnetfilter_conntrack/Makefile include/internal/Makefile src/conntrack/Makefile src/expect/Makefile src/deprecated/Makefile src/deprecated/l3extensions/Makefile src/deprecated/extensions/Makefile libnetfilter_conntrack.pc)
+AC_OUTPUT(Makefile src/Makefile include/Makefile utils/Makefile qa/Makefile include/libnetfilter_conntrack/Makefile include/internal/Makefile src/conntrack/Makefile src/expect/Makefile src/deprecated/Makefile src/deprecated/l3extensions/Makefile src/deprecated/extensions/Makefile libnetfilter_conntrack.pc)
 
diff --git a/qa/Makefile.am b/qa/Makefile.am
new file mode 100644
index 0000000..6a9471b
--- /dev/null
+++ b/qa/Makefile.am
@@ -0,0 +1,7 @@
+include $(top_srcdir)/Make_global.am
+
+check_PROGRAMS = test_api
+
+test_api_SOURCES = test_api.c
+test_api_LDADD = ../src/libnetfilter_conntrack.la
+test_api_LDFLAGS = -dynamic -ldl
diff --git a/qa/test_api.c b/qa/test_api.c
new file mode 100644
index 0000000..eda9d49
--- /dev/null
+++ b/qa/test_api.c
@@ -0,0 +1,102 @@
+/*
+ * Run this after adding a new attribute to the nf_conntrack object
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/wait.h>
+#include <errno.h>
+
+#include <libnetfilter_conntrack/libnetfilter_conntrack.h>
+
+/*
+ * this file contains a test to check the set/get/copy/cmp APIs.
+ */
+
+static eval_sigterm(int status)
+{
+	switch(WTERMSIG(status)) {
+	case SIGSEGV:
+		printf("received SIGSEV\n");
+		break;
+	case 0:
+		printf("OK\n", WTERMSIG(status));
+		break;
+	default:
+		printf("exited with signal: %d\n", WTERMSIG(status));
+		break;
+	}
+}
+
+int main()
+{
+	int ret, i;
+	struct nfct_handle *h;
+	struct nf_conntrack *ct, *tmp;
+	char data[32];
+	int status;
+
+	/* initialize fake data for testing purposes */
+	for (i=0; i<sizeof(data); i++)
+		data[i] = 0x01;
+
+	ct = nfct_new();
+	if (!ct) {
+		perror("nfct_new");
+		return 0;
+	}
+	tmp = nfct_new();
+	if (!tmp) {
+		perror("nfct_new");
+		return 0;
+	}
+
+	printf("== test set API ==\n");
+	ret = fork();
+	if (ret == 0) {
+		for (i=0; i<ATTR_MAX; i++)
+			nfct_set_attr(ct, i, data);
+		exit(0);
+	} else {
+		wait(&status);
+		eval_sigterm(status);
+	}
+
+	for (i=0; i<ATTR_MAX; i++)
+		nfct_set_attr(ct, i, data);
+
+	printf("== test get API ==\n");
+	ret = fork();
+	if (ret == 0) {
+		for (i=0; i<ATTR_MAX; i++)
+			nfct_get_attr(ct, i);
+		exit(0);
+	} else {
+		wait(&status);
+		eval_sigterm(status);
+	}
+
+	printf("== test copy API ==\n");
+	ret = fork();
+	if (ret == 0) {
+		for (i=0; i<ATTR_MAX; i++)
+			nfct_copy_attr(tmp, ct, i);
+		exit(0);
+	} else {
+		wait(&status);
+		eval_sigterm(status);
+	}
+
+	printf("== test cmp API ==\n");
+	ret = fork();
+	if (ret == 0) {
+		nfct_cmp(tmp, ct, NFCT_CMP_ALL);
+		exit(0);
+	} else {
+		wait(&status);
+		eval_sigterm(status);
+	}
+
+	nfct_destroy(ct);
+	nfct_destroy(tmp);
+}

--------------090103070501000509030808--
