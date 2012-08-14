From: Denis Efremov <yefremov.denis@gmail.com>
Subject: [PATCH v2] bridge: rcu_deref outside read-lock section
Date: Tue, 14 Aug 2012 12:08:52 +0400
Message-ID: <1344931732-1858-1-git-send-email-yefremov.denis@gmail.com>
References: <1344898062-23633-1-git-send-email-yefremov.denis@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
        bh=zuUtXORGIorczT+8QjGCO9egI9kXqP9GhN9mA4Y6ykw=;
        b=EMbYxkXlaLCTKCFkP8ccFTk2q8u5Kp/sk7UsTEL7RpQUU5Tlo2ZB/2EuSRj7zLfObh
         iW4zVudRA72MzbiJ66a7lordvdZ7Hv67T8nPNKM3FxcMTKr7OyffM71yk+xVBRHD/NpP
         rSczwIjlLmtnaBMCCsSuomxMIGZ23RoibYQqMgLWtvSwUQA6Jb9gnKfDOUYwBz/AFkzl
         9N42ROBGVWAjjprKFn1PRbbUBRVn6Hqdc19mvCOQDHbjaSM4mAr5gSzMCbfimcXTGhLO
         dN9aviaoNdkCFZ5yVb8kvpGL8Rq7MstuHLFHHtZiR1Jjeav8Ny549R13PaocqB60eHLN
         a+Fw==
In-Reply-To: <1344898062-23633-1-git-send-email-yefremov.denis@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <shemminger@vyatta.com>
Cc: Denis Efremov <yefremov.denis@gmail.com>, "David S. Miller" <davem@davemloft.net>, pablo@netfilter.org, kaber@trash.net, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, linux-kernel@vger.kernel.org, ldv-project@ispras.ru

As it noted in the comment before the br_handle_frame_finish
function, this function should be called under rcu_read_lock.

The problem callgraph:
br_dev_xmit -> br_nf_pre_routing_finish_bridge_slow ->
-> br_handle_frame_finish -> br_port_get_rcu -> rcu_dereference

And in this case there is no read-lock section.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Denis Efremov <yefremov.denis@gmail.com>
---
 net/bridge/br_device.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/net/bridge/br_device.c b/net/bridge/br_device.c
index 3334845..f9ae07f 100644
--- a/net/bridge/br_device.c
+++ b/net/bridge/br_device.c
@@ -33,7 +33,9 @@ netdev_tx_t br_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 
 #ifdef CONFIG_BRIDGE_NETFILTER
 	if (skb->nf_bridge && (skb->nf_bridge->mask & BRNF_BRIDGED_DNAT)) {
+		rcu_read_lock();
 		br_nf_pre_routing_finish_bridge_slow(skb);
+		rcu_read_unlock();
 		return NETDEV_TX_OK;
 	}
 #endif
-- 
1.7.7
