From: Hangbin Liu <liuhangbin@gmail.com>
Subject: [contrack-tools PATCH] build: do not compile nfct if we disabled cttimeout
Date: Thu,  8 May 2014 18:02:25 +0800
Message-ID: <1399543345-3634-1-git-send-email-liuhangbin@gmail.com>
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=9UA5yqMk09x33EUthHW7qdUDx5ChlxIzjs3c+5W5a30=;
        b=rzKEEI8qjRy5084+5LHE1PnHYNKkDO53KT3YLnuAqduRroJeyuy8Od+PycA35IkpMq
         Tq3Zznu3U8QEd+LC9CDKTU4p30nRXX9liqKNREC07r47UsunDUl/U03u6sJKL/NWFL3i
         N3wULUKGl+PQ6faCU32ognSfZkJWYYZVyt3YqdFarJbhT2LCfLC8V5KzVRO7azHGQq8/
         4WrHM6KFZYk/JZghjVM+y4EUX5FbWwaj8F/MPlC8ACQ5pzQ5TTB3DlJhIl+GP12F9Z2W
         d9qSttTBrnOJWMsOWP8n9asAEsi0yqb4N/4hCH1CaG2Mw5PweJmNQIBf/DbrxNBuwl+7
         2/fw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter dev <netfilter@vger.kernel.org>
Cc: Hangbin Liu <liuhangbin@gmail.com>

If we do not have libnetfilter_cttimeout and disabled cttimeout, conntrack-tools
will compile fail because nfct.c include nfnetlink_cttimeout.h. Fix it by only
compile nfct when we have enabled cttimeout
---
 src/Makefile.am | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/src/Makefile.am b/src/Makefile.am
index 1bc3622..3f8ddee 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -8,7 +8,10 @@ AM_YFLAGS = -d
 
 CLEANFILES = read_config_yy.c read_config_lex.c
 
-sbin_PROGRAMS = conntrack conntrackd nfct
+sbin_PROGRAMS = conntrack conntrackd
+if HAVE_CTTIMEOUT
+sbin_PROGRAMS += nfct
+endif
 
 conntrack_SOURCES = conntrack.c
 conntrack_LDADD = ../extensions/libct_proto_tcp.la ../extensions/libct_proto_udp.la ../extensions/libct_proto_udplite.la ../extensions/libct_proto_icmp.la ../extensions/libct_proto_icmpv6.la ../extensions/libct_proto_sctp.la ../extensions/libct_proto_dccp.la ../extensions/libct_proto_gre.la ../extensions/libct_proto_unknown.la ${LIBNETFILTER_CONNTRACK_LIBS} ${LIBMNL_LIBS} ${LIBNFNETLINK_LIBS}
-- 
1.8.1.4

