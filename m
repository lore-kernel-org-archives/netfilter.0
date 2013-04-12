From: Jonghwan Choi <jhbird.choi@gmail.com>
Subject: [PATCH 3.8-stable] netfilter: nfnetlink_acct: return -EINVAL if object name is empty
Date: Sat, 13 Apr 2013 00:16:05 +0900
Message-ID: <1365779765-11924-1-git-send-email-jhbird.choi@samsung.com>
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer;
        bh=qMxmTAhA9plBD8huYvJiec6WqM3uODFa68EIWiipR5w=;
        b=0ATf/tnXPZ6tW1oErevZJv6+rbQ9IU2DDY8gxvbiIX6XdZpqdFvQALj9/SbZMC8KIL
         6qMU9yAG6sS4jcMOwv5dGT4fwYIrjtFzE2knYXtRnwZ5+5Wh1PuFJLT2FTWtRTESRjh8
         xC5YjHjxpckwftmdb6ZyECoFjRn2kErJKvjXlHewGCczUJDwXbJ55dQunLNb/pdikHLz
         5VFxBnxzw8alZ4U/7v6TSL1hW2EUKZSSO63BdewRDUOT6jNpfgrerhrCEKxxcaxJOeK3
         fErpmlgFn+gEpYiovs+W3DnGV8RGKCqFP2UTUYGFqMdtSQYN/1A4wtWtH7+UeR1Yctee
         yAZQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: stable@vger.kernel.org, netfilter@vger.kernel.org, Jonghwan Choi <jhbird.choi@samsung.com>

From: Pablo Neira Ayuso <pablo@netfilter.org>

This patch looks like it should be in the 3.8-stable tree, should we apply
it?

------------------

From: "Pablo Neira Ayuso <pablo@netfilter.org>"

commit deadcfc3324410726cd6a663fb4fc46be595abe7 upstream

If user-space tries to create accounting object with an empty
name, then return -EINVAL.

Reported-by: Michael Zintakis <michael.zintakis@googlemail.com>
Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 net/netfilter/nfnetlink_acct.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/netfilter/nfnetlink_acct.c b/net/netfilter/nfnetlink_acct.c
index 589d686..dc3fd5d 100644
--- a/net/netfilter/nfnetlink_acct.c
+++ b/net/netfilter/nfnetlink_acct.c
@@ -49,6 +49,8 @@ nfnl_acct_new(struct sock *nfnl, struct sk_buff *skb,
 		return -EINVAL;
 
 	acct_name = nla_data(tb[NFACCT_NAME]);
+	if (strlen(acct_name) == 0)
+		return -EINVAL;
 
 	list_for_each_entry(nfacct, &nfnl_acct_list, head) {
 		if (strncmp(nfacct->name, acct_name, NFACCT_NAME_MAX) != 0)
-- 
1.7.10.4

