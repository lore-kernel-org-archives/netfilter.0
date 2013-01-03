From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH -v2 22/26] net/netfilter: rename random32() to prandom_u32()
Date: Thu,  3 Jan 2013 21:19:18 +0900
Message-ID: <1357215562-6288-23-git-send-email-akinobu.mita@gmail.com>
References: <1357215562-6288-1-git-send-email-akinobu.mita@gmail.com>
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=wKY+DDVah2zEOHvoSHaBZ86h+vfl83CpqkW0UTcUhCY=;
        b=rOevG0YQ/NqhRjXKWluMcDN1KcOO9HnbsbyVyKRy85WL6EszJgUVxX2X4qbcyJ5Xpt
         G1tY6AAsyrevaw8+/yK9i0z6uzxKDnDiWmw9KH2CzEXOeM3R69BGVVoYR6XW0ocFaOwP
         4oe59/Hr9kZ8cjjPhBDe6w1wEKOSAChkN//igBfaUckA8vm9rvUw/OL2T47j4X6mZYDp
         Q6pJTTqHdlvpjdkceeoUAq1RIVzPuKveFwIc2zSAYcL01sc6N1JZM3G5wAEoR+EzNBWa
         qThrbj1yTXST359+wbSVUwWaf3knRiBf5cpdxmFcM6Kr7lWDrvrUA2hwKNkXBRZV/4gV
         V4Ag==
In-Reply-To: <1357215562-6288-1-git-send-email-akinobu.mita@gmail.com>
Sender: netfilter-devel-owner@vger.kernel.org
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

* Change from v1
- leave net_random() callers as-is because that is a useful indirection

 net/netfilter/nf_conntrack_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/nf_conntrack_core.c b/net/netfilter/nf_conntrack_core.c
index 08cdc71..a8f5c7a 100644
--- a/net/netfilter/nf_conntrack_core.c
+++ b/net/netfilter/nf_conntrack_core.c
@@ -263,7 +263,7 @@ static void death_by_event(unsigned long ul_conntrack)
 	if (nf_conntrack_event(IPCT_DESTROY, ct) < 0) {
 		/* bad luck, let's retry again */
 		ecache->timeout.expires = jiffies +
-			(random32() % net->ct.sysctl_events_retry_timeout);
+			(prandom_u32() % net->ct.sysctl_events_retry_timeout);
 		add_timer(&ecache->timeout);
 		return;
 	}
@@ -282,7 +282,7 @@ void nf_ct_dying_timeout(struct nf_conn *ct)
 	/* set a new timer to retry event delivery */
 	setup_timer(&ecache->timeout, death_by_event, (unsigned long)ct);
 	ecache->timeout.expires = jiffies +
-		(random32() % net->ct.sysctl_events_retry_timeout);
+		(prandom_u32() % net->ct.sysctl_events_retry_timeout);
 	add_timer(&ecache->timeout);
 }
 EXPORT_SYMBOL_GPL(nf_ct_dying_timeout);
-- 
1.7.11.7

