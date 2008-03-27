From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: PATCHES AGAIN...
Date: Thu, 27 Mar 2008 08:20:39 +0100
Message-ID: <47EB4AC7.5040202@freemail.hu>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030505080709080507030502"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Netfilter list <netfilter@vger.kernel.org>

This is a multi-part message in MIME format.
--------------030505080709080507030502
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

Hi list!

I have a "few" patches against the following setup:

Kernel: 2.6.24.4
iptables: 7424 svn
ipset: 7424 svn
patch-o-matic-ng: 7424 svn
chaostables: 66 svn
gcc: 4.3.1 20080309

"Changelog:"
patch-o-matic: recognise the latest iptables svn
iptables: remove the compiling warnings ( { .name = NULL } )
pom-patches: repair incompatible type warnings
etc. .... :-D

WorksForMe TM :D

To Jan Engelhardt:

I have seen a v0.8 version of your chaostables, but it is not included 
in the svn.
Would you update the repository?

Swifty


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="ip6tables.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ip6tables.c.patch"

--- ../iptables/ip6tables.c.orig	2008-03-10 13:08:02.000000000 +0100
+++ ../iptables/ip6tables.c	2008-03-10 14:09:13.000000000 +0100
@@ -100,36 +100,36 @@
 = { 'n', 's', 'd', 'p', 'j', 'v', 'x', 'i', 'o', '0', 'c'};
 
 static struct option original_opts[] = {
-	{ "append", 1, 0, 'A' },
-	{ "delete", 1, 0,  'D' },
-	{ "insert", 1, 0,  'I' },
-	{ "replace", 1, 0,  'R' },
-	{ "list", 2, 0,  'L' },
-	{ "flush", 2, 0,  'F' },
-	{ "zero", 2, 0,  'Z' },
-	{ "new-chain", 1, 0,  'N' },
-	{ "delete-chain", 2, 0,  'X' },
-	{ "rename-chain", 1, 0,  'E' },
-	{ "policy", 1, 0,  'P' },
-	{ "source", 1, 0, 's' },
-	{ "destination", 1, 0,  'd' },
-	{ "src", 1, 0,  's' }, /* synonym */
-	{ "dst", 1, 0,  'd' }, /* synonym */
-	{ "protocol", 1, 0,  'p' },
-	{ "in-interface", 1, 0, 'i' },
-	{ "jump", 1, 0, 'j' },
-	{ "table", 1, 0, 't' },
-	{ "match", 1, 0, 'm' },
-	{ "numeric", 0, 0, 'n' },
-	{ "out-interface", 1, 0, 'o' },
-	{ "verbose", 0, 0, 'v' },
-	{ "exact", 0, 0, 'x' },
-	{ "version", 0, 0, 'V' },
-	{ "help", 2, 0, 'h' },
-	{ "line-numbers", 0, 0, '0' },
-	{ "modprobe", 1, 0, 'M' },
-	{ "set-counters", 1, 0, 'c' },
-	{ 0 }
+	{ .name = "append", .has_arg = 1, .flag = 0, .val = 'A' },
+	{ .name = "delete", .has_arg = 1, .flag = 0, .val = 'D' },
+	{ .name = "insert", .has_arg = 1, .flag = 0, .val = 'I' },
+	{ .name = "replace", .has_arg = 1, .flag = 0, .val = 'R' },
+	{ .name = "list", .has_arg = 2, .flag = 0, .val = 'L' },
+	{ .name = "flush", .has_arg = 2, .flag = 0, .val = 'F' },
+	{ .name = "zero", .has_arg = 2, .flag = 0, .val = 'Z' },
+	{ .name = "new-chain", .has_arg = 1, .flag = 0, .val = 'N' },
+	{ .name = "delete-chain", .has_arg = 2, .flag = 0, .val = 'X' },
+	{ .name = "rename-chain", .has_arg = 1, .flag = 0, .val = 'E' },
+	{ .name = "policy", .has_arg = 1, .flag = 0, .val = 'P' },
+	{ .name = "source", .has_arg = 1, .flag = 0, .val = 's' },
+	{ .name = "destination", .has_arg = 1, .flag = 0, .val = 'd' },
+	{ .name = "src", .has_arg = 1, .flag = 0, .val = 's' }, /* synonym */
+	{ .name = "dst", .has_arg = 1, .flag = 0, .val = 'd' }, /* synonym */
+	{ .name = "protocol", .has_arg = 1, .flag = 0, .val = 'p' },
+	{ .name = "in-interface", .has_arg = 1, .flag = 0, .val = 'i' },
+	{ .name = "jump", .has_arg = 1, .flag = 0, .val = 'j' },
+	{ .name = "table", .has_arg = 1, .flag = 0, .val = 't' },
+	{ .name = "match", .has_arg = 1, .flag = 0, .val = 'm' },
+	{ .name = "numeric", .has_arg = 0, .flag = 0, .val = 'n' },
+	{ .name = "out-interface", .has_arg = 1, .flag = 0, .val = 'o' },
+	{ .name = "verbose", .has_arg = 0, .flag = 0, .val = 'v' },
+	{ .name = "exact", .has_arg = 0, .flag = 0, .val = 'x' },
+	{ .name = "version", .has_arg = 0, .flag = 0, .val = 'V' },
+	{ .name = "help", .has_arg = 2, .flag = 0, .val = 'h' },
+	{ .name = "line-numbers", .has_arg = 0, .flag = 0, .val = '0' },
+	{ .name = "modprobe", .has_arg = 1, .flag = 0, .val = 'M' },
+	{ .name = "set-counters", .has_arg = 1, .flag = 0, .val = 'c' },
+	{ .name = NULL }
 };
 
 /* we need this for ip6tables-restore. ip6tables-restore.c sets line to the
@@ -576,7 +576,7 @@
 
 	if (invert) {
 		unsigned int i;
-		for (i = 0; 1 << i != option; i++);
+		for (i = 0; (unsigned int)(1 << i) != option; i++);
 
 		if (!inverse_for_options[i])
 			exit_error(PARAMETER_PROBLEM,


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="ip6tables-restore.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ip6tables-restore.c.patch"

--- ../iptables/ip6tables-restore.c.orig	2008-03-10 14:20:19.000000000 +0100
+++ ../iptables/ip6tables-restore.c	2008-03-10 14:25:44.000000000 +0100
@@ -29,14 +29,14 @@
 
 /* Keeping track of external matches and targets.  */
 static struct option options[] = {
-	{ "binary", 0, 0, 'b' },
-	{ "counters", 0, 0, 'c' },
-	{ "verbose", 0, 0, 'v' },
-	{ "test", 0, 0, 't' },
-	{ "help", 0, 0, 'h' },
-	{ "noflush", 0, 0, 'n'},
-	{ "modprobe", 1, 0, 'M'},
-	{ 0 }
+	{ .name = "binary", .has_arg = 0, .flag = 0, .val = 'b' },
+	{ .name = "counters", .has_arg = 0, .flag = 0, .val = 'c' },
+	{ .name = "verbose", .has_arg = 0, .flag = 0, .val = 'v' },
+	{ .name = "test", .has_arg = 0, .flag = 0, .val = 't' },
+	{ .name = "help", .has_arg = 0, .flag = 0, .val = 'h' },
+	{ .name = "noflush", .has_arg = 0, .flag = 0, .val = 'n'},
+	{ .name = "modprobe", .has_arg = 1, .flag = 0, .val = 'M'},
+	{ .name = NULL }
 };
 
 static void print_usage(const char *name, const char *version) __attribute__((noreturn));
@@ -96,7 +96,7 @@
  * returns true if argument added, false otherwise */
 static int add_argv(char *what) {
 	DEBUGP("add_argv: %s\n", what);
-	if (what && ((newargc + 1) < sizeof(newargv)/sizeof(char *))) {
+	if (what && (((unsigned int)(newargc + 1)) < sizeof(newargv)/sizeof(char *))) {
 		newargv[newargc] = strdup(what);
 		newargc++;
 		return 1;


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="ip6tables-save.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ip6tables-save.c.patch"

--- ../iptables/ip6tables-save.c.orig	2008-03-10 14:10:27.000000000 +0100
+++ ../iptables/ip6tables-save.c	2008-03-10 14:14:11.000000000 +0100
@@ -24,11 +24,11 @@
 static int binary = 0, counters = 0;
 
 static struct option options[] = {
-	{ "binary", 0, 0, 'b' },
-	{ "counters", 0, 0, 'c' },
-	{ "dump", 0, 0, 'd' },
-	{ "table", 1, 0, 't' },
-	{ 0 }
+	{ .name = "binary", .has_arg = 0, .flag = 0, .val = 'b' },
+	{ .name = "counters", .has_arg = 0, .flag = 0, .val = 'c' },
+	{ .name = "dump", .has_arg = 0, .flag = 0, .val = 'd' },
+	{ .name = "table", .has_arg = 1, .flag = 0, .val = 't' },
+	{ .name = NULL }
 };
 
 


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="ipt_connlimit.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ipt_connlimit.c.patch"

--- ../patch-o-matic-ng/patchlets/connlimit/linux-2.6/net/ipv4/netfilter/ipt_connlimit.c.orig	2007-07-11 23:44:10.000000000 +0200
+++ ../patch-o-matic-ng/patchlets/connlimit/linux-2.6/net/ipv4/netfilter/ipt_connlimit.c	2008-03-15 21:03:35.000000000 +0100
@@ -95,8 +95,12 @@
 #else
 		struct nf_conn *found_ct = NULL;
 		conn = list_entry(lh, struct ipt_connlimit_conn, list);
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,23)
+		found = nf_conntrack_find_get(&conn->tuple);
+#else
 		found = nf_conntrack_find_get(&conn->tuple, ct);
 #endif
+#endif
 
 		 if (found != NULL 
 #ifndef CONFIG_NF_CONNTRACK_SUPPORT
@@ -178,19 +182,15 @@
 	return matches;
 }
 
-static int
+static bool
 match(const struct sk_buff *skb,
       const struct net_device *in,
       const struct net_device *out,
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
       const struct xt_match *match,
-#endif
       const void *matchinfo,
       int offset,
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,16)
       unsigned int protoff,
-#endif
-      int *hotdrop)
+      bool *hotdrop)
 {
 	const struct ipt_connlimit_info *info = matchinfo;
 	int connections, rv;
@@ -232,34 +232,16 @@
 	return rv;
 }
 
-static int checkentry(const char *tablename,
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,16)
+static bool checkentry(const char *tablename,
 		 const void *ip_void,
-#else
-		 const struct ipt_ip *ip,
-#endif
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
 		 const struct xt_match *match,
-#endif
 		 void *matchinfo,
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19)
-		 unsigned int matchsize,
-#endif
 		 unsigned int hook_mask)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,16)
 	const struct ipt_ip *ip = ip_void;
-#endif
 
 	struct ipt_connlimit_info *info = matchinfo;
 	int i;
-
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,17)
-	/* verify size */
-	if (matchsize != IPT_ALIGN(sizeof(struct ipt_connlimit_info)))
-		return 0;
-#endif
-
 	/* refuse anything but tcp */
 	if (ip->proto != IPPROTO_TCP)
 		return 0;
@@ -274,14 +256,8 @@
 }
 
 static void destroy(
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
 		    const struct xt_match *match,
-#endif
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19)
-		    void *matchinfo, unsigned int matchsize)
-#else
 		    void *matchinfo)
-#endif
 {
 	struct ipt_connlimit_info *info = matchinfo;
 	struct ipt_connlimit_conn *conn;
@@ -300,19 +276,11 @@
 	kfree(info->data);
 }
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
 static struct xt_match connlimit_match = {
-#else
-static struct ipt_match connlimit_match = { 
-#endif
 	.name		= "connlimit",
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
 	.family		= AF_INET,
-#endif
 	.match		= &match,
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
 	.matchsize	= sizeof(struct ipt_connlimit_info),
-#endif
 	.checkentry	= &checkentry,
 	.destroy	= &destroy,
 	.me		= THIS_MODULE
@@ -320,20 +288,12 @@
 
 static int __init init(void)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
 	return xt_register_match(&connlimit_match);
-#else
-	return ipt_register_match(&connlimit_match);
-#endif
 }
 
 static void __exit fini(void)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
 	xt_unregister_match(&connlimit_match);
-#else
-	ipt_unregister_match(&connlimit_match);
-#endif
 }
 
 module_init(init);


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="ipt_ipp2p.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ipt_ipp2p.c.patch"

--- ../patch-o-matic-ng/patchlets/ipp2p/linux-2.6/net/ipv4/netfilter/ipt_ipp2p.c.orig	2007-07-11 23:45:12.000000000 +0200
+++ ../patch-o-matic-ng/patchlets/ipp2p/linux-2.6/net/ipv4/netfilter/ipt_ipp2p.c	2008-03-15 20:34:21.000000000 +0100
@@ -2,7 +2,6 @@
 #include <linux/modversions.h>
 #endif
 #include <linux/module.h>
-#include <linux/version.h>
 #include <linux/netfilter_ipv4/ip_tables.h>
 #include <linux/netfilter_ipv4/ipt_ipp2p.h>
 #include <net/tcp.h>
@@ -724,33 +723,19 @@
 };
 
 
-static int
+static bool
 match(const struct sk_buff *skb,
       const struct net_device *in,
       const struct net_device *out,
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
       const struct xt_match *match,
-#endif
       const void *matchinfo,
       int offset,
-
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
-      const void *hdr,
-      u_int16_t datalen,
-#endif
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,16)
       unsigned int protoff,
-#endif
-
-      int *hotdrop)
+      bool *hotdrop)
 {
     const struct ipt_p2p_info *info = matchinfo;
     unsigned char  *haystack;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,22)
     struct iphdr *ip = ip_hdr(skb);
-#else
-    struct iphdr *ip = skb->nh.iph;
-#endif
     int p2p_result = 0, i = 0;
 //    int head_len;
     int hlen = ntohs(ip->tot_len)-(ip->ihl*4);	/*hlen = packet-data length*/
@@ -824,20 +809,11 @@
 
 
 
-static int
+static bool
 checkentry(const char *tablename,
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,16)
             const void *ip,
-#else
-            const struct ipt_ip *ip,
-#endif
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
             const struct xt_match *match,
-#endif
 	    void *matchinfo,
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19)
-	    unsigned int matchsize,
-#endif
 	    unsigned int hook_mask)
 {
         /* Must specify -p tcp */
@@ -850,51 +826,25 @@
 									    
 
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
 static struct xt_match ipp2p_match = {
-#else
-static struct ipt_match ipp2p_match = { 
-#endif
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
-	{ NULL, NULL }, 
-	"ipp2p", 
-	&match, 
-	&checkentry, 
-	NULL, 
-	THIS_MODULE
-#endif
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0)
 	.name		= "ipp2p",
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
 	.family		= AF_INET,
-#endif
 	.match		= &match,
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
 	.matchsize	= sizeof(struct ipt_p2p_info),
-#endif
 	.checkentry	= &checkentry,
 	.me		= THIS_MODULE,
-#endif
 };
 
 
 static int __init init(void)
 {
     printk(KERN_INFO "IPP2P v%s loading\n", IPP2P_VERSION);
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
     return xt_register_match(&ipp2p_match);
-#else
-    return ipt_register_match(&ipp2p_match);
-#endif
 }
 	
 static void __exit fini(void)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
     xt_unregister_match(&ipp2p_match);
-#else
-    ipt_unregister_match(&ipp2p_match);
-#endif
     printk(KERN_INFO "IPP2P v%s unloaded\n", IPP2P_VERSION);    
 }
 	


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="ipt_ipv4options.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ipt_ipv4options.c.patch"

--- ../patch-o-matic-ng/patchlets/ipv4options/linux-2.6/net/ipv4/netfilter/ipt_ipv4options.c.orig	2007-05-02 15:32:00.000000000 +0200
+++ ../patch-o-matic-ng/patchlets/ipv4options/linux-2.6/net/ipv4/netfilter/ipt_ipv4options.c	2007-09-13 13:08:45.000000000 +0200
@@ -18,6 +18,8 @@
 #include <linux/netfilter_ipv4/ip_tables.h>
 #include <linux/netfilter_ipv4/ipt_ipv4options.h>
 
+#include <linux/version.h>
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Fabrice Marie <fabrice@netfilter.org>");
 
@@ -32,7 +34,11 @@
       int *hotdrop)
 {
 	const struct ipt_ipv4options_info *info = matchinfo;   /* match info for rule */
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,22)
+	const struct iphdr *iph = ip_hdr(skb);
+#else
 	const struct iphdr *iph = skb->nh.iph;
+#endif
 	const struct ip_options *opt;
 
 	if (iph->ihl * 4 == sizeof(struct iphdr)) {
@@ -110,13 +116,17 @@
 	   const void *ip,
 	   const struct xt_match *match,
 	   void *matchinfo,
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19)
 	   unsigned int matchsize,
+#endif
 	   unsigned int hook_mask)
 {
 	const struct ipt_ipv4options_info *info = matchinfo;   /* match info for rule */
 	/* Check the size */
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,17)
 	if (matchsize != IPT_ALIGN(sizeof(struct ipt_ipv4options_info)))
 		return 0;
+#endif
 	/* Now check the coherence of the data ... */
 	if (((info->options & IPT_IPV4OPTION_MATCH_ANY_OPT) == IPT_IPV4OPTION_MATCH_ANY_OPT) &&
 	    (((info->options & IPT_IPV4OPTION_DONT_MATCH_SRR) == IPT_IPV4OPTION_DONT_MATCH_SRR) ||
@@ -154,8 +164,15 @@
 	return 1;
 }
 
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+static struct xt_match ipv4options_match = { 
+#else
 static struct ipt_match ipv4options_match = { 
+#endif    
 	.name = "ipv4options",
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	.family = AF_INET,
+#endif    
 	.match = match,
 	.matchsize = sizeof(struct ipt_ipv4options_info),
 	.checkentry = checkentry,
@@ -164,12 +181,20 @@
 
 static int __init init(void)
 {
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	return xt_register_match(&ipv4options_match);
+#else
 	return ipt_register_match(&ipv4options_match);
+#endif    
 }
 
 static void __exit fini(void)
 {
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	xt_unregister_match(&ipv4options_match);
+#else
 	ipt_unregister_match(&ipv4options_match);
+#endif    
 }
 
 module_init(init);


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="ipt_IPV4OPTSSTRIP.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ipt_IPV4OPTSSTRIP.c.patch"

--- ../patch-o-matic-ng/patchlets/IPV4OPTSSTRIP/linux-2.6/net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c.orig	2007-05-02 15:32:00.000000000 +0200
+++ ../patch-o-matic-ng/patchlets/IPV4OPTSSTRIP/linux-2.6/net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c	2007-09-13 21:19:41.000000000 +0200
@@ -5,6 +5,7 @@
  * This software is distributed under GNU GPL v2, 1991
  */
 
+#include <linux/version.h>
 #include <linux/module.h>
 #include <linux/skbuff.h>
 #include <net/ip.h>
@@ -21,8 +22,15 @@
        const struct net_device *in,
        const struct net_device *out,
        unsigned int hooknum,
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
+       const struct xt_target *target,
+#endif
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19)
        const void *targinfo,
        void *userinfo)
+#else
+       const void *targinfo)
+#endif
 {
 	struct iphdr *iph;
 	struct sk_buff *skb;
@@ -30,12 +38,21 @@
 	unsigned char *optiph;
 	int l;
 	
+#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,19)
+	if (!skb_make_writable(pskb, (*pskb)->len))
+#else
 	if (!skb_ip_make_writable(pskb, (*pskb)->len))
+#endif
 		return NF_DROP;
  
 	skb = (*pskb);
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,22)
+	iph = ip_hdr(*pskb);
+	optiph = skb->network_header;
+#else
 	iph = (*pskb)->nh.iph;
 	optiph = skb->nh.raw;
+#endif
 	l = ((struct ip_options *)(&(IPCB(skb)->opt)))->optlen;
 
 	/* if no options in packet then nothing to clear. */
@@ -54,9 +71,18 @@
 
 static int
 checkentry(const char *tablename,
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,16)
+	   const void *e,
+#else
 	   const struct ipt_entry *e,
+#endif
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
+	   const struct xt_target *target,
+#endif
            void *targinfo,
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19)
            unsigned int targinfosize,
+#endif
            unsigned int hook_mask)
 {
 	if (strcmp(tablename, "mangle")) {
@@ -66,21 +92,35 @@
 	/* nothing else to check because no parameters */
 	return 1;
 }
-
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+static struct xt_target xt_ipv4optsstrip_reg = { 
+#else
 static struct ipt_target ipt_ipv4optsstrip_reg = { 
+#endif
 	.name = "IPV4OPTSSTRIP",
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	.family = AF_INET,
+#endif
 	.target = target,
 	.checkentry = checkentry,
 	.me = THIS_MODULE };
 
 static int __init init(void)
 {
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	return xt_register_target(&xt_ipv4optsstrip_reg);
+#else
 	return ipt_register_target(&ipt_ipv4optsstrip_reg);
+#endif
 }
 
 static void __exit fini(void)
 {
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	xt_unregister_target(&xt_ipv4optsstrip_reg);
+#else
 	ipt_unregister_target(&ipt_ipv4optsstrip_reg);
+#endif
 }
 
 module_init(init);


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="ipt_ROUTE.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ipt_ROUTE.c.patch"

--- ../patch-o-matic-ng/patchlets/ROUTE/linux-2.6/net/ipv4/netfilter/ipt_ROUTE.c.orig	2007-09-13 21:56:03.000000000 +0200
+++ ../patch-o-matic-ng/patchlets/ROUTE/linux-2.6/net/ipv4/netfilter/ipt_ROUTE.c	2008-03-26 12:37:44.000000000 +0100
@@ -15,16 +15,9 @@
 #include <linux/ip.h>
 #include <linux/netfilter_ipv4/ip_tables.h>
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,22)
 #define CONFIG_NF_CONNTRACK_SUPPORT
-#endif
 
-#ifdef CONFIG_NF_CONNTRACK_SUPPORT
 #include <net/netfilter/nf_conntrack.h>
-#else
-#include <linux/netfilter_ipv4/ip_conntrack.h>
-#endif
-
 #include <linux/netfilter_ipv4/ipt_ROUTE.h>
 #include <linux/netdevice.h>
 #include <linux/route.h>
@@ -34,6 +27,7 @@
 #include <net/route.h>
 #include <net/icmp.h>
 #include <net/checksum.h>
+#include <net/net_namespace.h>
 
 #if 0
 #define DEBUGP printk
@@ -68,11 +62,7 @@
 {
 	int err;
 	struct rtable *rt;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,22)
 	struct iphdr *iph = ip_hdr(skb);
-#else
-	struct iphdr *iph = skb->nh.iph;
-#endif
 	struct flowi fl = {
 		.oif = ifindex,
 		.nl_u = {
@@ -136,7 +126,7 @@
 	unsigned seq;
 
 	/* Be paranoid, rather than too clever. */
-	if (unlikely(skb_headroom(skb) < hh_len && dev->hard_header)) {
+	if (unlikely(skb_headroom(skb) < hh_len && (dev->header_ops && dev->header_ops->create))) {
 		struct sk_buff *skb2;
 
 		skb2 = skb_realloc_headroom(skb, LL_RESERVED_SPACE(dev));
@@ -190,7 +180,7 @@
 	/* The user set the interface name to use.
 	 * Getting the current interface index.
 	 */
-	if ((dev_out = dev_get_by_name(route_info->oif))) {
+	if ((dev_out = dev_get_by_name(&init_net , route_info->oif))) {
 		ifindex = dev_out->ifindex;
 	} else {
 		/* Unknown interface name : packet dropped */
@@ -256,7 +246,7 @@
 	struct net_device *dev_in = NULL;
 
 	/* Getting the current interface index. */
-	if (!(dev_in = dev_get_by_name(route_info->iif))) {
+	if (!(dev_in = dev_get_by_name(&init_net , route_info->iif))) {
 		if (net_ratelimit()) 
 			DEBUGP("ipt_ROUTE: iif interface %s not found\n", route_info->iif);
 		return NF_DROP;
@@ -292,28 +282,16 @@
  * routing packets when we see they already have that ->nfct.
  */
 
-#ifdef CONFIG_NF_CONNTRACK_SUPPORT
 static struct nf_conn route_tee_track;
-#else
-static struct ip_conntrack route_tee_track;
-#endif
 
-static unsigned int ipt_route_target(struct sk_buff **pskb,
+static unsigned int xt_route_target(struct sk_buff *skb,
 				     const struct net_device *in,
 				     const struct net_device *out,
 				     unsigned int hooknum,
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
 				     const struct xt_target *target,
-#endif
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19)
-				     const void *targinfo,
-				     void *userinfo)
-#else
 				     const void *targinfo)
-#endif
 {
 	const struct ipt_route_target_info *route_info = targinfo;
-	struct sk_buff *skb = *pskb;
 	unsigned int res;
 
 	if (skb->nfct == &route_tee_track.ct_general) {
@@ -331,11 +309,7 @@
 	if (hooknum == NF_IP_PRE_ROUTING ||
 	    hooknum == NF_IP_LOCAL_IN) {
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,22)
 		struct iphdr *iph = ip_hdr(skb);
-#else
-		struct iphdr *iph = skb->nh.iph;
-#endif
 		if (iph->ttl <= 1) {
 			struct rtable *rt;
 			struct flowi fl = {
@@ -390,7 +364,7 @@
 		 * on its way as if nothing happened. The copy should be
 		 * independantly delivered to the ROUTE --gw.
 		 */
-		skb = skb_copy(*pskb, GFP_ATOMIC);
+		skb = skb_copy(skb, GFP_ATOMIC);
 		if (!skb) {
 			if (net_ratelimit()) 
 				DEBUGP(KERN_DEBUG "ipt_ROUTE: copy failed!\n");
@@ -431,19 +405,10 @@
 }
 
 
-static int ipt_route_checkentry(const char *tablename,
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,16)
+static bool xt_route_checkentry(const char *tablename,
 				const void *e,
-#else
-				const struct ipt_ip *ip,
-#endif
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
 				const struct xt_target *target,
-#endif
 				void *targinfo,
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19)
-				unsigned int targinfosize,
-#endif
 				unsigned int hook_mask)
 {
 	if (strcmp(tablename, "mangle") != 0) {
@@ -461,32 +426,15 @@
 		return 0;
 	}
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19)
-	if (targinfosize != IPT_ALIGN(sizeof(struct ipt_route_target_info))) {
-		printk(KERN_WARNING "ipt_ROUTE: targinfosize %u != %Zu\n",
-		       targinfosize,
-		       IPT_ALIGN(sizeof(struct ipt_route_target_info)));
-		return 0;
-	}
-#endif
-
 	return 1;
 }
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
-static struct ipt_target xt_route_reg = { 
-#else
-static struct ipt_target ipt_route_reg = { 
-#endif
+static struct xt_target xt_route_reg = { 
 	.name = "ROUTE",
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
 	.family		= AF_INET,
-#endif
-	.target = ipt_route_target,
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
+	.target = xt_route_target,
 	.targetsize = sizeof(struct ipt_route_target_info),
-#endif
-	.checkentry = ipt_route_checkentry,
+	.checkentry = xt_route_checkentry,
 	.me = THIS_MODULE,
 };
 
@@ -500,21 +448,13 @@
 	/* Initialize fake conntrack so that NAT will skip it */
 	route_tee_track.status |= IPS_NAT_DONE_MASK;
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
 	return xt_register_target(&xt_route_reg);
-#else
-	return ipt_register_target(&ipt_route_reg);
-#endif
 }
 
 
 static void __exit fini(void)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
 	xt_unregister_target(&xt_route_reg);
-#else
-	ipt_unregister_target(&ipt_route_reg);
-#endif
 }
 
 module_init(init);


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="ipt_TARPIT.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ipt_TARPIT.c.patch"

--- ../patch-o-matic-ng/patchlets/TARPIT/linux-2.6/net/ipv4/netfilter/ipt_TARPIT.c.orig	2008-03-13 21:43:06.000000000 +0100
+++ ../patch-o-matic-ng/patchlets/TARPIT/linux-2.6/net/ipv4/netfilter/ipt_TARPIT.c	2008-03-26 13:00:28.000000000 +0100
@@ -42,7 +42,6 @@
 #include <net/ip.h>
 #include <net/tcp.h>
 #include <net/icmp.h>
-struct in_device;
 #include <net/route.h>
 #include <linux/random.h>
 #include <linux/netfilter_ipv4/ip_tables.h>
@@ -83,13 +84,15 @@
 	unsigned int otcplen;
 	u_int16_t tmp;
 
+	struct iphdr *oiph = ip_hdr(oskb);
+
 	/* A truncated TCP header isn't going to be useful */
-	if (oskb->len < (oskb->nh.iph->ihl*4) + sizeof(struct tcphdr))
+	if (oskb->len < (oiph->ihl*4) + sizeof(struct tcphdr))
 		return;
-
-	otcph = (struct tcphdr *)((u_int32_t*)oskb->nh.iph
-				  + oskb->nh.iph->ihl);
-	otcplen = oskb->len - oskb->nh.iph->ihl*4;
+		
+	otcph = (struct tcphdr *)((u_int32_t*)oiph
+				  + oiph->ihl);
+	otcplen = oskb->len - oiph->ihl*4;
 
 	/* No replies for RST or FIN */
 	if (otcph->rst || otcph->fin)
@@ -100,8 +103,8 @@
 		return;
 
 	/* Check checksum. */
-	if (tcp_v4_check(otcplen, oskb->nh.iph->saddr,
-			 oskb->nh.iph->daddr,
+	if (tcp_v4_check(otcplen, oiph->saddr,
+			 oiph->daddr,
 			 csum_partial((char *)otcph, otcplen, 0)) != 0)
 		return;
 
@@ -119,25 +122,21 @@
 	nskb->nf_debug = 0;
 #endif
 
-	ntcph = (struct tcphdr *)((u_int32_t*)nskb->nh.iph + nskb->nh.iph->ihl);
+	ntcph = (struct tcphdr *)((u_int32_t*)oiph + oiph->ihl);
 
 	/* Truncate to length (no data) */
 	ntcph->doff = sizeof(struct tcphdr)/4;
-	skb_trim(nskb, nskb->nh.iph->ihl*4 + sizeof(struct tcphdr));
-	nskb->nh.iph->tot_len = htons(nskb->len);
+	skb_trim(nskb, oiph->ihl*4 + sizeof(struct tcphdr));
+	oiph->tot_len = htons(nskb->len);
 
 	/* Swap source and dest */
-	nskb->nh.iph->daddr = xchg(&nskb->nh.iph->saddr, nskb->nh.iph->daddr);
+	oiph->daddr = xchg(&oiph->saddr, oiph->daddr);
 	tmp = ntcph->source;
 	ntcph->source = ntcph->dest;
 	ntcph->dest = tmp;
 
 	/* Use supplied sequence number or make a new one */
-	ntcph->seq = otcph->ack ? otcph->ack_seq
-		: htonl(secure_tcp_sequence_number(nskb->nh.iph->saddr,
-						   nskb->nh.iph->daddr,
-						   ntcph->source,
-						   ntcph->dest));
+	otcph->ack ? ntcph->seq = otcph->ack_seq : get_random_bytes(&ntcph->seq ,sizeof(ntcph->seq));
 
 	/* Our SYN-ACKs must have a >0 window */
 	ntcph->window = (otcph->syn && !otcph->ack) ? htons(5) : 0;
@@ -159,14 +158,14 @@
 	/* Adjust TCP checksum */
 	ntcph->check = 0;
 	ntcph->check = tcp_v4_check(sizeof(struct tcphdr),
-				   nskb->nh.iph->saddr,
-				   nskb->nh.iph->daddr,
+				   oiph->saddr,
+				   oiph->daddr,
 				   csum_partial((char *)ntcph,
 						sizeof(struct tcphdr), 0));
 
-	fl.nl_u.ip4_u.daddr = nskb->nh.iph->daddr;
-	fl.nl_u.ip4_u.saddr = local ? nskb->nh.iph->saddr : 0;
-	fl.nl_u.ip4_u.tos = RT_TOS(nskb->nh.iph->tos) | RTO_CONN;
+	fl.nl_u.ip4_u.daddr = oiph->daddr;
+	fl.nl_u.ip4_u.saddr = local ? oiph->saddr : 0;
+	fl.nl_u.ip4_u.tos = RT_TOS(oiph->tos) | RTO_CONN;
 	fl.oif = 0;
 
 	if (ip_route_output_key(&nrt, &fl))
@@ -176,23 +175,18 @@
 	nskb->dst = &nrt->u.dst;
 
 	/* Adjust IP TTL */
-	nskb->nh.iph->ttl = dst_metric(nskb->dst, RTAX_HOPLIMIT);
+	oiph->ttl = dst_metric(nskb->dst, RTAX_HOPLIMIT);
 
 	/* Set DF, id = 0 */
-	nskb->nh.iph->frag_off = htons(IP_DF);
-	nskb->nh.iph->id = 0;
+	oiph->frag_off = htons(IP_DF);
+	oiph->id = 0;
 
 	/* Adjust IP checksum */
-	nskb->nh.iph->check = 0;
-	nskb->nh.iph->check = ip_fast_csum((unsigned char *)nskb->nh.iph,
-					   nskb->nh.iph->ihl);
-
+	oiph->check = 0;
+	oiph->check = ip_fast_csum((unsigned char *)oiph,
+					   oiph->ihl);
 	/* "Never happens" */
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,12)
 	if (nskb->len > dst_mtu(nskb->dst))
-#else
-	if (nskb->len > dst_pmtu(nskb->dst))
-#endif
 		goto free_nskb;
 
 	ip_direct_send (nskb);
@@ -204,15 +198,15 @@
 }
 
 
-static unsigned int tarpit(struct sk_buff **pskb,
+static unsigned int tarpit(struct sk_buff *skb,
 			   const struct net_device *in,
 			   const struct net_device *out,
 			   unsigned int hooknum,
 			   const struct xt_target *target,
 			   const void *targinfo)
 {
-	struct sk_buff *skb = *pskb;
 	struct rtable *rt = (struct rtable*)skb->dst;
+	struct iphdr *iph = ip_hdr(skb);
 
 	/* Do we have an input route cache entry? */
 	if (!rt)
@@ -228,11 +222,11 @@
 
 	/* Our naive response construction doesn't deal with IP
            options, and probably shouldn't try. */
-	if (skb->nh.iph->ihl*4 != sizeof(struct iphdr))
+	if (iph->ihl*4 != sizeof(struct iphdr))
 		return NF_DROP;
 
 	/* We aren't interested in fragments */
-	if (skb->nh.iph->frag_off & htons(IP_OFFSET))
+	if (iph->frag_off & htons(IP_OFFSET))
 		return NF_DROP;
 
 	tarpit_tcp(skb,rt,hooknum == NF_IP_LOCAL_IN);
@@ -241,7 +235,7 @@
 }
 
 
-static int check(const char *tablename,
+static bool check(const char *tablename,
 		 const void *e_void,
 		 const struct xt_target *target,
 		 void *targinfo,


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="ipt_time.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ipt_time.c.patch"

--- ../patch-o-matic-ng/patchlets/time/linux-2.6/net/ipv4/netfilter/ipt_time.c.orig	2007-07-11 23:34:46.000000000 +0200
+++ ../patch-o-matic-ng/patchlets/time/linux-2.6/net/ipv4/netfilter/ipt_time.c	2008-03-15 20:55:56.000000000 +0100
@@ -15,7 +15,6 @@
 
 #include <linux/module.h>
 #include <linux/skbuff.h>
-#include <linux/version.h>
 #include <linux/netfilter_ipv4/ip_tables.h>
 #include <linux/netfilter_ipv4/ipt_time.h>
 #include <linux/time.h>
@@ -43,51 +42,33 @@
 void
 localtime(const u32 time, struct tm *r);
 
-static int
+static bool
 match(const struct sk_buff *skb,
       const struct net_device *in,
       const struct net_device *out,
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
       const struct xt_match *match,
-#endif
       const void *matchinfo,
       int offset,
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,16)
       unsigned int protoff,
-#endif
-      int *hotdrop)
+      bool *hotdrop)
 {
 	const struct ipt_time_info *info = matchinfo;   /* match info for rule */
 	struct tm currenttime;                          /* time human readable */
 	u_int8_t days_of_week[7] = {64, 32, 16, 8, 4, 2, 1};
 	u_int16_t packet_time;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,22)
 	struct timeval tv;
-#endif
 
 	/* We might not have a timestamp, get one */
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,22)
 	if (skb->tstamp.tv64 == 0)
-#else
-	if (skb->tstamp.off_sec == 0)
-#endif
 		__net_timestamp((struct sk_buff *)skb);
 
 	/* First we make sure we are in the date start-stop boundaries */
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,22)
 	tv = ktime_to_timeval(skb->tstamp);
 	if ((tv.tv_sec < info->date_start) || (tv.tv_sec > info->date_stop))
-#else
-	if ((skb->tstamp.off_sec < info->date_start) || (skb->tstamp.off_sec > info->date_stop))
-#endif
 		return 0; /* We are outside the date boundaries */
 
 	/* Transform the timestamp of the packet, in a human readable form */
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,22)
 	localtime(tv.tv_sec, &currenttime);
-#else
-	localtime(skb->tstamp.off_sec, &currenttime);
-#endif
 
 
 	/* check if we match this timestamp, we start by the days... */
@@ -108,29 +89,15 @@
 	return 1;
 }
 
-static int
+static bool
 checkentry(const char *tablename,
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,16)
            const void *ip,
-#else
-           const struct ipt_ip *ip,
-#endif
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
             const struct xt_match *match,
-#endif
            void *matchinfo,
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19)
-           unsigned int matchsize,
-#endif
            unsigned int hook_mask)
 {
 	struct ipt_time_info *info = matchinfo;   /* match info for rule */
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,17)
-	/* Check the size */
-	if (matchsize != IPT_ALIGN(sizeof(struct ipt_time_info)))
-		return 0;
-#endif
 
 	/* Now check the coherence of the data ... */
 	if ((info->time_start > 1439) ||        /* 23*60+59 = 1439*/
@@ -143,19 +110,11 @@
 	return 1;
 }
 
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
 static struct xt_match time_match = {
-#else
-static struct ipt_match time_match = {
-#endif
 	.name		= "time",
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
 	.family		= AF_INET,
-#endif
 	.match		= &match,
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
 	.matchsize      = sizeof(struct ipt_time_info),
-#endif
 	.checkentry	= &checkentry,
 	.me = THIS_MODULE
 };
@@ -163,20 +122,12 @@
 static int __init init(void)
 {
 	printk("ipt_time loading\n");
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
 	return xt_register_match(&time_match);
-#else
-	return ipt_register_match(&time_match);
-#endif
 }
 
 static void __exit fini(void)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
 	xt_unregister_match(&time_match);
-#else
-	ipt_unregister_match(&time_match);
-#endif
 	printk("ipt_time unloaded\n");
 }
 


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="ipt_u32.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ipt_u32.c.patch"

--- ../patch-o-matic-ng/patchlets/u32/linux-2.6/net/ipv4/netfilter/ipt_u32.c.orig	2008-03-13 21:43:06.000000000 +0100
+++ ../patch-o-matic-ng/patchlets/u32/linux-2.6/net/ipv4/netfilter/ipt_u32.c	2008-03-15 19:51:02.000000000 +0100
@@ -116,7 +116,7 @@
 static char u32_buffer[65536];
 static DEFINE_SPINLOCK(u32_lock);
 
-static int
+static bool
 match(const struct sk_buff *skb,
       const struct net_device *in,
       const struct net_device *out,
@@ -124,7 +124,7 @@
       const void *matchinfo,
       int offset,
       unsigned int protoff,
-      int *hotdrop)
+      bool *hotdrop)
 {
 	const struct ipt_u32 *data = matchinfo;
 	int testind, i;
@@ -201,16 +201,13 @@
 	return 1;
 }
 
-static int
+static bool
 checkentry(const char *tablename,
            const void *ip,
            const struct xt_match *match,
            void *matchinfo,
-           unsigned int matchsize,
            unsigned int hook_mask)
 {
-	if (matchsize != IPT_ALIGN(sizeof(struct ipt_u32)))
-		return 0;
 	return 1;
 }
 


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="iptables.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="iptables.c.patch"

--- ../iptables/iptables.c.orig	2008-03-10 14:10:27.000000000 +0100
+++ ../iptables/iptables.c	2008-03-10 14:15:52.000000000 +0100
@@ -99,38 +99,38 @@
 = { 'n', 's', 'd', 'p', 'j', 'v', 'x', 'i', 'o', 'f', '0', 'c'};
 
 static struct option original_opts[] = {
-	{ "append", 1, NULL, 'A' },
-	{ "delete", 1, NULL,  'D' },
-	{ "insert", 1, NULL,  'I' },
-	{ "replace", 1, NULL,  'R' },
-	{ "list", 2, NULL,  'L' },
-	{ "flush", 2, NULL,  'F' },
-	{ "zero", 2, NULL,  'Z' },
-	{ "new-chain", 1, NULL,  'N' },
-	{ "delete-chain", 2, NULL,  'X' },
-	{ "rename-chain", 1, NULL,  'E' },
-	{ "policy", 1, NULL,  'P' },
-	{ "source", 1, NULL, 's' },
-	{ "destination", 1, NULL,  'd' },
-	{ "src", 1, NULL,  's' }, /* synonym */
-	{ "dst", 1, NULL,  'd' }, /* synonym */
-	{ "protocol", 1, NULL,  'p' },
-	{ "in-interface", 1, NULL, 'i' },
-	{ "jump", 1, NULL, 'j' },
-	{ "table", 1, NULL, 't' },
-	{ "match", 1, NULL, 'm' },
-	{ "numeric", 0, NULL, 'n' },
-	{ "out-interface", 1, NULL, 'o' },
-	{ "verbose", 0, NULL, 'v' },
-	{ "exact", 0, NULL, 'x' },
-	{ "fragments", 0, NULL, 'f' },
-	{ "version", 0, NULL, 'V' },
-	{ "help", 2, NULL, 'h' },
-	{ "line-numbers", 0, NULL, '0' },
-	{ "modprobe", 1, NULL, 'M' },
-	{ "set-counters", 1, NULL, 'c' },
-	{ "goto", 1, NULL, 'g' },
-	{ }
+	{ .name = "append", .has_arg = 1, .flag = NULL, .val = 'A' },
+	{ .name = "delete", .has_arg = 1, .flag = NULL, .val = 'D' },
+	{ .name = "insert", .has_arg = 1, .flag = NULL, .val = 'I' },
+	{ .name = "replace", .has_arg = 1, .flag = NULL, .val = 'R' },
+	{ .name = "list", .has_arg = 2, .flag = NULL, .val = 'L' },
+	{ .name = "flush", .has_arg = 2, .flag = NULL, .val = 'F' },
+	{ .name = "zero", .has_arg = 2, .flag = NULL, .val = 'Z' },
+	{ .name = "new-chain", .has_arg = 1, .flag = NULL, .val = 'N' },
+	{ .name = "delete-chain", .has_arg = 2, .flag = NULL, .val = 'X' },
+	{ .name = "rename-chain", .has_arg = 1, .flag = NULL, .val = 'E' },
+	{ .name = "policy", .has_arg = 1, .flag = NULL, .val = 'P' },
+	{ .name = "source", .has_arg = 1, .flag = NULL, .val = 's' },
+	{ .name = "destination", .has_arg = 1, .flag = NULL, .val = 'd' },
+	{ .name = "src", .has_arg = 1, .flag = NULL, .val = 's' }, /* synonym */
+	{ .name = "dst", .has_arg = 1, .flag = NULL, .val = 'd' }, /* synonym */
+	{ .name = "protocol", .has_arg = 1, .flag = NULL, .val = 'p' },
+	{ .name = "in-interface", .has_arg = 1, .flag = NULL, .val = 'i' },
+	{ .name = "jump", .has_arg = 1, .flag = NULL, .val = 'j' },
+	{ .name = "table", .has_arg = 1, .flag = NULL, .val = 't' },
+	{ .name = "match", .has_arg = 1, .flag = NULL, .val = 'm' },
+	{ .name = "numeric", .has_arg = 0, .flag = NULL, .val = 'n' },
+	{ .name = "out-interface", .has_arg = 1, .flag = NULL, .val = 'o' },
+	{ .name = "verbose", .has_arg = 0, .flag = NULL, .val = 'v' },
+	{ .name = "exact", .has_arg = 0, .flag = NULL, .val = 'x' },
+	{ .name = "fragments", .has_arg = 0, .flag = NULL, .val = 'f' },
+	{ .name = "version", .has_arg = 0, .flag = NULL, .val = 'V' },
+	{ .name = "help", .has_arg = 2, .flag = NULL, .val = 'h' },
+	{ .name = "line-numbers", .has_arg = 0, .flag = NULL, .val = '0' },
+	{ .name = "modprobe", .has_arg = 1, .flag = NULL, .val = 'M' },
+	{ .name = "set-counters", .has_arg = 1, .flag = NULL, .val = 'c' },
+	{ .name = "goto", .has_arg = 1, .flag = NULL, .val = 'g' },
+	{ .name = NULL }
 };
 
 /* we need this for iptables-restore.  iptables-restore.c sets line to the
@@ -574,7 +574,7 @@
 
 	if (invert) {
 		unsigned int i;
-		for (i = 0; 1 << i != option; i++);
+		for (i = 0; (unsigned int)(1 << i) != option; i++);
 
 		if (!inverse_for_options[i])
 			exit_error(PARAMETER_PROBLEM,


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="iptables-restore.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="iptables-restore.c.patch"

--- ../iptables/iptables-restore.c.orig	2008-03-10 13:08:02.000000000 +0100
+++ ../iptables/iptables-restore.c	2008-03-10 14:04:49.000000000 +0100
@@ -26,15 +26,15 @@
 
 /* Keeping track of external matches and targets.  */
 static struct option options[] = {
-	{ "binary", 0, 0, 'b' },
-	{ "counters", 0, 0, 'c' },
-	{ "verbose", 0, 0, 'v' },
-	{ "test", 0, 0, 't' },
-	{ "help", 0, 0, 'h' },
-	{ "noflush", 0, 0, 'n'},
-	{ "modprobe", 1, 0, 'M'},
-	{ "table", 1, 0, 'T'},
-	{ 0 }
+	{ .name = "binary", .has_arg = 0, .flag = 0, .val = 'b' },
+	{ .name = "counters", .has_arg = 0, .flag = 0, .val = 'c' },
+	{ .name = "verbose", .has_arg = 0, .flag = 0, .val = 'v' },
+	{ .name = "test", .has_arg = 0, .flag = 0, .val = 't' },
+	{ .name = "help", .has_arg = 0, .flag = 0, .val = 'h' },
+	{ .name = "noflush", .has_arg = 0, .flag = 0, .val = 'n'},
+	{ .name = "modprobe", .has_arg = 1, .flag = 0, .val = 'M'},
+	{ .name = "table", .has_arg = 1, .flag = 0, .val = 'T'},
+	{ .name = NULL }
 };
 
 static void print_usage(const char *name, const char *version) __attribute__((noreturn));
@@ -95,7 +95,7 @@
  * returns true if argument added, false otherwise */
 static int add_argv(char *what) {
 	DEBUGP("add_argv: %s\n", what);
-	if (what && ((newargc + 1) < sizeof(newargv)/sizeof(char *))) {
+	if (what && (((unsigned int)(newargc + 1)) < sizeof(newargv)/sizeof(char *))) {
 		newargv[newargc] = strdup(what);
 		newargc++;
 		return 1;


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="iptables-save.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="iptables-save.c.patch"

--- ../iptables/iptables-save.c.orig	2008-03-10 12:38:18.000000000 +0100
+++ ../iptables/iptables-save.c	2008-03-10 12:54:55.000000000 +0100
@@ -23,11 +23,11 @@
 static int binary = 0, counters = 0;
 
 static struct option options[] = {
-	{ "binary", 0, 0, 'b' },
-	{ "counters", 0, 0, 'c' },
-	{ "dump", 0, 0, 'd' },
-	{ "table", 1, 0, 't' },
-	{ 0 }
+	{ .name = "binary", .has_arg = 0, .flag = 0, .val = 'b' },
+	{ .name = "counters", .has_arg = 0, .flag = 0, .val = 'c' },
+	{ .name = "dump", .has_arg = 0, .flag = 0, .val = 'd' },
+	{ .name = "table", .has_arg = 1, .flag = 0, .val = 't' },
+	{ .name = NULL }
 };
 
 #define IP_PARTS_NATIVE(n)			\


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libip6t_ROUTE.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libip6t_ROUTE.c.patch"

--- ../patch-o-matic-ng/patchlets/ROUTE/iptables/extensions/libip6t_ROUTE.c.orig	2006-12-12 11:34:45.000000000 +0100
+++ ../patch-o-matic-ng/patchlets/ROUTE/iptables/extensions/libip6t_ROUTE.c	2008-03-14 08:48:04.000000000 +0100
@@ -38,17 +38,17 @@
 }
 
 static struct option opts[] = {
-	{ "oif", 1, 0, '1' },
-	{ "iif", 1, 0, '2' },
-	{ "gw", 1, 0, '3' },
-	{ "continue", 0, 0, '4' },
-	{ "tee", 0, 0, '5' },
-	{ 0 }
+	{ .name = "oif", .has_arg = 1, .flag = 0, .val = '1' },
+	{ .name = "iif", .has_arg = 1, .flag = 0, .val = '2' },
+	{ .name = "gw", .has_arg = 1, .flag = 0, .val = '3' },
+	{ .name = "continue", .has_arg = 0, .flag = 0, .val = '4' },
+	{ .name = "tee", .has_arg = 0, .flag = 0, .val = '5' },
+	{ .name = NULL }
 };
 
 /* Initialize the target. */
 static void
-init(struct ip6t_entry_target *t, unsigned int *nfcache)
+init(struct xt_entry_target *t)
 {
 	struct ip6t_route_target_info *route_info = 
 		(struct ip6t_route_target_info*)t->data;
@@ -73,8 +73,8 @@
    ate an option */
 static int
 parse(int c, char **argv, int invert, unsigned int *flags,
-      const struct ip6t_entry *entry,
-      struct ip6t_entry_target **target)
+      const void *entry,
+      struct xt_entry_target **target)
 {
 	struct ip6t_route_target_info *route_info = 
 		(struct ip6t_route_target_info*)(*target)->data;
@@ -166,8 +166,8 @@
 
 /* Prints out the targinfo. */
 static void
-print(const struct ip6t_ip6 *ip,
-      const struct ip6t_entry_target *target,
+print(const void *ip,
+      const struct xt_entry_target *target,
       int numeric)
 {
 	const struct ip6t_route_target_info *route_info
@@ -195,8 +195,8 @@
 }
 
 
-static void save(const struct ip6t_ip6 *ip, 
-		 const struct ip6t_entry_target *target)
+static void save(const void *ip, 
+		 const struct xt_entry_target *target)
 {
 	const struct ip6t_route_target_info *route_info
 		= (const struct ip6t_route_target_info *)target->data;
@@ -220,7 +220,7 @@
 }
 
 
-static struct ip6tables_target route = { 
+static struct xtables_target route = { 
 	.name 		= "ROUTE",
 	.version	= IPTABLES_VERSION,
 	.size		= IP6T_ALIGN(sizeof(struct ip6t_route_target_info)),


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libipt_ACCOUNT.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libipt_ACCOUNT.c.patch"

--- ../patch-o-matic-ng/patchlets/ACCOUNT/iptables/extensions/libipt_ACCOUNT.c.orig	2007-12-14 10:42:16.000000000 +0100
+++ ../patch-o-matic-ng/patchlets/ACCOUNT/iptables/extensions/libipt_ACCOUNT.c	2008-03-13 23:36:21.000000000 +0100
@@ -30,14 +30,12 @@
 
 /* Initialize the target. */
 static void
-init(struct ipt_entry_target *t, unsigned int *nfcache)
+init(struct xt_entry_target *t)
 {
     struct ipt_acc_info *accountinfo = (struct ipt_acc_info *)t->data;
 
     accountinfo->table_nr = -1;
 
-    /* Can't cache this */
-    *nfcache |= NFC_UNKNOWN;
 }
 
 #define IPT_ACCOUNT_OPT_ADDR 0x01
@@ -47,8 +45,8 @@
    ate an option */
 static int
 parse(int c, char **argv, int invert, unsigned int *flags,
-      const struct ipt_entry *entry,
-      struct ipt_entry_target **target)
+      const void *entry,
+      struct xt_entry_target **target)
 {
     struct ipt_acc_info *accountinfo = (struct ipt_acc_info *)(*target)->data;
     struct in_addr *addrs = NULL, mask;
@@ -65,7 +63,7 @@
                             opts[0].name);
 
         //loginfo->level = parse_level(optarg);
-        parse_hostnetworkmask(optarg, &addrs, &mask, &naddrs);
+        ipparse_hostnetworkmask(optarg, &addrs, &mask, &naddrs);
         
         if (naddrs > 1)
                 exit_error(PARAMETER_PROBLEM, "multiple IP addresses not allowed");
@@ -108,8 +106,8 @@
                     opts[0].name, opts[1].name);
 }
 
-static void print_it(const struct ipt_ip *ip,
-                     const struct ipt_entry_target *target, char do_prefix)
+static void print_it(const void *ip,
+                     const struct xt_entry_target *target, char do_prefix)
 {
     const struct ipt_acc_info *accountinfo
         = (const struct ipt_acc_info *)target->data;
@@ -123,12 +121,11 @@
 	printf("--");
     printf("%s ", opts[0].name);
     
-    a.s_addr = accountinfo->net_ip;	
-    printf("%s", addr_to_dotted(&a));
+    a.s_addr = accountinfo->net_ip;
+    printf("%s", ipaddr_to_numeric(&a));
     a.s_addr = accountinfo->net_mask;
-    printf("%s", mask_to_dotted(&a));
+    printf("%s", ipmask_to_numeric(&a));
 
-    printf(" ");
     if (do_prefix)
 	printf("--");
 
@@ -137,8 +134,8 @@
 
 /* Prints out the targinfo. */
 static void
-print(const struct ipt_ip *ip,
-      const struct ipt_entry_target *target,
+print(const void *ip,
+      const struct xt_entry_target *target,
       int numeric)
 {
     print_it (ip, target, 0);
@@ -146,13 +143,13 @@
 
 /* Saves the union ipt_targinfo in parsable form to stdout. */
 static void
-save(const struct ipt_ip *ip, const struct ipt_entry_target *target)
+save(const void *ip, const struct xt_entry_target *target)
 {
     print_it(ip, target, 1);
 }
 
 static
-struct iptables_target account
+struct xtables_target account
 = {
     .next          = NULL,
     .name          = "ACCOUNT",


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libipt_connlimit.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libipt_connlimit.c.patch"

--- ../patch-o-matic-ng/patchlets/connlimit/iptables/extensions/libipt_connlimit.c.orig	2006-12-04 12:15:19.000000000 +0100
+++ ../patch-o-matic-ng/patchlets/connlimit/iptables/extensions/libipt_connlimit.c	2008-03-10 17:00:22.000000000 +0100
@@ -6,7 +6,6 @@
 #include <stddef.h>
 #include <getopt.h>
 #include <iptables.h>
-#include <linux/netfilter_ipv4/ip_conntrack.h>
 #include <linux/netfilter_ipv4/ipt_connlimit.h>
 
 /* Function which prints out usage message. */
@@ -21,18 +20,17 @@
 }
 
 static struct option opts[] = {
-	{ "connlimit-above", 1, 0, '1' },
-	{ "connlimit-mask",  1, 0, '2' },
-	{0}
+	{ .name = "connlimit-above", .has_arg = true, .flag = 0, .val = '1' },
+	{ .name = "connlimit-mask", .has_arg = true, .flag = 0, .val = '2' },
+	{ .name = 0 }
 };
 
 /* Function which parses command options; returns true if it
    ate an option */
 static int
 parse(int c, char **argv, int invert, unsigned int *flags,
-      const struct ipt_entry *entry,
-      unsigned int *nfcache,
-      struct ipt_entry_match **match)
+      const void *entry,
+      struct xt_entry_match **match)
 {
 	struct ipt_connlimit_info *info = (struct ipt_connlimit_info*)(*match)->data;
 	int i;
@@ -94,8 +92,8 @@
 
 /* Prints out the matchinfo. */
 static void
-print(const struct ipt_ip *ip,
-      const struct ipt_entry_match *match,
+print(const void *ip,
+      const struct xt_entry_match *match,
       int numeric)
 {
 	struct ipt_connlimit_info *info = (struct ipt_connlimit_info*)match->data;
@@ -105,7 +103,7 @@
 }
 
 /* Saves the matchinfo in parsable form to stdout. */
-static void save(const struct ipt_ip *ip, const struct ipt_entry_match *match)
+static void save(const void *ip, const struct xt_entry_match *match)
 {
 	struct ipt_connlimit_info *info = (struct ipt_connlimit_info*)match->data;
 


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libipt_IPMARK.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libipt_IPMARK.c.patch"

--- ../patch-o-matic-ng/patchlets/IPMARK/iptables/extensions/libipt_IPMARK.c.orig	2006-12-04 12:15:20.000000000 +0100
+++ ../patch-o-matic-ng/patchlets/IPMARK/iptables/extensions/libipt_IPMARK.c	2008-03-13 21:51:12.000000000 +0100
@@ -19,7 +19,7 @@
 #define IPT_OR_MASK_USED     4
 
 struct ipmarkinfo {
-	struct ipt_entry_target t;
+	struct xt_entry_target t;
 	struct ipt_ipmark_target_info ipmark;
 };
 
@@ -37,15 +37,15 @@
 }
 
 static struct option opts[] = {
-	{ "addr", 1, 0, '1' },
-	{ "and-mask", 1, 0, '2' },
-	{ "or-mask", 1, 0, '3' },
-	{ 0 }
+	{ .name = "addr", .has_arg = 1, .flag = 0, .val = '1' },
+	{ .name = "and-mask", .has_arg = 1, .flag = 0, .val = '2' },
+	{ .name = "or-mask", .has_arg = 1, .flag = 0, .val = '3' },
+	{ .name = NULL }
 };
 
 /* Initialize the target. */
 static void
-init(struct ipt_entry_target *t, unsigned int *nfcache)
+init(struct xt_entry_target *t)
 {
 	struct ipt_ipmark_target_info *ipmarkinfo =
 		(struct ipt_ipmark_target_info *)t->data;
@@ -59,8 +59,8 @@
    ate an option */
 static int
 parse(int c, char **argv, int invert, unsigned int *flags,
-      const struct ipt_entry *entry,
-      struct ipt_entry_target **target)
+      const void *entry,
+      struct xt_entry_target **target)
 {
 	struct ipt_ipmark_target_info *ipmarkinfo
 		= (struct ipt_ipmark_target_info *)(*target)->data;
@@ -116,8 +116,8 @@
 
 /* Prints out the targinfo. */
 static void
-print(const struct ipt_ip *ip,
-      const struct ipt_entry_target *target,
+print(const void *ip,
+      const struct xt_entry_target *target,
       int numeric)
 {
 	const struct ipt_ipmark_target_info *ipmarkinfo =
@@ -132,7 +132,7 @@
 
 /* Saves the union ipt_targinfo in parsable form to stdout. */
 static void
-save(const struct ipt_ip *ip, const struct ipt_entry_target *target)
+save(const void *ip, const struct xt_entry_target *target)
 {
 	const struct ipt_ipmark_target_info *ipmarkinfo =
 		(const struct ipt_ipmark_target_info *)target->data;
@@ -147,7 +147,7 @@
 	  printf("--or-mask 0x%lx ", ipmarkinfo->ormask);
 }
 
-static struct iptables_target ipmark = { 
+static struct xtables_target ipmark = { 
 	.next		= NULL,
 	.name		= "IPMARK",
 	.version	= IPTABLES_VERSION,


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libipt_ipp2p.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libipt_ipp2p.c.patch"

--- ../patch-o-matic-ng/patchlets/ipp2p/iptables/extensions/libipt_ipp2p.c.orig	2006-03-29 10:59:21.000000000 +0200
+++ ../patch-o-matic-ng/patchlets/ipp2p/iptables/extensions/libipt_ipp2p.c	2008-03-13 23:49:28.000000000 +0100
@@ -44,32 +44,29 @@
 }
 
 static struct option opts[] = {
-        { "ipp2p", 0, 0, '1' },
-        { "edk", 0, 0, '2' },	
-	{ "dc", 0, 0, '7' },
-	{ "gnu", 0, 0, '9' },
-	{ "kazaa", 0, 0, 'a' },
-	{ "bit", 0, 0, 'b' },
-	{ "apple", 0, 0, 'c' },	
-	{ "soul", 0, 0, 'd' },	
-	{ "winmx", 0, 0, 'e' },	
-	{ "ares", 0, 0, 'f' },
-	{ "mute", 0, 0, 'g' },
-	{ "waste", 0, 0, 'h' },
-	{ "xdcc", 0, 0, 'i' },
-	{ "debug", 0, 0, 'j' },
-        {0}
+	{ .name = "ipp2p", .has_arg = 0, .flag = 0, .val = '1' },
+	{ .name = "edk", .has_arg = 0, .flag = 0, .val = '2' },
+	{ .name = "dc", .has_arg = 0, .flag = 0, .val = '7' },
+	{ .name = "gnu", .has_arg = 0, .flag = 0, .val = '9' },
+	{ .name = "kazaa", .has_arg = 0, .flag = 0, .val = 'a' },
+	{ .name = "bit", .has_arg = 0, .flag = 0, .val = 'b' },
+	{ .name = "apple", .has_arg = 0, .flag = 0, .val = 'c' },
+	{ .name = "soul", .has_arg = 0, .flag = 0, .val = 'd' },
+	{ .name = "winmx", .has_arg = 0, .flag = 0, .val = 'e' },
+	{ .name = "ares", .has_arg = 0, .flag = 0, .val = 'f' },
+	{ .name = "mute", .has_arg = 0, .flag = 0, .val = 'g' },
+	{ .name = "waste", .has_arg = 0, .flag = 0, .val = 'h' },
+	{ .name = "xdcc", .has_arg = 0, .flag = 0, .val = 'i' },
+	{ .name = "debug", .has_arg = 0, .flag = 0, .val = 'j' },
+	{ .name = NULL }
 };
 
-	
 
 static void
-init(struct ipt_entry_match *m, unsigned int *nfcache)
+init(struct xt_entry_match *m)
 {
     struct ipt_p2p_info *info = (struct ipt_p2p_info *)m->data;
 
-    *nfcache |= NFC_UNKNOWN;
-
     /*init the module with default values*/
     info->cmd = 0;
     info->debug = 0;
@@ -79,9 +76,8 @@
 
 static int
 parse(int c, char **argv, int invert, unsigned int *flags,
-	const struct ipt_entry *entry,
-	unsigned int *nfcache,
-	struct ipt_entry_match **match)
+	const void *entry,
+	struct xt_entry_match **match)
 {
     struct ipt_p2p_info *info = (struct ipt_p2p_info *)(*match)->data;
     
@@ -315,8 +311,8 @@
 
 
 static void
-print(const struct ipt_ip *ip,
-        const struct ipt_entry_match *match,
+print(const void *ip,
+        const struct xt_entry_match *match,
 	int numeric)
 {
     struct ipt_p2p_info *info = (struct ipt_p2p_info *)match->data;
@@ -347,7 +343,7 @@
 
 
 static void
-save(const struct ipt_ip *ip, const struct ipt_entry_match *match)
+save(const void *ip, const struct xt_entry_match *match)
 {
     struct ipt_p2p_info *info = (struct ipt_p2p_info *)match->data;
     
@@ -376,7 +372,7 @@
 
 
 static 
-struct iptables_match ipp2p= 
+struct xtables_match ipp2p= 
 { 
     .next           = NULL,
     .name           = "ipp2p",


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libipt_ipv4options.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libipt_ipv4options.c.patch"

--- ../patch-o-matic-ng/patchlets/ipv4options/iptables/extensions/libipt_ipv4options.c.orig	2008-03-13 18:56:14.000000000 +0100
+++ ../patch-o-matic-ng/patchlets/ipv4options/iptables/extensions/libipt_ipv4options.c	2008-03-13 20:12:14.000000000 +0100
@@ -25,22 +25,22 @@
 }
 
 static struct option opts[] = {
-	{ "ssrr", 0, 0, '1' },
-	{ "lsrr", 0, 0, '2' },
-	{ "no-srr", 0, 0, '3'},
-	{ "rr", 0, 0, '4'},
-	{ "ts", 0, 0, '5'},
-	{ "ra", 0, 0, '6'},
-	{ "any-opt", 0, 0, '7'},
-	{0}
+	{ .name = "ssrr", .has_arg = 0, .flag = 0, .val = '1' },
+	{ .name = "lsrr", .has_arg = 0, .flag = 0, .val = '2' },
+	{ .name = "no-srr", .has_arg = 0, .flag = 0, .val = '3'},
+	{ .name = "rr", .has_arg = 0, .flag = 0, .val = '4'},
+	{ .name = "ts", .has_arg = 0, .flag = 0, .val = '5'},
+	{ .name = "ra", .has_arg = 0, .flag = 0, .val = '6'},
+	{ .name = "any-opt", .has_arg = 0, .flag = 0, .val = '7'},
+	{ .name = NULL }
 };
 
 /* Function which parses command options; returns true if it
    ate an option */
 static int
 parse(int c, char **argv, int invert, unsigned int *flags,
-      const struct ipt_entry *entry,
-      struct ipt_entry_match **match)
+      const void *entry,
+      struct xt_entry_match **match)
 {
 	struct ipt_ipv4options_info *info = (struct ipt_ipv4options_info *)(*match)->data;
 
@@ -225,8 +225,8 @@
 
 /* Prints out the matchinfo. */
 static void
-print(const struct ipt_ip *ip,
-      const struct ipt_entry_match *match,
+print(const void *ip,
+      const struct xt_entry_match *match,
       int numeric)
 {
 	struct ipt_ipv4options_info *info = ((struct ipt_ipv4options_info *)match->data);
@@ -260,7 +260,7 @@
 
 /* Saves the data in parsable form to stdout. */
 static void
-save(const struct ipt_ip *ip, const struct ipt_entry_match *match)
+save(const void *ip, const struct xt_entry_match *match)
 {
 	struct ipt_ipv4options_info *info = ((struct ipt_ipv4options_info *)match->data);
 
@@ -290,7 +290,7 @@
 	printf(" ");
 }
 
-static struct iptables_match ipv4options_struct = { 
+static struct xtables_match ipv4options_struct = { 
 	.next		= NULL,
 	.name		= "ipv4options",
 	.version	= IPTABLES_VERSION,


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libipt_IPV4OPTSSTRIP.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libipt_IPV4OPTSSTRIP.c.patch"

--- ../patch-o-matic-ng/patchlets/IPV4OPTSSTRIP/iptables/extensions/libipt_IPV4OPTSSTRIP.c.orig	2008-03-13 21:43:06.000000000 +0100
+++ ../patch-o-matic-ng/patchlets/IPV4OPTSSTRIP/iptables/extensions/libipt_IPV4OPTSSTRIP.c	2008-03-13 23:51:27.000000000 +0100
@@ -20,15 +20,15 @@
 }
 
 static struct option opts[] = {
-	{ 0 }
+	{ .name = NULL }
 };
 
 /* Function which parses command options; returns true if it
    ate an option */
 static int
 parse(int c, char **argv, int invert, unsigned int *flags,
-      const struct ipt_entry *entry,
-      struct ipt_entry_target **target)
+      const void *entry,
+      struct xt_entry_target **target)
 {
 	return 0;
 }
@@ -40,8 +40,8 @@
 
 /* Prints out the targinfo. */
 static void
-print(const struct ipt_ip *ip,
-      const struct ipt_entry_target *target,
+print(const void *ip,
+      const struct xt_entry_target *target,
       int numeric)
 {
 	/* nothing to print, we don't take option... */
@@ -49,12 +49,12 @@
 
 /* Saves the stuff in parsable form to stdout. */
 static void
-save(const struct ipt_ip *ip, const struct ipt_entry_target *target)
+save(const void *ip, const struct xt_entry_target *target)
 {
 	/* nothing to print, we don't take option... */
 }
 
-static struct iptables_target IPV4OPTSSTRIP = { 
+static struct xtables_target IPV4OPTSSTRIP = { 
 	.next		= NULL,
 	.name		= "IPV4OPTSSTRIP",
 	.version	= IPTABLES_VERSION,


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libipt_ROUTE.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libipt_ROUTE.c.patch"

--- ../patch-o-matic-ng/patchlets/ROUTE/iptables/extensions/libipt_ROUTE.c.orig	2006-12-12 11:34:45.000000000 +0100
+++ ../patch-o-matic-ng/patchlets/ROUTE/iptables/extensions/libipt_ROUTE.c	2008-03-10 15:04:02.000000000 +0100
@@ -39,17 +39,17 @@
 }
 
 static struct option opts[] = {
-	{ "oif", 1, 0, '1' },
-	{ "iif", 1, 0, '2' },
-	{ "gw", 1, 0, '3' },
-	{ "continue", 0, 0, '4' },
-	{ "tee", 0, 0, '5' },
-	{ 0 }
+	{ .name = "oif", .has_arg = 1, .flag = 0, .val = '1' },
+	{ .name = "iif", .has_arg = 1, .flag = 0, .val = '2' },
+	{ .name = "gw", .has_arg = 1, .flag = 0, .val = '3' },
+	{ .name = "continue", .has_arg = 0, .flag = 0, .val = '4' },
+	{ .name = "tee", .has_arg = 0, .flag = 0, .val = '5' },
+	{ .name = NULL }
 };
 
 /* Initialize the target. */
 static void
-init(struct ipt_entry_target *t, unsigned int *nfcache)
+init(struct xt_entry_target *t)
 {
 	struct ipt_route_target_info *route_info = 
 		(struct ipt_route_target_info*)t->data;
@@ -71,8 +71,8 @@
    ate an option */
 static int
 parse(int c, char **argv, int invert, unsigned int *flags,
-      const struct ipt_entry *entry,
-      struct ipt_entry_target **target)
+      const void *entry,
+      struct xt_entry_target **target)
 {
 	struct ipt_route_target_info *route_info = 
 		(struct ipt_route_target_info*)(*target)->data;
@@ -189,8 +189,8 @@
 
 /* Prints out the targinfo. */
 static void
-print(const struct ipt_ip *ip,
-      const struct ipt_entry_target *target,
+print(const void *ip,
+      const struct xt_entry_target *target,
       int numeric)
 {
 	const struct ipt_route_target_info *route_info
@@ -218,8 +218,8 @@
 }
 
 
-static void save(const struct ipt_ip *ip, 
-		 const struct ipt_entry_target *target)
+static void save(const void *ip, 
+		 const struct xt_entry_target *target)
 {
 	const struct ipt_route_target_info *route_info
 		= (const struct ipt_route_target_info *)target->data;


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libipt_SET.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libipt_SET.c.patch"

--- ../iptables/extensions/libipt_SET.c.orig	2008-03-10 15:11:32.000000000 +0100
+++ ../iptables/extensions/libipt_SET.c	2008-03-10 15:49:43.000000000 +0100
@@ -35,9 +35,9 @@
 }
 
 static const struct option SET_opts[] = {
-	{"add-set",   1, 0, '1'},
-	{"del-set",   1, 0, '2'},
-	{0}
+	{ .name = "add-set", .has_arg = 1, .flag = 0, .val = '1'},
+	{ .name = "del-set", .has_arg = 1, .flag = 0, .val = '2'},
+	{ .name = NULL }
 };
 
 /* Initialize the target. */


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libipt_set.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libipt_set.c.patch"

--- ../iptables/extensions/libipt_SET.c.orig	2008-03-10 15:11:32.000000000 +0100
+++ ../iptables/extensions/libipt_SET.c	2008-03-10 15:49:43.000000000 +0100
@@ -35,9 +35,9 @@
 }
 
 static const struct option SET_opts[] = {
-	{"add-set",   1, 0, '1'},
-	{"del-set",   1, 0, '2'},
-	{0}
+	{ .name = "add-set", .has_arg = 1, .flag = 0, .val = '1'},
+	{ .name = "del-set", .has_arg = 1, .flag = 0, .val = '2'},
+	{ .name = NULL }
 };
 
 /* Initialize the target. */


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libipt_set.h.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libipt_set.h.patch"

--- ../iptables/extensions/libipt_set.h.orig	2008-03-13 23:52:34.000000000 +0100
+++ ../iptables/extensions/libipt_set.h	2008-03-14 00:01:05.000000000 +0100
@@ -67,7 +67,7 @@
 		exit_error(OTHER_PROBLEM,
 			   "Incorrect return size from kernel during ipset lookup, "
 			   "(want %ld, got %ld)\n",
-			   sizeof(struct ip_set_req_get_set), size);
+			   (long int)sizeof(struct ip_set_req_get_set), (long int)size);
 	if (req.set.index == IP_SET_INVALID_ID)
 		exit_error(PARAMETER_PROBLEM,
 			   "Set %s doesn't exist.\n", setname);
@@ -93,7 +93,7 @@
 		exit_error(OTHER_PROBLEM,
 			   "Incorrect return size from kernel during ipset lookup, "
 			   "(want %ld, got %ld)\n",
-			   sizeof(struct ip_set_req_get_set), size);
+			   (long int)sizeof(struct ip_set_req_get_set), (long int)size);
 	if (req.set.name[0] == '\0')
 		exit_error(PARAMETER_PROBLEM,
 			   "Set id %i in kernel doesn't exist.\n", index);


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libipt_TARPIT.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libipt_TARPIT.c.patch"

--- ../patch-o-matic-ng/patchlets/TARPIT/iptables/extensions/libipt_TARPIT.c.orig	2008-03-10 16:40:05.000000000 +0100
+++ ../patch-o-matic-ng/patchlets/TARPIT/iptables/extensions/libipt_TARPIT.c	2008-03-10 16:50:27.000000000 +0100
@@ -12,13 +12,13 @@
 }
 
 static struct option opts[] = {
-	{ 0 }
+	{ .name = 0 }
 };
 
 static int
 parse(int c, char **argv, int invert, unsigned int *flags,
-      const struct ipt_entry *entry,
-      struct ipt_entry_target **target)
+      const void *entry,
+      struct xt_entry_target **target)
 {
 	return 0;
 }
@@ -28,13 +28,13 @@
 }
 
 static void
-print(const struct ipt_ip *ip,
-      const struct ipt_entry_target *target,
+print(const void *ip,
+      const struct xt_entry_target *target,
       int numeric)
 {
 }
 
-static void save(const struct ipt_ip *ip, const struct ipt_entry_target *target)
+static void save(const void *ip, const struct xt_entry_target *target)
 {
 }
 


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libipt_time.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libipt_time.c.patch"

--- ../patch-o-matic-ng/patchlets/time/iptables/extensions/libipt_time.c.orig	2006-12-04 12:15:20.000000000 +0100
+++ ../patch-o-matic-ng/patchlets/time/iptables/extensions/libipt_time.c	2008-03-14 01:23:54.000000000 +0100
@@ -10,7 +10,7 @@
 #include <linux/netfilter_ipv4/ipt_time.h>
 #include <time.h>
 
-static int globaldays;
+static unsigned int globaldays;
 
 /* Function which prints out usage message. */
 static void
@@ -43,17 +43,17 @@
 }
 
 static struct option opts[] = {
-	{ "timestart", 1, 0, '1' },
-	{ "timestop", 1, 0, '2' },
-	{ "days", 1, 0, '3'},
-	{ "datestart", 1, 0, '4' },
-	{ "datestop", 1, 0, '5' },
-	{0}
+	{ .name = "timestart", .has_arg = 1, .flag = 0, .val = '1' },
+	{ .name = "timestop", .has_arg = 1, .flag = 0, .val = '2' },
+	{ .name = "days", .has_arg = 1, .flag = 0, .val = '3'},
+	{ .name = "datestart", .has_arg = 1, .flag = 0, .val = '4' },
+	{ .name = "datestop", .has_arg = 1, .flag = 0, .val = '5' },
+	{ .name = NULL }
 };
 
 /* Initialize the match. */
 static void
-init(struct ipt_entry_match *m, unsigned int *nfcache)
+init(struct xt_entry_match *m)
 {
 	struct ipt_time_info *info = (struct ipt_time_info *)m->data;
 	globaldays = 0;
@@ -105,7 +105,7 @@
 }
 
 static int
-parse_number(char *str, int num_min, int num_max, int *number)
+parse_number(char *str, unsigned int num_min, unsigned int num_max, void *number)
 {
 	/* if the number starts with 0, replace it with a space else
 	string_to_number() will interpret it as octal !! */
@@ -119,7 +119,7 @@
 }
 
 static void
-parse_time_string(int *hour, int *minute, const char *time)
+parse_time_string(unsigned int *hour, unsigned int *minute, const char *time)
 {
 	char *hours;
 	char *minutes;
@@ -151,11 +151,11 @@
 
 /* return 1->ok, return 0->error */
 static int
-parse_day(int *days, int from, int to, const char *string)
+parse_day(unsigned int *days, unsigned int from, unsigned int to, const char *string)
 {
 	char *dayread;
 	char *days_str[7] = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
-	unsigned short int days_of_week[7] = {64, 32, 16, 8, 4, 2, 1};
+	unsigned short int days_of_week[7] = {1 << 6, 1 << 5, 1 << 4, 1 << 3, 1 << 2, 1 << 1, 1 << 0};
 	unsigned int i;
 
 	dayread = (char *)malloc(4);
@@ -179,7 +179,7 @@
 }
 
 static void
-parse_days_string(int *days, const char *daystring)
+parse_days_string(unsigned int *days, const char *daystring)
 {
 	int len;
 	int i=0;
@@ -334,12 +334,11 @@
    ate an option */
 static int
 parse(int c, char **argv, int invert, unsigned int *flags,
-      const struct ipt_entry *entry,
-      unsigned int *nfcache,
-      struct ipt_entry_match **match)
+      const void *entry,
+      struct xt_entry_match **match)
 {
 	struct ipt_time_info *timeinfo = (struct ipt_time_info *)(*match)->data;
-	int hours, minutes;
+	unsigned int hours, minutes;
 	time_t temp_date;
 
 	switch (c)
@@ -425,7 +424,7 @@
 print_days(int daynum)
 {
 	char *days[7] = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
-	unsigned short int days_of_week[7] = {64, 32, 16, 8, 4, 2, 1};
+	unsigned short int days_of_week[7] = {1 << 6, 1 << 5, 1 << 4, 1 << 3, 1 << 2, 1 << 1, 1 << 0};
 	unsigned short int i, nbdays=0;
 
 	for (i=0; i<7; i++) {
@@ -467,8 +466,8 @@
 
 /* Prints out the matchinfo. */
 static void
-print(const struct ipt_ip *ip,
-      const struct ipt_entry_match *match,
+print(const void *ip,
+      const struct xt_entry_match *match,
       int numeric)
 {
 	struct ipt_time_info *time = ((struct ipt_time_info *)match->data);
@@ -500,7 +499,7 @@
 
 /* Saves the data in parsable form to stdout. */
 static void
-save(const struct ipt_ip *ip, const struct ipt_entry_match *match)
+save(const void *ip, const struct xt_entry_match *match)
 {
 	struct ipt_time_info *time = ((struct ipt_time_info *)match->data);
 	int hour_start, hour_stop, minute_start, minute_stop;
@@ -528,7 +527,7 @@
 /* have to use offsetof() instead of IPT_ALIGN(), since kerneltime must not
  * be compared when user deletes rule with '-D' */
 static
-struct iptables_match timestruct = {
+struct xtables_match timestruct = {
 	.next		= NULL,
 	.name		= "time",
 	.version	= IPTABLES_VERSION,


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libipt_u32.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libipt_u32.c.patch"

--- ../patch-o-matic-ng/patchlets/u32/iptables/extensions/libipt_u32.c.orig	2008-03-10 17:03:26.000000000 +0100
+++ ../patch-o-matic-ng/patchlets/u32/iptables/extensions/libipt_u32.c	2008-03-10 17:14:57.000000000 +0100
@@ -33,8 +33,8 @@
 
 /* defined in /usr/include/getopt.h maybe in man getopt */
 static struct option opts[] = {
-	{ "u32", 1, 0, '1' },
-	{ 0 }
+	{ .name = "u32", .has_arg = 1, .flag = 0, .val = '1' },
+	{ .name = NULL }
 };
 
 /* shared printing code */
@@ -92,8 +92,8 @@
 /* Function which parses command options; returns true if it ate an option */
 static int
 parse(int c, char **argv, int invert, unsigned int *flags,
-      const struct ipt_entry *entry,
-      struct ipt_entry_match **match)
+      const void *entry,
+      struct xt_entry_match **match)
 {
 	struct ipt_u32 *data = (struct ipt_u32 *)(*match)->data;
 	char *arg = argv[optind-1]; /* the argument string */
@@ -227,8 +227,8 @@
 
 /* Prints out the matchinfo. */
 static void
-print(const struct ipt_ip *ip,
-      const struct ipt_entry_match *match,
+print(const void *ip,
+      const struct xt_entry_match *match,
       int numeric)
 {
 	printf("u32 ");
@@ -236,7 +236,7 @@
 }
 
 /* Saves the union ipt_matchinfo in parsable form to stdout. */
-static void save(const struct ipt_ip *ip, const struct ipt_entry_match *match)
+static void save(const void *ip, const struct xt_entry_match *match)
 {
 	printf("--u32 ");
 	print_u32((struct ipt_u32 *)match->data);


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libiptc.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libiptc.c.patch"

--- ../iptables/libiptc/libiptc.c.orig	2008-03-10 14:30:20.000000000 +0100
+++ ../iptables/libiptc/libiptc.c	2008-03-10 14:41:54.000000000 +0100
@@ -918,7 +918,7 @@
 			if (t->verdict < 0) {
 				DEBUGP_C("standard, verdict=%d\n", t->verdict);
 				r->type = IPTCC_R_STANDARD;
-			} else if (t->verdict == r->offset+e->next_offset) {
+			} else if ((unsigned int)(t->verdict) == r->offset+e->next_offset) {
 				DEBUGP_C("fallthrough\n");
 				r->type = IPTCC_R_FALLTHROUGH;
 			} else {


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libxt_CHAOS.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libxt_CHAOS.c.patch"

--- ../chaostables/tags/v0.7/iptables/extensions/libxt_CHAOS.c.orig	2008-03-07 16:51:34.000000000 +0100
+++ ../chaostables/tags/v0.7/iptables/extensions/libxt_CHAOS.c	2008-03-07 16:57:06.000000000 +0100
@@ -86,9 +86,9 @@
 }
 
 static const struct option CHAOS_opts[] = {
-	{"delude", 0, NULL, 'd'},
-	{"tarpit", 0, NULL, 't'},
-	{NULL},
+	{ .name = "delude", .has_arg = 0, .flag = NULL, .val = 'd'},
+	{ .name = "tarpit", .has_arg = 0, .flag = NULL, .val = 't'},
+	{ .name = NULL }
 };
 
 static struct xtables_target CHAOS_reg = {


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libxt_geoip.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libxt_geoip.c.patch"

--- ../patch-o-matic-ng/patchlets/geoip/iptables/extensions/libxt_geoip.c.orig	2008-02-13 17:03:42.000000000 +0100
+++ ../patch-o-matic-ng/patchlets/geoip/iptables/extensions/libxt_geoip.c	2008-03-15 20:05:46.000000000 +0100
@@ -46,11 +46,11 @@
 }
 
 static struct option geoip_opts[] = {
-   {  "dst-cc",  1, 0, '2'  }, /* Alias for --destination-country */
-   {  "destination-country",   1, 0, '2'  },
-   {  "src-cc",  1, 0, '1'  }, /* Alias for --source-country */
-   {  "source-country",  1, 0, '1'  },
-   {  0  },
+   { .name = "dst-cc", .has_arg = 1, .flag = 0, .val = '2'  }, /* Alias for --destination-country */
+   { .name = "destination-country", .has_arg = 1, .flag = 0, .val = '2'  },
+   { .name = "src-cc", .has_arg = 1, .flag = 0, .val = '1'  }, /* Alias for --source-country */
+   { .name = "source-country", .has_arg = 1, .flag = 0, .val = '1'  },
+   { .name = NULL  }
 };
 
 /* NOT IMPLEMENTED YET


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libxt_portscan.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libxt_portscan.c.patch"

--- ../chaostables/tags/v0.7/iptables/extensions/libxt_portscan.c.orig	2008-03-13 18:25:33.000000000 +0100
+++ ../chaostables/tags/v0.7/iptables/extensions/libxt_portscan.c	2008-03-13 18:51:02.000000000 +0100
@@ -29,15 +29,13 @@
 	return;
 }
 
-static void portscan_mtinit(struct xt_entry_match *match, unsigned int *nfcache)
+static void portscan_mtinit(struct xt_entry_match *match)
 {
-	/* Cannot cache this */
-	*nfcache |= NFC_UNKNOWN;
 	return;
 }
 
 static int portscan_parse(int c, char **argv, int invert, unsigned int *flags,
-    const void *entry, unsigned int *nfcache, struct xt_entry_match **match)
+    const void *entry, struct xt_entry_match **match)
 {
 	struct xt_portscan_info *info = (void *)((*match)->data);
 
@@ -100,11 +98,11 @@
 }
 
 static const struct option portscan_opts[] = {
-	{"stealth", 0, NULL, 'x'},
-	{"synscan", 0, NULL, 's'},
-	{"cnscan",  0, NULL, 'c'},
-	{"grscan",  0, NULL, 'g'},
-	{NULL},
+	{ .name = "stealth", .has_arg = 0, .flag = NULL, .val = 'x'},
+	{ .name = "synscan", .has_arg = 0, .flag = NULL, .val = 's'},
+	{ .name = "cnscan",  .has_arg = 0, .flag = NULL, .val = 'c'},
+	{ .name = "grscan",  .has_arg = 0, .flag = NULL, .val = 'g'},
+	{ .name = NULL }
 };
 
 static struct xtables_match portscan_reg = {


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libxt_RATEEST.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libxt_RATEEST.c.patch"

--- ../iptables/extensions/libxt_RATEEST.c.orig	2008-03-10 15:11:32.000000000 +0100
+++ ../iptables/extensions/libxt_RATEEST.c	2008-03-10 15:23:07.000000000 +0100
@@ -152,7 +152,7 @@
 		exit_error(PARAMETER_PROBLEM, "RATEEST: no ewmalog specified");
 
 	for (info->interval = 0; info->interval <= 5; info->interval++) {
-		if (interval <= (1 << info->interval) * (TIME_UNITS_PER_SEC / 4))
+		if (interval <= (unsigned int)(1 << info->interval) * (TIME_UNITS_PER_SEC / 4))
 			break;
 	}
 


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="libxt_sctp.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libxt_sctp.c.patch"

--- ../iptables/extensions/libxt_sctp.c.orig	2008-03-09 22:28:33.000000000 +0100
+++ ../iptables/extensions/libxt_sctp.c	2008-03-10 16:17:27.000000000 +0100
@@ -388,7 +388,7 @@
 		printf("0x%04X", chunknum);
 	}
 	else {
-		int i;
+		unsigned int i;
 
 		for (i = 0; i < ELEMCOUNT(sctp_chunk_names); i++) {
 			if (sctp_chunk_names[i].chunk_type == chunknum)


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="Makefile.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Makefile.patch"

--- ../linux/Makefile.orig	2008-02-07 16:06:30.000000000 +0100
+++ ../linux/Makefile	2008-02-07 16:24:03.000000000 +0100
@@ -331,7 +331,7 @@
 KBUILD_CPPFLAGS := -D__KERNEL__ $(LINUXINCLUDE)
 
 KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
-		   -fno-strict-aliasing -fno-common \
+		   -fno-strict-aliasing -fno-common -fno-tree-scev-cprop \
 		   -Werror-implicit-function-declaration
 KBUILD_AFLAGS   := -D__ASSEMBLY__
 


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="Netfilter_POM.pm.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Netfilter_POM.pm.patch"

--- ../patch-o-matic-ng/Netfilter_POM.pm.orig	2008-03-04 14:29:20.000000000 +0100
+++ ../patch-o-matic-ng/Netfilter_POM.pm	2008-03-04 14:30:10.000000000 +0100
@@ -128,7 +128,7 @@
 		or croak "Missing Makefile from $self->{projects}->{iptables}->{PATH}!";
 	while (my $line = <MAKEFILE>) {
 		chomp($line);
-		if ($line =~ /^IPTABLES_VERSION:=(\S+)/) {
+		if ($line =~ /^VERSION =\s*(\S+)/) {
 			$version = $1;
 			# don't support versioning like 1.2.3b!
 			$version =~ s/[^\d\.]//g;


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="xt_CHAOS.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="xt_CHAOS.c.patch"

--- ../chaostables/tags/v0.7/kernel/xt_CHAOS.c.orig	2008-03-27 07:28:52.000000000 +0100
+++ ../chaostables/tags/v0.7/kernel/xt_CHAOS.c	2008-03-27 07:41:14.000000000 +0100
@@ -44,16 +44,17 @@
 
 /* CHAOS functions */
 static void xt_chaos_total(const struct xt_chaos_info *info,
-    struct sk_buff **pskb, const struct net_device *in,
+    struct sk_buff *pskb, const struct net_device *in,
     const struct net_device *out, unsigned int hooknum)
 {
-	const struct iphdr *iph = ip_hdr(*pskb);
+	const struct iphdr *iph = ip_hdr(pskb);
 	const int protoff       = 4 * iph->ihl;
 	const int offset        = ntohs(iph->frag_off) & IP_OFFSET;
 	const struct xt_target *destiny;
-	int hotdrop = false, ret;
+	bool hotdrop = false;
+	int ret;
 
-	ret = xm_tcp->match(*pskb, in, out, xm_tcp, &tcp_params,
+	ret = xm_tcp->match(pskb, in, out, xm_tcp, &tcp_params,
 	                    offset, protoff, &hotdrop);
 	if (!ret || hotdrop || (unsigned int)net_random() > delude_percentage)
 		return;
@@ -63,7 +64,7 @@
 	return;
 }
 
-static unsigned int xt_chaos_target(struct sk_buff **pskb,
+static unsigned int xt_chaos_target(struct sk_buff *pskb,
     const struct net_device *in, const struct net_device *out,
     unsigned int hooknum, const struct xt_target *target, const void *targinfo)
 {
@@ -76,7 +77,7 @@
 	 * -A chaos -j DROP;
 	 */
 	const struct xt_chaos_info *info = targinfo;
-	const struct iphdr *iph = ip_hdr(*pskb);
+	const struct iphdr *iph = ip_hdr(pskb);
 
 	if ((unsigned int)net_random() <= reject_percentage)
 		return xt_reject->target(pskb, in, out, hooknum, target,
@@ -90,7 +91,7 @@
 	return NF_DROP;
 }
 
-static int xt_chaos_checkentry(const char *tablename, const void *entry,
+static bool xt_chaos_checkentry(const char *tablename, const void *entry,
     const struct xt_target *target, void *targinfo, unsigned int hook_mask)
 {
 	const struct xt_chaos_info *info = targinfo;


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="xt_DELUDE.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="xt_DELUDE.c.patch"

--- ../chaostables/tags/v0.7/kernel/xt_DELUDE.c.orig	2008-03-26 15:06:58.000000000 +0100
+++ ../chaostables/tags/v0.7/kernel/xt_DELUDE.c	2008-03-26 15:32:57.000000000 +0100
@@ -131,7 +131,7 @@
 #endif
 		addr_type = RTN_LOCAL;
 
-	if (ip_route_me_harder(&nskb, addr_type))
+	if (ip_route_me_harder(nskb, addr_type))
 		goto free_nskb;
 
 	nskb->ip_summed = CHECKSUM_NONE;
@@ -157,14 +157,14 @@
 	kfree_skb(nskb);
 }
 
-static unsigned int xt_delude_target(struct sk_buff **pskb,
+static unsigned int xt_delude_target(struct sk_buff *pskb,
     const struct net_device *in, const struct net_device *out,
     unsigned int hooknum, const struct xt_target *target, const void *targinfo)
 {
 	/* WARNING: This code causes reentry within iptables.
 	   This means that the iptables jump stack is now crap.  We
 	   must return an absolute verdict. --RR */
-	send_reset(*pskb, hooknum);
+	send_reset(pskb, hooknum);
 	return NF_DROP;
 }
 


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="xt_portscan.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="xt_portscan.c.patch"

--- ../chaostables/tags/v0.7/kernel/xt_portscan.c.orig	2008-03-26 08:58:01.000000000 +0100
+++ ../chaostables/tags/v0.7/kernel/xt_portscan.c	2008-03-26 15:01:29.000000000 +0100
@@ -18,6 +18,7 @@
 #include <linux/netfilter/x_tables.h>
 #include <linux/netfilter/xt_tcpudp.h>
 #include <net/netfilter/nf_nat_rule.h>
+#include <net/net_namespace.h>
 #include "xt_portscan.h"
 #define PFX KBUILD_MODNAME ": "
 
@@ -170,10 +171,10 @@
 	return mark;
 }
 
-static int xt_portscan_match(const struct sk_buff *skb,
+static bool xt_portscan_match(const struct sk_buff *skb,
     const struct net_device *in, const struct net_device *out,
     const struct xt_match *match, const void *matchinfo, int offset,
-    unsigned int protoff, int *hotdrop)
+    unsigned int protoff, bool *hotdrop)
 {
 	const struct xt_portscan_info *info = matchinfo;
 	enum ip_conntrack_info ctstate;
@@ -206,7 +207,7 @@
 		unsigned int n;
 
 		n = xt_portscan_full(ctdata->mark & connmark_mask, ctstate,
-		    in == &loopback_dev, tcph,
+		    in == init_net.loopback_dev, tcph,
 		    skb->len - protoff - 4 * tcph->doff);
 
 		ctdata->mark = (ctdata->mark & ~connmark_mask) | n;
@@ -219,7 +220,7 @@
 	       (info->match_gr && ctdata->mark == mark_grscan);
 }
 
-static int xt_portscan_checkentry(const char *tablename, const void *entry,
+static bool xt_portscan_checkentry(const char *tablename, const void *entry,
     const struct xt_match *match, void *matchinfo, unsigned int hook_mask)
 {
 	const struct xt_portscan_info *info = matchinfo;


--------------030505080709080507030502
Content-Type: text/x-diff;
 name="xt_sctp.h.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="xt_sctp.h.patch"

--- ../iptables/include/linux/netfilter/xt_sctp.h.orig	2008-03-10 15:50:52.000000000 +0100
+++ ../iptables/include/linux/netfilter/xt_sctp.h	2008-03-10 16:30:59.000000000 +0100
@@ -58,28 +58,28 @@
 
 #define SCTP_CHUNKMAP_RESET(chunkmap) 				\
 	do {							\
-		int i; 						\
+		unsigned int i; 						\
 		for (i = 0; i < ELEMCOUNT(chunkmap); i++)	\
 			chunkmap[i] = 0;			\
 	} while (0)
 
 #define SCTP_CHUNKMAP_SET_ALL(chunkmap) 			\
 	do {							\
-		int i; 						\
+		unsigned int i; 						\
 		for (i = 0; i < ELEMCOUNT(chunkmap); i++) 	\
 			chunkmap[i] = ~0;			\
 	} while (0)
 
 #define SCTP_CHUNKMAP_COPY(destmap, srcmap) 			\
 	do {							\
-		int i; 						\
+		unsigned int i; 						\
 		for (i = 0; i < ELEMCOUNT(chunkmap); i++) 	\
 			destmap[i] = srcmap[i];			\
 	} while (0)
 
 #define SCTP_CHUNKMAP_IS_CLEAR(chunkmap) 		\
 ({							\
-	int i; 						\
+	unsigned int i; 						\
 	int flag = 1;					\
 	for (i = 0; i < ELEMCOUNT(chunkmap); i++) {	\
 		if (chunkmap[i]) {			\
@@ -92,10 +92,10 @@
 
 #define SCTP_CHUNKMAP_IS_ALL_SET(chunkmap) 		\
 ({							\
-	int i; 						\
+	unsigned int i; 						\
 	int flag = 1;					\
 	for (i = 0; i < ELEMCOUNT(chunkmap); i++) {	\
-		if (chunkmap[i] != ~0) {		\
+		if (chunkmap[i] != (unsigned int)(~0)) {		\
 			flag = 0;			\
 				break;			\
 		}					\


--------------030505080709080507030502--
