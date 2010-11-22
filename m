From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 10/17] Net: irda: irlan: Makefile: Remove deprecated kbuild goal definitions
Date: Sun, 21 Nov 2010 20:03:21 -0500
Message-ID: <1290387808-2239-11-git-send-email-tdent48227@gmail.com>
References: <1290387808-2239-1-git-send-email-tdent48227@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=IdO/5M8qmMGMmrVe5x9/4Vw4uQ8na1ytZY8TPyB0f/o=;
        b=phiMgCyJ7NIVQtEiiInLV9GBrQjHuiRrl3ivWMjEL3dklgA67K6jTEUrW55Xg3K5x+
         IAjYn88Iz8A/9HAc8EnCyp0qwv5/DJxAfFTVImh0d26aWv71XAph5xWgh5osJFCkI83k
         CHYk603pYGdvu7SHGaKwjUK3jcj6VSRWcY+hw=
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
 net/irda/irlan/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/irda/irlan/Makefile b/net/irda/irlan/Makefile
index 77549bc..94eefbc 100644
--- a/net/irda/irlan/Makefile
+++ b/net/irda/irlan/Makefile
@@ -4,4 +4,4 @@
 
 obj-$(CONFIG_IRLAN) += irlan.o
 
-irlan-objs := irlan_common.o irlan_eth.o irlan_event.o irlan_client.o irlan_provider.o irlan_filter.o irlan_provider_event.o irlan_client_event.o
+irlan-y := irlan_common.o irlan_eth.o irlan_event.o irlan_client.o irlan_provider.o irlan_filter.o irlan_provider_event.o irlan_client_event.o
-- 
1.7.3.2.245.g03276

