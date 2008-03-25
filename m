From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: [PATCH 11/29] : remove arpt_(un)register_target indirection macros
Date: Tue, 25 Mar 2008 19:30:03 +0100
Message-ID: <8801489a9cb20b1dee2b641df58300cd53826d45.1206469820.git.jengelh@computergmbh.de>
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
 include/linux/netfilter_arp/arp_tables.h |    5 -----
 net/ipv4/netfilter/arpt_mangle.c         |    8 +++-----
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/include/linux/netfilter_arp/arp_tables.h b/include/linux/netfilter_arp/arp_tables.h
index 1cb698b..493dcd2 100644
--- a/include/linux/netfilter_arp/arp_tables.h
+++ b/include/linux/netfilter_arp/arp_tables.h
@@ -259,11 +259,6 @@ struct arpt_error
 	.target.errorname = "ERROR",					       \
 }
 
-#define arpt_register_target(tgt) 	\
-({	(tgt)->family = NF_ARP;		\
- 	xt_register_target(tgt); })
-#define arpt_unregister_target(tgt) xt_unregister_target(tgt)
-
 extern struct xt_table *
 arpt_register_table(struct net *net, struct xt_table *table,
                     const struct arpt_replace *repl);
diff --git a/net/ipv4/netfilter/arpt_mangle.c b/net/ipv4/netfilter/arpt_mangle.c
index f9c102a..a385959 100644
--- a/net/ipv4/netfilter/arpt_mangle.c
+++ b/net/ipv4/netfilter/arpt_mangle.c
@@ -75,6 +75,7 @@ checkentry(const char *tablename, const void *e, const struct xt_target *target,
 
 static struct xt_target arpt_mangle_reg __read_mostly = {
 	.name		= "mangle",
+	.family		= NF_ARP,
 	.target		= target,
 	.targetsize	= sizeof(struct arpt_mangle),
 	.checkentry	= checkentry,
@@ -83,15 +84,12 @@ static struct xt_target arpt_mangle_reg __read_mostly = {
 
 static int __init arpt_mangle_init(void)
 {
-	if (arpt_register_target(&arpt_mangle_reg))
-		return -EINVAL;
-
-	return 0;
+	return xt_register_target(&arpt_mangle_reg);
 }
 
 static void __exit arpt_mangle_fini(void)
 {
-	arpt_unregister_target(&arpt_mangle_reg);
+	xt_unregister_target(&arpt_mangle_reg);
 }
 
 module_init(arpt_mangle_init);
-- 
1.5.4.4

