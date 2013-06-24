From: Gao feng <gaofeng@cn.fujitsu.com>
Subject: Re: v3.10-rc7 oops soon after boot
Date: Mon, 24 Jun 2013 17:12:15 +0800
Message-ID: <51C80D6F.6070907@cn.fujitsu.com>
References: <20130624084727.1494.qmail@science.horizon.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030006060801010902010903"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130624084727.1494.qmail@science.horizon.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: George Spelvin <linux@horizon.com>
Cc: bp@alien8.de, kaber@trash.net, linux-kernel@vger.kernel.org, netfilter@vger.kernel.org, pablo@netfilter.org

This is a multi-part message in MIME format.
--------------030006060801010902010903
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

On 06/24/2013 04:47 PM, George Spelvin wrote:
>> This looks like ulog_timer in net/ipv4/netfilter/ipt_ULOG.c, judging by
>> your config.
> 
> Ah, yes, it's a firewall/router machine with multiple interfaces.
> Exploding based on packet arrivals could explain the variable timing
> during init script processing.
> 

Hi George,

Please try the patch below,
I think this bug is introduced by me :(

Thanks!

--------------030006060801010902010903
Content-Transfer-Encoding: 7bit
Content-Type: text/x-patch;
 name="0001-netfilter-ipt_ULOG-fix-incorrect-setting-of-ulog-tim.patch"
Content-Disposition: attachment;
 filename*0="0001-netfilter-ipt_ULOG-fix-incorrect-setting-of-ulog-tim.pa";
 filename*1="tch"

From f12c9178b881e0b21efd37b10a33059fd0544a40 Mon Sep 17 00:00:00 2001
From: Gao feng <gaofeng@cn.fujitsu.com>
Date: Mon, 24 Jun 2013 17:04:02 +0800
Subject: [PATCH] netfilter: ipt_ULOG: fix incorrect setting of ulog timer

The parameter of setup_timer should be &ulog->nlgroup[i].
the incorrect parameter will cause kernel panic in
ulog_timer.

Bug introducted in commit 355430671ad93546b34b4e91bdf720f3a704efa4
"netfilter: ipt_ULOG: add net namespace support for ipt_ULOG"

ebt_ULOG doesn't have this problem.

Reported-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Gao feng <gaofeng@cn.fujitsu.com>
---
 net/ipv4/netfilter/ipt_ULOG.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/netfilter/ipt_ULOG.c b/net/ipv4/netfilter/ipt_ULOG.c
index ff4b781..5200054 100644
--- a/net/ipv4/netfilter/ipt_ULOG.c
+++ b/net/ipv4/netfilter/ipt_ULOG.c
@@ -408,7 +408,8 @@ static int __net_init ulog_tg_net_init(struct net *net)
 	spin_lock_init(&ulog->lock);
 	/* initialize ulog_buffers */
 	for (i = 0; i < ULOG_MAXNLGROUPS; i++)
-		setup_timer(&ulog->ulog_buffers[i].timer, ulog_timer, i);
+		setup_timer(&ulog->ulog_buffers[i].timer, ulog_timer,
+			    (unsigned long)&ulog->nlgroup[i]);
 
 	ulog->nflognl = netlink_kernel_create(net, NETLINK_NFLOG, &cfg);
 	if (!ulog->nflognl)
-- 
1.8.1.4


--------------030006060801010902010903--
