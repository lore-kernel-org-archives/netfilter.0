From: Takero Funaki <raphanus@gmail.com>
Subject: [PATCH] netfilter: xt_u32: Accept negative offset in AT operation
Date: Fri,  8 Aug 2014 02:24:37 +0900
Message-ID: <1407432277-2032-1-git-send-email-raphanus@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=PiJd6oGOW7c5EBLtFNWWFYgw/DZOdqN8LgGV0Yvpa1Q=;
        b=eWaa+irEYRuurQCMgLNJWq9VFQUPnJFQqz2DgrBoMB7Ko6D2jWlDwY3Ds4BgnMgfd4
         FICg3PafTUykgK1UpVzvgCFtvGXvbmuIYYK9laNGc/o/aQiokKysYy2Oms2S5T/ROc4g
         0OEmJpONJqOBfiGIka8TvEZGZSi5g7n6LUjmeu2OfkgPR1CUL4YU4ZWGFaL+0xrlnXM5
         X5C+othSlUQ4mCaEZAuyJ9AOegiFUcShBweyCcdcgclD6jlN1VeNsgKDIUXXko7PM+vR
         oEWIG99TRPut7HXJIot2TSAFAopS0PbOn8QTOGlALBJDMKdmNUuohvv54JZvD6z72V+l
         0+fQ==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: Takero Funaki <raphanus@gmail.com>, Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "open list:NETFILTER/IPTABLES" <netfilter-devel@vger.kernel.org>, "open list:NETFILTER/IPTABLES" <netfilter@vger.kernel.org>, "open list:NETFILTER/IPTABLES" <coreteam@netfilter.org>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

Remove unnecessary uint wraparound checks which prohibited two's
complement representation of negative number in "@" operation.
It is required to test last N bytes of variable length formats and to be
consistent with libxt parser which silently replaces negative number by
its compliment.

For example, --u32 '0&0xFFFF@-4=0' will read IPv4 total length header
then add complement of -4 to test if the last 4 bytes are 0. Previously,
it would never match as (total length)+0xFFFFFFFC always overflow.

Signed-off-by: Takero Funaki <raphanus@gmail.com>
---
 net/netfilter/xt_u32.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/netfilter/xt_u32.c b/net/netfilter/xt_u32.c
index a95b5034..9de339d 100644
--- a/net/netfilter/xt_u32.c
+++ b/net/netfilter/xt_u32.c
@@ -57,12 +57,12 @@ static bool u32_match_it(const struct xt_u32 *data,
 				val >>= number;
 				break;
 			case XT_U32_AT:
-				if (at + val < at)
-					return false;
 				at += val;
 				pos = number;
-				if (at + 4 < at || skb->len < at + 4 ||
-				    pos > skb->len - at - 4)
+				/* unsigned integer may wraparound
+				 * to represent negative offset
+				 */
+				if (at + pos > skb->len - 4)
 					return false;
 
 				if (skb_copy_bits(skb, at + pos, &n,
-- 
1.9.1
