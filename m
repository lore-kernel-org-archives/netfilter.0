From: Dong Fang <yp.fangdong@gmail.com>
Subject: [PATCH] netfilter: avoid array overflow in nf_register_hook
Date: Fri, 23 Aug 2013 23:04:55 -0400
Message-ID: <1377313495-16060-1-git-send-email-yp.fangdong@gmail.com>
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=UoEMEY+jpD7Qvi55coWwYzUW1T95EInBrputZLbehQs=;
        b=xK3UMyv0ebGKiwsEsSByU/+hYclgJQY0ZNQU//mLitGv+JtBE73Pn5Q8g0bQcAX0My
         ugTrOa9YJhNSWSF2eNvhCmC/SSmLncCNaA3pxBHIPsCrfzcFtRqdX/1//Mf1XnGiXCht
         oVcr2FwVA51OZW+J3AWcTddBgw8nFFeJfcgpV26RMtWFHK0/gZPwO3MJfhuJIkLH55SL
         dfMXQriujMcYwUjJjW4RQ7Ur7JhhpWfqrcOHK3FsrI/J5DvFCseGBxgh3j38gJXyjJCT
         8MiGiyx2FyUdlv9HK/7P+sCoWGfur4lkB9aBc/M4wN9zGVGvqIVKWQhuPWPhbRvQK6Zo
         +PPQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pablo@netfilter.org, kaber@trash.net, kadlec@blackhole.kfki.hu, davem@davemloft.net
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, Dong Fang <yp.fangdong@gmail.com>

This patch fix the array overflow in nf_register_hook function

Signed-off-by: Dong Fang <yp.fangdong@gmail.com>
---
 net/netfilter/core.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/net/netfilter/core.c b/net/netfilter/core.c
index 2217363..819eee1 100644
--- a/net/netfilter/core.c
+++ b/net/netfilter/core.c
@@ -68,8 +68,11 @@ static DEFINE_MUTEX(nf_hook_mutex);
 int nf_register_hook(struct nf_hook_ops *reg)
 {
 	struct nf_hook_ops *elem;
-	int err;
+	int err = -EINVAL;
 
+	if (reg->pf >= NFPROTO_NUMPROTO || reg->hooknum >= NF_MAX_HOOKS)
+		return err;
+
 	err = mutex_lock_interruptible(&nf_hook_mutex);
 	if (err < 0)
 		return err;
-- 
1.7.1

