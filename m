From: Michal Nazarewicz <mpn@google.com>
Subject: [PATCH] netfilter: remove unused variable
Date: Fri, 29 Nov 2013 18:03:11 +0100
Message-ID: <1385744591-9743-1-git-send-email-mpn@google.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=QYTerNV5neeVC1G+ecmyKa/G6M0dWIHTtpzYkchfHYE=;
        b=eRACcC7r7rmxoCakXdCBhs6ANzp6jIaFYTMsvDiqQQGQagSWU4Pg0ipAAR7J9v0NUx
         2nPMgx551C/heHnsr9onFUdWdvpyLm/EhPDdO7FxaI0uuO4KN57ofSufJoo5UTrVnKID
         IOSke6KAqVcPfbhEEM+OIZ6xh2d9nnel+uYWneQPycSuNl9Yv7QaHQUA6Rly/ZLH7/YM
         ZR3Ar3vaFY4E2jzHbNn+BXzFjyoxpZ7HUCm/xBfJDyRyuNOMMDqh4SImQEk00VRW+mX9
         zw92CyL+9E1nuuMGbN5okm0VLhYHgdvBaho/e6OUq7ZKUk1kAAUF/Ldmhy4BVwtSrVw1
         hx9Q==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org, linux-kernel@vger.kernel.org

From: Michal Nazarewicz <mina86@mina86.com>

The nfmsg variable is not used (except in sizeof operator which does
not care about its value) between the first and second time it is
assigned the value.  Furthermore, nlmsg_data has no side effects, so
the whole assignment insruction can be safely removed.

Signed-off-by: Michal Nazarewicz <mina86@mina86.com>
---
 net/netfilter/nf_tables_api.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
index dcddc49..ebf2f96 100644
--- a/net/netfilter/nf_tables_api.c
+++ b/net/netfilter/nf_tables_api.c
@@ -2501,7 +2501,6 @@ static int nf_tables_dump_set(struct sk_buff *skb, struct netlink_callback *cb)
 	u32 portid, seq;
 	int event, err;
 
-	nfmsg = nlmsg_data(cb->nlh);
 	err = nlmsg_parse(cb->nlh, sizeof(*nfmsg), nla, NFTA_SET_ELEM_LIST_MAX,
 			  nft_set_elem_list_policy);
 	if (err < 0)
-- 
1.8.4.1
