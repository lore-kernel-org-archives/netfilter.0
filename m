From: Huang Weiyi <weiyi.huang@gmail.com>
Subject: netfilter: remove unused #include <version.h>
Date: Sun, 12 Oct 2008 23:12:51 +0800
Message-ID: <20081012231045.E7EC.WEIYI.HUANG@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:subject:cc
         :message-id:mime-version:content-type:content-transfer-encoding
         :x-mailer;
        bh=/Clstd/jXVwSjoUidDWhcFRr1S9loYFqJzTtevXQJ7E=;
        b=ULKrLbajFwRMSdbTrv5+JW+tk3ZQCRo9YhGbMhUqdiOsB+yb4V0Ze9S2Wd2HY8LuUt
         +0P7zGXOr9aooxJcb3l1WmUOlQLwxYslrilE3Mc73TEihQSimDMeTk7AN349H3gv9nwK
         Qz1W6HE97K9SLHTS8rKTuJGOVpEzxiUCwoFh4=
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kaber@trash.net
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org

The file(s) below do not use LINUX_VERSION_CODE nor KERNEL_VERSION.
  net/netfilter/nf_tproxy_core.c

This patch removes the said #include <version.h>.

Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>

diff --git a/net/netfilter/nf_tproxy_core.c b/net/netfilter/nf_tproxy_core.c
index fe34f4b..cdc97f3 100644
--- a/net/netfilter/nf_tproxy_core.c
+++ b/net/netfilter/nf_tproxy_core.c
@@ -10,7 +10,6 @@
  *
  */

-#include <linux/version.h>
 #include <linux/module.h>

 #include <linux/net.h>

