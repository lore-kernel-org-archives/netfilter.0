From: Lopsch <lopsch@lopsch.com>
Subject: Re: connmark problem
Date: Mon, 13 Dec 2004 22:19:24 +0100
Message-ID: <41BE075C.9080004@lopsch.com>
References: <41BE04D2.4050708@o2.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature";
	boundary="------------enig3A6B3BD1730DA7D2D7E74F80"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41BE04D2.4050708@o2.pl>
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
To: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig3A6B3BD1730DA7D2D7E74F80
Content-Type: multipart/mixed; boundary="------------020501070905010006050302"

This is a multi-part message in MIME format.
--------------020501070905010006050302
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

Krystian schrieb:
> hi
> 
> I have a stock 2.6.9 kernel + iptables 1.2.11 + patch-o-matic-ng and i'm 
> trying to apply CONNMARK patch.
> I cant patch it becouse it gest rejected while trying to apply it using 
> POM.
> 
> Any clues?
> 
> Thanks
> Krystian
> 
> 
> 
Try this patch.

-- 

PGP-ID 0xF8EAF138

--------------020501070905010006050302
Content-Type: text/plain;
 name="2.6.9-connmark.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="2.6.9-connmark.patch"

diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff linux-2.6.9-test/include/linux/netfilter_ipv4/ip_conntrack.h linux-2.6.9-connmark/include/linux/netfilter_ipv4/ip_conntrack.h
--- linux-2.6.9-test/include/linux/netfilter_ipv4/ip_conntrack.h	2004-10-18 23:55:21.000000000 +0200
+++ linux-2.6.9-connmark/include/linux/netfilter_ipv4/ip_conntrack.h	2004-10-20 23:59:36.354104294 +0200
@@ -212,6 +212,10 @@
 	} nat;
 #endif /* CONFIG_IP_NF_NAT_NEEDED */
 
+#if defined(CONFIG_IP_NF_CONNTRACK_MARK)
+	unsigned long mark;
+#endif
+
 	/* Traversed often, so hopefully in different cacheline to top */
 	/* These are my tuples; original and reply */
 	struct ip_conntrack_tuple_hash tuplehash[IP_CT_DIR_MAX];
diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff linux-2.6.9-test/include/linux/netfilter_ipv4/ipt_CONNMARK.h linux-2.6.9-connmark/include/linux/netfilter_ipv4/ipt_CONNMARK.h
--- linux-2.6.9-test/include/linux/netfilter_ipv4/ipt_CONNMARK.h	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.9-connmark/include/linux/netfilter_ipv4/ipt_CONNMARK.h	2004-10-20 23:59:36.343104676 +0200
@@ -0,0 +1,25 @@
+#ifndef _IPT_CONNMARK_H_target
+#define _IPT_CONNMARK_H_target
+
+/* Copyright (C) 2002,2004 MARA Systems AB <http://www.marasystems.com>>
+ * by Henrik Nordstrom <hno@marasystems.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+enum {
+	IPT_CONNMARK_SET = 0,
+	IPT_CONNMARK_SAVE,
+	IPT_CONNMARK_RESTORE
+};
+
+struct ipt_connmark_target_info {
+	unsigned long mark;
+	unsigned long mask;
+	u_int8_t mode;
+};
+
+#endif /*_IPT_CONNMARK_H_target*/
diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff linux-2.6.9-test/include/linux/netfilter_ipv4/ipt_connmark.h linux-2.6.9-connmark/include/linux/netfilter_ipv4/ipt_connmark.h
--- linux-2.6.9-test/include/linux/netfilter_ipv4/ipt_connmark.h	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.9-connmark/include/linux/netfilter_ipv4/ipt_connmark.h	2004-10-20 23:59:36.345104606 +0200
@@ -0,0 +1,18 @@
+#ifndef _IPT_CONNMARK_H
+#define _IPT_CONNMARK_H
+
+/* Copyright (C) 2002,2004 MARA Systems AB <http://www.marasystems.com>>
+ * by Henrik Nordstrom <hno@marasystems.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+struct ipt_connmark_info {
+	unsigned long mark, mask;
+	u_int8_t invert;
+};
+
+#endif /*_IPT_CONNMARK_H*/
diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff linux-2.6.9-test/net/ipv4/netfilter/Kconfig linux-2.6.9-connmark/net/ipv4/netfilter/Kconfig
--- linux-2.6.9-test/net/ipv4/netfilter/Kconfig	2004-10-18 23:54:55.000000000 +0200
+++ linux-2.6.9-connmark/net/ipv4/netfilter/Kconfig	2004-10-21 00:16:30.830850002 +0200
@@ -32,6 +32,14 @@
 
 	  If unsure, say `N'.
 
+config IP_NF_CONNTRACK_MARK
+	bool  'Connection mark tracking support'
+	help
+	  This option enables support for connection marks, used by the
+	  `CONNMARK' target and `connmark' match. Similar to the mark value
+	  of packets, but this mark value is kept in the conntrack session
+	  instead of the individual packets.
+	
 config IP_NF_CT_PROTO_SCTP
 	tristate  'SCTP protocol connection tracking support (EXPERIMENTAL)'
 	depends on IP_NF_CONNTRACK && EXPERIMENTAL
@@ -342,6 +350,17 @@
 	  If you want to compile it as a module, say M here and read
 	  Documentation/modules.txt.  If unsure, say `N'.
 
+config IP_NF_MATCH_CONNMARK
+	tristate  'Connection mark match support'
+	depends on IP_NF_CONNTRACK_MARK && IP_NF_IPTABLES
+	help
+	  This option adds a `connmark' match, which allows you to match the
+	  connection mark value previously set for the session by `CONNMARK'. 
+	
+	  If you want to compile it as a module, say M here and read
+	  Documentation/modules.txt.  The module will be called
+	  ipt_connmark.o.  If unsure, say `N'.
+
 # `filter', generic and specific targets
 config IP_NF_FILTER
 	tristate "Packet filtering"
@@ -597,6 +616,18 @@
 
 	  To compile it as a module, choose M here.  If unsure, say N.
 
+config IP_NF_TARGET_CONNMARK
+	tristate  'CONNMARK target support'
+	depends on IP_NF_CONNTRACK_MARK && IP_NF_MANGLE
+	help
+	  This option adds a `CONNMARK' target, which allows one to manipulate
+	  the connection mark value.  Similar to the MARK target, but
+	  affects the connection mark value rather than the packet mark value.
+	
+	  If you want to compile it as a module, say M here and read
+	  Documentation/modules.txt.  The module will be called
+	  ipt_CONNMARK.o.  If unsure, say `N'.
+
 # raw + specific targets
 config IP_NF_RAW
 	tristate  'raw table support (required for NOTRACK/TRACE)'
diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff linux-2.6.9-test/net/ipv4/netfilter/Makefile linux-2.6.9-connmark/net/ipv4/netfilter/Makefile
--- linux-2.6.9-test/net/ipv4/netfilter/Makefile	2004-10-18 23:53:43.000000000 +0200
+++ linux-2.6.9-connmark/net/ipv4/netfilter/Makefile	2004-10-20 23:59:36.368103807 +0200
@@ -61,6 +61,7 @@
 obj-$(CONFIG_IP_NF_MATCH_LENGTH) += ipt_length.o
 obj-$(CONFIG_IP_NF_MATCH_TTL) += ipt_ttl.o
 obj-$(CONFIG_IP_NF_MATCH_STATE) += ipt_state.o
+obj-$(CONFIG_IP_NF_MATCH_CONNMARK) += ipt_connmark.o
 obj-$(CONFIG_IP_NF_MATCH_CONNTRACK) += ipt_conntrack.o
 obj-$(CONFIG_IP_NF_MATCH_TCPMSS) += ipt_tcpmss.o
 obj-$(CONFIG_IP_NF_MATCH_REALM) += ipt_realm.o
@@ -81,6 +82,7 @@
 obj-$(CONFIG_IP_NF_TARGET_CLASSIFY) += ipt_CLASSIFY.o
 obj-$(CONFIG_IP_NF_NAT_SNMP_BASIC) += ip_nat_snmp_basic.o
 obj-$(CONFIG_IP_NF_TARGET_LOG) += ipt_LOG.o
+obj-$(CONFIG_IP_NF_TARGET_CONNMARK) += ipt_CONNMARK.o
 obj-$(CONFIG_IP_NF_TARGET_ULOG) += ipt_ULOG.o
 obj-$(CONFIG_IP_NF_TARGET_TCPMSS) += ipt_TCPMSS.o
 obj-$(CONFIG_IP_NF_TARGET_NOTRACK) += ipt_NOTRACK.o
diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff linux-2.6.9-test/net/ipv4/netfilter/ip_conntrack_core.c linux-2.6.9-connmark/net/ipv4/netfilter/ip_conntrack_core.c
--- linux-2.6.9-test/net/ipv4/netfilter/ip_conntrack_core.c	2004-10-18 23:53:05.000000000 +0200
+++ linux-2.6.9-connmark/net/ipv4/netfilter/ip_conntrack_core.c	2004-10-20 23:59:36.402102626 +0200
@@ -595,6 +595,9 @@
 		__set_bit(IPS_EXPECTED_BIT, &conntrack->status);
 		conntrack->master = expected;
 		expected->sibling = conntrack;
+#if CONFIG_IP_NF_CONNTRACK_MARK
+		conntrack->mark = expected->expectant->mark;
+#endif
 		LIST_DELETE(&ip_conntrack_expect_list, expected);
 		expected->expectant->expecting--;
 		nf_conntrack_get(&master_ct(conntrack)->ct_general);
diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff linux-2.6.9-test/net/ipv4/netfilter/ip_conntrack_standalone.c linux-2.6.9-connmark/net/ipv4/netfilter/ip_conntrack_standalone.c
--- linux-2.6.9-test/net/ipv4/netfilter/ip_conntrack_standalone.c	2004-10-18 23:54:07.000000000 +0200
+++ linux-2.6.9-connmark/net/ipv4/netfilter/ip_conntrack_standalone.c	2004-10-21 00:01:55.101282662 +0200
@@ -146,6 +146,11 @@
 		if (seq_printf(s, "[ASSURED] "))
 			return 1;
 
+#if defined(CONFIG_IP_NF_CONNTRACK_MARK)
+	if (seq_printf(s, "mark=%ld ", conntrack->mark))
+		return 1;
+#endif
+
 	if (seq_printf(s, "use=%u\n", atomic_read(&conntrack->ct_general.use)))
 		return 1;
 
diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff linux-2.6.9-test/net/ipv4/netfilter/ipt_CONNMARK.c linux-2.6.9-connmark/net/ipv4/netfilter/ipt_CONNMARK.c
--- linux-2.6.9-test/net/ipv4/netfilter/ipt_CONNMARK.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.9-connmark/net/ipv4/netfilter/ipt_CONNMARK.c	2004-10-20 23:59:36.347104537 +0200
@@ -0,0 +1,118 @@
+/* This kernel module is used to modify the connection mark values, or
+ * to optionally restore the skb nfmark from the connection mark
+ *
+ * Copyright (C) 2002,2004 MARA Systems AB <http://www.marasystems.com>>
+ * by Henrik Nordstrom <hno@marasystems.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+#include <linux/module.h>
+#include <linux/skbuff.h>
+#include <linux/ip.h>
+#include <net/checksum.h>
+
+MODULE_AUTHOR("Henrik Nordstrom <hno@marasytems.com>");
+MODULE_DESCRIPTION("IP tables CONNMARK matching module");
+MODULE_LICENSE("GPL");
+
+#include <linux/netfilter_ipv4/ip_tables.h>
+#include <linux/netfilter_ipv4/ipt_CONNMARK.h>
+#include <linux/netfilter_ipv4/ip_conntrack.h>
+
+static unsigned int
+target(struct sk_buff **pskb,
+       const struct net_device *in,
+       const struct net_device *out,
+       unsigned int hooknum,
+       const void *targinfo,
+       void *userinfo)
+{
+	const struct ipt_connmark_target_info *markinfo = targinfo;
+	unsigned long diff;
+	unsigned long nfmark;
+	unsigned long newmark;
+
+	enum ip_conntrack_info ctinfo;
+	struct ip_conntrack *ct = ip_conntrack_get((*pskb), &ctinfo);
+	if (ct) {
+	    switch(markinfo->mode) {
+	    case IPT_CONNMARK_SET:
+		newmark = (ct->mark & ~markinfo->mask) | markinfo->mark;
+		if (newmark != ct->mark)
+		    ct->mark = newmark;
+		break;
+	    case IPT_CONNMARK_SAVE:
+		newmark = (ct->mark & ~markinfo->mask) | ((*pskb)->nfmark & markinfo->mask);
+		if (ct->mark != newmark)
+		    ct->mark = newmark;
+		break;
+	    case IPT_CONNMARK_RESTORE:
+		nfmark = (*pskb)->nfmark;
+		diff = (ct->mark ^ nfmark & markinfo->mask);
+		if (diff != 0) {
+		    (*pskb)->nfmark = nfmark ^ diff;
+		    (*pskb)->nfcache |= NFC_ALTERED;
+		}
+		break;
+	    }
+	}
+
+	return IPT_CONTINUE;
+}
+
+static int
+checkentry(const char *tablename,
+	   const struct ipt_entry *e,
+	   void *targinfo,
+	   unsigned int targinfosize,
+	   unsigned int hook_mask)
+{
+	struct ipt_connmark_target_info *matchinfo = targinfo;
+	if (targinfosize != IPT_ALIGN(sizeof(struct ipt_connmark_target_info))) {
+		printk(KERN_WARNING "CONNMARK: targinfosize %u != %Zu\n",
+		       targinfosize,
+		       IPT_ALIGN(sizeof(struct ipt_connmark_target_info)));
+		return 0;
+	}
+
+	if (matchinfo->mode == IPT_CONNMARK_RESTORE) {
+	    if (strcmp(tablename, "mangle") != 0) {
+		    printk(KERN_WARNING "CONNMARK: restore can only be called from \"mangle\" table, not \"%s\"\n", tablename);
+		    return 0;
+	    }
+	}
+
+	return 1;
+}
+
+static struct ipt_target ipt_connmark_reg = {
+	.name = "CONNMARK",
+	.target = &target,
+	.checkentry = &checkentry,
+	.me = THIS_MODULE
+};
+
+static int __init init(void)
+{
+	return ipt_register_target(&ipt_connmark_reg);
+}
+
+static void __exit fini(void)
+{
+	ipt_unregister_target(&ipt_connmark_reg);
+}
+
+module_init(init);
+module_exit(fini);
diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff linux-2.6.9-test/net/ipv4/netfilter/ipt_connmark.c linux-2.6.9-connmark/net/ipv4/netfilter/ipt_connmark.c
--- linux-2.6.9-test/net/ipv4/netfilter/ipt_connmark.c	1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.9-connmark/net/ipv4/netfilter/ipt_connmark.c	2004-10-20 23:59:36.349104467 +0200
@@ -0,0 +1,81 @@
+/* This kernel module matches connection mark values set by the
+ * CONNMARK target
+ *
+ * Copyright (C) 2002,2004 MARA Systems AB <http://www.marasystems.com>>
+ * by Henrik Nordstrom <hno@marasystems.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+#include <linux/module.h>
+#include <linux/skbuff.h>
+
+MODULE_AUTHOR("Henrik Nordstrom <hno@marasytems.com>");
+MODULE_DESCRIPTION("IP tables connmark match module");
+MODULE_LICENSE("GPL");
+
+#include <linux/netfilter_ipv4/ip_tables.h>
+#include <linux/netfilter_ipv4/ipt_connmark.h>
+#include <linux/netfilter_ipv4/ip_conntrack.h>
+
+static int
+match(const struct sk_buff *skb,
+      const struct net_device *in,
+      const struct net_device *out,
+      const void *matchinfo,
+      int offset,
+      int *hotdrop)
+{
+	const struct ipt_connmark_info *info = matchinfo;
+	enum ip_conntrack_info ctinfo;
+	struct ip_conntrack *ct = ip_conntrack_get((struct sk_buff *)skb, &ctinfo);
+	if (!ct)
+		return 0;
+
+	return ((ct->mark & info->mask) == info->mark) ^ info->invert;
+}
+
+static int
+checkentry(const char *tablename,
+	   const struct ipt_ip *ip,
+	   void *matchinfo,
+	   unsigned int matchsize,
+	   unsigned int hook_mask)
+{
+	if (matchsize != IPT_ALIGN(sizeof(struct ipt_connmark_info)))
+		return 0;
+
+	return 1;
+}
+
+static struct ipt_match connmark_match = {
+	.name = "connmark",
+	.match = &match,
+	.checkentry = &checkentry,
+	.me = THIS_MODULE
+};
+
+static int __init init(void)
+{
+	return ipt_register_match(&connmark_match);
+}
+
+static void __exit fini(void)
+{
+	ipt_unregister_match(&connmark_match);
+}
+
+module_init(init);
+module_exit(fini);

--------------020501070905010006050302--

--------------enig3A6B3BD1730DA7D2D7E74F80
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (MingW32)

iQIVAwUBQb4HXCXe0Lt4Z4FpAQEPgw//aCU+ynqC1IYFy6bM1jYswcyQxj/4v10b
wmzK18znZj/35l/MlFcrTCZ8Zlwl5hY8DaPnQKocxvkBTcGSKHGeHtyQU9q23K/n
Ej3EHOq0oiWbifyAxq3finXadqVc181k5e6HNjZqnmtACfzKIV1PTe4svIIBE33r
/xk29nOUJxm+gvxImG0WN9zpIvkNOeqaKztDBazAKYC19Zj76rGzn8H6XgrNm/I0
9JIkbV+P23fcGWtxoMFfV0MEQLQAvef7XZZH/ULzshHu5aK9M0AmHZ/wOa7QK5Bn
X0rEpKeTVa7nkQxdQ3VgxnHuPAzh1bV33qpCr7l22/SPadfyNf7XTOvyKuyR9K9S
GEzWoLW1n5dqBiFE4z8PmIZV9xjRHoPfGxpAzht2P8ePbEIUhP32f0ykxQfb3k9R
94NKxNeu41UcdXti/1kLSezTvhDNvprS+HLEaSa6NkjZkg8LJp8f05OZ93Q4NSwc
tXxdiI1v9FXLYTfyFe7mOPGYYwstqLhnfz1yih8nPRU9/nwGMERqwEYsFq5u6Qgj
Bt4VXwYxdG7ZdD8UhR81AW4uZivuviCReckpYnjPt6WHcgqwdtzR/UBZ5dH+Mq4y
v7DMAg4WmLnMR/zKlsv/cV9hF7fK+b1mf8cI081dLB0/IAQyj1kOEXsRBZqkSRyX
uvQL+34+WVw=
=AQDN
-----END PGP SIGNATURE-----

--------------enig3A6B3BD1730DA7D2D7E74F80--


