From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH -v3 19/23] net/netfilter: rename random32() to prandom_u32()
Date: Mon,  4 Mar 2013 21:58:27 +0900
Message-ID: <1362401911-14074-20-git-send-email-akinobu.mita@gmail.com>
References: <1362401911-14074-1-git-send-email-akinobu.mita@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=4+86HsSetn+M1niH59LZkEPh70NiO6UIOHc0fgOXAMc=;
        b=LUKbaP5pIT8UMRKQPacSJSKbGcks7n414zKEk9n8vv5pTJQcGT0fdO4+kVf8VL5h/j
         B3z2uD5jH57BKu1yxG1iFQEehkjuavpsWvVrFAtNntO4XQqDTY9MRvnHEEgdWyDcizjr
         UE4JmiAkrkc2nCYzGtDhM0vTNKB9WRrdUyGDbv9syvvuH/CwT0UkONwkLQDkJs9F+lz+
         2XZ/Wb2S80ri0Qx63vDlfdQ1dGFada8RVUy4uLGadQQcug+PxdS0WR4dECTGIS0A15Bu
         1HJ3i3ylG9pL0rr7NzzjWQnzRHXUkXeO+cGQ/aUn/u8nCWKrmgOgq+p3j3RkOFmC08fP
         ORwQ==
In-Reply-To: <1362401911-14074-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org

Use more preferable function name which implies using a pseudo-random
number generator.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Patrick McHardy <kaber@trash.net>
Cc: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org
Cc: coreteam@netfilter.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org
---

No change from v2

 net/netfilter/nf_conntrack_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/nf_conntrack_core.c b/net/netfilter/nf_conntrack_core.c
index c8e001a..f84965a 100644
--- a/net/netfilter/nf_conntrack_core.c
+++ b/net/netfilter/nf_conntrack_core.c
@@ -264,7 +264,7 @@ static void death_by_event(unsigned long ul_conntrack)
 	if (nf_conntrack_event(IPCT_DESTROY, ct) < 0) {
 		/* bad luck, let's retry again */
 		ecache->timeout.expires = jiffies +
-			(random32() % net->ct.sysctl_events_retry_timeout);
+			(prandom_u32() % net->ct.sysctl_events_retry_timeout);
 		add_timer(&ecache->timeout);
 		return;
 	}
@@ -283,7 +283,7 @@ void nf_ct_dying_timeout(struct nf_conn *ct)
 	/* set a new timer to retry event delivery */
 	setup_timer(&ecache->timeout, death_by_event, (unsigned long)ct);
 	ecache->timeout.expires = jiffies +
-		(random32() % net->ct.sysctl_events_retry_timeout);
+		(prandom_u32() % net->ct.sysctl_events_retry_timeout);
 	add_timer(&ecache->timeout);
 }
 EXPORT_SYMBOL_GPL(nf_ct_dying_timeout);
-- 
1.8.1.2
