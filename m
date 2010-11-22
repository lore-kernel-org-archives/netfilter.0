From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 15/17] Net: rxrpc: Makefile: Remove deprecated kbuild goal definitions
Date: Sun, 21 Nov 2010 20:03:26 -0500
Message-ID: <1290387808-2239-16-git-send-email-tdent48227@gmail.com>
References: <1290387808-2239-1-git-send-email-tdent48227@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=WDI4q17lDBe2nCA7NjOQiQvxLz4ubhcCkaep7LrMdi0=;
        b=oGKRAR/QXJOged8U7VNq0xs22n/esGtyw1l+5KW/v5xhx0RmYXVEuz4jQ3h4H2vunC
         QcAbsydFlKjKrKA6gsjrNQofD3wLD3w/xlvBV7S/AMJkAthHPaKgwinjgDLXiGkSqh/J
         gu/DAQ7fJQAlCbiFqw8ELuloJ8eGAhDAunWFg=
In-Reply-To: <1290387808-2239-1-git-send-email-tdent48227@gmail.com>
Sender: netdev-owner@vger.kernel.org
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
 net/rxrpc/Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/rxrpc/Makefile b/net/rxrpc/Makefile
index c46867c..d1c3429 100644
--- a/net/rxrpc/Makefile
+++ b/net/rxrpc/Makefile
@@ -2,7 +2,7 @@
 # Makefile for Linux kernel RxRPC
 #
 
-af-rxrpc-objs := \
+af-rxrpc-y := \
 	af_rxrpc.o \
 	ar-accept.o \
 	ar-ack.o \
@@ -21,7 +21,7 @@ af-rxrpc-objs := \
 	ar-transport.o
 
 ifeq ($(CONFIG_PROC_FS),y)
-af-rxrpc-objs += ar-proc.o
+af-rxrpc-y += ar-proc.o
 endif
 
 obj-$(CONFIG_AF_RXRPC) += af-rxrpc.o
-- 
1.7.3.2.245.g03276

