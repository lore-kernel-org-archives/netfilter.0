From: Guruswamy Basavaiah <guru2018@gmail.com>
Subject: [PATCH] iptables-translate: Printing the table name before chain name
Date: Tue, 5 Apr 2016 11:58:07 +0530
Message-ID: <20160405062807.GA6421@inbhdhcp21574.apac.nsn-net.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=lbAXrfidCxj3CZFxBdgfC1unzjAN51kTtiiObY0i6Ss=;
        b=Wk5SVZ7+oJiaPJQbDV7ls6qsG12xJui4js88TVjZrPORQhoF53UoshFrLpWQ0+aIU6
         8dQQBCkeqEcxIquGW5cuKCGSUxWqKOB8hGFXg7mJAHCpymgrKSKpzJOVxywDXEsViak9
         QdncdX+xX/UnkkUQ5N2VreT7laIyia0EPhjIw5zwXeKuaYJJhzD8ygeCXo/WsvNXh4OV
         g5Ap8Cr4OPwuCSYqIhg+pzQHFC/9cI+8BQTJY8KkQ2e6/ysyGnZKJSZtxd8TBGGYcV1+
         FqYWonMlwNRKePMu2ozBBQLcIKHKZ8MaU7HD+759NuAeKULp18yPOVjFaJyja39s+HrR
         JT/A==
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Printing the table name before chain name.

Command ./iptables-restore-translate, was printing
table name before the chain name for user added chains.
This is breaking ./nft -f command.

Before fix, output of "./iptables-restore-translate"
add chain ip OUTPUT_direct raw

After fix:
add chain ip raw OUTPUT_direct

Signed-off-by: Guruswamy Basavaiah <guru2018@gmail.com>
---
 iptables/xtables-translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/iptables/xtables-translate.c b/iptables/xtables-translate.c
index 44162a2..07cc98c 100644
--- a/iptables/xtables-translate.c
+++ b/iptables/xtables-translate.c
@@ -296,7 +296,7 @@ static const struct option options[] = {
 static int xlate_chain_user_add(struct nft_handle *h, const char *chain,
                                const char *table)
 {
-       printf("add chain %s %s %s\n", family2str[h->family], chain, table);
+       printf("add chain %s %s %s\n", family2str[h->family], table, chain);
        return 0;
 }

-- 
2.5.0
