From: Mike Mestnik <cheako911@yahoo.com>
Subject: There was some extra code I would hope none would try to use.
Date: Thu, 24 Feb 2005 20:53:23 -0800 (PST)
Message-ID: <20050225045323.19979.qmail@web31009.mail.mud.yahoo.com>
Mime-Version: 1.0
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "lists.netfilter.org netfilter" <netfilter@lists.netfilter.org>

There was some extra code I would hope none would try to use.

Basicaly for memmove(A, B, X) if A > B then
A(not B) will clober A else skb too small.

Notes:
A - B < X || skb too small.

--- ip_nat_helper.c.orig	2005-02-24 22:36:13.825645136 -0600
+++ ip_nat_helper.c	2005-02-24 22:38:16.677968744 -0600
@@ -101,7 +101,7 @@
 	BUG_ON(skb_is_nonlinear(skb));
 	data = (unsigned char *)skb->nh.iph + dataoff;
 
-	/* move post-replacement */
+	/* move post-replacement, rep_len < match_len or else. */
 	memmove(data + match_offset + rep_len,
 		data + match_offset + match_len,
 		skb->tail - (data + match_offset + match_len));
@@ -110,17 +110,10 @@
 	memcpy(data + match_offset, rep_buffer, rep_len);
 
 	/* update skb info */
-	if (rep_len > match_len) {
-		DEBUGP("ip_nat_mangle_packet: Extending packet by "
-			"%u from %u bytes\n", rep_len - match_len,
-		       skb->len);
-		skb_put(skb, rep_len - match_len);
-	} else {
-		DEBUGP("ip_nat_mangle_packet: Shrinking packet from "
-			"%u from %u bytes\n", match_len - rep_len,
-		       skb->len);
-		__skb_trim(skb, skb->len + rep_len - match_len);
-	}
+	DEBUGP("ip_nat_mangle_packet: Shrinking packet from "
+		"%u from %u bytes\n", match_len - rep_len,
+	       skb->len);
+	__skb_trim(skb, skb->len + rep_len - match_len);
 
 	/* fix IP hdr checksum information */
 	skb->nh.iph->tot_len = htons(skb->len);


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

