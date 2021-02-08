From: Florian Westphal <fw@strlen.de>
Subject: Re: Unable to create a chain called "trace"
Date: Mon, 8 Feb 2021 16:49:15 +0100
Message-ID: <20210208154915.GF16570@breakpoint.cc>
References: <CANf9dFMJN5ZsihtygUnEWB_9T=WLbEHrZY1a5mTqLgN7J39D5w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANf9dFMJN5ZsihtygUnEWB_9T=WLbEHrZY1a5mTqLgN7J39D5w@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Gignac <martin.gignac@gmail.com>
Cc: netfilter@vger.kernel.org, netfilter-devel <netfilter-devel@vger.kernel.org>

Martin Gignac <martin.gignac@gmail.com> wrote:

[ cc devel ]

> Out of curiosity, is there a reason why calling a chain "trace"
> results in an error?
> 
> This configuration:
> 
>   chain trace {
>     type filter hook prerouting priority -301;
>     ip daddr 24.153.88.9 ip protocol icmp meta nftrace set 1
>   }
> 
> Results in the following error when I try loading the ruleset:
> 
>   /etc/firewall/rules.nft:40:9-13: Error: syntax error, unexpected
> trace, expecting string
>   chain trace {
>         ^^^^^

grammar bug.

Pablo, Phil, others, can you remind me why we never did:

diff --git a/src/monitor.c b/src/monitor.c
--- a/src/monitor.c
+++ b/src/monitor.c
@@ -254,7 +254,7 @@ static int netlink_events_chain_cb(const struct nlmsghdr *nlh, int type,
 			chain_print_plain(c, &monh->ctx->nft->output);
 			break;
 		case NFT_MSG_DELCHAIN:
-			nft_mon_print(monh, "chain %s %s %s",
+			nft_mon_print(monh, "chain %s \"%s\" \"%s\"",
 				      family2str(c->handle.family),
 				      c->handle.table.name,
 				      c->handle.chain.name);
diff --git a/src/parser_bison.y b/src/parser_bison.y
--- a/src/parser_bison.y
+++ b/src/parser_bison.y
@@ -2395,6 +2395,7 @@ chain_policy		:	ACCEPT		{ $$ = NF_ACCEPT; }
 			;
 
 identifier		:	STRING
+			|	QUOTED_STRING
 			;
 
 string			:	STRING
diff --git a/src/rule.c b/src/rule.c
index e4bb6bae276a..77477e535f2e 100644
--- a/src/rule.c
+++ b/src/rule.c
@@ -1236,7 +1236,7 @@ static void chain_print_declaration(const struct chain *chain,
 	if (chain->flags & CHAIN_F_BINDING)
 		return;
 
-	nft_print(octx, "\tchain %s {", chain->handle.chain.name);
+	nft_print(octx, "\tchain \"%s\" {", chain->handle.chain.name);
 	if (nft_output_handle(octx))
 		nft_print(octx, " # handle %" PRIu64, chain->handle.handle.id);
 	if (chain->comment)
@@ -1297,7 +1297,7 @@ void chain_print_plain(const struct chain *chain, struct output_ctx *octx)
 	char priobuf[STD_PRIO_BUFSIZE];
 	int policy;
 
-	nft_print(octx, "chain %s %s %s", family2str(chain->handle.family),
+	nft_print(octx, "chain %s \"%s\" \"%s\"", family2str(chain->handle.family),
 		  chain->handle.table.name, chain->handle.chain.name);
 
 	if (chain->flags & CHAIN_F_BASECHAIN) {

?
