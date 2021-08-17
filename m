From: Adam Casella <ihateprod@gmail.com>
Subject: [PATCH] conntrackd: cache: fix zone entry uniqueness in external cache
Date: Tue, 17 Aug 2021 13:31:25 -0700
Message-ID: <20210817203125.20128-1-adam.casella1984@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wit2Kh7CslS+sGiL7V2V65u+evKZ44Wi3SvSxMD1dgQ=;
        b=ls46qutHY3za8EwUYBpHDbDx2tv/7mPhF94K2fWtkdMQ03KYGUPlf3sigvPChroe4i
         f2YRamIycXwpr1Kej2ivU9YHrBydJWzHAkm3TpqhGFszStJ3miuyH0f/vJUo7LefskgS
         zhFXEdleIYsxP75l9SZnctn6iQrSy8UbVTe3S8X+uzTYhzDh7P4qyuHUn2EQuFI3L8r7
         4UD7UqTaZ8HjMio+s/2/5jGUAiWx/R826CCc6gyClaFmCLZuEkGMLitkj19iWYZHf7GM
         i2/0ksX+Fp4Fi3vXodOQtax9rpNkpdVuTPPb9k/lJ7H3RWgFQg2oJGtEduuAPX/HKkgV
         AcqQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Adam Casella <adam.casella1984@gmail.com>

In some use-cases, zone is used to differetiate conntrack state.  This preserves that uniqueness by adding zone into the cache in addtion to 5-tuple data
This preserves external-cache uniqueness per zone when synced.

Follow up fix to: https://git.netfilter.org/conntrack-tools/commit/?id=a08af5d26297eb85218a3c3a9e0991001a88cf10

Signed-off-by: Adam Casella <adam.casella1984@gmail.com>
---
 src/cache-ct.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/src/cache-ct.c b/src/cache-ct.c
index abcfde4..7e788d2 100644
--- a/src/cache-ct.c
+++ b/src/cache-ct.c
@@ -41,7 +41,8 @@ cache_hash4_ct(const struct nf_conntrack *ct, const struct hashtable *table)
 			  nfct_get_attr_u8(ct, ATTR_L4PROTO),
 		[3]	= nfct_get_attr_u16(ct, ATTR_PORT_SRC) << 16 |
 			  nfct_get_attr_u16(ct, ATTR_PORT_DST),
-	};
+                [4]     = nfct_get_attr_u16(ct, ATTR_ZONE),
+        };
 
 	/*
 	 * Instead of returning hash % table->hashsize (implying a divide)
@@ -50,13 +51,13 @@ cache_hash4_ct(const struct nf_conntrack *ct, const struct hashtable *table)
 	 * but using a multiply, less expensive than a divide. See:
 	 * http://www.mail-archive.com/netdev@vger.kernel.org/msg56623.html
 	 */
-	return ((uint64_t)jhash2(a, 4, 0) * table->hashsize) >> 32;
+	return ((uint64_t)jhash2(a, 5, 0) * table->hashsize) >> 32;
 }
 
 static uint32_t
 cache_hash6_ct(const struct nf_conntrack *ct, const struct hashtable *table)
 {
-	uint32_t a[10];
+	uint32_t a[11];
 
 	memcpy(&a[0], nfct_get_attr(ct, ATTR_IPV6_SRC), sizeof(uint32_t)*4);
 	memcpy(&a[4], nfct_get_attr(ct, ATTR_IPV6_DST), sizeof(uint32_t)*4);
@@ -64,8 +65,9 @@ cache_hash6_ct(const struct nf_conntrack *ct, const struct hashtable *table)
 	       nfct_get_attr_u8(ct, ATTR_ORIG_L4PROTO);
 	a[9] = nfct_get_attr_u16(ct, ATTR_ORIG_PORT_SRC) << 16 |
 	       nfct_get_attr_u16(ct, ATTR_ORIG_PORT_DST);
+        a[10] = nfct_get_attr_u16(ct, ATTR_ZONE);
 
-	return ((uint64_t)jhash2(a, 10, 0) * table->hashsize) >> 32;
+	return ((uint64_t)jhash2(a, 11, 0) * table->hashsize) >> 32;
 }
 
 static uint32_t
-- 
2.30.1 (Apple Git-130)

