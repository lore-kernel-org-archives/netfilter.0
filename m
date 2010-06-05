From: David Favro <netfilter@meta-dynamic.com>
Subject: [PATCH libnetfilter_queue 1/3] Non-modified payload arguments are pointer-to-const.
Date: Sat,  5 Jun 2010 13:40:18 +0700
Message-ID: <1275720020-14058-1-git-send-email-netfilter@meta-dynamic.com>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: pablo@netfilter.org, David Favro <netfilter@meta-dynamic.com>

The payload parameters to nfq_set_verdict(), nfq_set_verdict2(), and
nfq_set_verdict_mark() are not modified by those functions, and
therefore should have datatype pointer-to-const.  This both causes the
source-code to more effectively represent what is the purpose of the
parameter, and eliminates the need to cast away const-ness when calling
the functions with compilers that enforce strict casting.  All existing
calling code should not need modification as pointer-to-X automatically
converts to pointer-to-const-X.

Signed-off-by: David Favro <netfilter@meta-dynamic.com>
---
 include/libnetfilter_queue/libnetfilter_queue.h |    6 +++---
 src/libnetfilter_queue.c                        |   11 ++++++-----
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/libnetfilter_queue/libnetfilter_queue.h b/include/libnetfilter_queue/libnetfilter_queue.h
index 88a9b8c..2e2ca8b 100644
--- a/include/libnetfilter_queue/libnetfilter_queue.h
+++ b/include/libnetfilter_queue/libnetfilter_queue.h
@@ -60,14 +60,14 @@ extern int nfq_set_verdict(struct nfq_q_handle *qh,
 			     u_int32_t id,
 			     u_int32_t verdict,
 			     u_int32_t data_len,
-			     unsigned char *buf);
+			     const unsigned char *buf);
 
 extern int nfq_set_verdict2(struct nfq_q_handle *qh,
 			    u_int32_t id,
 			    u_int32_t verdict, 
 			    u_int32_t mark,
 			    u_int32_t datalen,
-			    unsigned char *buf);
+			    const unsigned char *buf);
 
 extern __attribute__((deprecated))
 int nfq_set_verdict_mark(struct nfq_q_handle *qh, 
@@ -75,7 +75,7 @@ int nfq_set_verdict_mark(struct nfq_q_handle *qh,
 			 u_int32_t verdict, 
 			 u_int32_t mark,
 			 u_int32_t datalen,
-			 unsigned char *buf);
+			 const unsigned char *buf);
 
 /* message parsing function */
 
diff --git a/src/libnetfilter_queue.c b/src/libnetfilter_queue.c
index cc19e6a..4cc4925 100644
--- a/src/libnetfilter_queue.c
+++ b/src/libnetfilter_queue.c
@@ -610,7 +610,7 @@ int nfq_set_queue_maxlen(struct nfq_q_handle *qh,
 
 static int __set_verdict(struct nfq_q_handle *qh, u_int32_t id,
 		u_int32_t verdict, u_int32_t mark, int set_mark,
-		u_int32_t data_len, unsigned char *data)
+		u_int32_t data_len, const unsigned char *data)
 {
 	struct nfqnl_msg_verdict_hdr vh;
 	union {
@@ -646,8 +646,9 @@ static int __set_verdict(struct nfq_q_handle *qh, u_int32_t id,
 	nvecs = 1;
 
 	if (data_len) {
+		/* The typecast here is to cast away data's const-ness: */
 		nfnl_build_nfa_iovec(&iov[1], &data_attr, NFQA_PAYLOAD,
-				data_len, data);
+				data_len, (unsigned char *) data);
 		nvecs += 2;
 		/* Add the length of the appended data to the message
 		 * header.  The size of the attribute is given in the
@@ -688,7 +689,7 @@ static int __set_verdict(struct nfq_q_handle *qh, u_int32_t id,
  */
 int nfq_set_verdict(struct nfq_q_handle *qh, u_int32_t id,
 		u_int32_t verdict, u_int32_t data_len, 
-		unsigned char *buf)
+		const unsigned char *buf)
 {
 	return __set_verdict(qh, id, verdict, 0, 0, data_len, buf);
 }	
@@ -704,7 +705,7 @@ int nfq_set_verdict(struct nfq_q_handle *qh, u_int32_t id,
  */
 int nfq_set_verdict2(struct nfq_q_handle *qh, u_int32_t id,
 		     u_int32_t verdict, u_int32_t mark,
-		     u_int32_t data_len, unsigned char *buf)
+		     u_int32_t data_len, const unsigned char *buf)
 {
 	return __set_verdict(qh, id, verdict, htonl(mark), 1, data_len, buf);
 }
@@ -725,7 +726,7 @@ int nfq_set_verdict2(struct nfq_q_handle *qh, u_int32_t id,
  */
 int nfq_set_verdict_mark(struct nfq_q_handle *qh, u_int32_t id,
 		u_int32_t verdict, u_int32_t mark,
-		u_int32_t data_len, unsigned char *buf)
+		u_int32_t data_len, const unsigned char *buf)
 {
 	return __set_verdict(qh, id, verdict, mark, 1, data_len, buf);
 }
-- 
1.7.0.4

