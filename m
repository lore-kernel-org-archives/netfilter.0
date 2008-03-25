From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: [PATCH 01/29] : xt_sctp: simplify xt_sctp.h
Date: Tue, 25 Mar 2008 19:29:53 +0100
Message-ID: <720350a38b1dbd43c907d5d81decd6edd6725d81.1206469820.git.jengelh@computergmbh.de>
References: <alpine.LNX.1.10.0803251914060.2240@fbirervta.pbzchgretzou.qr>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0803251914060.2240@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kaber@trash.net
Cc: netfilter@vger.kernel.org, Jan Engelhardt <jengelh@computergmbh.de>

The use of xt_sctp.h flagged up -Wshadow warnings in userspace, which
prompted me to look at it and clean it up. Basic operations have been
directly replaced by library calls (memcpy, memset is both available
in the kernel and userspace, and usually faster than a self-made
loop). The is_set and is_clear functions now use a processing time
shortcut, too.

Signed-off-by: Jan Engelhardt <jengelh@computergmbh.de>
---
 include/linux/netfilter/xt_sctp.h |   84 ++++++++++++-----------------
 1 files changed, 35 insertions(+), 49 deletions(-)

diff --git a/include/linux/netfilter/xt_sctp.h b/include/linux/netfilter/xt_sctp.h
index dd5a4fd..32000ba 100644
--- a/include/linux/netfilter/xt_sctp.h
+++ b/include/linux/netfilter/xt_sctp.h
@@ -37,68 +37,54 @@ struct xt_sctp_info {
 
 #define SCTP_CHUNKMAP_SET(chunkmap, type) 		\
 	do { 						\
-		chunkmap[type / bytes(u_int32_t)] |= 	\
+		(chunkmap)[type / bytes(u_int32_t)] |= 	\
 			1 << (type % bytes(u_int32_t));	\
 	} while (0)
 
 #define SCTP_CHUNKMAP_CLEAR(chunkmap, type)		 	\
 	do {							\
-		chunkmap[type / bytes(u_int32_t)] &= 		\
+		(chunkmap)[type / bytes(u_int32_t)] &= 		\
 			~(1 << (type % bytes(u_int32_t)));	\
 	} while (0)
 
 #define SCTP_CHUNKMAP_IS_SET(chunkmap, type) 			\
 ({								\
-	(chunkmap[type / bytes (u_int32_t)] & 			\
+	((chunkmap)[type / bytes (u_int32_t)] & 		\
 		(1 << (type % bytes (u_int32_t)))) ? 1: 0;	\
 })
 
-#define SCTP_CHUNKMAP_RESET(chunkmap) 				\
-	do {							\
-		int i; 						\
-		for (i = 0; i < ARRAY_SIZE(chunkmap); i++)	\
-			chunkmap[i] = 0;			\
-	} while (0)
-
-#define SCTP_CHUNKMAP_SET_ALL(chunkmap) 			\
-	do {							\
-		int i; 						\
-		for (i = 0; i < ARRAY_SIZE(chunkmap); i++) 	\
-			chunkmap[i] = ~0;			\
-	} while (0)
-
-#define SCTP_CHUNKMAP_COPY(destmap, srcmap) 			\
-	do {							\
-		int i; 						\
-		for (i = 0; i < ARRAY_SIZE(srcmap); i++) 	\
-			destmap[i] = srcmap[i];			\
-	} while (0)
-
-#define SCTP_CHUNKMAP_IS_CLEAR(chunkmap) 		\
-({							\
-	int i; 						\
-	int flag = 1;					\
-	for (i = 0; i < ARRAY_SIZE(chunkmap); i++) {	\
-		if (chunkmap[i]) {			\
-			flag = 0;			\
-			break;				\
-		}					\
-	}						\
-        flag;						\
-})
-
-#define SCTP_CHUNKMAP_IS_ALL_SET(chunkmap) 		\
-({							\
-	int i; 						\
-	int flag = 1;					\
-	for (i = 0; i < ARRAY_SIZE(chunkmap); i++) {	\
-		if (chunkmap[i] != ~0) {		\
-			flag = 0;			\
-				break;			\
-		}					\
-	}						\
-        flag;						\
-})
+#define SCTP_CHUNKMAP_RESET(chunkmap) \
+	memset((chunkmap), 0, sizeof(chunkmap))
+
+#define SCTP_CHUNKMAP_SET_ALL(chunkmap) \
+	memset((chunkmap), ~0U, sizeof(chunkmap))
+
+#define SCTP_CHUNKMAP_COPY(destmap, srcmap) \
+	memcpy((destmap), (srcmap), sizeof(srcmap))
+
+#define SCTP_CHUNKMAP_IS_CLEAR(chunkmap) \
+	__sctp_chunkmap_is_clear((chunkmap), ARRAY_SIZE(chunkmap))
+static inline bool
+__sctp_chunkmap_is_clear(const u_int32_t *chunkmap, unsigned int n)
+{
+	unsigned int i;
+	for (i = 0; i < n; ++i)
+		if (chunkmap[i])
+			return false;
+	return true;
+}
+
+#define SCTP_CHUNKMAP_IS_ALL_SET(chunkmap) \
+	__sctp_chunkmap_is_all_set((chunkmap), ARRAY_SIZE(chunkmap))
+static inline bool
+__sctp_chunkmap_is_all_set(const u_int32_t *chunkmap, unsigned int n)
+{
+	unsigned int i;
+	for (i = 0; i < n; ++i)
+		if (chunkmap[i] != ~0U)
+			return false;
+	return true;
+}
 
 #endif /* _XT_SCTP_H_ */
 
-- 
1.5.4.4

