From: Denis Efremov <yefremov.denis@gmail.com>
Subject: [PATCH 07/21] netfilter: nf_nat: remove inline marking of EXPORT_SYMBOL functions
Date: Thu,  9 May 2013 13:19:38 +0400
Message-ID: <1368091192-10245-2-git-send-email-yefremov.denis@gmail.com>
References: <1368086241-9357-1-git-send-email-yefremov.denis@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=TX3Qfzi3jmY1//fTshdgToopZ1avkEqguhlrt8XdhXc=;
        b=AlZG1j04+coJKEjErF2yppRd5qifXMLDsEuSOZpctNjhESzjmulD8cJE8NyMQXGtmv
         ASGZzA5UvlvVsE8j0EEltb3SV4QVg+QorSrLUtwD/iG7Y1Y9OILmZLl4OvRpwD6/K8Xf
         qhBWshEShSviCaekWZFuAh0sFtgEJjCXK0EczRAFs3YOYQXds+Bhd2BBrIRqVw4r4oC3
         Y7MsFagY2tlS9hHLW6OX5MAgNM5yjhvxmShcwS+bwbSJ9HS10+uPZiGrPRVjaTVIBR33
         4y7ZrttSbCEm5uBLkDNxoTP8r3vHYrp1sgOunzkXtvoK3snJ+iegHZd7ccv8zgOLJ55M
         EPTQ==
In-Reply-To: <1368086241-9357-1-git-send-email-yefremov.denis@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: Denis Efremov <yefremov.denis@gmail.com>, Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>, netfilter@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org, ldv-project@linuxtesting.org

EXPORT_SYMBOL and inline directives are contradictory to each other.
The patch fixes this inconsistency.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Denis Efremov <yefremov.denis@gmail.com>
---
 net/netfilter/nf_nat_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netfilter/nf_nat_core.c b/net/netfilter/nf_nat_core.c
index 038eee5..38492e0 100644
--- a/net/netfilter/nf_nat_core.c
+++ b/net/netfilter/nf_nat_core.c
@@ -44,7 +44,7 @@ __nf_nat_l3proto_find(u8 family)
 	return rcu_dereference(nf_nat_l3protos[family]);
 }
 
-inline const struct nf_nat_l4proto *
+const struct nf_nat_l4proto *
 __nf_nat_l4proto_find(u8 family, u8 protonum)
 {
 	return rcu_dereference(nf_nat_l4protos[family][protonum]);
-- 
1.8.1.4
