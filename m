From: David Fabian <david.fabian@cldn.cz>
Subject: question about UNDEFINE/REDEFINE
Date: Mon, 22 Jan 2018 14:44:19 +0100
Message-ID: <2200580.RFSStH2qd4@voxel>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart13190643.81e5tvaz3h"
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cldn.cz; s=mail;
        t=1516628660; bh=mJ2ARVN/5IlAmUW+Oy88UF8qKhBopHYrfftFhGH80/Y=;
        h=From:To:Subject:Date;
        b=oo9VbNFQN13HWaIjQG6ldH/LD6LgmiM3Np29xOYu4e9xowuz9RC6MorV0qOAPH2HL
         7QXnfOXc5Og99IesheQTFpQTWDhiTH+w8d863t1bdpG6TCgcnKhmbBh34F6YjUtjft
         uTGCCh8tYcJhtRlO/tdJ4k4MMXAMzwlALvTEUK8AUIs6pDioHk73+0T4FW1T2Asi6r
         8Zv55fiDvIouwJxuZMoAmZzeV4CsCfz6vBmKyoCOGA42nQNH+Ewmfcb4R+UsoRK6Fg
         tFYHPt4+W/cEgsdr6ZOiBFn20pDZheQ0amY6aNJJsG8k04icYsgdZ7uRY0E6jUwTRz
         joiHgSJpVJQrw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

This is a multi-part message in MIME format.

--nextPart13190643.81e5tvaz3h
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hello,

we have a firewall written in bash (using iptables) that is organized by 
customer VLANs. Each VLAN has its own set of bash variables holding things 
like uplink iface names, gateway IPs, etc. We want to rewrite the firewall to 
nftables but are stuck on the fact that nft variables cannot be overridden in 
the same scope. We have each VLAN configuration in a separate file containing 
pre/post-routing, input, output and forward rules,and we include those files to 
a master firewall configuration. One solution is to rename all the variables 
with some VLAN specific (pre/su)ffix. But that is cumbersome.

I have made a small patch to nft which adds two new keywords - undefine and 
redefine. undefine simply undefines a variable from the current scope. redefine 
allows one to change a variable definition. The patch works against the latest 
fedora nft (version 0.7) but I believe it should work against master as well. 
I don't know how to properly send the patch to the project so I am attaching 
it here. I would like to know your opinion.

-- 
Best regards,

David Fabian
Cluster Design, s.r.o.

--nextPart13190643.81e5tvaz3h
Content-Disposition: attachment; filename="0001-Added-undefine-redefine-keywords.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0001-Added-undefine-redefine-keywords.patch"

From 43abd3a12670b54739f0a7f6500aa315b3905f08 Mon Sep 17 00:00:00 2001
From: David Fabian <david.fabian@bosson.cz>
Date: Mon, 22 Jan 2018 14:02:11 +0100
Subject: [PATCH] Added undefine/redefine keywords

---
 include/rule.h     |  1 +
 src/parser_bison.y | 23 +++++++++++++++++++++++
 src/rule.c         | 16 ++++++++++++++++
 src/scanner.l      |  2 ++
 4 files changed, 42 insertions(+)

diff --git a/include/rule.h b/include/rule.h
index b9b4a19..4524b4d 100644
--- a/include/rule.h
+++ b/include/rule.h
@@ -80,6 +80,7 @@ struct symbol {
 
 extern void symbol_bind(struct scope *scope, const char *identifier,
 			struct expr *expr);
+extern int symbol_unbind(struct scope *scope, const char *identifier);
 extern struct symbol *symbol_lookup(const struct scope *scope,
 				    const char *identifier);
 
diff --git a/src/parser_bison.y b/src/parser_bison.y
index deaaf06..4cc1b47 100644
--- a/src/parser_bison.y
+++ b/src/parser_bison.y
@@ -167,6 +167,8 @@ static void location_update(struct location *loc, struct location *rhs, int n)
 
 %token INCLUDE			"include"
 %token DEFINE			"define"
+%token REDEFINE			"redefine"
+%token UNDEFINE			"undefine"
 
 %token FIB			"fib"
 
@@ -661,6 +663,27 @@ common_block		:	INCLUDE		QUOTED_STRING	stmt_seperator
 				symbol_bind(scope, $2, $4);
 				xfree($2);
 			}
+			|       REDEFINE                identifier      '='     initializer_expr        stmt_seperator
+			{
+				struct scope *scope = current_scope(state);
+
+				/* ignore missing identifier */
+				symbol_unbind(scope, $2);
+				symbol_bind(scope, $2, $4);
+				xfree($2);
+			}
+			|       UNDEFINE                identifier      stmt_seperator
+			{
+				struct scope *scope = current_scope(state);
+
+				if (symbol_unbind(scope, $2) < 0) {
+					erec_queue(error(&@2, "undefined symbol '%s'", $2),
+						   state->msgs);
+					YYERROR;
+			}
+
+				xfree($2);
+			}
 			|	error		stmt_seperator
 			{
 				if (++state->nerrs == max_errors)
diff --git a/src/rule.c b/src/rule.c
index f1bb6cf..f97c8e5 100644
--- a/src/rule.c
+++ b/src/rule.c
@@ -447,6 +447,22 @@ void symbol_bind(struct scope *scope, const char *identifier, struct expr *expr)
 	list_add_tail(&sym->list, &scope->symbols);
 }
 
+int symbol_unbind(struct scope *scope, const char *identifier)
+{
+	struct symbol *sym;
+
+	if ((sym = symbol_lookup(scope, identifier)) == NULL)
+	{
+		return -1;
+	}
+	list_del(&sym->list);
+	xfree(sym->identifier);
+	expr_free(sym->expr);
+	xfree(sym);
+	return 0;
+}
+
+
 struct symbol *symbol_lookup(const struct scope *scope, const char *identifier)
 {
 	struct symbol *sym;
diff --git a/src/scanner.l b/src/scanner.l
index 625023f..2000554 100644
--- a/src/scanner.l
+++ b/src/scanner.l
@@ -231,6 +231,8 @@ addrstring	({macaddr}|{ip4addr}|{ip6addr})
 
 "include"		{ return INCLUDE; }
 "define"		{ return DEFINE; }
+"redefine"		{ return REDEFINE; }
+"undefine"		{ return UNDEFINE; }
 
 "describe"		{ return DESCRIBE; }
 
-- 
2.14.3


--nextPart13190643.81e5tvaz3h--

