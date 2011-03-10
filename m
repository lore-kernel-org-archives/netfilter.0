From: Vasiliy Kulikov <segoon@openwall.com>
Subject: [PATCH] ipv4: netfilter: ipt_CLUSTERIP: fix buffer overflow
Date: Thu, 10 Mar 2011 21:12:19 +0300
Message-ID: <1299780740-32652-1-git-send-email-segoon@openwall.com>
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:from:to:cc:subject:date:message-id
         :x-mailer;
        bh=YE76ThPbUn8ByEa0SvralFQX4hHx5V1d56Pi8PO2/eU=;
        b=IQ47yDIJei7FAYEZr2t07ckTm88w7QzdmCPbW7ASXvELHDCp4okkGgl4p9V1wPvVAW
         FmCYnOGulIWs4GiiyLkexqaacyQJ71nDuSA/MRKiHZZSXMOUWEuKK1FhyI9Hw/iGCFNM
         OxFe7EDHBRTCuNOvbu6MLQdB7fFG8Z5bFqNkg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: security@kernel.org, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org

buffer string is copied from userspace.  It is not checked whether it is
zero terminated.  This may lead to overflow inside of simple_strtoul().

It was introduced before the git epoch.  Files "ipt_CLUSTERIP/*" are
root writable only by default, however, on some setups permissions might be
relaxed to e.g. network admin user.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested.

 net/ipv4/netfilter/ipt_CLUSTERIP.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/net/ipv4/netfilter/ipt_CLUSTERIP.c b/net/ipv4/netfilter/ipt_CLUSTERIP.c
index 403ca57..7aabf9a 100644
--- a/net/ipv4/netfilter/ipt_CLUSTERIP.c
+++ b/net/ipv4/netfilter/ipt_CLUSTERIP.c
@@ -666,6 +666,7 @@ static ssize_t clusterip_proc_write(struct file *file, const char __user *input,
 
 	if (copy_from_user(buffer, input, PROC_WRITELEN))
 		return -EFAULT;
+	buffer[sizeof(buffer)-1] = 0;
 
 	if (*buffer == '+') {
 		nodenum = simple_strtoul(buffer+1, NULL, 10);
-- 
1.7.0.4

