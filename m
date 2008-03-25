From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: [PATCH 16/29] : Explicitly initialize .priority in arptable_filter
Date: Tue, 25 Mar 2008 19:30:08 +0100
Message-ID: <3e6e83bd6c7f0bd55e73140ad4b5c5bb65afa64a.1206469820.git.jengelh@computergmbh.de>
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
 net/ipv4/netfilter/arptable_filter.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/net/ipv4/netfilter/arptable_filter.c b/net/ipv4/netfilter/arptable_filter.c
index 56c8db9..cd69fdc 100644
--- a/net/ipv4/netfilter/arptable_filter.c
+++ b/net/ipv4/netfilter/arptable_filter.c
@@ -70,18 +70,21 @@ static struct nf_hook_ops arpt_ops[] __read_mostly = {
 		.owner		= THIS_MODULE,
 		.pf		= AF_ARP,
 		.hooknum	= NF_ARP_IN,
+		.priority	= NF_IP_PRI_FILTER,
 	},
 	{
 		.hook		= arpt_hook,
 		.owner		= THIS_MODULE,
 		.pf		= AF_ARP,
 		.hooknum	= NF_ARP_OUT,
+		.priority	= NF_IP_PRI_FILTER,
 	},
 	{
 		.hook		= arpt_hook,
 		.owner		= THIS_MODULE,
 		.pf		= AF_ARP,
 		.hooknum	= NF_ARP_FORWARD,
+		.priority	= NF_IP_PRI_FILTER,
 	},
 };
 
-- 
1.5.4.4

