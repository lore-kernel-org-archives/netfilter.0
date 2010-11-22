From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 13/17] Net: phonet: Makefile: Remove deprecated kbuild goal definitions
Date: Sun, 21 Nov 2010 20:03:24 -0500
Message-ID: <1290387808-2239-14-git-send-email-tdent48227@gmail.com>
References: <1290387808-2239-1-git-send-email-tdent48227@gmail.com>
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=IYw2usdsvs6Zlf+v6HZ5NiiJ7pH2f74ysB2MZ/R5q2g=;
        b=RMyD7RB+6IOOGRl41et9wd+4aWknYWPKGoRgDoXJEAy8QPUKUzmXGhCQZMzWFJs4bK
         xmOd4oNckPbHRw9RaCImHQKyfG7kikrl9UsTU8MJSKqtyUsb9cCkX5hyfkj4C7PJU308
         WHmwfjrUgY8krSZIX4D8SQLhoB2SUiizRNE7k=
In-Reply-To: <1290387808-2239-1-git-send-email-tdent48227@gmail.com>
Sender: netfilter-owner@vger.kernel.org
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
 net/phonet/Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/phonet/Makefile b/net/phonet/Makefile
index d62bbba..e10b1b1 100644
--- a/net/phonet/Makefile
+++ b/net/phonet/Makefile
@@ -1,6 +1,6 @@
 obj-$(CONFIG_PHONET) += phonet.o pn_pep.o
 
-phonet-objs := \
+phonet-y := \
 	pn_dev.o \
 	pn_netlink.o \
 	socket.o \
@@ -8,4 +8,4 @@ phonet-objs := \
 	sysctl.o \
 	af_phonet.o
 
-pn_pep-objs := pep.o pep-gprs.o
+pn_pep-y := pep.o pep-gprs.o
-- 
1.7.3.2.245.g03276

