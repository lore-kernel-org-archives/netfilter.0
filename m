From: Jan-Philipp Litza <jpl@plutex.de>
Subject: [PATCH] nftables: Bump dependency on libnftnl to 1.1.5
Date: Wed, 4 Dec 2019 16:25:29 +0100
Message-ID: <a43d1acf-ba73-f8f5-9b0c-aebd61d33f8d@plutex.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

The multidevice support was introduced in libnftnl commit e3ac19b5ec162,
which is first included in version 1.1.5

With version 1.1.4, compile errors like the following occur:

netlink.c:423:38: error: 'NFTNL_CHAIN_DEVICES' undeclared (first use in
this function); did you mean 'NFTNL_CHAIN_DEV'?

Fixes: 3fdc7541fba07 ("src: add multidevice support for netdev chain")
Signed-off-by: Jan-Philipp Litza <janphilipp@litza.de>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 5ed3f18a..c487029a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -57,7 +57,7 @@ AS_IF([test "x$enable_man_doc" = "xyes"], [
 ])

 PKG_CHECK_MODULES([LIBMNL], [libmnl >= 1.0.3])
-PKG_CHECK_MODULES([LIBNFTNL], [libnftnl >= 1.1.4])
+PKG_CHECK_MODULES([LIBNFTNL], [libnftnl >= 1.1.5])

 AC_ARG_WITH([mini-gmp], [AS_HELP_STRING([--with-mini-gmp],
             [Use builtin mini-gmp (for embedded builds)])],

-- 
Jan-Philipp Litza
PLUTEX GmbH
Hermann-Ritter-Str. 108
28197 Bremen

Hotline: 0800 100 400 800
Telefon: 0800 100 400 821
Telefax: 0800 100 400 888
E-Mail: support@plutex.de
Internet: http://www.plutex.de

USt-IdNr.: DE 815030856
Handelsregister: Amtsgericht Bremen, HRB 25144
Geschäftsführer: Torben Belz, Hendrik Lilienthal
