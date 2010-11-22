From: Tracey Dent <tdent48227-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/17] Net: bluetooth: Makefile: Remove deprecated kbuild goal definitions
Date: Sun, 21 Nov 2010 20:03:12 -0500
Message-ID: <1290387808-2239-2-git-send-email-tdent48227@gmail.com>
References: <1290387808-2239-1-git-send-email-tdent48227@gmail.com>
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=f7ocLH6XdK1sUzvbr/si5cJWMafWosvBE3SYcQbTNgI=;
        b=wYwcjmdqdC+Dru9DSDgJkM5R2zj7u6YnvOsJK7Lxnmssyi65UUgZDZUYgfbBZCsbfL
         chlxEeiiwG7oD12RO5w6fOMwigcbRNw7VuVc9WEa0GqeHXmRmTwY/AvDKZSRqlgh+m/p
         8i0pfEr0SnFZGV0KNIDVqji9vDukRERldFOWU=
In-Reply-To: <1290387808-2239-1-git-send-email-tdent48227-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
Cc: marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, padovan-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sjur.brandeland-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, socketcan-fJ+pQTUTwRTk1uMJSBkQmQ@public.gmane.org, urs.thuermann-l29pVbxQd1IUtdQbppsyvg@public.gmane.org, socketcan-core-0fE9KPoRgkgATYTw5x5z8w@public.gmane.org, sage-BnTBU8nroG7k1uMJSBkQmQ@public.gmane.org, ceph-devel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wang840925-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jlayton-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, kaber-dcUjhNyLwpNeoWH0uzbU5w@public.gmane.org, pekkas-UjJjq++bwZ7HOG6cAo2yLw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netfilter-devel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samuel-jcdQHdrhKHMdnm+yROfE0A@public.gmane.org, Tracey Dent <tdent48227-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Changed Makefile to use <modules>-y instead of <modules>-objs
because -objs is deprecated and not mentioned in
Documentation/kbuild/makefiles.txt.

Signed-off-by: Tracey Dent <tdent48227-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 net/bluetooth/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/bluetooth/Makefile b/net/bluetooth/Makefile
index d1e433f..7ca1f46 100644
--- a/net/bluetooth/Makefile
+++ b/net/bluetooth/Makefile
@@ -10,4 +10,4 @@ obj-$(CONFIG_BT_BNEP)	+= bnep/
 obj-$(CONFIG_BT_CMTP)	+= cmtp/
 obj-$(CONFIG_BT_HIDP)	+= hidp/
 
-bluetooth-objs := af_bluetooth.o hci_core.o hci_conn.o hci_event.o hci_sock.o hci_sysfs.o lib.o
+bluetooth-y := af_bluetooth.o hci_core.o hci_conn.o hci_event.o hci_sock.o hci_sysfs.o lib.o
-- 
1.7.3.2.245.g03276
