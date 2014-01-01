From: Michal Nazarewicz <mina86@mina86.com>
Subject: [PATCH RESEND] netfilter: remove unused variable
Date: Wed,  1 Jan 2014 06:27:19 +0100
Message-ID: <1388554039-28452-1-git-send-email-mina86@mina86.com>
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id;
        bh=4eu9fH9VzRNMoBKo19TtI+LOwdBsgi5DJ1PUl+fm7qY=;
        b=DSQK5waCmJXoHyBhFJ6acAg7X0HnevGBjhsnu6MCeYpQDATbG9KrUZzYDoRbowqvas
         yPfCXdRwVILaPVLrFJo3okKY4JI3f5nXn8t0EEXHI+hqdfy4P16uTYH+0fH+Rxht6vRl
         QU8Jx4Lt9E7L8YLyYZlgl1ejVAaKUN6G9+k+2h2EXXRA/Je+nE+J86CHavX3mRtqhN/F
         9XX5qNheCAqjJn5kQHJ7aV+mjJjQpeub03VaIzfXz0B3PC9WYOTdtnK+NGh42aE1tyXm
         9nYU5xAm/eW5NUGc2ldOgoT5tmWAV09xryGK9MY5wIrJUF6BB1G21AO04dosFoTddrdN
         D7Yw==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Nazarewicz <mina86@mina86.com>

The nfmsg variable is not used (except in sizeof operator which does
not care about its value) between the first and second time it is
assigned the value.  Furthermore, nlmsg_data has no side effects, so
the assignment can be safely removed.

Signed-off-by: Michal Nazarewicz <mina86@mina86.com>
Cc: Patrick McHardy <kaber@trash.net>
---
 net/netfilter/nf_tables_api.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
index f93b7d0..9c56adc 100644
--- a/net/netfilter/nf_tables_api.c
+++ b/net/netfilter/nf_tables_api.c
@@ -2521,7 +2521,6 @@ static int nf_tables_dump_set(struct sk_buff *skb, struct netlink_callback *cb)
 	u32 portid, seq;
 	int event, err;
 
-	nfmsg = nlmsg_data(cb->nlh);
 	err = nlmsg_parse(cb->nlh, sizeof(*nfmsg), nla, NFTA_SET_ELEM_LIST_MAX,
 			  nft_set_elem_list_policy);
 	if (err < 0)
-- 
1.8.4

