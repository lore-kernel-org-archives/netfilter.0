From: Stephanie Lockwood-Childs <sjl@vctlabs.com>
Subject: [PATCH] netfilter_queue: byte order of mark
Date: Fri, 7 Dec 2007 15:35:39 -0800 (PST)
Message-ID: <Pine.LNX.4.64.0712071304490.2760@dent.vctlabs.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

when trying to set marks with netfilter_queue library, I discovered there 
is a discrepency in byte ordering between the library and the 
nfnetlink_queue kernel model. The kernel code expects to receive the mark 
attribute in network order

net/netfilter/nfnetlink_queue.c
if (nfqa[NFQA_MARK-1])
 	entry->skb->mark = ntohl(*(__be32 *)
 				NFA_DATA(nfqa[NFQA_MARK-1]));

so netfilter_queue library should put the mark into network order when
sending it.

diff -ur libnetfilter_queue.orig/src/libnetfilter_queue.c libnetfilter_queue/src/libnetfilter_queue.c
--- netfilter/libnetfilter_queue/src/libnetfilter_queue.c	2007-12-05 11:26:24.000000000 -0800
+++ libnetfilter_queue-0.0.15/src/libnetfilter_queue.c	2007-12-05 16:47:44.000000000 -0800
@@ -333,8 +333,9 @@
  	/* add verdict header */
  	nfnl_addattr_l(nmh, sizeof(buf), NFQA_VERDICT_HDR, &vh, sizeof(vh));

+	/* kernel module expects mark to be in network byte order */
  	if (set_mark)
-		nfnl_addattr32(nmh, sizeof(buf), NFQA_MARK, mark);
+		nfnl_addattr32(nmh, sizeof(buf), NFQA_MARK, htonl(mark));

  	iov[0].iov_base = nmh;
  	iov[0].iov_len = NLMSG_TAIL(nmh) - (void *)nmh;
