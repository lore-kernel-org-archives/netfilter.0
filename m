From: Lai Jiangshan <laijs@cn.fujitsu.com>
Subject: [PATCH 25/36] net,rcu: convert call_rcu(__nf_ct_ext_free_rcu) to
 kfree_rcu()
Date: Fri, 18 Mar 2011 12:07:09 +0800
Message-ID: <4D82DA6D.7030100__22976.3654679575$1300421145$gmane$org@cn.fujitsu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Ingo Molnar <mingo@elte.hu>, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.o



The rcu callback __nf_ct_ext_free_rcu() just calls a kfree(),
so we use kfree_rcu() instead of the call_rcu(__nf_ct_ext_free_rcu).

Signed-off-by: Lai Jiangshan <laijs@cn.fujitsu.com>
---
 net/netfilter/nf_conntrack_extend.c |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/net/netfilter/nf_conntrack_extend.c b/net/netfilter/nf_conntrack_extend.c
index bd82450..cc0bcda 100644
--- a/net/netfilter/nf_conntrack_extend.c
+++ b/net/netfilter/nf_conntrack_extend.c
@@ -68,12 +68,6 @@ nf_ct_ext_create(struct nf_ct_ext **ext, enum nf_ct_ext_id id, gfp_t gfp)
 	return (void *)(*ext) + off;
 }
 
-static void __nf_ct_ext_free_rcu(struct rcu_head *head)
-{
-	struct nf_ct_ext *ext = container_of(head, struct nf_ct_ext, rcu);
-	kfree(ext);
-}
-
 void *__nf_ct_ext_add(struct nf_conn *ct, enum nf_ct_ext_id id, gfp_t gfp)
 {
 	struct nf_ct_ext *old, *new;
@@ -114,7 +108,7 @@ void *__nf_ct_ext_add(struct nf_conn *ct, enum nf_ct_ext_id id, gfp_t gfp)
 					(void *)old + old->offset[i]);
 			rcu_read_unlock();
 		}
-		call_rcu(&old->rcu, __nf_ct_ext_free_rcu);
+		kfree_rcu(old, rcu);
 		ct->ext = new;
 	}
 
-- 
1.7.4
