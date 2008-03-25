From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: [PATCH 12/29] : remove ARPT_{CONTINUE,RETURN} indirection macros
Date: Tue, 25 Mar 2008 19:30:04 +0100
Message-ID: <21b69579e7f7f0ddc0cf2ab933d56263017b5d09.1206469820.git.jengelh@computergmbh.de>
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
 include/linux/netfilter_arp/arp_tables.h |    6 ------
 net/ipv4/netfilter/arp_tables.c          |    6 +++---
 net/ipv4/netfilter/arpt_mangle.c         |    2 +-
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/include/linux/netfilter_arp/arp_tables.h b/include/linux/netfilter_arp/arp_tables.h
index 493dcd2..2cdcc0c 100644
--- a/include/linux/netfilter_arp/arp_tables.h
+++ b/include/linux/netfilter_arp/arp_tables.h
@@ -125,12 +125,6 @@ struct arpt_entry
 #define ARPT_SO_GET_REVISION_TARGET	(ARPT_BASE_CTL + 3)
 #define ARPT_SO_GET_MAX			(ARPT_SO_GET_REVISION_TARGET)
 
-/* CONTINUE verdict for targets */
-#define ARPT_CONTINUE XT_CONTINUE
-
-/* For standard target */
-#define ARPT_RETURN XT_RETURN
-
 /* The argument to ARPT_SO_GET_INFO */
 struct arpt_getinfo
 {
diff --git a/net/ipv4/netfilter/arp_tables.c b/net/ipv4/netfilter/arp_tables.c
index 514f91b..bc124c2 100644
--- a/net/ipv4/netfilter/arp_tables.c
+++ b/net/ipv4/netfilter/arp_tables.c
@@ -264,7 +264,7 @@ unsigned int arpt_do_table(struct sk_buff *skb,
 				v = ((struct arpt_standard_target *)t)->verdict;
 				if (v < 0) {
 					/* Pop from stack? */
-					if (v != ARPT_RETURN) {
+					if (v != XT_RETURN) {
 						verdict = (unsigned)(-v) - 1;
 						break;
 					}
@@ -299,7 +299,7 @@ unsigned int arpt_do_table(struct sk_buff *skb,
 				/* Target might have changed stuff. */
 				arp = arp_hdr(skb);
 
-				if (verdict == ARPT_CONTINUE)
+				if (verdict == XT_CONTINUE)
 					e = (void *)e + e->next_offset;
 				else
 					/* Verdict */
@@ -542,7 +542,7 @@ static inline int check_entry_size_and_hooks(struct arpt_entry *e,
 	}
 
 	/* FIXME: underflows must be unconditional, standard verdicts
-	   < 0 (not ARPT_RETURN). --RR */
+	   < 0 (not XT_RETURN). --RR */
 
 	/* Clear counters and comefrom */
 	e->counters = ((struct xt_counters) { 0, 0 });
diff --git a/net/ipv4/netfilter/arpt_mangle.c b/net/ipv4/netfilter/arpt_mangle.c
index a385959..6cccaab 100644
--- a/net/ipv4/netfilter/arpt_mangle.c
+++ b/net/ipv4/netfilter/arpt_mangle.c
@@ -68,7 +68,7 @@ checkentry(const char *tablename, const void *e, const struct xt_target *target,
 		return false;
 
 	if (mangle->target != NF_DROP && mangle->target != NF_ACCEPT &&
-	   mangle->target != ARPT_CONTINUE)
+	   mangle->target != XT_CONTINUE)
 		return false;
 	return true;
 }
-- 
1.5.4.4

