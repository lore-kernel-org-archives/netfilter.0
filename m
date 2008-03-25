From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: [PATCH 13/29] : remove ARPT_{CONTINUE,RETURN} indirection macros
Date: Tue, 25 Mar 2008 19:30:05 +0100
Message-ID: <29364238f42dacdbf884fc42419ea48349959c7d.1206469820.git.jengelh@computergmbh.de>
References: <alpine.LNX.1.10.0803251914060.2240@fbirervta.pbzchgretzou.qr>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0803251914060.2240@fbirervta.pbzchgretzou.qr>
In-Reply-To: <720350a38b1dbd43c907d5d81decd6edd6725d81.1206469820.git.jengelh@computergmbh.de>
References: <720350a38b1dbd43c907d5d81decd6edd6725d81.1206469820.git.jengelh@computergmbh.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kaber@trash.net
Cc: netfilter@vger.kernel.org, Jan Engelhardt <jengelh@computergmbh.de>

Signed-off-by: Jan Engelhardt <jengelh@computergmbh.de>
---
 include/linux/netfilter_arp/arp_tables.h |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/include/linux/netfilter_arp/arp_tables.h b/include/linux/netfilter_arp/arp_tables.h
index 2cdcc0c..f701e36 100644
--- a/include/linux/netfilter_arp/arp_tables.h
+++ b/include/linux/netfilter_arp/arp_tables.h
@@ -180,10 +180,6 @@ struct arpt_replace
 	struct arpt_entry entries[0];
 };
 
-/* The argument to ARPT_SO_ADD_COUNTERS. */
-#define arpt_counters_info xt_counters_info
-#define arpt_counters xt_counters
-
 /* The argument to ARPT_SO_GET_ENTRIES. */
 struct arpt_get_entries
 {
-- 
1.5.4.4

