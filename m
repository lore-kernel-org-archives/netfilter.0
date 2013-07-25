From: Alexey Perevalov <a.perevalov@samsung.com>
Subject: [PATCH 2/4] extensions: Use DEBUGP macro from trace.h
Date: Thu, 25 Jul 2013 13:23:47 +0400
Message-ID: <1374744229-5427-3-git-send-email-a.perevalov@samsung.com>
References: <1374744229-5427-1-git-send-email-a.perevalov@samsung.com>
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-reply-to: <1374744229-5427-1-git-send-email-a.perevalov@samsung.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org, netfilter@vger.kernel.org, Alexey Perevalov <a.perevalov@samsung.com>

Signed-off-by: Alexey Perevalov <a.perevalov@samsung.com>
---
 extensions/libxt_dccp.c |    8 +-------
 extensions/libxt_sctp.c |    8 +-------
 extensions/libxt_set.c  |    1 +
 3 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/extensions/libxt_dccp.c b/extensions/libxt_dccp.c
index 06cd23d..13a6451 100644
--- a/extensions/libxt_dccp.c
+++ b/extensions/libxt_dccp.c
@@ -15,13 +15,7 @@
 #include <linux/dccp.h>
 #include <linux/netfilter/x_tables.h>
 #include <linux/netfilter/xt_dccp.h>
-
-#ifdef DEBUG
-#define DEBUGP(format, first...) printf(format, ##first)
-#define static
-#else
-#define DEBUGP(format, fist...)
-#endif
+#include "trace.h"
 
 enum {
 	O_SOURCE_PORT = 0,
diff --git a/extensions/libxt_sctp.c b/extensions/libxt_sctp.c
index f5959cb..dab59d5 100644
--- a/extensions/libxt_sctp.c
+++ b/extensions/libxt_sctp.c
@@ -19,13 +19,7 @@
 #include <xtables.h>
 
 #include <linux/netfilter/xt_sctp.h>
-
-#if DEBUG
-#define DEBUGP(format, first...) printf(format, ##first)
-#define static
-#else
-#define DEBUGP(format, fist...)
-#endif
+#include "trace.h"
 
 static void
 print_chunk(uint32_t chunknum, int numeric);
diff --git a/extensions/libxt_set.c b/extensions/libxt_set.c
index 2cb9e78..4099541 100644
--- a/extensions/libxt_set.c
+++ b/extensions/libxt_set.c
@@ -21,6 +21,7 @@
 #include <xtables.h>
 #include <linux/netfilter/xt_set.h>
 #include "libxt_set.h"
+#include "trace.h"
 
 /* Revision 0 */
 
-- 
1.7.9.5

