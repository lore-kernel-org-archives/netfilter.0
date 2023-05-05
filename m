From: Patryk Sondej <patryk.sondej@gmail.com>
Subject: [PATCH 2/2] netfilter: nfnetlink_queue: enable cgroup id socket info retrieval
Date: Fri,  5 May 2023 04:03:32 +0200
Message-ID: <20230505020332.9338-3-patryk.sondej@gmail.com>
References: <20230505020332.9338-1-patryk.sondej@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683252229; x=1685844229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgADu5aECiZ7xPmm6/GH32z65pbt6re30In465DSTfo=;
        b=RdCofevTQXxOppoOInWiqOyzSuOvlAGhRX01cEGrobvMvJ0rqTPBBY2bb0Axosb9CE
         b+QNBrN9emr358u32pxFbiiEjMcOLnWV4DIfuhg6K1Z2V7A/HrBrk21TrGTuVgORpj6m
         dY2C9goN+asdWb3OeqmONL0o9Ac+sK0ezNwJ9hS++gCGDIqF10jbo+zxk5a10xg2rmkR
         2gxi4DGw2G6IURAkVYOF7yV0CtXZji2TKZ4w2hZ4BtuC2b5u4myoNBzybnu2iKZoaBIb
         U5tuEKXqt92+VaVA1kw3+ckDKKtaF1JL08apkmyrppMblIAOGXxP5Q5aeaOrtTZE/9JB
         M3tQ==
In-Reply-To: <20230505020332.9338-1-patryk.sondej@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Patryk Sondej <patryk.sondej@gmail.com>

This enables associating a socket with a v2 cgroup. Useful for
applying a per-cgroup policy when processing packets in userspace.

Signed-off-by: Patryk Sondej <patryk.sondej@gmail.com>
---
 .../uapi/linux/netfilter/nfnetlink_queue.h    |  2 ++
 net/netfilter/nfnetlink_queue.c               | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/uapi/linux/netfilter/nfnetlink_queue.h b/include/uapi/linux/netfilter/nfnetlink_queue.h
index efcb7c044a74..681c02290d39 100644
--- a/include/uapi/linux/netfilter/nfnetlink_queue.h
+++ b/include/uapi/linux/netfilter/nfnetlink_queue.h
@@ -63,6 +63,8 @@ enum nfqnl_attr_type {
 	NFQA_L2HDR,			/* full L2 header */
 	NFQA_PRIORITY,			/* skb->priority */
 	NFQA_CGROUP_CLASSID,		/* __u32 cgroup classid */
+	NFQA_CGROUP_ID,			/* __u64 cgroup2 id of socket */
+	NFQA_PAD,			/* 64bit padding */
 
 	__NFQA_MAX
 };
diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
index e311462f6d98..c9c473d523c5 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -30,6 +30,7 @@
 #include <linux/netfilter/nf_conntrack_common.h>
 #include <linux/list.h>
 #include <linux/cgroup-defs.h>
+#include <linux/cgroup.h>
 #include <net/sock.h>
 #include <net/tcp_states.h>
 #include <net/netfilter/nf_queue.h>
@@ -302,6 +303,18 @@ static int nfqnl_put_sk_uidgid(struct sk_buff *skb, struct sock *sk)
 	return -1;
 }
 
+static int nfqnl_put_sk_cgroupid(struct sk_buff *skb, struct sock *sk)
+{
+#if IS_ENABLED(CONFIG_SOCK_CGROUP_DATA)
+	if (sk && sk_fullsock(sk)) {
+		struct cgroup *cgrp = sock_cgroup_ptr(&sk->sk_cgrp_data);
+		if (cgrp && nla_put_be64(inst->skb, NFQA_CGROUP_ID, cpu_to_be64(cgroup_id(cgrp)), NFQA_PAD))
+			return -1;
+	}
+#endif
+	return 0;
+}
+
 static int nfqnl_put_sk_classid(struct sk_buff *skb, struct sock *sk)
 {
 #if IS_ENABLED(CONFIG_CGROUP_NET_CLASSID)
@@ -420,6 +433,9 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 		+ nla_total_size(sizeof(u_int32_t))	/* priority */
 		+ nla_total_size(sizeof(struct nfqnl_msg_packet_hw))
 		+ nla_total_size(sizeof(u_int32_t))	/* skbinfo */
+#if IS_ENABLED(CONFIG_SOCK_CGROUP_DATA)
+		+ nla_total_size(sizeof(u_int64_t))	/* cgroup2 id */
+#endif
 #if IS_ENABLED(CONFIG_CGROUP_NET_CLASSID)
 		+ nla_total_size(sizeof(u_int32_t))	/* classid */
 #endif
@@ -616,6 +632,9 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
 	    nfqnl_put_sk_uidgid(skb, entskb->sk) < 0)
 		goto nla_put_failure;
 
+	if (nfqnl_put_sk_cgroupid(skb, entskb->sk) < 0)
+		goto nla_put_failure;
+
 	if (nfqnl_put_sk_classid(skb, entskb->sk) < 0)
 		goto nla_put_failure;
 
-- 
2.37.1 (Apple Git-137.1)

