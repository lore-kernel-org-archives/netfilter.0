From: haibbo@gmail.com
Subject: [PATCH] fix conntrack reassembly expire code
Date: Fri,  7 Dec 2012 17:42:17 +0800
Message-ID: <1354873337-3776-1-git-send-email-haibbo@gmail.com>
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:x-mailer;
        bh=AKiGmhHhg8FT3MGSvZxgHezbhYakGy6wQzR40laJ04w=;
        b=xriVuNDXDTEdNqxBIjx/FMVlRwAFBbxAocHnKJnLxtko4SW/gUwl4wvDOpRRQ1+9OQ
         qzenMucgmgXQBvl4VE9hBEKdf9Lcmz2kcbWr5w88n5O6ADSQPl4vEKkO8i8+KlG2E7P7
         gUqaEk52+QHuyjRkKJJojAvbOL7WLwjZDmnygJWAoj9hEjLr9wXc+PdKWyLDVYE1PZjA
         d7PkXNfx8v7SXVfCdRk0xUhyy7WstymNI/RDbpehy8vwVBlHxEQRFkhx35OYCSljZ5sO
         sMgoeVqSDIqiApW3NXkKBRGVgnqdHvr+fMA0HNp33CowCKRPQZpgGhQ9ih0Xh2OBmZEv
         bfdg==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pablo@netfilter.org, kaber@trash.net, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org
Cc: Haibo Xi <haibbo@gmail.com>

From: Haibo Xi <haibbo@gmail.com>

Commit b836c99fd6c9 (ipv6: unify conntrack reassembly expire
code with standard one) use the standard IPv6 reassembly
code(ip6_expire_frag_queue) to handle conntrack reassembly expire.

In ip6_expire_frag_queue, it invoke dev_get_by_index_rcu to get
which device received this expired packet.so we must save ifindex
when NF_conntrack get this packet.

With this patch applied, I can see ICMP Time Exceeded sent
from the receiver when the sender sent out 1/2 fragmented
IPv6 packet.

Signed-off-by: Haibo Xi <haibbo@gmail.com>
---
 net/ipv6/netfilter/nf_conntrack_reasm.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/net/ipv6/netfilter/nf_conntrack_reasm.c b/net/ipv6/netfilter/nf_conntrack_reasm.c
index 22c8ea9..e7197be 100644
--- a/net/ipv6/netfilter/nf_conntrack_reasm.c
+++ b/net/ipv6/netfilter/nf_conntrack_reasm.c
@@ -196,6 +196,7 @@ static int nf_ct_frag6_queue(struct frag_queue *fq, struct sk_buff *skb,
 	struct sk_buff *prev, *next;
 	unsigned int payload_len;
 	int offset, end;
+	struct net_device *dev = NULL;
 
 	if (fq->q.last_in & INET_FRAG_COMPLETE) {
 		pr_debug("Already completed\n");
@@ -311,7 +312,11 @@ found:
 	else
 		fq->q.fragments = skb;
 
-	skb->dev = NULL;
+	dev = skb->dev;
+	if (dev) {
+		fq->iif = dev->ifindex;
+		skb->dev = NULL;
+	}
 	fq->q.stamp = skb->tstamp;
 	fq->q.meat += skb->len;
 	if (payload_len > fq->q.max_size)
-- 
1.7.0.4

