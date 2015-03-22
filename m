From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: nft fails to add rules to chains
Date: Sun, 22 Mar 2015 19:31:06 +0100
Message-ID: <20150322183106.GA4150@salvia>
References: <550B3069.7080209@skarnet.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="TB36FDmn/VVEgNH/"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <550B3069.7080209@skarnet.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Laurent Bercot <ska-devel@skarnet.org>
Cc: netfilter@vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2015 at 09:24:09PM +0100, Laurent Bercot wrote:
> 
>  Hello,
> 
>  (Platform: Intel Atom (x86_64), Linux 3.19.1, musl 1.1.7,
> latest nftables/libnftnl/libmnl from git. All iptables modules
> out of the kernel, all necessary nftables modules in.)
> 
>  I can flush tables, create tables and create chains with nft
> without trouble; however, every time I try and add a rule to
> a chain, no matter what chain, no matter in what table, I get
> the following error:
> 
>  netlink.c:182: Memory allocation failure

I think this error is bogus. Please, apply this patch to libnftnl and
let us know.  For some reason __init is being ignored, are you using
gcc?


--TB36FDmn/VVEgNH/
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="x.patch"

diff --git a/src/expr.c b/src/expr.c
index 79782fa..db84d0b 100644
--- a/src/expr.c
+++ b/src/expr.c
@@ -29,8 +29,11 @@ struct nft_rule_expr *nft_rule_expr_alloc(const char *name)
 	struct expr_ops *ops;
 
 	ops = nft_expr_ops_lookup(name);
-	if (ops == NULL)
+	if (ops == NULL) {
+		fprintf(stderr, "libnftnl: Expression '%s' not supported\n",
+			name);
 		return NULL;
+	}
 
 	expr = calloc(1, sizeof(struct nft_rule_expr) + ops->alloc_len);
 	if (expr == NULL)

--TB36FDmn/VVEgNH/--
