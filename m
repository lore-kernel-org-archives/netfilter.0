From: Art Haas <ahaas@airmail.net>
Subject: [PATCH] C99 initializers for net/ipv4/netfilter files
Date: Wed, 12 Feb 2003 20:07:06 -0600
Sender: linux-net-owner@vger.kernel.org
Message-ID: <20030213020706.GB23898@debian>
Mime-Version: 1.0
Return-path: <linux-net-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-net@vger.kernel.org
Cc: netfilter@lists.netfilter.org

Hi.

These two patches switches the files to use C99 initializers to improve
readability and remove warnings if '-W' is used.

Art Haas

===== net/ipv4/netfilter/ip_queue.c 1.9 vs edited =====
--- 1.9/net/ipv4/netfilter/ip_queue.c	Fri Feb  7 03:51:46 2003
+++ edited/net/ipv4/netfilter/ip_queue.c	Wed Feb 12 17:07:21 2003
@@ -586,19 +586,37 @@
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
-	{NET_IPV4, "ipv4", NULL, 0, 0555, ipq_table, 0, 0, 0, 0, 0},
-	{ 0 }
+	{
+		.ctl_name	= NET_IPV4,
+		.procname	= "ipv4",
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


===== net/ipv4/netfilter/ip_conntrack_core.c 1.15 vs edited =====
--- 1.15/net/ipv4/netfilter/ip_conntrack_core.c	Fri Jan 10 03:03:34 2003
+++ edited/net/ipv4/netfilter/ip_conntrack_core.c	Wed Feb 12 17:07:41 2003
@@ -1361,19 +1361,37 @@
 static struct ctl_table_header *ip_conntrack_sysctl_header;
 
 static ctl_table ip_conntrack_table[] = {
-	{ NET_IP_CONNTRACK_MAX, NET_IP_CONNTRACK_MAX_NAME, &ip_conntrack_max,
-	  sizeof(ip_conntrack_max), 0644,  NULL, proc_dointvec },
- 	{ 0 }
+	{
+		.ctl_name	= NET_IP_CONNTRACK_MAX,
+		.procname	= NET_IP_CONNTRACK_MAX_NAME,
+		.data		= &ip_conntrack_max,
+		.maxlen		= sizeof(ip_conntrack_max),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec
+	},
+ 	{ .ctl_name = 0 }
 };
 
 static ctl_table ip_conntrack_dir_table[] = {
-	{NET_IPV4, "ipv4", NULL, 0, 0555, ip_conntrack_table, 0, 0, 0, 0, 0},
-	{ 0 }
+	{
+		.ctl_name	= NET_IPV4,
+		.procname	= "ipv4",
+		.maxlen		= 0,
+		.mode		= 0555,
+		.child		= ip_conntrack_table
+	},
+	{ .ctl_name = 0 }
 };
 
 static ctl_table ip_conntrack_root_table[] = {
-	{CTL_NET, "net", NULL, 0, 0555, ip_conntrack_dir_table, 0, 0, 0, 0, 0},
-	{ 0 }
+	{
+		.ctl_name	= CTL_NET,
+		.procname	= "net",
+		.maxlen		= 0,
+		.mode		= 0555,
+		.child		= ip_conntrack_dir_table
+	},
+	{ .ctl_name = 0 }
 };
 #endif /*CONFIG_SYSCTL*/
 
-- 
They that can give up essential liberty to obtain a little temporary safety
deserve neither liberty nor safety.
 -- Benjamin Franklin, Historical Review of Pennsylvania, 1759
