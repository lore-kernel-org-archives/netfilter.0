From: Art Haas <ahaas@airmail.net>
Subject: [PATCH] C99 initializers for net/ipv6/netfilter/ip6_queue.c
Date: Wed, 12 Feb 2003 20:12:26 -0600
Sender: linux-net-owner@vger.kernel.org
Message-ID: <20030213021226.GD23898@debian>
Mime-Version: 1.0
Return-path: <linux-net-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-net@vger.kernel.org
Cc: netfilter@lists.netfilter.org

Hi.

This patch converts the file to use C99 initializers to improve
readability and remove warnings if '-W' is used.

Art Haas

===== net/ipv6/netfilter/ip6_queue.c 1.5 vs edited =====
--- 1.5/net/ipv6/netfilter/ip6_queue.c	Fri Feb  7 03:51:46 2003
+++ edited/net/ipv6/netfilter/ip6_queue.c	Wed Feb 12 17:07:08 2003
@@ -628,19 +628,37 @@
 static struct ctl_table_header *ipq_sysctl_header;
 
 static ctl_table ipq_table[] = {
-	{ NET_IPQ_QMAX, NET_IPQ_QMAX_NAME, &sysctl_maxlen,
-	  sizeof(sysctl_maxlen), 0644,  NULL, proc_dointvec },
- 	{ 0 }
+	{
+		.ctl_name	= NET_IPQ_QMAX,
+		.procname	= NET_IPQ_QMAX_NAME,
+		.data		= &sysctl_maxlen,
+		.maxlen		= sizeof(sysctl_maxlen),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec
+	},
+ 	{ .ctl_name = 0 }
 };
 
 static ctl_table ipq_dir_table[] = {
-	{NET_IPV6, "ipv6", NULL, 0, 0555, ipq_table, 0, 0, 0, 0, 0},
-	{ 0 }
+	{
+		.ctl_name	= NET_IPV6,
+		.procname	= "ipv6",
+		.maxlen		= 0,
+		.mode		= 0555,
+		.child		= ipq_table
+	},
+	{ .ctl_name = 0 }
 };
 
 static ctl_table ipq_root_table[] = {
-	{CTL_NET, "net", NULL, 0, 0555, ipq_dir_table, 0, 0, 0, 0, 0},
-	{ 0 }
+	{
+		.ctl_name	= CTL_NET,
+		.procname	= "net",
+		.maxlen		= 0,
+		.mode		= 0555,
+		.child		= ipq_dir_table
+	},
+	{ .ctl_name = 0 }
 };
 
 static int
-- 
They that can give up essential liberty to obtain a little temporary safety
deserve neither liberty nor safety.
 -- Benjamin Franklin, Historical Review of Pennsylvania, 1759
