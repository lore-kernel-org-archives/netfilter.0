From: Florian Westphal <fw@strlen.de>
Subject: Re: ct state vmap no longer works on 6.3 kernel
Date: Wed, 3 May 2023 10:19:20 +0200
Message-ID: <20230503081920.GA9674@breakpoint.cc>
References: <a2c6386f-d339-9774-387a-f20fa8aa28e6@rvf6.com>
 <ZFH86op04R2rWPbi@calendula>
 <03175e31-29bd-1588-1042-5931af102348@rvf6.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <03175e31-29bd-1588-1042-5931af102348@rvf6.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rvfg <i@rvf6.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

Rvfg <i@rvf6.com> wrote:
> On 5/3/23 14:19, Pablo Neira Ayuso wrote:
> > I don't see anything bad with this patch.
> > 
> > Did you enable conntrack logging to understand why conntrack is
> > marking your packets as invalid?
> > 
> > # sh -c 'echo 58 > /proc/sys/net/netfilter/nf_conntrack_log_invalid'
> > 
> > where 58 is ICMPv6.
> 
> Thanks for your reply. I tried enable conntrack logging. But nothing printed
> in dmesg. Actually on 6.2.13 kernel, those RA packets are untracked. Not
> invalid. Here's a trace on 6.2.13 kernel:

Thanks, the BREAK in the referenced patch is the problem.

Please give this fix a try:

diff --git a/net/netfilter/nft_ct_fast.c b/net/netfilter/nft_ct_fast.c
--- a/net/netfilter/nft_ct_fast.c
+++ b/net/netfilter/nft_ct_fast.c
@@ -15,10 +15,6 @@ void nft_ct_get_fast_eval(const struct nft_expr *expr,
 	unsigned int state;
 
 	ct = nf_ct_get(pkt->skb, &ctinfo);
-	if (!ct) {
-		regs->verdict.code = NFT_BREAK;
-		return;
-	}
 
 	switch (priv->key) {
 	case NFT_CT_STATE:
@@ -30,6 +26,16 @@ void nft_ct_get_fast_eval(const struct nft_expr *expr,
 			state = NF_CT_STATE_INVALID_BIT;
 		*dest = state;
 		return;
+	default:
+		break;
+	}
+
+	if (!ct) {
+		regs->verdict.code = NFT_BREAK;
+		return;
+	}
+
+	switch (priv->key) {
 	case NFT_CT_DIRECTION:
 		nft_reg_store8(dest, CTINFO2DIR(ctinfo));
 		return;
