From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 09/17] Net: irda: ircomm: Makefile: Remove deprecated kbuild goal defintions
Date: Sun, 21 Nov 2010 20:03:20 -0500
Message-ID: <1290387808-2239-10-git-send-email-tdent48227@gmail.com>
References: <1290387808-2239-1-git-send-email-tdent48227@gmail.com>
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=8ZZUb3cz22EIFhDLUt7XYpz5ymofaLDKu/rgHAkBQ/Y=;
        b=gboMBJma383vjyn6ycXF3BAeT2ZdGdzivm2kZsc2JRAiFuTpLniHheh2yyhsnLxfaG
         /u+vaYeDkv+L8BmqcGRDzn8A5UJWsSkrLJiAZOx+M9yHgrSEvScoNgPfct2eevL/dQIs
         LEYPJeuu8q+hsy7zeLLA0o9ixeItfbHkKQPaI=
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
 net/irda/ircomm/Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/irda/ircomm/Makefile b/net/irda/ircomm/Makefile
index 4868945..ab23b5b 100644
--- a/net/irda/ircomm/Makefile
+++ b/net/irda/ircomm/Makefile
@@ -4,5 +4,5 @@
 
 obj-$(CONFIG_IRCOMM) += ircomm.o ircomm-tty.o
 
-ircomm-objs := ircomm_core.o ircomm_event.o ircomm_lmp.o ircomm_ttp.o
-ircomm-tty-objs := ircomm_tty.o ircomm_tty_attach.o ircomm_tty_ioctl.o ircomm_param.o
+ircomm-y := ircomm_core.o ircomm_event.o ircomm_lmp.o ircomm_ttp.o
+ircomm-tty-y := ircomm_tty.o ircomm_tty_attach.o ircomm_tty_ioctl.o ircomm_param.o
-- 
1.7.3.2.245.g03276

