From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: Re: iptables 1.3.7 doesn't properly test for condition patch
Date: Tue, 29 May 2007 06:34:37 -0400
Message-ID: <jb0o53l444mih7lnb29k4uba93jhsbfb3d@4ax.com>
References: <bgel53lion8nqn77p455vughf1071fgple@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Errors-To: netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org

> I have kernel 2.6.21, iptables 1.3.7, and pom-ng 20070527.  I run
> 
> ./runme --download --batch condition
> 
> and the patch applies successfully.  But when I build iptables, the
> condition extension isn't included.  This is because
> iptables-1.3.7/extensions/.condition-test tests for the existence of
> 
> $KERNEL_DIR/include/linux/netfilter_ipv4/ipt_condition.h
> 
> But the condition patch doesn't create that file any more; it now creates
> 
> $KERNEL_DIR/include/linux/netfilter/xt_condition.h

For the archive, Massimilano Hofer sent me the attached patch, which solves
the problem.  It seems that this patch should be merged into iptables.

Andrew.

diff -Nru iptables-1.3.5-20060922.orig/extensions/.condition-test iptables-1.3.5-20060922.new/extensions/.condition-test
--- iptables-1.3.5-20060922.orig/extensions/.condition-test	2002-11-02 16:00:15.000000000 +0100
+++ iptables-1.3.5-20060922.new/extensions/.condition-test	2006-09-26 12:56:01.000000000 +0200
@@ -1,3 +1,5 @@
 #!/bin/sh
 # True if condition is applied.
-[ -f $KERNEL_DIR/include/linux/netfilter_ipv4/ipt_condition.h ] && echo condition
+( [ -f $KERNEL_DIR/include/linux/netfilter_ipv4/ipt_condition.h ] ||
+  [ -f $KERNEL_DIR/include/linux/netfilter/xt_condition.h ] ) &&
+ echo condition
diff -Nru iptables-1.3.5-20060922.orig/extensions/.condition-test6 iptables-1.3.5-20060922.new/extensions/.condition-test6
--- iptables-1.3.5-20060922.orig/extensions/.condition-test6	2003-02-25 12:54:56.000000000 +0100
+++ iptables-1.3.5-20060922.new/extensions/.condition-test6	2006-09-26 12:55:23.000000000 +0200
@@ -1,3 +1,5 @@
 #!/bin/sh
 # True if condition6 is applied.
-[ -f $KERNEL_DIR/include/linux/netfilter_ipv6/ip6t_condition.h ] && echo condition
+( [ -f $KERNEL_DIR/include/linux/netfilter_ipv6/ip6t_condition.h ] ||
+  [ -f $KERNEL_DIR/include/linux/netfilter/xt_condition.h ] ) &&
+ echo condition
diff -Nru iptables-1.3.5-20060922.orig/extensions/libip6t_condition.c iptables-1.3.5-20060922.new/extensions/libip6t_condition.c
--- iptables-1.3.5-20060922.orig/extensions/libip6t_condition.c	2005-02-14 14:13:04.000000000 +0100
+++ iptables-1.3.5-20060922.new/extensions/libip6t_condition.c	2006-09-26 13:04:09.000000000 +0200
@@ -6,7 +6,14 @@
 #include <ip6tables.h>
 
 #include<linux/netfilter_ipv6/ip6_tables.h>
+
+#ifndef _X_TABLES_H
 #include<linux/netfilter_ipv6/ip6t_condition.h>
+#define condition_info condition6_info
+#define CONDITION_NAME_LEN CONDITION6_NAME_LEN
+#else
+#include<linux/netfilter/xt_condition.h>
+#endif
 
 
 static void
@@ -29,8 +36,12 @@
       const struct ip6t_entry *entry, unsigned int *nfcache,
       struct ip6t_entry_match **match)
 {
-	struct condition6_info *info =
-	    (struct condition6_info *) (*match)->data;
+	static const char * const forbidden_names[]={ "", ".", ".." };
+	const char *name;
+	int i;
+
+	struct condition_info *info =
+	    (struct condition_info *) (*match)->data;
 
 	if (c == 'X') {
 		if (*flags)
@@ -39,12 +50,26 @@
 
 		check_inverse(optarg, &invert, &optind, 0);
 
-		if (strlen(argv[optind - 1]) < CONDITION6_NAME_LEN)
-			strcpy(info->name, argv[optind - 1]);
-		else
+		name = argv[optind - 1];
+		/* We don't want a '/' in a proc file name. */
+		for (i=0; i < CONDITION_NAME_LEN && name[i] != '\0'; i++)
+			if (name[i] == '/')
+				exit_error(PARAMETER_PROBLEM,
+					   "Can't have a '/' in a condition name");
+
+		/* We can't handle file names longer than CONDITION_NAME_LEN and */
+		/* we want a NULL terminated string. */
+		if (i == CONDITION_NAME_LEN)
 			exit_error(PARAMETER_PROBLEM,
 				   "File name too long");
 
+		/* We don't want certain reserved names. */
+		for (i=0; i < sizeof(forbidden_names)/sizeof(char *); i++)
+			if(strcmp(name, forbidden_names[i])==0)
+				exit_error(PARAMETER_PROBLEM,
+					   "Forbidden condition name");
+
+		strcpy(info->name, name);
 		info->invert = invert;
 		*flags = 1;
 		return 1;
@@ -67,8 +92,8 @@
 print(const struct ip6t_ip6 *ip,
 		  const struct ip6t_entry_match *match, int numeric)
 {
-	const struct condition6_info *info =
-	    (const struct condition6_info *) match->data;
+	const struct condition_info *info =
+	    (const struct condition_info *) match->data;
 
 	printf("condition %s%s ", (info->invert) ? "!" : "", info->name);
 }
@@ -78,8 +103,8 @@
 save(const struct ip6t_ip6 *ip,
 		 const struct ip6t_entry_match *match)
 {
-	const struct condition6_info *info =
-	    (const struct condition6_info *) match->data;
+	const struct condition_info *info =
+	    (const struct condition_info *) match->data;
 
 	printf("--condition %s\"%s\" ", (info->invert) ? "! " : "", info->name);
 }
@@ -88,8 +113,8 @@
 static struct ip6tables_match condition = {
 	.name = "condition",
 	.version = IPTABLES_VERSION,
-	.size = IP6T_ALIGN(sizeof(struct condition6_info)),
-	.userspacesize = IP6T_ALIGN(sizeof(struct condition6_info)),
+	.size = IP6T_ALIGN(sizeof(struct condition_info)),
+	.userspacesize = IP6T_ALIGN(sizeof(struct condition_info)),
 	.help = &help,
 	.parse = &parse,
 	.final_check = &final_check,
diff -Nru iptables-1.3.5-20060922.orig/extensions/libip6t_condition.man iptables-1.3.5-20060922.new/extensions/libip6t_condition.man
--- iptables-1.3.5-20060922.orig/extensions/libip6t_condition.man	2006-01-30 09:50:09.000000000 +0100
+++ iptables-1.3.5-20060922.new/extensions/libip6t_condition.man	2006-09-26 09:31:40.000000000 +0200
@@ -1,4 +1,4 @@
 This matches if a specific /proc filename is '0' or '1'.
 .TP
 .BR "--condition " "[!] \fIfilename"
-Match on boolean value stored in /proc/net/ip6t_condition/filename file
+Match on boolean value stored in /proc/net/nf_condition/filename file
diff -Nru iptables-1.3.5-20060922.orig/extensions/libipt_condition.c iptables-1.3.5-20060922.new/extensions/libipt_condition.c
--- iptables-1.3.5-20060922.orig/extensions/libipt_condition.c	2005-02-14 14:13:04.000000000 +0100
+++ iptables-1.3.5-20060922.new/extensions/libipt_condition.c	2006-09-26 12:01:57.000000000 +0200
@@ -6,7 +6,12 @@
 #include <iptables.h>
 
 #include<linux/netfilter_ipv4/ip_tables.h>
+
+#ifndef _X_TABLES_H
 #include<linux/netfilter_ipv4/ipt_condition.h>
+#else
+#include<linux/netfilter/xt_condition.h>
+#endif
 
 
 static void
@@ -29,6 +34,10 @@
       const struct ipt_entry *entry, unsigned int *nfcache,
       struct ipt_entry_match **match)
 {
+	static const char * const forbidden_names[]={ "", ".", ".." };
+	const char *name;
+	int i;
+
 	struct condition_info *info =
 	    (struct condition_info *) (*match)->data;
 
@@ -39,12 +48,26 @@
 
 		check_inverse(optarg, &invert, &optind, 0);
 
-		if (strlen(argv[optind - 1]) < CONDITION_NAME_LEN)
-			strcpy(info->name, argv[optind - 1]);
-		else
+		name = argv[optind - 1];
+		/* We don't want a '/' in a proc file name. */
+		for (i=0; i < CONDITION_NAME_LEN && name[i] != '\0'; i++)
+			if (name[i] == '/')
+				exit_error(PARAMETER_PROBLEM,
+					   "Can't have a '/' in a condition name");
+
+		/* We can't handle file names longer than CONDITION_NAME_LEN and */
+		/* we want a NULL terminated string. */
+		if (i == CONDITION_NAME_LEN)
 			exit_error(PARAMETER_PROBLEM,
 				   "File name too long");
 
+		/* We don't want certain reserved names. */
+		for (i=0; i < sizeof(forbidden_names)/sizeof(char *); i++)
+			if(strcmp(name, forbidden_names[i])==0)
+				exit_error(PARAMETER_PROBLEM,
+					   "Forbidden condition name");
+
+		strcpy(info->name, name);
 		info->invert = invert;
 		*flags = 1;
 		return 1;
diff -Nru iptables-1.3.5-20060922.orig/extensions/libipt_condition.man iptables-1.3.5-20060922.new/extensions/libipt_condition.man
--- iptables-1.3.5-20060922.orig/extensions/libipt_condition.man	2006-01-30 09:50:09.000000000 +0100
+++ iptables-1.3.5-20060922.new/extensions/libipt_condition.man	2006-09-26 09:31:42.000000000 +0200
@@ -1,4 +1,4 @@
 This matches if a specific /proc filename is '0' or '1'.
 .TP
 .BI "--condition " "[!] \fIfilename\fP"
-Match on boolean value stored in /proc/net/ipt_condition/filename file
+Match on boolean value stored in /proc/net/nf_condition/filename file


