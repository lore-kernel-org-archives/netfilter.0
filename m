From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] netfilter: nfnetlink_queue: fix error return code in nfnetlink_queue_init()
Date: Fri, 22 Mar 2013 19:28:18 +0800
Message-ID: <CAPgLHd-WKwgAUeXH9C7OvnEmJiqZt7CJh=tZVqm5Aq0DKcqVcA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to:cc
         :content-type;
        bh=KzYXOGZLhS3cBsFmddnjlFO8LbUgjfrtlKt4GWvHnZI=;
        b=Pd2znuihAI8emn0sTpLzGXuShkqtHODjrj4MDB4V8UYkMnPAOQgxgFDuJI22B2xk3l
         6xLAiKXj3v4OQLsetnLd5ioM+rdl3wL0/PjDH5tXuXiNsJ6F2kSRImfpbBy2Yyd9lLCJ
         BhoS7rYPxyTx1GYZu+ZqOvAGxCUnGLqVXQBMqPsOOI17Os/F9rxjDLW7TlHZvrbo1C8U
         zAjSrrMwEbBQXbS1BAOK9C3HR96M3w66Fl8wByd76xS/pBMWvyM1CvEw8WZUYS3a8XYY
         XrkZbdt51Egq0AHzQm9+uojuo2Vo3U3gOYuDTlwaaqhRPZo8frEPyNq7+DA3asMLmxe3
         2RBQ==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pablo@netfilter.org, kaber@trash.net
Cc: yongjun_wei@trendmicro.com.cn, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return a negative error code from the error handling
case instead of 0, as returned elsewhere in this function.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 net/netfilter/nfnetlink_queue_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nfnetlink_queue_core.c b/net/netfilter/nfnetlink_queue_core.c
index 1cb4854..42680b2 100644
--- a/net/netfilter/nfnetlink_queue_core.c
+++ b/net/netfilter/nfnetlink_queue_core.c
@@ -1062,8 +1062,10 @@ static int __init nfnetlink_queue_init(void)
 
 #ifdef CONFIG_PROC_FS
 	if (!proc_create("nfnetlink_queue", 0440,
-			 proc_net_netfilter, &nfqnl_file_ops))
+			 proc_net_netfilter, &nfqnl_file_ops)) {
+		status = -ENOMEM;
 		goto cleanup_subsys;
+	}
 #endif
 
 	register_netdevice_notifier(&nfqnl_dev_notifier);


