From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] netfilter: remove pointless conditional before kfree_skb()
Date: Tue, 28 Aug 2012 21:14:43 +0800
Message-ID: <CAPgLHd_+fxJET1PkriFRqws5gFr5220zqcZCuEU59M2gAB-9KA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:cc:content-type;
        bh=a1NKsyaMhAn/rjgyO5z8gT689FdR1KvkKn1PCyTmIUk=;
        b=H3e6pLRXX+vgPl5QFs4Yyz3ixNIQ9jPmm6Hy/7ycyEm3auZG4vqjJK1n9j3t1k+nOK
         bUqTalnqOwGKM+ACNGTGip+T++9WU+w6xVPyGdMiUSmF5O2z4ppZFT4ZpCripsyDiAPq
         Aixh10j0SdMtgd33f+4e0C7vgaq6VC8S4HT2Q6GJO8W3rOTqIKOk/JwHGyLfRxvy8T3T
         vi6tu8RiKOvR4xQkBTWDvoqwB/a58CYcMnq2D1ICjTxg3q65MvcEYyBK1Q96z22lP9r/
         olj0kfp1ZVmqmNYE4LJ4xgLbVmnMNZ9y7N1Zzs/BfPEUj61hbLRf3m/6lx3lHw0j28oj
         zdzw==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pablo@netfilter.org, kaber@trash.net, kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org
Cc: yongjun_wei@trendmicro.com.cn, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Remove pointless conditional before kfree_skb().

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 net/ipv6/netfilter/nf_conntrack_reasm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/ipv6/netfilter/nf_conntrack_reasm.c b/net/ipv6/netfilter/nf_conntrack_reasm.c
index c9c78c2..58cf705 100644
--- a/net/ipv6/netfilter/nf_conntrack_reasm.c
+++ b/net/ipv6/netfilter/nf_conntrack_reasm.c
@@ -112,8 +112,7 @@ static unsigned int nf_hashfn(struct inet_frag_queue *q)
 
 static void nf_skb_free(struct sk_buff *skb)
 {
-	if (NFCT_FRAG6_CB(skb)->orig)
-		kfree_skb(NFCT_FRAG6_CB(skb)->orig);
+	kfree_skb(NFCT_FRAG6_CB(skb)->orig);
 }
 
 /* Destruction primitives. */


