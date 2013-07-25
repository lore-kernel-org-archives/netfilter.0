From: Alexey Perevalov <a.perevalov@samsung.com>
Subject: [PATCH 3/4] iptables: Use DEBUGP macro from trace.h
Date: Thu, 25 Jul 2013 13:23:48 +0400
Message-ID: <1374744229-5427-4-git-send-email-a.perevalov@samsung.com>
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
 iptables/ip6tables-restore.c |    7 +------
 iptables/iptables-restore.c  |    7 +------
 iptables/iptables-xml.c      |    7 +------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/iptables/ip6tables-restore.c b/iptables/ip6tables-restore.c
index b8b9e0d..2f08640 100644
--- a/iptables/ip6tables-restore.c
+++ b/iptables/ip6tables-restore.c
@@ -18,12 +18,7 @@
 #include "xtables.h"
 #include "libiptc/libip6tc.h"
 #include "ip6tables-multi.h"
-
-#ifdef DEBUG
-#define DEBUGP(x, args...) fprintf(stderr, x, ## args)
-#else
-#define DEBUGP(x, args...)
-#endif
+#include "trace.h"
 
 static int binary = 0, counters = 0, verbose = 0, noflush = 0;
 
diff --git a/iptables/iptables-restore.c b/iptables/iptables-restore.c
index 8c942ff..611049b 100644
--- a/iptables/iptables-restore.c
+++ b/iptables/iptables-restore.c
@@ -15,12 +15,7 @@
 #include "xtables.h"
 #include "libiptc/libiptc.h"
 #include "iptables-multi.h"
-
-#ifdef DEBUG
-#define DEBUGP(x, args...) fprintf(stderr, x, ## args)
-#else
-#define DEBUGP(x, args...)
-#endif
+#include "trace.h"
 
 static int binary = 0, counters = 0, verbose = 0, noflush = 0;
 
diff --git a/iptables/iptables-xml.c b/iptables/iptables-xml.c
index 4b12bd4..79eba8d 100644
--- a/iptables/iptables-xml.c
+++ b/iptables/iptables-xml.c
@@ -16,12 +16,7 @@
 #include "libiptc/libiptc.h"
 #include "xtables-multi.h"
 #include <xtables.h>
-
-#ifdef DEBUG
-#define DEBUGP(x, args...) fprintf(stderr, x, ## args)
-#else
-#define DEBUGP(x, args...)
-#endif
+#include "trace.h"
 
 struct xtables_globals iptables_xml_globals = {
 	.option_offset = 0,
-- 
1.7.9.5

