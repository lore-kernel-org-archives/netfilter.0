From: Florian Westphal <fw@strlen.de>
Subject: Re: Creating a map programmatically using the C library libnftnl
Date: Thu, 30 Mar 2023 18:09:54 +0200
Message-ID: <20230330160954.GA22225@breakpoint.cc>
References: <CAOg40qh_1Fse-qHwBMZW9mQdbMma9VPMbOkr6d1wpF9YeUYdFg@mail.gmail.com>
 <20230328150941.GB25361@breakpoint.cc>
 <CAOg40qhR5vXo=tkNThLTbZ3nK0MZDf=VwONarYBg4KFokYCqcg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOg40qhR5vXo=tkNThLTbZ3nK0MZDf=VwONarYBg4KFokYCqcg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kiernan George <kbg98@vt.edu>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Kiernan George <kbg98@vt.edu> wrote:
> I'm not sure how to take that example and modify it to create the type of
> map I mentioned in my initial request, or how to work in IPV6 for example.
> I could also use an example on how to add an element to a map
> programmatically. I see there is the nft-set-add, but it does not work on a
> map.

diff --git a/examples/nft-map-add.c b/examples/nft-map-add.c
--- a/examples/nft-map-add.c
+++ b/examples/nft-map-add.c
@@ -26,6 +26,16 @@
 #include <libmnl/libmnl.h>
 #include <libnftnl/set.h>
 
+/* See nftables/include/datatype.h. We should place these datatypes in
+ * a public header so third party applications still work with nftables.
+ */
+#define TYPE_BITS 6
+
+enum nft_key_types {
+        TYPE_IPADDR        = 7,
+        TYPE_INET_SERVICE  = 13,
+};
+
 static struct nftnl_set *setup_set(uint8_t family, const char *table,
 				 const char *name)
 {
@@ -40,14 +50,11 @@ static struct nftnl_set *setup_set(uint8_t family, const char *table,
 	nftnl_set_set_str(s, NFTNL_SET_TABLE, table);
 	nftnl_set_set_str(s, NFTNL_SET_NAME, name);
 	nftnl_set_set_u32(s, NFTNL_SET_FAMILY, family);
-	nftnl_set_set_u32(s, NFTNL_SET_KEY_LEN, 2);
-	/* See nftables/include/datatype.h, where TYPE_INET_SERVICE is 13. We
-	 * should place these datatypes in a public header so third party
-	 * applications still work with nftables.
-	 */
-	nftnl_set_set_u32(s, NFTNL_SET_KEY_TYPE, 13);
-	nftnl_set_set_u32(s, NFTNL_SET_DATA_LEN, 2);
-	nftnl_set_set_u32(s, NFTNL_SET_DATA_TYPE, 13);
+	nftnl_set_set_u32(s, NFTNL_SET_KEY_LEN, 8); /* two 32bit regs, one for ip address, one for inet_service */
+	/* Next line is ONLY needed so 'nft list ruleset' can pretty-print this */
+	// nftnl_set_set_u32(s, NFTNL_SET_KEY_TYPE, TYPE_IPADDR << TYPE_BITS | TYPE_INET_SERVICE);
+	nftnl_set_set_u32(s, NFTNL_SET_DATA_LEN, 4); /* one 32bit reg */
+	nftnl_set_set_u32(s, NFTNL_SET_DATA_TYPE, TYPE_IPADDR);
 	nftnl_set_set_u32(s, NFTNL_SET_ID, 1);
 	nftnl_set_set_u32(s, NFTNL_SET_FLAGS, NFT_SET_CONSTANT | NFT_SET_MAP);
