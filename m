From: Mikael Pettersson <mikpe@it.uu.se>
Subject: [2.6.35 regression] iptables busted on Mac G5
Date: Thu, 5 Aug 2010 16:58:35 +0200
Message-ID: <19546.53659.970308.750410@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: netfilter@vger.kernel.org

The machine is a Mac G5 (ppc64) with Fedora 11 user-space,
most of it 32-bit.  Everything worked fine with kernel 2.6.34.

With kernel 2.6.35 however the machine comes up, seemingly with
networking operational according to the kernel log, but neither
NIC will actually send or receive anything including pings.  There
are no errors, just no traffic.

Initial investigation shows that 2.6.34-git5 was the last kernel
that worked, and from 2.6.34-git6 up to 2.6.35-git2 all kernels
malfunction as described (and 2.6.35-rc1 won't boot at all).

As a final experiment I disabled iptables (via chkconfig + reboot)
and that restored networking.  This is clearly not the solution.

I'll try to narrow it down further next week when I'm at the
machine's location again.  Meanwhile I would be grateful if
anyone has any ideas about what the issue might be.  I'll add
that a Mac G4 (ppc32) with similar kernel configuration and
user-space works fine with 2.6.35 and iptables.

/Mikael

--- config-2.6.34-git5	2010-08-05 16:02:30.000000000 +0200
+++ config-2.6.34-git6	2010-08-05 15:46:43.000000000 +0200
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Linux kernel version: 2.6.34-git5
-# Thu Aug  5 16:02:30 2010
+# Linux kernel version: 2.6.34-git6
+# Thu Aug  5 15:46:43 2010
 #
 CONFIG_PPC64=y
 
@@ -410,11 +410,22 @@
 # CONFIG_NF_CONNTRACK_SIP is not set
 # CONFIG_NF_CT_NETLINK is not set
 CONFIG_NETFILTER_XTABLES=m
-# CONFIG_NETFILTER_XT_TARGET_MARK is not set
+
+#
+# Xtables combined modules
+#
+# CONFIG_NETFILTER_XT_MARK is not set
+
+#
+# Xtables targets
+#
 # CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
 # CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
+
+#
+# Xtables matches
+#
 CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
-# CONFIG_NETFILTER_XT_MATCH_MARK is not set
 CONFIG_NETFILTER_XT_MATCH_STATE=m
 # CONFIG_IP_VS is not set
 
@@ -436,6 +447,7 @@
 # CONFIG_RDS is not set
 # CONFIG_TIPC is not set
 # CONFIG_ATM is not set
+# CONFIG_L2TP is not set
 # CONFIG_BRIDGE is not set
 # CONFIG_NET_DSA is not set
 # CONFIG_VLAN_8021Q is not set
@@ -451,6 +463,7 @@
 # CONFIG_IEEE802154 is not set
 # CONFIG_NET_SCHED is not set
 # CONFIG_DCB is not set
+CONFIG_RPS=y
 
 #
 # Network testing
@@ -467,6 +480,11 @@
 # CONFIG_NET_9P is not set
 
 #
+# CAIF Support
+#
+# CONFIG_CAIF is not set
+
+#
 # Device Drivers
 #
 
@@ -778,6 +796,7 @@
 CONFIG_TIGON3=m
 # CONFIG_BNX2 is not set
 # CONFIG_CNIC is not set
+# CONFIG_XILINX_LL_TEMAC is not set
 # CONFIG_QLA3XXX is not set
 # CONFIG_ATL1 is not set
 # CONFIG_ATL1E is not set
