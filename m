From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: [PATCH 24/29] : Replace anon union by nf_conntrack_man_proto
Date: Tue, 25 Mar 2008 19:30:16 +0100
Message-ID: <da1926d4abbece0fd5c9e123c70d916cc6a150dd.1206469820.git.jengelh@computergmbh.de>
References: <alpine.LNX.1.10.0803251914060.2240@fbirervta.pbzchgretzou.qr>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0803251914060.2240@fbirervta.pbzchgretzou.qr>
In-Reply-To: <720350a38b1dbd43c907d5d81decd6edd6725d81.1206469820.git.jengelh@computergmbh.de>
References: <720350a38b1dbd43c907d5d81decd6edd6725d81.1206469820.git.jengelh@computergmbh.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kaber@trash.net
Cc: netfilter@vger.kernel.org, Jan Engelhardt <jengelh@computergmbh.de>

Signed-off-by: Jan Engelhardt <jengelh@computergmbh.de>
---
 include/net/netfilter/nf_conntrack_tuple.h |   28 +++++---------------
 1 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/include/net/netfilter/nf_conntrack_tuple.h b/include/net/netfilter/nf_conntrack_tuple.h
index 2c7e115..6db3df6 100644
--- a/include/net/netfilter/nf_conntrack_tuple.h
+++ b/include/net/netfilter/nf_conntrack_tuple.h
@@ -37,7 +37,12 @@ union nf_conntrack_man_proto
 		__be16 port;
 	} udp;
 	struct {
-		__be16 id;
+		union {
+			__be16 id;
+			struct {
+				__u8 type, code;
+			};
+		};
 	} icmp;
 	struct {
 		__be16 port;
@@ -64,26 +69,7 @@ struct nf_conntrack_tuple
 	/* These are the parts of the tuple which are fixed. */
 	struct {
 		union nf_inet_addr u3;
-		union {
-			/* Add other protocols here. */
-			__be16 all;
-
-			struct {
-				__be16 port;
-			} tcp;
-			struct {
-				__be16 port;
-			} udp;
-			struct {
-				u_int8_t type, code;
-			} icmp;
-			struct {
-				__be16 port;
-			} sctp;
-			struct {
-				__be16 key;
-			} gre;
-		} u;
+		union nf_conntrack_man_proto u;
 
 		/* The protocol. */
 		u_int8_t protonum;
-- 
1.5.4.4

