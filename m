From: Florian Westphal <fw@strlen.de>
Subject: [PATCH nft] trace: do not remove icmp type from packet dump
Date: Mon,  8 Feb 2021 16:08:09 +0100
Message-ID: <20210208150809.1601-1-fw@strlen.de>
References: <CANf9dFNK+APd2Pn0twresoZic60q+cFJ+yxc77fggYZKsf-11A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <CANf9dFNK+APd2Pn0twresoZic60q+cFJ+yxc77fggYZKsf-11A@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, Florian Westphal <fw@strlen.de>, Martin Gignac <martin.gignac@gmail.com>

As of 0.9.8 the icmp type is marked as a protocol field, so its
elided in 'nft monitor trace' output:

   icmp code 0 icmp id 44380 ..

Restore it.  Unlike tcp, where 'tcp sport' et. al in the dump
will make the 'ip protocol tcp' redundant this case isn't obvious
in the icmp case:

  icmp type 8 code 0 id ...

Reported-by: Martin Gignac <martin.gignac@gmail.com>
Fixes: 98b871512c4677 ("src: add auto-dependencies for ipv4 icmp")
Signed-off-by: Florian Westphal <fw@strlen.de>
---
 src/netlink.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/netlink.c b/src/netlink.c
index ec2dad29ace1..c3887d5b6662 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -1859,7 +1859,9 @@ next:
 		    pctx->pbase == PROTO_BASE_INVALID) {
 			payload_dependency_store(pctx, stmt, base - stacked);
 		} else {
-			payload_dependency_kill(pctx, lhs, ctx->family);
+			/* Don't strip 'icmp type' from payload dump. */
+			if (pctx->icmp_type == 0)
+				payload_dependency_kill(pctx, lhs, ctx->family);
 			if (lhs->flags & EXPR_F_PROTOCOL)
 				payload_dependency_store(pctx, stmt, base - stacked);
 		}
-- 
2.26.2

