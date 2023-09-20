From: Sam James <sam@gentoo.org>
Subject: [PATCH] build: Fix double-prefix w/ pkgconfig
Date: Wed, 20 Sep 2023 14:34:17 +0100
Message-ID: <20230920133418.1893675-1-sam@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: netfilter-devel@vger.kernel.org, Jan Engelhardt <jengelh@inai.de>, Florian Westphal <fw@strlen.de>, Jozsef Kadlecsik <kadlec@netfilter.org>, Sam James <sam@gentoo.org>

First, apologies - 326932be0c4f47756f9809cad5a103ac310f700d clearly introduced
a double prefix and I can't tell you what my thought process was 9 months ago
but it was obviously wrong (my guess is I rebased some old patch and didn't
think properly, no idea).

Anyway, let's just drop the extraneous pkgconfigdir definition and use the
proper one from pkg.m4 via PKG_INSTALLDIR.

Fixes: 326932be0c4f47756f9809cad5a103ac310f700d
Signed-off-by: Sam James <sam@gentoo.org>
---
 configure.ac    | 1 +
 lib/Makefile.am | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index cad93af..6c26645 100644
--- a/configure.ac
+++ b/configure.ac
@@ -14,6 +14,7 @@ LT_CONFIG_LTDL_DIR([libltdl])
 LTDL_INIT([nonrecursive])
 
 PKG_PROG_PKG_CONFIG
+PKG_INSTALLDIR
 
 dnl Shortcut: Linux supported alone
 case "$host" in
diff --git a/lib/Makefile.am b/lib/Makefile.am
index 50d937d..a9edf95 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -46,7 +46,6 @@ EXTRA_libipset_la_SOURCES = \
 
 EXTRA_DIST = $(IPSET_SETTYPE_LIST) libipset.map
 
-pkgconfigdir = $(prefix)/$(libdir)/pkgconfig
 pkgconfig_DATA = libipset.pc
 
 dist_man_MANS = libipset.3
-- 
2.42.0

