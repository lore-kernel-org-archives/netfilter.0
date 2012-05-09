From: Eldad Zack <eldad@fogrefinery.com>
Subject: [PATCH] netfilter/xt_CT.c: remove redundant header include
Date: Thu, 10 May 2012 00:03:35 +0200
Message-ID: <1336601016-19495-1-git-send-email-eldad@fogrefinery.com>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eldad Zack <eldad@fogrefinery.com>

nf_conntrack_l4proto.h is included twice.

Signed-off-by: Eldad Zack <eldad@fogrefinery.com>
---
 net/netfilter/xt_CT.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/net/netfilter/xt_CT.c b/net/netfilter/xt_CT.c
index 3746d8b..a51de9b 100644
--- a/net/netfilter/xt_CT.c
+++ b/net/netfilter/xt_CT.c
@@ -17,7 +17,6 @@
 #include <net/netfilter/nf_conntrack_l4proto.h>
 #include <net/netfilter/nf_conntrack_helper.h>
 #include <net/netfilter/nf_conntrack_ecache.h>
-#include <net/netfilter/nf_conntrack_l4proto.h>
 #include <net/netfilter/nf_conntrack_timeout.h>
 #include <net/netfilter/nf_conntrack_zones.h>
 
-- 
1.7.10

