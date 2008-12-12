From: Richard Kennedy <richard@rsk.demon.co.uk>
Subject: [PATCH] netfilter: remove padding from struct xt_match on 64bit
	builds
Date: Fri, 12 Dec 2008 13:39:50 +0000
Message-ID: <1229089190.2921.7.camel@castor.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758752AbYLLNkE@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: coreteam@netfilter.org
Cc: lkml <linux-kernel@vger.kernel.org>, netfilter@vger.kernel.org

reorder struct xt_match to remove 8 bytes of padding and make its size
128 bytes.

This saves a small amount of data space in each of the xt netfilter
modules and fits xt_match in one 128 byte cache line.

Signed-off-by: Richard Kennedy <richard@rsk.demon.co.uk>
----

patch against v2.6.28-rc8
Compiled & running on AMD X2 desktop machine.
regards
Richard



diff --git a/include/linux/netfilter/x_tables.h b/include/linux/netfilter/x_tables.h
index e52ce47..c7ee874 100644
--- a/include/linux/netfilter/x_tables.h
+++ b/include/linux/netfilter/x_tables.h
@@ -270,6 +270,7 @@ struct xt_match
 	struct list_head list;
 
 	const char name[XT_FUNCTION_MAXNAMELEN-1];
+	u_int8_t revision;
 
 	/* Return true or false: return FALSE and set *hotdrop = 1 to
            force immediate packet drop. */
@@ -302,7 +303,6 @@ struct xt_match
 	unsigned short proto;
 
 	unsigned short family;
-	u_int8_t revision;
 };
 
 /* Registration hooks for targets. */

