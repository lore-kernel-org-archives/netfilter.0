From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: patches against 2.6.21 and a small script
Date: Mon, 25 Jun 2007 19:04:10 +0200
Message-ID: <467FF58A.1010000@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

Hi list!

I found that many pom patches are out of date so I "upgraded" them...
And also attached a small diff script. (Just rename the old source to 
.orig and you will get all of those modifications you did if you run 
this script.)

Swifty

Patches:

--- ./patchlets/ipv4options/linux-2.6/net/ipv4/netfilter/ipt_ipv4options.c.orig	2007-05-02 15:32:49.000000000 +0200
+++ ./patchlets/ipv4options/linux-2.6/net/ipv4/netfilter/ipt_ipv4options.c	2007-06-25 18:40:25.000000000 +0200
@@ -154,8 +154,16 @@
 	return 1;
 }
 
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+static struct xt_match ipv4options_match = { 
+#else
 static struct ipt_match ipv4options_match = { 
+#endif
 	.name = "ipv4options",
+	.family = AF_INET,
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	.family		= AF_INET,
+#endif
 	.match = match,
 	.matchsize = sizeof(struct ipt_ipv4options_info),
 	.checkentry = checkentry,
@@ -164,12 +172,20 @@
 
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
--- ./patchlets/ROUTE/linux-2.6/net/ipv4/netfilter/ipt_ROUTE.c.orig	2007-05-29 16:29:35.000000000 +0200
+++ ./patchlets/ROUTE/linux-2.6/net/ipv4/netfilter/ipt_ROUTE.c	2007-06-25 18:53:18.000000000 +0200
@@ -452,8 +452,15 @@
 }
 
 
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+static struct xt_target xt_route_reg = { 
+#else
 static struct ipt_target ipt_route_reg = { 
+#endif
 	.name = "ROUTE",
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	.family		= AF_INET,
+#endif
 	.target = ipt_route_target,
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
 	.targetsize = sizeof(struct ipt_route_target_info),
@@ -471,14 +478,21 @@
 	set_bit(IPS_CONFIRMED_BIT, &route_tee_track.status);
 	/* Initialize fake conntrack so that NAT will skip it */
 	route_tee_track.status |= IPS_NAT_DONE_MASK;
-
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	return xt_register_target(&xt_route_reg);
+#else
 	return ipt_register_target(&ipt_route_reg);
+#endif
 }
 
 
 static void __exit fini(void)
 {
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	xt_unregister_target(&xt_route_reg);
+#else
 	ipt_unregister_target(&ipt_route_reg);
+#endif
 }
 
 module_init(init);
--- ./patchlets/IPV4OPTSSTRIP/linux-2.6/net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c.orig	2007-05-02 15:32:51.000000000 +0200
+++ ./patchlets/IPV4OPTSSTRIP/linux-2.6/net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c	2007-06-25 18:28:00.000000000 +0200
@@ -30,7 +30,7 @@
 	unsigned char *optiph;
 	int l;
 	
-	if (!skb_ip_make_writable(pskb, (*pskb)->len))
+	if (!skb_make_writable(pskb, (*pskb)->len))
 		return NF_DROP;
  
 	skb = (*pskb);
@@ -67,20 +67,36 @@
 	return 1;
 }
 
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+static struct xt_target xt_ipv4optsstrip_reg = { 
+#else
 static struct ipt_target ipt_ipv4optsstrip_reg = { 
+#endif
 	.name = "IPV4OPTSSTRIP",
+	.family = AF_INET,
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	.family		= AF_INET,
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
--- ./patchlets/geoip/linux-2.6/net/ipv4/netfilter/ipt_geoip.c.orig	2006-12-06 03:47:46.000000000 +0100
+++ ./patchlets/geoip/linux-2.6/net/ipv4/netfilter/ipt_geoip.c	2007-06-25 18:38:49.000000000 +0200
@@ -275,8 +275,15 @@
    return;
 }
 
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+static struct xt_match geoip_match = {
+#else
 static struct ipt_match geoip_match = {
+#endif
    .name    = "geoip",
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+   .family     = AF_INET,
+#endif
    .match      = &match,
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
    .matchsize  = sizeof (struct ipt_geoip_info),
@@ -288,12 +295,20 @@
 
 static int __init init(void)
 {
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+   return xt_register_match(&geoip_match);
+#else
    return ipt_register_match(&geoip_match);
+#endif
 }
 
 static void __exit fini(void)
 {
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+  xt_unregister_match(&geoip_match);
+#else
   ipt_unregister_match(&geoip_match);
+#endif
   return;
 }
 
--- ./patchlets/IPMARK/linux-2.6/net/ipv4/netfilter/ipt_IPMARK.c.orig	2007-03-06 14:47:13.000000000 +0100
+++ ./patchlets/IPMARK/linux-2.6/net/ipv4/netfilter/ipt_IPMARK.c	2007-06-25 18:55:51.000000000 +0200
@@ -82,8 +82,15 @@
 	return 1;
 }
 
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+static struct xt_target xt_ipmark_reg = { 
+#else
 static struct ipt_target ipt_ipmark_reg = { 
+#endif
 	.name		= "IPMARK",
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	.family		= AF_INET,
+#endif
 	.target		= target,
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
 	.targetsize	= sizeof(struct ipt_ipmark_target_info),
@@ -94,12 +101,20 @@
 
 static int __init init(void)
 {
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	return xt_register_target(&xt_ipmark_reg);
+#else
 	return ipt_register_target(&ipt_ipmark_reg);
+#endif
 }
 
 static void __exit fini(void)
 {
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	xt_unregister_target(&xt_ipmark_reg);
+#else
 	ipt_unregister_target(&ipt_ipmark_reg);
+#endif
 }
 
 module_init(init);
--- ./patchlets/connlimit/linux-2.6/net/ipv4/netfilter/ipt_connlimit.c.orig	2007-03-06 14:47:13.000000000 +0100
+++ ./patchlets/connlimit/linux-2.6/net/ipv4/netfilter/ipt_connlimit.c	2007-06-25 18:32:06.000000000 +0200
@@ -291,8 +291,15 @@
 	kfree(info->data);
 }
 
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+static struct xt_match connlimit_match = { 
+#else
 static struct ipt_match connlimit_match = { 
+#endif
 	.name		= "connlimit",
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	.family		= AF_INET,
+#endif
 	.match		= &match,
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
 	.matchsize	= sizeof(struct ipt_connlimit_info),
@@ -304,12 +311,20 @@
 
 static int __init init(void)
 {
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	return xt_register_match(&connlimit_match);
+#else
 	return ipt_register_match(&connlimit_match);
+#endif
 }
 
 static void __exit fini(void)
 {
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	xt_unregister_match(&connlimit_match);
+#else
 	ipt_unregister_match(&connlimit_match);
+#endif
 }
 
 module_init(init);
--- ./patchlets/ipp2p/linux-2.6/net/ipv4/netfilter/ipt_ipp2p.c.orig	2006-08-08 17:51:42.000000000 +0200
+++ ./patchlets/ipp2p/linux-2.6/net/ipv4/netfilter/ipt_ipp2p.c	2007-06-25 18:35:30.000000000 +0200
@@ -844,8 +844,11 @@
 									    
 
 
-
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+static struct xt_match ipp2p_match = { 
+#else
 static struct ipt_match ipp2p_match = { 
+#endif
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)
 	{ NULL, NULL }, 
 	"ipp2p", 
@@ -856,6 +859,9 @@
 #endif
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0)
 	.name		= "ipp2p",
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	.family		= AF_INET,
+#endif
 	.match		= &match,
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
 	.matchsize	= sizeof(struct ipt_p2p_info),
@@ -869,12 +875,20 @@
 static int __init init(void)
 {
     printk(KERN_INFO "IPP2P v%s loading\n", IPP2P_VERSION);
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+    return xt_register_match(&ipp2p_match);
+#else
     return ipt_register_match(&ipp2p_match);
+#endif
 }
 	
 static void __exit fini(void)
 {
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+    xt_unregister_match(&ipp2p_match);
+#else
     ipt_unregister_match(&ipp2p_match);
+#endif
     printk(KERN_INFO "IPP2P v%s unloaded\n", IPP2P_VERSION);    
 }
 	
--- ./patchlets/time/linux-2.6/net/ipv4/netfilter/ipt_time.c.orig	2007-03-06 15:01:42.000000000 +0100
+++ ./patchlets/time/linux-2.6/net/ipv4/netfilter/ipt_time.c	2007-06-25 18:44:20.000000000 +0200
@@ -126,8 +126,15 @@
 	return 1;
 }
 
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+static struct xt_match time_match = {
+#else
 static struct ipt_match time_match = {
+#endif
 	.name		= "time",
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	.family		= AF_INET,
+#endif
 	.match		= &match,
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,17)
 	.matchsize      = sizeof(struct ipt_time_info),
@@ -139,12 +146,20 @@
 static int __init init(void)
 {
 	printk("ipt_time loading\n");
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	return xt_register_match(&time_match);
+#else
 	return ipt_register_match(&time_match);
+#endif
 }
 
 static void __exit fini(void)
 {
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,21)
+	xt_unregister_match(&time_match);
+#else
 	ipt_unregister_match(&time_match);
+#endif
 	printk("ipt_time unloaded\n");
 }
 


Diff script:

#!/bin/bash

for f in `find . | grep .orig`
 do diff -Nru $f `echo $f | sed 's/.orig//'`
 done






