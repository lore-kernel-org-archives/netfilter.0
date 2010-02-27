From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 40/66] include/linux/netfilter/nf_conntrack_tuple_common.h: Checkpatch cleanup
Date: Sat, 27 Feb 2010 17:51:21 +0100
Message-ID: <1267289508-31031-41-git-send-email-andrea.gelmini@gelma.net>
References: <1267289508-31031-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=4uxCA/1UV5CtsKs+dCSGJalqATceoOvYhsm+D7GrYG4=;
        b=xUeh0ReoYEH17GKppsqCMO6ejqJaUEPPQZo2/lbnvBCNIwzYIkplxd0s1faDMalJpc
         MkJnCmv4WPhDwAV6+oeXBtwNJ1NOsdnJbLg6S+AdUmDzjM5BXZ/NSeLSy5YcpKWYE8/f
         vLpc+0YUwmcxVYvLRpT+bGT/R/Ik33VIdrxJw=
In-Reply-To: <1267289508-31031-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Andrea Gelmini <andrea.gelmini@gelma.net>, Patrick McHardy <kaber@trash.net>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org

include/linux/netfilter/nf_conntrack_tuple_common.h:5: ERROR: open brace '{' following enum go on the same line

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 .../linux/netfilter/nf_conntrack_tuple_common.h    |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/include/linux/netfilter/nf_conntrack_tuple_common.h b/include/linux/netfilter/nf_conntrack_tuple_common.h
index 8e145f0..2ea22b0 100644
--- a/include/linux/netfilter/nf_conntrack_tuple_common.h
+++ b/include/linux/netfilter/nf_conntrack_tuple_common.h
@@ -1,8 +1,7 @@
 #ifndef _NF_CONNTRACK_TUPLE_COMMON_H
 #define _NF_CONNTRACK_TUPLE_COMMON_H
 
-enum ip_conntrack_dir
-{
+enum ip_conntrack_dir {
 	IP_CT_DIR_ORIGINAL,
 	IP_CT_DIR_REPLY,
 	IP_CT_DIR_MAX
-- 
1.7.0.90.g251a4
