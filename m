From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] netfilter: nfnetlink_queue: remove pointless conditional
 before kfree_skb()
Date: Tue, 28 Aug 2012 21:14:15 +0800
Message-ID: <CAPgLHd_dNe3ZLzkAZC7p6V7oQLohmFQxfPjVtK-SBhXG1yYxWw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:cc:content-type;
        bh=jDLdOupbzSTjhUajqNnAe2Y2glKOjtlHITiGoFnlns8=;
        b=fdpokB/xY71lzXDgTDw79m/M5F3KnZBrnVDfrx81SSv/dsehO25UmaBnMzGk5TL4yW
         TvirC14Bx2qzR2kJFYioiztyupkqQkm6sDc6Y3LFXJZvMGXZ03rmaGrXv9uOjSHzZ1/8
         aWQ9dkJ7UMl8Kq6bUFBuPGJEQuOV1Pffx6vG210wmyT/cecb0tca88OURP6EnWfSciPd
         8y2bHfGZiLpTX8b5/ZQNqmaWyNByhUIz5YfFsN9fZFmxygPdQbrlouEL00HERfJiiXLU
         e/+LIPXlI9DFIIiDtHv2LzDPVNg3AJIDu72XpICOKLejtydcVt2gLMX7gmqGjDSbYkCG
         iSPQ==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pablo@netfilter.org, kaber@trash.net
Cc: yongjun_wei@trendmicro.com.cn, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Remove pointless conditional before kfree_skb().

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 net/netfilter/nfnetlink_queue_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/netfilter/nfnetlink_queue_core.c b/net/netfilter/nfnetlink_queue_core.c
index c0496a5..5c2d78d 100644
--- a/net/netfilter/nfnetlink_queue_core.c
+++ b/net/netfilter/nfnetlink_queue_core.c
@@ -406,8 +406,7 @@ nfqnl_build_packet_message(struct nfqnl_instance *queue,
 	return skb;
 
 nla_put_failure:
-	if (skb)
-		kfree_skb(skb);
+	kfree_skb(skb);
 	net_err_ratelimited("nf_queue: error creating packet message\n");
 	return NULL;
 }


