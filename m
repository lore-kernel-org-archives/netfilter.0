From: Florian Westphal <fw@strlen.de>
Subject: Re: NFQUEUE/iptables and kernel warning messages for
 net/ipv4/tcp_output.c
Date: Tue, 18 Feb 2020 13:39:58 +0100
Message-ID: <20200218123958.GJ19559@breakpoint.cc>
References: <CABLYT9gNPFh7RpwE8P3uZyLKBM-_6ctpg7_8BPo4iCN3PWMQOQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABLYT9gNPFh7RpwE8P3uZyLKBM-_6ctpg7_8BPo4iCN3PWMQOQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vieri Di Paola <vieridipaola@gmail.com>
Cc: netfilter@vger.kernel.org

Vieri Di Paola <vieridipaola@gmail.com> wrote:
> Hi,
> 
> Whenever I use NFQUEUE/iptables to send traffic to an IDS/IPS (eg.
> Suricata), I get an ugly kernel warning which can sometimes and on the
> long run turn into a system freeze.
> 
> I'm using NFQUEUE 0:5, and I'm running Suricata with -q 0 -q 1 -q 2 -q
> 3 -q 4 -q 5 as arguments.
> 
> I've already reported the issue on the LKML here:
> 
> https://lkml.org/lkml/2020/2/13/1255

No idea.  Suricata forces software-side segmentation for each packet,
could be related.

Can you post to suricata ML and get this patch working (untested):
If the problem doesn't occur with segmentation off we've at least
narrowed it down:

diff --git a/src/source-nfq.c b/src/source-nfq.c
--- a/src/source-nfq.c
+++ b/src/source-nfq.c
@@ -154,6 +154,7 @@ typedef enum NFQMode_ {
 } NFQMode;
 
 #define NFQ_FLAG_FAIL_OPEN  (1 << 0)
+#define NFQ_FLAG_GSO        (1 << 2)
 
 typedef struct NFQCnf_ {
     NFQMode mode;
@@ -242,6 +243,10 @@ void NFQInitConfig(char quiet)
 #endif
     }
 
+#ifdef HAVE_NFQ_SET_QUEUE_FLAGS
+        nfq_config.flags |= NFQ_FLAG_GSO;
+#endif
+
     if ((ConfGetInt("nfq.repeat-mark", &value)) == 1) {
         nfq_config.mark = (uint32_t)value;
     }
@@ -389,6 +394,16 @@ static inline void NFQMutexInit(NFQQueueVars *nq)
     }
 }
 
+/* Ugly Hack */
+struct nfq_data {
+	void **data;
+};
+
+static uint32_t nfq_get_pktinfo(struct nfq_data *nfad)
+{
+        return ntohl(nfnl_get_data(nfad->data, NFQA_SKB_INFO, uint32_t));
+}
+
 #define NFQMutexLock(nq) do {           \
     if ((nq)->use_mutex)                \
         SCMutexLock(&(nq)->mutex_qh);   \
@@ -412,6 +427,7 @@ static int NFQSetupPkt (Packet *p, struct nfq_q_handle *qh, void *data)
     int ret;
     char *pktdata;
     struct nfqnl_msg_packet_hdr *ph;
+    uint32_t pktinfo;
 
     ph = nfq_get_msg_packet_hdr(tb);
     if (ph != NULL) {
@@ -474,6 +490,11 @@ static int NFQSetupPkt (Packet *p, struct nfq_q_handle *qh, void *data)
         gettimeofday(&p->ts, NULL);
     }
 
+    pktinfo = nfq_get_pktinfo(tb);
+    /* kernel/nic will compute checksum on output */
+    if (pktinfo & NFQA_SKB_CSUMNOTREADY)
+       p->flags |= PKT_IGNORE_CHECKSUM;
+
     p->datalink = DLT_RAW;
     return 0;
 }
@@ -674,16 +695,14 @@ static TmEcode NFQInitThread(NFQThreadVars *t, uint32_t queue_maxlen)
 #endif
 
 #ifdef HAVE_NFQ_SET_QUEUE_FLAGS
-    if (nfq_config.flags & NFQ_FLAG_FAIL_OPEN) {
-        uint32_t flags = NFQA_CFG_F_FAIL_OPEN;
-        uint32_t mask = NFQA_CFG_F_FAIL_OPEN;
-        int r = nfq_set_queue_flags(q->qh, mask, flags);
+    if (nfq_config.flags) {
+        int r = nfq_set_queue_flags(q->qh, nfq_config.flags, nfq_config.flags);
 
         if (r == -1) {
-            SCLogWarning(SC_ERR_NFQ_SET_MODE, "can't set fail-open mode: %s",
-                         strerror(errno));
+            SCLogWarning(SC_ERR_NFQ_SET_MODE, "can't set nfq flags 0x%x: %s",
+                         nfq_config.flags, strerror(errno));
         } else {
-            SCLogInfo("fail-open mode should be set on queue");
+            SCLogInfo("Set flag modes 0x%x on queue", nfq_config.flags);
         }
     }
 #endif
