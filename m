From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 06/17] Net: econet: Makefile: Remove deprecated kbuild goal definitions
Date: Sun, 21 Nov 2010 20:03:17 -0500
Message-ID: <1290387808-2239-7-git-send-email-tdent48227@gmail.com>
References: <1290387808-2239-1-git-send-email-tdent48227@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=rx0c8f3gZsrreyz72/70goj4kOq0gLvhyCg2WOhcdkk=;
        b=YDkb7k7CJrJEbdtclN5u9i5sT4Ok+BBastDz0ofq8KupyiFz4NaHSVtsIChu/Cod8H
         y5ZqruRgiftpeIEdhQvTo6N0ba7ln8l2jgjctjslVLR2DS9Ot4XvGjrs+FNIvj5UD9xo
         +ca4oB6+IeHBRLyIP3xbYYWsMsLYzbMNmt4oo=
In-Reply-To: <1290387808-2239-1-git-send-email-tdent48227@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
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
 net/econet/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/econet/Makefile b/net/econet/Makefile
index 39f0a77..05fae8b 100644
--- a/net/econet/Makefile
+++ b/net/econet/Makefile
@@ -4,4 +4,4 @@
 
 obj-$(CONFIG_ECONET) += econet.o
 
-econet-objs := af_econet.o
+econet-y := af_econet.o
-- 
1.7.3.2.245.g03276
