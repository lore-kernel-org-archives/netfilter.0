From: Vasiliy Kulikov <segoon@openwall.com>
Subject: [PATCH] ipv4: netfilter: ip_tables: fix infoleak to userspace
Date: Thu, 10 Mar 2011 21:12:14 +0300
Message-ID: <1299780735-32607-1-git-send-email-segoon@openwall.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:from:to:cc:subject:date:message-id
         :x-mailer;
        bh=SbUFmikaGHl0gMj/swC9eZQlz0//TRkeJTObQ+oo8Hw=;
        b=UDzAtt9+z3EY4BJs1PCSLy5WhBVsQJ97ZwJ3aj3sgvKooaIpGhUp5u3W0+XxAr1EnI
         n27xPN7lNQOc79uEtkdTimA8r1gCyB0I9eE1Cz+5PKNx4aM8vXC2dga6E9tKUPIAr83m
         N3np++WqOxMOWc8jfWp0FTykB7mCmYPuexSOw=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: security@kernel.org, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org

Structures ipt_replace, compat_ipt_replace, and xt_get_revision are
copied from userspace.  Fields of these structs that are
zero-terminated strings are not checked.  When they are used as argument
to a format string containing "%s" in request_module(), some sensitive
information is leaked to userspace via argument of spawned modprobe
process.

The first and the third bugs were introduced before the git epoch; the
second was introduced in 2722971c (v2.6.17-rc1).  To trigger the bug
one should have CAP_NET_ADMIN.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested.

 net/ipv4/netfilter/ip_tables.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/net/ipv4/netfilter/ip_tables.c b/net/ipv4/netfilter/ip_tables.c
index ef7d7b9..b09ed0d 100644
--- a/net/ipv4/netfilter/ip_tables.c
+++ b/net/ipv4/netfilter/ip_tables.c
@@ -1262,6 +1262,7 @@ do_replace(struct net *net, const void __user *user, unsigned int len)
 	/* overflow check */
 	if (tmp.num_counters >= INT_MAX / sizeof(struct xt_counters))
 		return -ENOMEM;
+	tmp.name[sizeof(tmp.name)-1] = 0;
 
 	newinfo = xt_alloc_table_info(tmp.size);
 	if (!newinfo)
@@ -1807,6 +1808,7 @@ compat_do_replace(struct net *net, void __user *user, unsigned int len)
 		return -ENOMEM;
 	if (tmp.num_counters >= INT_MAX / sizeof(struct xt_counters))
 		return -ENOMEM;
+	tmp.name[sizeof(tmp.name)-1] = 0;
 
 	newinfo = xt_alloc_table_info(tmp.size);
 	if (!newinfo)
@@ -2036,6 +2038,7 @@ do_ipt_get_ctl(struct sock *sk, int cmd, void __user *user, int *len)
 			ret = -EFAULT;
 			break;
 		}
+		rev.name[sizeof(rev.name)-1] = 0;
 
 		if (cmd == IPT_SO_GET_REVISION_TARGET)
 			target = 1;
-- 
1.7.0.4
