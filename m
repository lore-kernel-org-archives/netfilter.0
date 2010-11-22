From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 04/17] Net: ceph: Makefile: remove deprecated kbuild goal definitions
Date: Sun, 21 Nov 2010 20:03:15 -0500
Message-ID: <1290387808-2239-5-git-send-email-tdent48227@gmail.com>
References: <1290387808-2239-1-git-send-email-tdent48227@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=kUyFDKeU4B4Kez+OMi0Iv50wBCpJIWVcxCbX8oYmBrs=;
        b=V5t92qiv87oWoxOMybPeqy7cPgpxbXLipluD1+oIRnsux/Cgu9mq3gn5LRVBpuese1
         MbIjjasLY4/66J8edBhBT6Q3lG8pASBBx/ubyyphblN19SKDV3JEwYIhuIUuiIblnNO7
         duTZaFFypTFJEV2zE4TuMhHfTzLpVYGRZHQso=
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
 net/ceph/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/ceph/Makefile b/net/ceph/Makefile
index aab1cab..153bdec 100644
--- a/net/ceph/Makefile
+++ b/net/ceph/Makefile
@@ -6,7 +6,7 @@ ifneq ($(KERNELRELEASE),)
 
 obj-$(CONFIG_CEPH_LIB) += libceph.o
 
-libceph-objs := ceph_common.o messenger.o msgpool.o buffer.o pagelist.o \
+libceph-y := ceph_common.o messenger.o msgpool.o buffer.o pagelist.o \
 	mon_client.o \
 	osd_client.o osdmap.o crush/crush.o crush/mapper.o crush/hash.o \
 	debugfs.o \
-- 
1.7.3.2.245.g03276

