From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] netfilter: nf_tables: remove duplicated include from nf_tables_ipv4.c
Date: Wed, 30 Oct 2013 13:31:30 +0800
Message-ID: <CAPgLHd_rvGiaM-XVo8AoVXz=et4gzp1F2zKuxGZsAmLDPODRwQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:cc:content-type;
        bh=+KMH8JjJlFZ0BzVY0/maezU64QtIwjpxGl5+JSeGcPY=;
        b=FDFv4XXEkq2yoXNwC7V3H4xdyGKSLy1EqLdiTwzNObKNWOYk1mITi4eT0HOVgYmJob
         YWi5t6iJbUHgEJ+0PU2ydbBUSHwqvcVjDG6fglG5jpN9HwVLRNL4Q477Njbaf4L37b8g
         mKx1yhQqkIBG/jsSc4sZI5tVlyuBeGZ4zh1kVEkFze4SVhOxClXlETOZ6n1SydNBy84R
         Kzq+xSd5XkuhFdGpY/3rl6fOb7XBqqc2NZ716sHXERxLnLpY80ArRFwS0GL01m9GmX7n
         OchOs+Y0CL9UT25h9TBgnnUtdck8xnP1i7cfceSvzhXAQa67NmQxAUiRVMmD/cuOP2IL
         zgtA==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pablo@netfilter.org, kaber@trash.net, kadlec@blackhole.kfki.hu, kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org
Cc: yongjun_wei@trendmicro.com.cn, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Remove duplicated include.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 net/ipv4/netfilter/nf_tables_ipv4.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/ipv4/netfilter/nf_tables_ipv4.c b/net/ipv4/netfilter/nf_tables_ipv4.c
index 8f7536b..0f4cbfe 100644
--- a/net/ipv4/netfilter/nf_tables_ipv4.c
+++ b/net/ipv4/netfilter/nf_tables_ipv4.c
@@ -16,7 +16,6 @@
 #include <net/netfilter/nf_tables.h>
 #include <net/net_namespace.h>
 #include <net/ip.h>
-#include <net/net_namespace.h>
 #include <net/netfilter/nf_tables_ipv4.h>
 
 static unsigned int nft_ipv4_output(const struct nf_hook_ops *ops,

