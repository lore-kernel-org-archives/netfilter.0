From: Il Han <corone.il.han@gmail.com>
Subject: [PATCH] ip_tables.h: Add the const qualifier.
Date: Wed, 28 Sep 2011 16:32:31 +0900
Message-ID: <1317195151-5278-1-git-send-email-corone.il.han@gmail.com>
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=from:to:cc:subject:date:message-id:x-mailer;
        bh=MTCYR6ePDFHZ0+0w0nN+sbRzqpL5OSgPvQRX+eF8yME=;
        b=qxakuswrSbAOsYHxR0EdDUzI8g8AjcOHgRb/us6BUsyenhyWc3SbCrbkn7qAStKhh0
         cwKew0c4wmDqjjjXzHB5uLgdk2HXcOWhchh16Kfd5N11f7woSGaFjyApJW7IGr7FpEu7
         sU8Ij4aUZwztxRv+3jUzQ+GsXh+XlIt5cfauI=
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Rusty Russell <rusty@rustcorp.com.au>, James Morris <jmorris@namei.org>, Harald Welte <laforge@gnumonks.org>, Jozsef Kadlecsik <kadlec@blackh>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, Il Han <corone.il.han@gmail.com>

We need to add the const qualifier before the struct specifier,
because its value will not be changed.
Then, the following warning would be removed.

net/ipv4/netfilter/ip_tables.c:183: warning: passing argument 1 of 'ipt_get_target' discards qualifiers from pointer target type

Add it.

Signed-off-by: Il Han <corone.il.han@gmail.com>
---
 include/linux/netfilter_ipv4/ip_tables.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/netfilter_ipv4/ip_tables.h b/include/linux/netfilter_ipv4/ip_tables.h
index 64a5d95..6e319f4 100644
--- a/include/linux/netfilter_ipv4/ip_tables.h
+++ b/include/linux/netfilter_ipv4/ip_tables.h
@@ -224,7 +224,7 @@ struct ipt_get_entries {
 
 /* Helper functions */
 static __inline__ struct xt_entry_target *
-ipt_get_target(struct ipt_entry *e)
+ipt_get_target(const struct ipt_entry *e)
 {
 	return (void *)e + e->target_offset;
 }
-- 
1.7.4.1

