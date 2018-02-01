From: Eric Grunt <gruntblue@gmail.com>
Subject: How to add rules to ip6/inet tables without getting unknown [invalid
 type] with nft list?
Date: Thu, 1 Feb 2018 21:59:55 +0300
Message-ID: <CADB9fJHanmSUUhjrGt9SmM-9t_kFMFH6jApAGrSvo80rgvDnZw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=DIGkonKsaCEo2bVbsPS55LHW6Z9njL6Tudnss5UcltI=;
        b=ILV5+o5y/Miawiulob/eAtMy91qnkzaiJBGprFXZ2sUQXw+q6aZiVwI/jSbhV2EqKg
         Yewz3SgTp5GX1W3b52VwYIdVK566c8t829IU9pUrR3WkV5CdiO9hPsziIlQm+fPIb5Wu
         2ApbNzt2SIvd6cCKxijjm1saijhNILzwEfD1KmoHRBiL2UrmqlkNaR3wJraqrVTbG2Uq
         TejKTiA7Jw8EAv0oORN+2UxHS1JeRuozml+AWxC60GacFKbMu7C5irL6EbNKMkQ59vJS
         FHAx+D8XpYOkpbjtCzYkxzZCogDSqWNgyjxHYB6Yu3quV+rKrzAufRJbl/XzvnIzT7MM
         L+0A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

When modifying the example nft-rule-add.c to support family inet
and to add an accept rule instead of a counter [1],
it works as expected when operating on an ip table.

table ip filter {
        chain input {
                type filter hook input priority 0; policy accept;
                tcp dport ssh accept
        }
}

But not on an ip6 or inet table.

table ip6/inet filter {
        chain input {
                type filter hook input priority 0; policy accept;
                unknown unknown 0x6 [invalid type] unknown unknown
0x16 [invalid type] accept
        }
}

With the original nft-rule-add.c the results are similar.

table ip6/inet filter {
        chain input {
                type filter hook input priority 0; policy accept;
                unknown unknown 0x6 [invalid type] unknown unknown
0x16 [invalid type] counter packets 0 bytes 0
        }
}

Using the nft command line tool to add the rules, the results are as expected.

Are there additional flags needed in order to support ip6?
Also, is there more documentation on how to use libnftnl?


[1]

--- /tmp/nft-rule-add.c 2018-02-01 11:49:00.120002698 +0200
+++ nft-rule-add.c      2018-02-01 11:56:27.130002751 +0200
@@ -8,7 +8,6 @@
  *
  * This software has been sponsored by Sophos Astaro <http://www.sophos.com>
  */
-
 #include <stdlib.h>
 #include <time.h>
 #include <string.h>
@@ -66,16 +65,16 @@
        nftnl_rule_add_expr(r, e);
 }

-static void add_counter(struct nftnl_rule *r)
+static void add_accept(struct nftnl_rule *r)
 {
        struct nftnl_expr *e;
-
-       e = nftnl_expr_alloc("counter");
+       e=nftnl_expr_alloc("immediate");
        if (e == NULL) {
-               perror("expr counter oom");
+               perror("expr immediate oom");
                exit(EXIT_FAILURE);
        }
-
+       nftnl_expr_set_u32(e, NFTNL_EXPR_IMM_VERDICT, NF_ACCEPT);
+        nftnl_expr_set_u32(e, NFTNL_EXPR_IMM_DREG, NFT_REG_VERDICT);
        nftnl_rule_add_expr(r, e);
 }

@@ -112,7 +111,7 @@
                    offsetof(struct tcphdr, dest), sizeof(uint16_t));
        add_cmp(r, NFT_REG_1, NFT_CMP_EQ, &dport, sizeof(uint16_t));

-       add_counter(r);
+       add_accept(r);

        return r;
 }
@@ -137,8 +136,10 @@
                family = NFPROTO_IPV4;
        else if (strcmp(argv[1], "ip6") == 0)
                family = NFPROTO_IPV6;
+       else if (strcmp(argv[1], "inet") == 0)
+               family = NFPROTO_INET;
        else {
-               fprintf(stderr, "Unknown family: ip, ip6\n");
+               fprintf(stderr, "Unknown family: ip, ip6, inet\n");
                exit(EXIT_FAILURE);
        }
