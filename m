From: Kostadin Karaivanov <larry@tamiweb.com>
Subject: forward port of TTL.patch to 2.6.0-test9
Date: Tue, 04 Nov 2003 18:01:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FA7CD65.6000804@tamiweb.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080907010401010406090206"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------080907010401010406090206
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi list,
I just forward ported TTL.patch (attached) from patch-o-matic-20031103 
to linux-2.6.0-test9 for fun and profit. It's rather mechanical port but 
it works at least build-in. I've veryfied this with tcpdump.
But I have two questions. First of course is: is this the proper way to 
port things like this, couse AFAIC 2.4 and 2.5 networking code is quite 
different, if not why. And second - where I can read about current 
implementation ot linux networking excetp kernel sources.

wwell Larry.

P.S please cc me, I'm not subscribet to the list.

--------------080907010401010406090206
Content-Type: text/plain;
 name="patch.TTL-2.6.0-test9"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch.TTL-2.6.0-test9"

diff -ruN linux-2.6.0-test9/include/linux/netfilter_ipv4/ipt_TTL.h linux-2.6.0-test9-my/include/linux/netfilter_ipv4/ipt_TTL.h
--- linux-2.6.0-test9/include/linux/netfilter_ipv4/ipt_TTL.h	1970-01-01 02:00:00.000000000 +0200
+++ linux-2.6.0-test9-my/include/linux/netfilter_ipv4/ipt_TTL.h	2003-11-04 11:31:22.000000000 +0200
@@ -0,0 +1,21 @@
+/* TTL modification module for IP tables
+ * (C) 2000 by Harald Welte <laforge@gnumonks.org> */
+
+#ifndef _IPT_TTL_H
+#define _IPT_TTL_H
+
+enum {
+	IPT_TTL_SET = 0,
+	IPT_TTL_INC,
+	IPT_TTL_DEC
+};
+
+#define IPT_TTL_MAXMODE	IPT_TTL_DEC
+
+struct ipt_TTL_info {
+	u_int8_t	mode;
+	u_int8_t	ttl;
+};
+
+
+#endif
diff -ruN linux-2.6.0-test9/net/ipv4/netfilter/Kconfig linux-2.6.0-test9-my/net/ipv4/netfilter/Kconfig
--- linux-2.6.0-test9/net/ipv4/netfilter/Kconfig	2003-10-25 21:44:33.000000000 +0300
+++ linux-2.6.0-test9-my/net/ipv4/netfilter/Kconfig	2003-11-04 14:32:09.000000000 +0200
@@ -478,6 +478,17 @@
 
 	  To compile it as a module, choose M here.  If unsure, say N.
 
+config IP_NF_TARGET_TTL
+	tristate "TTL target support"
+	depends on IP_NF_MANGLE
+	help 
+	  This option adds a `TTL' target, which enables the user to set
+	  the TTL value or increment / decrement the TTL value by a given
+	  amount.
+	      
+	  If you want to compile it as a module, say M here and read
+          Documentation/modules.txt.  If unsure, say `N'.
+		  
 config IP_NF_TARGET_LOG
 	tristate "LOG target support"
 	depends on IP_NF_IPTABLES
diff -ruN linux-2.6.0-test9/net/ipv4/netfilter/Makefile linux-2.6.0-test9-my/net/ipv4/netfilter/Makefile
--- linux-2.6.0-test9/net/ipv4/netfilter/Makefile	2003-10-25 21:43:07.000000000 +0300
+++ linux-2.6.0-test9-my/net/ipv4/netfilter/Makefile	2003-11-04 11:29:22.000000000 +0200
@@ -78,6 +78,7 @@
 obj-$(CONFIG_IP_NF_TARGET_SAME) += ipt_SAME.o
 obj-$(CONFIG_IP_NF_TARGET_CLASSIFY) += ipt_CLASSIFY.o
 obj-$(CONFIG_IP_NF_NAT_SNMP_BASIC) += ip_nat_snmp_basic.o
+obj-$(CONFIG_IP_NF_TARGET_TTL) += ipt_TTL.o
 obj-$(CONFIG_IP_NF_TARGET_LOG) += ipt_LOG.o
 obj-$(CONFIG_IP_NF_TARGET_ULOG) += ipt_ULOG.o
 obj-$(CONFIG_IP_NF_TARGET_TCPMSS) += ipt_TCPMSS.o
diff -ruN linux-2.6.0-test9/net/ipv4/netfilter/ipt_TTL.c linux-2.6.0-test9-my/net/ipv4/netfilter/ipt_TTL.c
--- linux-2.6.0-test9/net/ipv4/netfilter/ipt_TTL.c	1970-01-01 02:00:00.000000000 +0200
+++ linux-2.6.0-test9-my/net/ipv4/netfilter/ipt_TTL.c	2003-11-04 13:00:00.000000000 +0200
@@ -0,0 +1,124 @@
+/* TTL modification target for IP tables
+ * (C) 2000 by Harald Welte <laforge@gnumonks.org>
+ *
+ * Version: 1.8
+ *
+ * This software is distributed under the terms of GNU GPL
+ */
+
+#include <linux/module.h>
+#include <linux/skbuff.h>
+#include <linux/ip.h>
+#include <net/checksum.h>
+
+#include <linux/netfilter_ipv4/ip_tables.h>
+#include <linux/netfilter_ipv4/ipt_TTL.h>
+
+MODULE_AUTHOR("Harald Welte <laforge@gnumonks.org>");
+MODULE_DESCRIPTION("IP tables TTL modification module");
+MODULE_LICENSE("GPL");
+
+static unsigned int 
+ipt_ttl_target(struct sk_buff **pskb, 
+		const struct net_device *in, 
+		const struct net_device *out,
+		unsigned int hooknum,
+		const void *targinfo, 
+		void *userinfo)
+{
+	struct iphdr *iph = (*pskb)->nh.iph;
+	const struct ipt_TTL_info *info = targinfo;
+	u_int16_t diffs[2];
+	int new_ttl;
+			 
+	switch (info->mode) {
+		case IPT_TTL_SET:
+			new_ttl = info->ttl;
+			break;
+		case IPT_TTL_INC:
+			new_ttl = iph->ttl + info->ttl;
+			if (new_ttl > 255)
+				new_ttl = 255;
+			break;
+		case IPT_TTL_DEC:
+			new_ttl = iph->ttl + info->ttl;
+			if (new_ttl < 0)
+				new_ttl = 0;
+			break;
+		default:
+			new_ttl = iph->ttl;
+			break;
+	}
+
+	if (new_ttl != iph->ttl) {
+		diffs[0] = htons(((unsigned)iph->ttl) << 8) ^ 0xFFFF;
+		iph->ttl = new_ttl;
+		diffs[1] = htons(((unsigned)iph->ttl) << 8);
+		iph->check = csum_fold(csum_partial((char *)diffs,
+						    sizeof(diffs),
+				 	            iph->check^0xFFFF));
+									                	(*pskb)->nfcache |= NFC_ALTERED;
+	}
+
+	return IPT_CONTINUE;
+}
+
+static int ipt_ttl_checkentry(const char *tablename,
+		const struct ipt_entry *e,
+		void *targinfo,
+		unsigned int targinfosize,
+		unsigned int hook_mask)
+{
+	struct ipt_TTL_info *info = targinfo;
+
+	if (targinfosize != IPT_ALIGN(sizeof(struct ipt_TTL_info))) {
+		printk(KERN_WARNING "TTL: targinfosize %u != %Zu\n",
+				targinfosize,
+				IPT_ALIGN(sizeof(struct ipt_TTL_info)));
+		return 0;	
+	}	
+
+	if (strcmp(tablename, "mangle")) {
+		printk(KERN_WARNING "TTL: can only be called from \"mangle\" table, not \"%s\"\n", tablename);
+		return 0;
+	}
+
+	if (info->mode > IPT_TTL_MAXMODE) {
+		printk(KERN_WARNING "TTL: invalid or unknown Mode %u\n", 
+			info->mode);
+		return 0;
+	}
+
+	if ((info->mode != IPT_TTL_SET) && (info->ttl == 0)) {
+		printk(KERN_WARNING "TTL: increment/decrement doesn't make sense with value 0\n");
+		return 0;
+	}
+	
+	return 1;
+}
+
+static struct ipt_target ipt_TTL_reg = {
+	 .name		= "TTL",
+	 .target	= ipt_ttl_target,
+	 .checkentry	= ipt_ttl_checkentry,
+	 .me		= THIS_MODULE,
+};
+
+static int __init init(void)
+{
+	if (ipt_register_target(&ipt_TTL_reg));
+	    return -EINVAL;
+	    
+	return 0;
+}
+
+static void __exit fini(void)
+{
+	ipt_unregister_target(&ipt_TTL_reg);
+}
+
+module_init(init);
+module_exit(fini);

--------------080907010401010406090206--


