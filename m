From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: [PATCH 09/29] : remove ARPT_{STANDARD,ERROR}_TARGET indirection macro
Date: Tue, 25 Mar 2008 19:30:01 +0100
Message-ID: <49de6a3b3b90070d0396627f25bd2612c5a0ae1e.1206469820.git.jengelh@computergmbh.de>
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
 include/linux/netfilter_arp/arp_tables.h |    9 ++-------
 net/ipv4/netfilter/arp_tables.c          |    8 ++++----
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/include/linux/netfilter_arp/arp_tables.h b/include/linux/netfilter_arp/arp_tables.h
index 4aed7c4..0e6b5e1 100644
--- a/include/linux/netfilter_arp/arp_tables.h
+++ b/include/linux/netfilter_arp/arp_tables.h
@@ -203,11 +203,6 @@ struct arpt_get_entries
 	struct arpt_entry entrytable[0];
 };
 
-/* Standard return verdict, or do jump. */
-#define ARPT_STANDARD_TARGET XT_STANDARD_TARGET
-/* Error verdict. */
-#define ARPT_ERROR_TARGET XT_ERROR_TARGET
-
 /* Helper functions */
 static __inline__ struct arpt_entry_target *arpt_get_target(struct arpt_entry *e)
 {
@@ -251,7 +246,7 @@ struct arpt_error
 #define ARPT_STANDARD_INIT(__verdict)					       \
 {									       \
 	.entry		= ARPT_ENTRY_INIT(sizeof(struct arpt_standard)),       \
-	.target		= XT_TARGET_INIT(ARPT_STANDARD_TARGET,		       \
+	.target		= XT_TARGET_INIT(XT_STANDARD_TARGET,		       \
 					 sizeof(struct arpt_standard_target)), \
 	.target.verdict	= -(__verdict) - 1,				       \
 }
@@ -259,7 +254,7 @@ struct arpt_error
 #define ARPT_ERROR_INIT							       \
 {									       \
 	.entry		= ARPT_ENTRY_INIT(sizeof(struct arpt_error)),	       \
-	.target		= XT_TARGET_INIT(ARPT_ERROR_TARGET,		       \
+	.target		= XT_TARGET_INIT(XT_ERROR_TARGET,		       \
 					 sizeof(struct arpt_error_target)),    \
 	.target.errorname = "ERROR",					       \
 }
diff --git a/net/ipv4/netfilter/arp_tables.c b/net/ipv4/netfilter/arp_tables.c
index 67db115..514f91b 100644
--- a/net/ipv4/netfilter/arp_tables.c
+++ b/net/ipv4/netfilter/arp_tables.c
@@ -367,7 +367,7 @@ static int mark_source_chains(struct xt_table_info *newinfo,
 			/* Unconditional return/END. */
 			if ((e->target_offset == sizeof(struct arpt_entry)
 			    && (strcmp(t->target.u.user.name,
-				       ARPT_STANDARD_TARGET) == 0)
+				       XT_STANDARD_TARGET) == 0)
 			    && t->verdict < 0
 			    && unconditional(&e->arp)) || visited) {
 				unsigned int oldpos, size;
@@ -406,7 +406,7 @@ static int mark_source_chains(struct xt_table_info *newinfo,
 				int newpos = t->verdict;
 
 				if (strcmp(t->target.u.user.name,
-					   ARPT_STANDARD_TARGET) == 0
+					   XT_STANDARD_TARGET) == 0
 				    && newpos >= 0) {
 					if (newpos > newinfo->size -
 						sizeof(struct arpt_entry)) {
@@ -1785,7 +1785,7 @@ void arpt_unregister_table(struct xt_table *table)
 
 /* The built-in targets: standard (NULL) and error. */
 static struct xt_target arpt_standard_target __read_mostly = {
-	.name		= ARPT_STANDARD_TARGET,
+	.name		= XT_STANDARD_TARGET,
 	.targetsize	= sizeof(int),
 	.family		= NF_ARP,
 #ifdef CONFIG_COMPAT
@@ -1796,7 +1796,7 @@ static struct xt_target arpt_standard_target __read_mostly = {
 };
 
 static struct xt_target arpt_error_target __read_mostly = {
-	.name		= ARPT_ERROR_TARGET,
+	.name		= XT_ERROR_TARGET,
 	.target		= arpt_error,
 	.targetsize	= ARPT_FUNCTION_MAXNAMELEN,
 	.family		= NF_ARP,
-- 
1.5.4.4

