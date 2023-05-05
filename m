From: Patryk Sondej <patryk.sondej@gmail.com>
Subject: [PATCH 1/2] netfilter: nfnetlink_log: enable cgroup id socket info retrieval
Date: Fri,  5 May 2023 04:03:31 +0200
Message-ID: <20230505020332.9338-2-patryk.sondej@gmail.com>
References: <20230505020332.9338-1-patryk.sondej@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683252226; x=1685844226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbJduYgF7YJEuUTzpAoy9Z4HUMvLrdUs98l6wH9u04g=;
        b=N6Q+6CQcevZrGkyjo1rim8Bq1AkRWYQVpc3H8fKi/g0R8sLgE3bO2rQUiuQBTnVaWm
         EC/x0K7IpFdGtafyzmS4wSN48AH3c7oxVYRqFhHJsgt8m0zBXUyaQ9ZHA6zIcAmT9hQn
         u5BMC9thEPN0zytf4NWd84UaoiQVLX2PPfxywg6gAZvf3KndGPcvEhcdoKBOZWn+QUGl
         Pu8dC/PkM/V8v2C0Hqf46KM9d9i4ypCRFzR6ig6lbZk5cowPrIAg6A3lulfSwkl9kQe5
         bjK60Mps7RS0l2rW+UFPEkYhli0axPKVJCPcG9E9I5MRv0Um+ONqnKxmVeAJWMITd9s4
         LIvA==
In-Reply-To: <20230505020332.9338-1-patryk.sondej@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Patryk Sondej <patryk.sondej@gmail.com>

This enables associating a socket with a v2 cgroup. Useful processing
packets in userspace.

Signed-off-by: Patryk Sondej <patryk.sondej@gmail.com>
---
 include/uapi/linux/netfilter/nfnetlink_log.h |  2 ++
 net/netfilter/nfnetlink_log.c                | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/uapi/linux/netfilter/nfnetlink_log.h b/include/uapi/linux/netfilter/nfnetlink_log.h
index 0af9c113d665..5f4500e1c28c 100644
--- a/include/uapi/linux/netfilter/nfnetlink_log.h
+++ b/include/uapi/linux/netfilter/nfnetlink_log.h
@@ -65,6 +65,8 @@ enum nfulnl_attr_type {
 	NFULA_CT_INFO,                  /* enum ip_conntrack_info */
 	NFULA_VLAN,			/* nested attribute: packet vlan info */
 	NFULA_L2HDR,			/* full L2 header */
+	NFULA_CGROUP_ID,		/* __u64 cgroup2 id of socket */
+	NFULA_PAD,			/* 64bit padding */
 
 	__NFULA_MAX
 };
diff --git a/net/netfilter/nfnetlink_log.c b/net/netfilter/nfnetlink_log.c
index e57eb168ee13..5d11d070ad24 100644
--- a/net/netfilter/nfnetlink_log.c
+++ b/net/netfilter/nfnetlink_log.c
@@ -31,6 +31,7 @@
 #include <linux/security.h>
 #include <linux/list.h>
 #include <linux/slab.h>
+#include <linux/cgroup.h>
 #include <net/sock.h>
 #include <net/netfilter/nf_log.h>
 #include <net/netns/generic.h>
@@ -628,6 +629,15 @@ __build_packet_message(struct nfnl_log_net *log,
 			read_unlock_bh(&sk->sk_callback_lock);
 	}
 
+#if IS_ENABLED(CONFIG_SOCK_CGROUP_DATA)
+	/* cgroup2 */
+	if (sk && sk_fullsock(sk)) {
+		struct cgroup *cgrp = sock_cgroup_ptr(&sk->sk_cgrp_data);
+		if(cgrp && nla_put_be64(inst->skb, NFULA_CGROUP_ID, cpu_to_be64(cgroup_id(cgrp)), NFULA_PAD))
+			goto nla_put_failure;
+	}
+#endif
+
 	/* local sequence number */
 	if ((inst->flags & NFULNL_CFG_F_SEQ) &&
 	    nla_put_be32(inst->skb, NFULA_SEQ, htonl(inst->seq++)))
@@ -729,6 +739,9 @@ nfulnl_log_packet(struct net *net,
 		+ nla_total_size(sizeof(u_int32_t))	/* mark */
 		+ nla_total_size(sizeof(u_int32_t))	/* uid */
 		+ nla_total_size(sizeof(u_int32_t))	/* gid */
+#if IS_ENABLED(CONFIG_SOCK_CGROUP_DATA)
+		+ nla_total_size(sizeof(u_int64_t))	/* cgroup2 id */
+#endif
 		+ nla_total_size(plen)			/* prefix */
 		+ nla_total_size(sizeof(struct nfulnl_msg_packet_hw))
 		+ nla_total_size(sizeof(struct nfulnl_msg_packet_timestamp))
-- 
2.37.1 (Apple Git-137.1)

