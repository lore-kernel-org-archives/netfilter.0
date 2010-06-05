From: David Favro <netfilter@meta-dynamic.com>
Subject: [PATCH libnetfilter_queue 2/3] Payload buffer datatypes are consistent.
Date: Sat,  5 Jun 2010 13:40:19 +0700
Message-ID: <1275720020-14058-2-git-send-email-netfilter@meta-dynamic.com>
References: <1275720020-14058-1-git-send-email-netfilter@meta-dynamic.com>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1275720020-14058-1-git-send-email-netfilter@meta-dynamic.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: pablo@netfilter.org, David Favro <netfilter@meta-dynamic.com>

The 'data' parameter to nfq_get_payload() returns pointer to unsigned
char (rather than signed char) to make it consistent with the 'buf'
parameter of nfq_set_verdict(), nfq_set_verdict2(), and
nfq_set_verdict_mark(), all of which refer to the same data.  Either
signed or unsigned is fine, but they should be consistent as the output
of nfq_get_payload() may be passed back into nfq_set_verdict*(); in that
case, this change eliminates the need for typecasting in the calling
code when using compilers that enforce strict typecasting.

Signed-off-by: David Favro <netfilter@meta-dynamic.com>
---
 include/libnetfilter_queue/libnetfilter_queue.h |    2 +-
 src/libnetfilter_queue.c                        |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/libnetfilter_queue/libnetfilter_queue.h b/include/libnetfilter_queue/libnetfilter_queue.h
index 2e2ca8b..53bda74 100644
--- a/include/libnetfilter_queue/libnetfilter_queue.h
+++ b/include/libnetfilter_queue/libnetfilter_queue.h
@@ -104,7 +104,7 @@ extern int nfq_get_physoutdev_name(struct nlif_handle *nlif_handle,
 extern struct nfqnl_msg_packet_hw *nfq_get_packet_hw(struct nfq_data *nfad);
 
 /* return -1 if problem, length otherwise */
-extern int nfq_get_payload(struct nfq_data *nfad, char **data);
+extern int nfq_get_payload(struct nfq_data *nfad, unsigned char **data);
 
 #ifdef __cplusplus
 } /* extern "C" */
diff --git a/src/libnetfilter_queue.c b/src/libnetfilter_queue.c
index 4cc4925..c543055 100644
--- a/src/libnetfilter_queue.c
+++ b/src/libnetfilter_queue.c
@@ -1003,7 +1003,7 @@ struct nfqnl_msg_packet_hw *nfq_get_packet_hw(struct nfq_data *nfad)
  *
  * \return -1 on error, otherwise > 0.
  */
-int nfq_get_payload(struct nfq_data *nfad, char **data)
+int nfq_get_payload(struct nfq_data *nfad, unsigned char **data)
 {
 	*data = nfnl_get_pointer_to_data(nfad->data, NFQA_PAYLOAD, char);
 	if (*data)
-- 
1.7.0.4

