From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] netfilter: nf_conntrack_standalone: fix error return code
Date: Wed, 27 Mar 2013 21:57:10 +0800
Message-ID: <CAPgLHd-=NwowPW_A6-owg6NE=zOCaTOC6fqDZh3mCVFrWMcN6Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to:cc
         :content-type;
        bh=KLviZpQM9NRmC34RH3H1TZ6O99+jPvpBbhnKXFCjggw=;
        b=MLpf7avznD2TpHNWqnQmGZiS4E5+6JRFFYsP+V1aVyJcXiMstfVoBFgJghWMgTHynN
         ufV0RhLlgkOvR0wPtCDx4qwG1F2iVo8rVE6xi1URrUfS/ATsKqXcMfoIx14yQ89vO4EC
         O7w5KczdT2U7EbKDSaiLWLCr6Mxn+TQ7Ibthqnp/JjXIKgQjUvCFUxhppy0JeXOmA6lz
         rK1S/7+cJBxsYvmE7soJr7fIsgMQvmNH5KPVsqoEAvcFZ7Pu43/BKjWgNk1LHGHAsbum
         CK0JhXuGh7W/8GiXSG9mmRF0EDg7EEX218fSoXRKU6ZKGutrAq514SA4RZyZhkwKhNXV
         lNtg==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pablo@netfilter.org, kaber@trash.net
Cc: yongjun_wei@trendmicro.com.cn, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return a negative error code from the error handling
case instead of 0, as returned elsewhere in function
nf_conntrack_standalone_init().

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 net/netfilter/nf_conntrack_standalone.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/netfilter/nf_conntrack_standalone.c b/net/netfilter/nf_conntrack_standalone.c
index 6c69fbd..ebb67d3 100644
--- a/net/netfilter/nf_conntrack_standalone.c
+++ b/net/netfilter/nf_conntrack_standalone.c
@@ -572,6 +572,7 @@ static int __init nf_conntrack_standalone_init(void)
 		register_net_sysctl(&init_net, "net", nf_ct_netfilter_table);
 	if (!nf_ct_netfilter_header) {
 		pr_err("nf_conntrack: can't register to sysctl.\n");
+		ret = -ENOMEM;
 		goto out_sysctl;
 	}
 #endif


