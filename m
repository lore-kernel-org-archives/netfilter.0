From: Aaron Sethman <androsyn@ratbox.org>
Subject: ip6tables on sparc64(and probably others as well)
Date: Tue, 18 Feb 2003 14:18:50 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.50.0302181417210.3329-100000@squeaker.ratbox.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


This patch is necessary to get ip6tables functioning properly on sparc64.
Not sure about other platforms however.

Regards,

Aaron
--- net/ipv6/netfilter/ip6_tables.c.orig	2002-11-28 18:53:15.000000000 -0500
+++ net/ipv6/netfilter/ip6_tables.c	2003-02-10 04:32:43.000000000 -0500
@@ -101,10 +101,8 @@
 	unsigned int hook_entry[NF_IP6_NUMHOOKS];
 	unsigned int underflow[NF_IP6_NUMHOOKS];

-	char padding[SMP_ALIGN((NF_IP6_NUMHOOKS*2+2)*sizeof(unsigned int))];
-
 	/* ip6t_entry tables: one per CPU */
-	char entries[0];
+	char entries[0] ____cacheline_aligned;;
 };

 static LIST_HEAD(ip6t_target);
@@ -1450,8 +1448,7 @@
 	int ret;
 	struct ip6t_table_info *newinfo;
 	static struct ip6t_table_info bootstrap
-		= { 0, 0, 0, { 0 }, { 0 }, { }, { } };
-
+		= { 0, 0, 0, { 0 }, { 0 }, { } };
 	MOD_INC_USE_COUNT;
 	newinfo = vmalloc(sizeof(struct ip6t_table_info)
 			  + SMP_ALIGN(table->table->size) * smp_num_cpus);

