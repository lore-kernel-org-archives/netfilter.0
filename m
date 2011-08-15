From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ERROR: iptables v1.4.12: u32: option "--u32" cannot be
 inverted.
Date: Mon, 15 Aug 2011 17:10:41 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1108151710350.923@frira.zrqbmnf.qr>
References: <CAA2qdGUgvpfyX9Xw1tvs95HanqrjjeO-okDDeiucrRQCZZo=8A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAA2qdGUgvpfyX9Xw1tvs95HanqrjjeO-okDDeiucrRQCZZo=8A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pandu Poluan <pandu@poluan.info>
Cc: netfilter@vger.kernel.org

On Monday 2011-08-15 16:12, Pandu Poluan wrote:

>What's wrong with my command here:
>
>    iptables -A rq_icmp -m u32 ! --u32 0x4&0x3fff=0x0  -m comment
>--comment "Fragmented" -g rq_drop_icmpattack
>
>it works without problem on Ubuntu 10.04, why won't it work with
>Gentoo? I keep getting the error:
>
>    iptables v1.4.12: u32: option "--u32" cannot be inverted.
>
>Rgds,
>-- 


parent 91ca4603f649a9b9fed4f2e31a8c005cdbdacd1e (v1.4.12-8-g91ca460)
commit 48ddf871ed3c8b31832f38d3d5ea14ac12f0c73d
Author: Jan Engelhardt <jengelh@medozas.de>
Date:   Mon Aug 15 17:06:20 2011 +0200

libxt_u32: fix missing allowance for inversion

Signed-off-by: Jan Engelhardt <jengelh@medozas.de>
---
 extensions/libxt_u32.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/extensions/libxt_u32.c b/extensions/libxt_u32.c
index 774d5ea..6d024fb 100644
--- a/extensions/libxt_u32.c
+++ b/extensions/libxt_u32.c
@@ -24,7 +24,7 @@ enum {
 
 static const struct xt_option_entry u32_opts[] = {
 	{.name = "u32", .id = O_U32, .type = XTTYPE_STRING,
-	 .flags = XTOPT_MAND},
+	 .flags = XTOPT_MAND | XTOPT_INVERT},
 	XTOPT_TABLEEND,
 };
 
-- 
# Created with git-export-patch
