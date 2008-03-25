From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: [PATCH 19/29] : nf_nat: autoload IPv4 connection tracking
Date: Tue, 25 Mar 2008 19:30:11 +0100
Message-ID: <9f654a7c5d0f82bf78df3f0e5bf8e1cb68781c44.1206469820.git.jengelh@computergmbh.de>
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

Without this patch, the generic L3 tracker would kick in
if nf_conntrack_ipv4 was not loaded before nf_nat, which
would lead to translation problems with ICMP errors.

NAT does not make sense without IPv4 connection tracking
anyway, so just add a call to need_ipv4_conntrack().

Signed-off-by: Jan Engelhardt <jengelh@computergmbh.de>
---
 net/ipv4/netfilter/nf_nat_core.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/net/ipv4/netfilter/nf_nat_core.c b/net/ipv4/netfilter/nf_nat_core.c
index 9c8aa8d..37b7125 100644
--- a/net/ipv4/netfilter/nf_nat_core.c
+++ b/net/ipv4/netfilter/nf_nat_core.c
@@ -629,6 +629,8 @@ static int __init nf_nat_init(void)
 	size_t i;
 	int ret;
 
+	need_ipv4_conntrack();
+
 	ret = nf_ct_extend_register(&nat_extend);
 	if (ret < 0) {
 		printk(KERN_ERR "nf_nat_core: Unable to register extension\n");
-- 
1.5.4.4

