From: Jonghwan Choi <jhbird.choi@gmail.com>
Subject: [PATCH 3.8-stable] netfilter: nfnetlink_queue: fix error return code in nfnetlink_queue_init()
Date: Sat, 13 Apr 2013 00:14:23 +0900
Message-ID: <1365779663-11862-1-git-send-email-jhbird.choi@samsung.com>
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer;
        bh=qltZ2HbC2n4ojNHT4YzM+p4P8HSJ+sOfY8y6PXLgY7k=;
        b=lqL8JrE95zVsLSPT3+dGYEQHXnKDy4iZ9h9DW5u5cW/2IEo2BjfWxlV2mNxcKe8BPw
         c/vsnzfToOhdSVj/jRAfQAAEqLwBU0CZ0q44hN6V7bDRAA/ws/WG1NSaoZ1apvtuQWO5
         lo8YmY8mDuz1vlmuaOjnEHnG+LrUwZcq27nY7pnNZDFI04etkeCQoRMX+dpTae1OnHWW
         Rx7cV+0/0Qsgluvs+3OIwNC1TeMj7HFnV41AKhgnQo5+c9T4FcW3xZlET7crNHM05aBk
         ThsPqlcbFWNpbqU5KykSCT6g3eLMfuM8+gN4xBfmQk4PoHPwG2FeP923IfHmqGIDP4bT
         r3Kg==
Sender: stable-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Pablo Neira Ayuso <pablo@netfilter.org>
Cc: stable@vger.kernel.org, netfilter@vger.kernel.org, Jonghwan Choi <jhbird.choi@samsung.com>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

This patch looks like it should be in the 3.8-stable tree, should we apply
it?

------------------

From: "Wei Yongjun <yongjun_wei@trendmicro.com.cn>"

commit 558724a5b2a73ad0c7638e21e8dffc419d267b6c upstream

Fix to return a negative error code from the error handling
case instead of 0, as returned elsewhere in this function.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 net/netfilter/nfnetlink_queue_core.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nfnetlink_queue_core.c b/net/netfilter/nfnetlink_queue_core.c
index 3158d87..39006c9 100644
--- a/net/netfilter/nfnetlink_queue_core.c
+++ b/net/netfilter/nfnetlink_queue_core.c
@@ -1064,8 +1064,10 @@ static int __init nfnetlink_queue_init(void)
 
 #ifdef CONFIG_PROC_FS
 	if (!proc_create("nfnetlink_queue", 0440,
-			 proc_net_netfilter, &nfqnl_file_ops))
+			 proc_net_netfilter, &nfqnl_file_ops)) {
+		status = -ENOMEM;
 		goto cleanup_subsys;
+	}
 #endif
 
 	register_netdevice_notifier(&nfqnl_dev_notifier);
-- 
1.7.10.4
