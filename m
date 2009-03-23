From: Kuzin Andrey <kuzinandrey@yandex.ru>
Subject: [PATCH]: drop packet without verdict from nfqueue after timeout
Date: Mon, 23 Mar 2009 21:43:13 +0300
Message-ID: <1723655470.20090323214313@yandex.ru>
Reply-To: Kuzin Andrey <kuzinandrey@yandex.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

This is patch for problem with stucked packets in nf_queue if
something going wrong in userspace program. Automatically drop packets
without any verdict after timeout defined by NFQNL_TIMEOUT_ENTRY_DROP.

Who may create patch for menu config for this feature ?


diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
index 8c86011..74fc322 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -169,17 +169,29 @@ __enqueue_entry(struct nfqnl_instance *queue, struct nf_queue_entry *entry)
        queue->queue_total++;
 }

+#define NFQNL_TIMEOUT_ENTRY_DROP 30
+
 static struct nf_queue_entry *
 find_dequeue_entry(struct nfqnl_instance *queue, unsigned int id)
 {
-       struct nf_queue_entry *entry = NULL, *i;
+       struct nf_queue_entry *entry = NULL, *next, *i;
+       ktime_t kt = ktime_get_real();

        spin_lock_bh(&queue->lock);

-       list_for_each_entry(i, &queue->queue_list, list) {
+       list_for_each_entry_safe(i, next, &queue->queue_list, list) {
                if (i->id == id) {
                        entry = i;
                        break;
+                } else {
+                       struct timeval tv = ktime_to_timeval(ktime_sub(kt, i->skb->tstamp));
+                       if (tv.tv_sec > NFQNL_TIMEOUT_ENTRY_DROP) {
+                               printk(KERN_ERR "nf_queue: drop timeouted packet "
+                                       "(queue_num=%u seq_id=%u)\n", queue->queue_num, i->id);
+                               list_del(&i->list);
+                               queue->queue_total--;
+                               nf_reinject(i, NF_DROP);
+                       }
                }
        }


