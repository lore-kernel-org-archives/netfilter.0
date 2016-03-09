From: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH] extensions: libxt_CONNMARK.c: Add translation to nft
Date: Wed,  9 Mar 2016 21:28:53 +0530
Message-ID: <1457539133-6410-1-git-send-email-bhumirks@gmail.com>
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:message-id;
        bh=IfwmDR7TCyEdoAdN9ZKQMMz1ctEH9euueYsLhwD1Hs4=;
        b=Hd/ZprNChkkLfpLLeKcb2XhAJsOE49Y7eNSzRsZiaiX3qHeS8RjwW2Ri/pH5ktyDr7
         KXcR+mPcepfOMVCk6iVTqieq10TJHHQcixYdq6CJHQdndDG5gFvSo8E2cqmWoUiFWiD1
         e3PmciRxcrBtN3ztO/XTUss2gl5RS8NQwDjHERMWh4jZrcnB0TE5oUQLfufodHvARrSJ
         YGSD31E/UCKrJBamC77L7bj4siW5U5GDezeraRNhiwOD2YmHmz9ZG4+McemaKBP9psyj
         EK/8t7gPU03VbrQLY+a6YMosCsPZKzB2YKJ6QwECxti0n6cVW6I3F3/QDmdWH9q7lDQr
         pEXw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bhumirks@gmail.com, shivanib134@gmail.com, pablo@netfilter.org, netfilter@vger.kernel.org

Add translation for target CONNMARK to nftables.

Examples:

$ sudo iptables-translate -t mangle -A PREROUTING -p tcp  --dport 80 -j CONNMARK --save-mark
nft add rule ip mangle PREROUTING tcp dport 80 counter mark save nfmask 0xffffffff ctmask 0xffffffff

$ sudo iptables-translate -t mangle -A PREROUTING -p tcp --dport 80 -j CONNMARK --restore-mark --mask 12
nft add rule ip mangle PREROUTING tcp dport 80 counter mark restore nfmask 0xc ctmask 0xc

$ sudo iptables-translate -t mangle -A PREROUTING -p tcp --dport 22 -j CONNMARK --set-mark 2
nft add rule ip mangle PREROUTING tcp dport 22 counter mark set 0x2/0xffffffff

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 extensions/libxt_CONNMARK.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/extensions/libxt_CONNMARK.c b/extensions/libxt_CONNMARK.c
index 42cf207..e2dbf8d 100644
--- a/extensions/libxt_CONNMARK.c
+++ b/extensions/libxt_CONNMARK.c
@@ -347,6 +347,32 @@ connmark_tg_save(const void *ip, const struct xt_entry_target *target)
 	}
 }
 
+static int
+connmark_tg_xlate(const struct xt_entry_target *target,
+		  struct xt_xlate *xl, int numeric)
+{
+	const struct xt_connmark_tginfo1 *info = (const void *)target->data;
+
+	switch (info->mode) {
+	case XT_CONNMARK_SET:
+		xt_xlate_add(xl, "mark set 0x%x/0x%x", info->ctmark, info->ctmask);
+		break;
+	case XT_CONNMARK_SAVE:
+		xt_xlate_add(xl,"mark save nfmask 0x%x ctmask 0x%x",
+			     info->nfmask, info->ctmask);
+		break;
+	case XT_CONNMARK_RESTORE:
+		xt_xlate_add(xl,"mark restore nfmask 0x%x ctmask 0x%x",
+			     info->nfmask, info->ctmask);
+		break;
+	default:
+		/* Should not happen */
+		break;
+	}
+
+	return 1;
+}
+
 static struct xtables_target connmark_tg_reg[] = {
 	{
 		.family        = NFPROTO_UNSPEC,
@@ -362,6 +388,7 @@ static struct xtables_target connmark_tg_reg[] = {
 		.x6_parse      = CONNMARK_parse,
 		.x6_fcheck     = connmark_tg_check,
 		.x6_options    = CONNMARK_opts,
+		.xlate	       = connmark_tg_xlate,
 	},
 	{
 		.version       = XTABLES_VERSION,
@@ -377,6 +404,7 @@ static struct xtables_target connmark_tg_reg[] = {
 		.x6_parse      = connmark_tg_parse,
 		.x6_fcheck     = connmark_tg_check,
 		.x6_options    = connmark_tg_opts,
+		.xlate	       = connmark_tg_xlate,
 	},
 };
 
-- 
1.9.1

