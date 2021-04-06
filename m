From: Florian Westphal <fw@strlen.de>
Subject: [PATCH nft] evaluate: check if nat statement map specifies a transport header expr
Date: Tue,  6 Apr 2021 18:34:19 +0200
Message-ID: <20210406163419.13267-1-fw@strlen.de>
References: <20210406153338.GO13699@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20210406153338.GO13699@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, Florian Westphal <fw@strlen.de>, Henning Reich <henning.reich@gmail.com>

Importing the systemd nat table fails:

table ip io.systemd.nat {
 map map_port_ipport {
   type inet_proto . inet_service : ipv4_addr . inet_service
   elements = { tcp . 8088 : 192.168.162.117 . 80 }
 }
 chain prerouting {
   type nat hook prerouting priority dstnat + 1; policy accept;
    fib daddr type local dnat ip addr . port to meta l4proto . th dport map @map_port_ipport
 }
}
ruleset:9:48-59: Error: transport protocol mapping is only valid after transport protocol match

To resolve this (no transport header base specified), check if the
map itself contains a network base protocol expression.

This allows nft to import the ruleset.
Import still fails with same error if 'inet_service' is removed
from the map, as it should.

Reported-by: Henning Reich <henning.reich@gmail.com>
Signed-off-by: Florian Westphal <fw@strlen.de>
---
 src/evaluate.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/src/evaluate.c b/src/evaluate.c
index 85cf9e05b641..a6bb1792c58a 100644
--- a/src/evaluate.c
+++ b/src/evaluate.c
@@ -2971,12 +2971,48 @@ static int evaluate_addr(struct eval_ctx *ctx, struct stmt *stmt,
 				 expr);
 }
 
+static bool nat_evaluate_addr_has_th_expr(const struct expr *map)
+{
+	const struct expr *i, *concat;
+
+	if (!map || map->etype != EXPR_MAP)
+		return false;
+
+	concat = map->map;
+	if (concat ->etype != EXPR_CONCAT)
+		return false;
+
+	list_for_each_entry(i, &concat->expressions, list) {
+		enum proto_bases base;
+
+		if ((i->flags & EXPR_F_PROTOCOL) == 0)
+			continue;
+
+		switch (i->etype) {
+		case EXPR_META:
+			base = i->meta.base;
+			break;
+		case EXPR_PAYLOAD:
+			base = i->payload.base;
+			break;
+		default:
+			return false;
+		}
+
+		if (base == PROTO_BASE_NETWORK_HDR)
+			return true;
+	}
+
+	return false;
+}
+
 static int nat_evaluate_transport(struct eval_ctx *ctx, struct stmt *stmt,
 				  struct expr **expr)
 {
 	struct proto_ctx *pctx = &ctx->pctx;
 
-	if (pctx->protocol[PROTO_BASE_TRANSPORT_HDR].desc == NULL)
+	if (pctx->protocol[PROTO_BASE_TRANSPORT_HDR].desc == NULL &&
+	    !nat_evaluate_addr_has_th_expr(stmt->nat.addr))
 		return stmt_binary_error(ctx, *expr, stmt,
 					 "transport protocol mapping is only "
 					 "valid after transport protocol match");
-- 
2.26.3

