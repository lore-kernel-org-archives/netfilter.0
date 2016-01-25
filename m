From: Rami Rosen <rami.rosen@intel.com>
Subject: [PATCH] extensions: fix cgroup2 help message in libxt_cgroup.c.
Date: Mon, 25 Jan 2016 08:09:39 +0200
Message-ID: <1453702179-21590-1-git-send-email-rami.rosen@intel.com>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: pablo@netfilter.org, tj@kernel.org, dborkman@redhat.com, jengelh@inai.de, Rami Rosen <rami.rosen@intel.com>

This patch fixes a typo in the cgroup2 cgroup_help_v1() method in extensions\ibxt_cgroup.c.

Signed-off-by: Rami Rosen <rami.rosen@intel.com>
---
 extensions/libxt_cgroup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/extensions/libxt_cgroup.c b/extensions/libxt_cgroup.c
index bea3c80..3be42ad 100644
--- a/extensions/libxt_cgroup.c
+++ b/extensions/libxt_cgroup.c
@@ -19,7 +19,7 @@ static void cgroup_help_v1(void)
 	printf(
 "cgroup match options:\n"
 "[!] --path path                 Recursively match path relative to cgroup2 root\n"
-"[!] --cgroup claasid            Match cgroup classid, can't be used with --path\n");
+"[!] --cgroup classid            Match cgroup classid, can't be used with --path\n");
 }
 
 static const struct xt_option_entry cgroup_opts_v0[] = {
-- 
1.9.3

