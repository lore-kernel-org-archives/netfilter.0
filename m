From: Cong Ding <dinggnu@gmail.com>
Subject: [PATCH] net: netfilter/xt_CT.c: fix uninitialized variable
Date: Tue, 15 Jan 2013 19:58:34 +0100
Message-ID: <1358276314-9536-1-git-send-email-dinggnu@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer;
        bh=GrxCywxohS3Lq0djz3UM9PNjDvB6yh4WZduYDS59g9Q=;
        b=MKDnxExclc+FSn2K2g5twlXuA3QNz9NX8TfDMS1kJRYQ7SNUMcmxqdycHv5NHG7xTP
         dKhwMaPWu2yQo2ssU7FttjDii3bI9sLBhA5PG8Aj+AAgzB5QEHQAeWzqNZMC7Rcr1PHX
         TlLhygb8dlZ5D4jzT4A5DgXIHyfIrMzwbtOjdBp0velaa70AwhrZ8uZOl/1nm0WG1L1T
         qdXOs/fGoKuNFfYCVH3zcTof5I3oUSIKheh9ryuqmKiS01f35OF0b1G2xSohJoQxt/JK
         a2tz6cVrx5ZFa1A4atcJceh+Zxcsyo4gMCyGFdtmgt34SnyIQfI1hLITc/GriWIQidXt
         P/gg==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Cong Ding <dinggnu@gmail.com>

If CONFIG_NF_CONNTRACK_ZONES is not defined, the variable ret might be
uninitialized when it goes to err1 through line 125 and 263 respectively.
So I change these goto err1 to return -EINVAL directly.

Signed-off-by: Cong Ding <dinggnu@gmail.com>
---
 net/netfilter/xt_CT.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/xt_CT.c b/net/netfilter/xt_CT.c
index 2a08430..941f600 100644
--- a/net/netfilter/xt_CT.c
+++ b/net/netfilter/xt_CT.c
@@ -122,7 +122,7 @@ static int xt_ct_tg_check_v0(const struct xt_tgchk_param *par)
 
 #ifndef CONFIG_NF_CONNTRACK_ZONES
 	if (info->zone)
-		goto err1;
+		return -EINVAL;
 #endif
 
 	ret = nf_ct_l3proto_try_module_get(par->family);
@@ -260,7 +260,7 @@ static int xt_ct_tg_check_v1(const struct xt_tgchk_param *par)
 
 #ifndef CONFIG_NF_CONNTRACK_ZONES
 	if (info->zone)
-		goto err1;
+		return -EINVAL;
 #endif
 
 	ret = nf_ct_l3proto_try_module_get(par->family);
-- 
1.7.10.4
