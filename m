From: Rashika Kheria <rashika.kheria@gmail.com>
Subject: [PATCH 12/13] net: Include appropriate header file in
 netfilter/nft_lookup.c
Date: Sun, 9 Feb 2014 01:39:20 +0530
Message-ID: <401aceca1fc3f95097624fe8433635491b39248d.1391888654.git.rashika.kheria@gmail.com>
References: <6f029c895035908595957fb16ab445c82793c77d.1391888654.git.rashika.kheria@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=q29h+0YnCNBLfJGM6huHAps3rCVkk0B9OEXe5UNrpFw=;
        b=HSRLbiyOzpZkGORrZPIuJRHsyLrJnrSCKANqaaNiOgGp4NewY8SuIzaOnDf7rj+lqO
         FEquY4srTmVD3ls6Qjy+Exatskt+wYlETtOREw3rl7efhYhKll+SmmxKqsW78WUiyDE0
         k/Icb7zmU9muXyAxww+nQGocHa7iZN7bOyQQcdFoFU2HH9GWR6yjQ7S9EijtMRtxvy72
         q0RfYQ2ZIEiWs0bmFOYNgJ55JNLTIzeRKWfu38DZbi68fnnSev1KcogGio3mLCyXv1st
         5SRCystCUZbpLL8r6OgTPPhRvJmlfhZTXt0r1YQbEfhjGGpBKVLSYn3Xy0KOgIPsT+0o
         Tr7A==
Content-Disposition: inline
In-Reply-To: <6f029c895035908595957fb16ab445c82793c77d.1391888654.git.rashika.kheria@gmail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-kernel@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, josh@joshtriplett.org

Include appropriate header file net/netfilter/nf_tables_core.h in
net/netfilter/nft_lookup.c because it has prototype declaration of
functions defined in net/netfilter/nft_lookup.c.

This eliminates the following warning in net/netfilter/nft_lookup.c:
net/netfilter/nft_lookup.c:133:12: warning: no previous prototype for =E2=
=80=98nft_lookup_module_init=E2=80=99 [-Wmissing-prototypes]
net/netfilter/nft_lookup.c:138:6: warning: no previous prototype for =E2=
=80=98nft_lookup_module_exit=E2=80=99 [-Wmissing-prototypes]

Signed-off-by: Rashika Kheria <rashika.kheria@gmail.com>
---
 net/netfilter/nft_lookup.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/net/netfilter/nft_lookup.c b/net/netfilter/nft_lookup.c
index 8a6116b..bb4ef4c 100644
--- a/net/netfilter/nft_lookup.c
+++ b/net/netfilter/nft_lookup.c
@@ -16,6 +16,7 @@
 #include <linux/netfilter.h>
 #include <linux/netfilter/nf_tables.h>
 #include <net/netfilter/nf_tables.h>
+#include <net/netfilter/nf_tables_core.h>
=20
 struct nft_lookup {
 	struct nft_set			*set;
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
