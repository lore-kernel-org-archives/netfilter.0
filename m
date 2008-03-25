From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: [PATCH 10/29] : remove unused ARPT_ALIGN indirection macros
Date: Tue, 25 Mar 2008 19:30:02 +0100
Message-ID: <e5eb9c5b9edb3bebd2c12e1245b2cbb196a6e0ff.1206469820.git.jengelh@computergmbh.de>
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
index 0e6b5e1..1cb698b 100644
--- a/include/linux/netfilter_arp/arp_tables.h
+++ b/include/linux/netfilter_arp/arp_tables.h
@@ -274,8 +274,6 @@ extern unsigned int arpt_do_table(struct sk_buff *skb,
 				  const struct net_device *out,
 				  struct xt_table *table);
 
-#define ARPT_ALIGN(s) XT_ALIGN(s)
-
 #ifdef CONFIG_COMPAT
 #include <net/compat.h>
 
@@ -295,8 +293,6 @@ compat_arpt_get_target(struct compat_arpt_entry *e)
 	return (void *)e + e->target_offset;
 }
 
-#define COMPAT_ARPT_ALIGN(s)	COMPAT_XT_ALIGN(s)
-
 /* fn returns 0 to continue iteration */
 #define COMPAT_ARPT_ENTRY_ITERATE(entries, size, fn, args...) \
 	XT_ENTRY_ITERATE(struct compat_arpt_entry, entries, size, fn, ## args)
-- 
1.5.4.4

