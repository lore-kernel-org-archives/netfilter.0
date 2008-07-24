From: Laurent Pinchart <laurentp@cse-semaphore.com>
Subject: [PATCH] netfilter: Add support for ICMP Time Exceeded to the REJECT target
Date: Thu, 24 Jul 2008 16:30:46 +0200
Message-ID: <200807241630.46830.laurentp@cse-semaphore.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

When rejecting a packet, the REJECT target supports both ICMP Destination
Unreachable messages and TCP reset packets. This patch adds support for ICMP
Time Exceeded (TTL exceeded in transit). Those messages are useful to add
route discovery to layer 2 devices.

Signed-off-by: Laurent Pinchart <laurentp@cse-semaphore.com>
---
 include/linux/netfilter_ipv4/ipt_REJECT.h |    3 ++-
 net/ipv4/netfilter/ipt_REJECT.c           |    3 +++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/include/linux/netfilter_ipv4/ipt_REJECT.h b/include/linux/netfilter_ipv4/ipt_REJECT.h
index 4293a1a..ed6e14e 100644
--- a/include/linux/netfilter_ipv4/ipt_REJECT.h
+++ b/include/linux/netfilter_ipv4/ipt_REJECT.h
@@ -10,7 +10,8 @@ enum ipt_reject_with {
 	IPT_ICMP_NET_PROHIBITED,
 	IPT_ICMP_HOST_PROHIBITED,
 	IPT_TCP_RESET,
-	IPT_ICMP_ADMIN_PROHIBITED
+	IPT_ICMP_ADMIN_PROHIBITED,
+	IPT_ICMP_TIME_EXCEEDED
 };
 
 struct ipt_reject_info {
diff --git a/net/ipv4/netfilter/ipt_REJECT.c b/net/ipv4/netfilter/ipt_REJECT.c
index cb038c8..97a8452 100644
--- a/net/ipv4/netfilter/ipt_REJECT.c
+++ b/net/ipv4/netfilter/ipt_REJECT.c
@@ -167,6 +167,9 @@ static unsigned int reject(struct sk_buff **pskb,
 	case IPT_ICMP_ADMIN_PROHIBITED:
 		send_unreach(skb, ICMP_PKT_FILTERED);
 		break;
+	case IPT_ICMP_TIME_EXCEEDED:
+		icmp_send(skb, ICMP_TIME_EXCEEDED, ICMP_EXC_TTL, 0);
+		break;
 	case IPT_TCP_RESET:
 		send_reset(skb, hooknum);
 	case IPT_ICMP_ECHOREPLY:
-- 
1.5.0


-- 
Laurent Pinchart
CSE Semaphore Belgium

Chaussee de Bruxelles, 732A
B-1410 Waterloo
Belgium

T +32 (2) 387 42 59
F +32 (2) 387 42 75
