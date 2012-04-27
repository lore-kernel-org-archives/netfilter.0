From: Benjamin Poirier <bpoirier@suse.de>
Subject: [PATCH RFC 2/2] netfilter: conntrack: replace mutex with cmpxchg
Date: Fri, 27 Apr 2012 14:28:53 -0400
Message-ID: <1335551333-6103-2-git-send-email-bpoirier@suse.de>
References: <1335551333-6103-1-git-send-email-bpoirier@suse.de>
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=uZegOUDizkBLzpCwbEGmK95BZRp+FZ1PAloTAaR90Yo=;
        b=FoQmnPogzDUtHdk4yfUGKX0KIVohUa/5afYcyMmY/+zhL6X29C/Sss34hQ6ThreNqU
         0V+do3LUv7e1hxEX7s1yaNBtPizbDhyFEiVxN5GW0xnFm5/3kwHkteyAP0d3CIuFqxRV
         7dOc75gdfXeGoQK5oRdZx3aiZOrO3cI9n8fynXBedbOB3suq8RHIcrQig/oLMFK/sKYV
         mkK520hOVlZuXD3mbBhc86xCbCD95xwtnzD5MrGTG8smK3iIom/wjOcnPkUZTSRGAT0e
         N43VEY6FBNzX8aHMfEGk07XuFxspo7tA2d4w0B6asZ1XofEZhnlBamnteDFw9MBptHcm
         HEiw==
In-Reply-To: <1335551333-6103-1-git-send-email-bpoirier@suse.de>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Eric Dumazet <eric.dumazet@gmail.com>, Mike Frysinger <vapier@gentoo.org>, Arun Sharma <asharma@fb.com>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, linux-kernel@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>

This mutex protects a single pointer.
---
 net/netfilter/nf_conntrack_ecache.c |   38 +++++++++-------------------------
 1 files changed, 10 insertions(+), 28 deletions(-)

diff --git a/net/netfilter/nf_conntrack_ecache.c b/net/netfilter/nf_conntrack_ecache.c
index 0134009..603eb69 100644
--- a/net/netfilter/nf_conntrack_ecache.c
+++ b/net/netfilter/nf_conntrack_ecache.c
@@ -25,8 +25,6 @@
 #include <net/netfilter/nf_conntrack_core.h>
 #include <net/netfilter/nf_conntrack_extend.h>
 
-static DEFINE_MUTEX(nf_ct_ecache_mutex);
-
 /* deliver cached events and clear cache entry - must be called with locally
  * disabled softirqs */
 void nf_ct_deliver_cached_events(struct nf_conn *ct)
@@ -80,52 +78,36 @@ EXPORT_SYMBOL_GPL(nf_ct_deliver_cached_events);
 int nf_conntrack_register_notifier(struct net *net,
 				   struct nf_ct_event_notifier *new)
 {
-	int ret = 0;
-
-	mutex_lock(&nf_ct_ecache_mutex);
-	if (net->ct.nf_conntrack_event_cb != NULL)
-		ret = -EBUSY;
+	if (cmpxchg(&net->ct.nf_conntrack_event_cb, NULL, new) != NULL)
+		return -EBUSY;
 	else
-		net->ct.nf_conntrack_event_cb = new;
-	mutex_unlock(&nf_ct_ecache_mutex);
-
-	return ret;
+		return 0;
 }
 EXPORT_SYMBOL_GPL(nf_conntrack_register_notifier);
 
 void nf_conntrack_unregister_notifier(struct net *net,
 				      struct nf_ct_event_notifier *new)
 {
-	mutex_lock(&nf_ct_ecache_mutex);
-	BUG_ON(net->ct.nf_conntrack_event_cb != new);
-	net->ct.nf_conntrack_event_cb = NULL;
-	mutex_unlock(&nf_ct_ecache_mutex);
+	if (xchg(&net->ct.nf_conntrack_event_cb, NULL) != new)
+		BUG();
 }
 EXPORT_SYMBOL_GPL(nf_conntrack_unregister_notifier);
 
 int nf_ct_expect_register_notifier(struct net *net,
 				   struct nf_exp_event_notifier *new)
 {
-	int ret = 0;
-
-	mutex_lock(&nf_ct_ecache_mutex);
-	if (net->ct.nf_expect_event_cb != NULL)
-		ret = -EBUSY;
+	if (cmpxchg(&net->ct.nf_expect_event_cb, NULL, new) != NULL)
+		return -EBUSY;
 	else
-		net->ct.nf_expect_event_cb = new;
-	mutex_unlock(&nf_ct_ecache_mutex);
-
-	return ret;
+		return 0;
 }
 EXPORT_SYMBOL_GPL(nf_ct_expect_register_notifier);
 
 void nf_ct_expect_unregister_notifier(struct net *net,
 				      struct nf_exp_event_notifier *new)
 {
-	mutex_lock(&nf_ct_ecache_mutex);
-	BUG_ON(net->ct.nf_expect_event_cb != new);
-	net->ct.nf_expect_event_cb = NULL;
-	mutex_unlock(&nf_ct_ecache_mutex);
+	if (xchg(&net->ct.nf_expect_event_cb, NULL) != new)
+		BUG();
 }
 EXPORT_SYMBOL_GPL(nf_ct_expect_unregister_notifier);
 
-- 
1.7.7

