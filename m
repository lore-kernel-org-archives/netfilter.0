From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 05/17] Net: dns_resolver: Makefile: Remove deprecated kbuild goal definitions
Date: Sun, 21 Nov 2010 20:03:16 -0500
Message-ID: <1290387808-2239-6-git-send-email-tdent48227@gmail.com>
References: <1290387808-2239-1-git-send-email-tdent48227@gmail.com>
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=19qQIBvFharmMlBEVYJU0u3PdiRpGVKJExaxEPkadj4=;
        b=n80ErXwymTjklRR9BwcCzPHV/gIU3HBQ3HLSVIfl+4ryjJP8PQglCT6PisZGSxfXjb
         jrvTAND3O5KnptvM6bw1TgEtPS8cI9EeybAgMSr+dNuSU6AtLK+UWRuqByzP8DduKKdV
         jzCZv56hx9puDD0/alAcsqb8rVaXEjuCsYoYo=
In-Reply-To: <1290387808-2239-1-git-send-email-tdent48227@gmail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: marcel@holtmann.org, padovan@profusion.mobi, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, sjur.brandeland@stericsson.com, socketcan@hartkopp.net, urs.thuermann@volkswagen.de, socketcan-core@lists.berlios.de, sage@newdream.net, ceph-devel@vger.kernel.org, wang840925@gmail.com, jlayton@redhat.com, kaber@trash.net, pekkas@netcore.fi, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, samuel@sortiz.org, Tracey Dent <tdent48227@gmail.com>

Changed Makefile to use <modules>-y instead of <modules>-objs
because -objs is deprecated and not mentioned in
Documentation/kbuild/makefiles.txt.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 net/dns_resolver/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/dns_resolver/Makefile b/net/dns_resolver/Makefile
index c0ef4e7..d5c13c2 100644
--- a/net/dns_resolver/Makefile
+++ b/net/dns_resolver/Makefile
@@ -4,4 +4,4 @@
 
 obj-$(CONFIG_DNS_RESOLVER) += dns_resolver.o
 
-dns_resolver-objs :=  dns_key.o dns_query.o
+dns_resolver-y :=  dns_key.o dns_query.o
-- 
1.7.3.2.245.g03276

