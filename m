From: Wei Yongjun <yjwei@cn.fujitsu.com>
Subject: [PATCH] netfilter: remove some pointless conditionals before kfree_skb()
Date: Wed, 25 Feb 2009 18:44:06 +0800
Message-ID: <49A520F6.1010404@cn.fujitsu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org, Wei Yongjun <yjwei@cn.fujitsu.com>

Remove some pointless conditionals before kfree_skb().

Signed-off-by: Wei Yongjun <yjwei@cn.fujitsu.com>
---
 net/decnet/netfilter/dn_rtmsg.c         |    3 +--
 net/ipv6/netfilter/nf_conntrack_reasm.c |    3 +--
 net/netfilter/nfnetlink_queue.c         |    3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/net/decnet/netfilter/dn_rtmsg.c b/net/decnet/netfilter/dn_rtmsg.c
index 6d2bd32..17cbc4c 100644
--- a/net/decnet/netfilter/dn_rtmsg.c
+++ b/net/decnet/netfilter/dn_rtmsg.c
@@ -53,8 +53,7 @@ static struct sk_buff *dnrmg_build_message(struct sk_buff *rt_skb, int *errp)
 	return skb;
 
 nlmsg_failure:
-	if (skb)
-		kfree_skb(skb);
+	kfree_skb(skb);
 	*errp = -ENOMEM;
 	if (net_ratelimit())
 		printk(KERN_ERR "dn_rtmsg: error creating netlink message\n");
diff --git a/net/ipv6/netfilter/nf_conntrack_reasm.c b/net/ipv6/netfilter/nf_conntrack_reasm.c
index ed4d79a..37f7954 100644
--- a/net/ipv6/netfilter/nf_conntrack_reasm.c
+++ b/net/ipv6/netfilter/nf_conntrack_reasm.c
@@ -112,8 +112,7 @@ static unsigned int nf_hashfn(struct inet_frag_queue *q)
 
 static void nf_skb_free(struct sk_buff *skb)
 {
-	if (NFCT_FRAG6_CB(skb)->orig)
-		kfree_skb(NFCT_FRAG6_CB(skb)->orig);
+	kfree_skb(NFCT_FRAG6_CB(skb)->orig);
 }
 
 /* Memory Tracking Functions. */
diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
index 8c86011..6f4c970 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -379,8 +379,7 @@ nfqnl_build_packet_message(struct nfqnl_instance *queue,
 
 nlmsg_failure:
 nla_put_failure:
-	if (skb)
-		kfree_skb(skb);
+	kfree_skb(skb);
 	if (net_ratelimit())
 		printk(KERN_ERR "nf_queue: error creating packet message\n");
 	return NULL;
-- 
1.5.3.8




