From: Lopsch <lopsch@lopsch.com>
Subject: Re: CONNMARK patch do not work in kernel 2.6.9
Date: Sun, 05 Dec 2004 16:19:55 +0100
Message-ID: <41B3271B.20008@lopsch.com>
References: <1241129595.20041204132415@roger.net.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature";
	boundary="------------enigBD80D955F6C4796D07C12B96"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1241129595.20041204132415@roger.net.ru>
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
--------------enigBD80D955F6C4796D07C12B96
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

> Hello.
> 
> I try to use latest patch-o-matic to
> I have tried to use last patch-o-matic
> (patch-o-matic-ng-20040621.tar.bz2 also do not work)
> for addition of purpose CONNMARK in iptables on a kernel 2.6.9
> 
> But the patch is not set, as does not find the necessary lines of a code in a file
> linux/net/ipv4/netfilter/ip_conntrack_standalone.c
> 
> ================code===================
> diff -uN --exclude .* --exclude *.o linux-2.4.3-pre3/net/ipv4/netfilter/ip_conntrack_standalone.c
> linux-2.4.3-pre3-uml/net/ipv4/netfilter/ip_conntrack_standalone.c
> --- linux-2.4.3-pre3/net/ipv4/netfilter/ip_conntrack_standalone.c       Thu Aug 10 21:35:15 2000
> +++ linux-2.4.3-pre3-uml/net/ipv4/netfilter/ip_conntrack_standalone.c   Wed Mar 21 13:04:19 2001
> @@ -92,6 +92,9 @@
>                 len += sprintf(buffer + len, "[UNCONFIRMED] ");
>         len += sprintf(buffer + len, "use=%u ",
>                        atomic_read(&conntrack->ct_general.use));
> +#if defined(CONFIG_IP_NF_CONNTRACK_MARK)
> +       len += sprintf(buffer + len, "mark=%ld ", conntrack->mark);
> +#endif
>         len += sprintf(buffer + len, "\n");
> 
>         return len;  
> ================/code==================
> 
> 
> 
> The code "&conntrack->ct_general.use" is mentioned in this piece:
> 
> Will not prompt where to make changes what it would be possible to activate CONNMARK on a nucleus 2.6.9?
> ================code===================
> if (test_bit(IPS_ASSURED_BIT, &conntrack->status))
>    if (seq_printf(s, "[ASSURED] "))
>       return 1;
> 
> if (seq_printf(s, "use=%u\n", atomic_read(&conntrack->ct_general.use)))
>    return 1;
> 
> return 0;
> }
> 
> ================/code==================
> 
> but this code is completely not similar that in a patch.
> 
> Prompt please, it is necessary to bring in what changes to a kernel
> 2.6.9, that CONNMARK would work?
> 
> 
Try this:

diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff 
linux-2.6.9-test/include/linux/netfilter_ipv4/ip_conntrack.h 
linux-2.6.9-connmark/include/linux/netfilter_ipv4/ip_conntrack.h
--- linux-2.6.9-test/include/linux/netfilter_ipv4/ip_conntrack.h 
2004-10-18 23:55:21.000000000 +0200
+++ linux-2.6.9-connmark/include/linux/netfilter_ipv4/ip_conntrack.h 
2004-10-20 23:59:36.354104294 +0200
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
diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff 
linux-2.6.9-test/include/linux/netfilter_ipv4/ipt_CONNMARK.h 
linux-2.6.9-connmark/include/linux/netfilter_ipv4/ipt_CONNMARK.h
--- linux-2.6.9-test/include/linux/netfilter_ipv4/ipt_CONNMARK.h 
1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.9-connmark/include/linux/netfilter_ipv4/ipt_CONNMARK.h 
2004-10-20 23:59:36.343104676 +0200
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
diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff 
linux-2.6.9-test/include/linux/netfilter_ipv4/ipt_connmark.h 
linux-2.6.9-connmark/include/linux/netfilter_ipv4/ipt_connmark.h
--- linux-2.6.9-test/include/linux/netfilter_ipv4/ipt_connmark.h 
1970-01-01 01:00:00.000000000 +0100
+++ linux-2.6.9-connmark/include/linux/netfilter_ipv4/ipt_connmark.h 
2004-10-20 23:59:36.345104606 +0200
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
diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff 
linux-2.6.9-test/net/ipv4/netfilter/Kconfig 
linux-2.6.9-connmark/net/ipv4/netfilter/Kconfig
--- linux-2.6.9-test/net/ipv4/netfilter/Kconfig	2004-10-18 
23:54:55.000000000 +0200
+++ linux-2.6.9-connmark/net/ipv4/netfilter/Kconfig	2004-10-21 
00:16:30.830850002 +0200
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
diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff 
linux-2.6.9-test/net/ipv4/netfilter/Makefile 
linux-2.6.9-connmark/net/ipv4/netfilter/Makefile
--- linux-2.6.9-test/net/ipv4/netfilter/Makefile	2004-10-18 
23:53:43.000000000 +0200
+++ linux-2.6.9-connmark/net/ipv4/netfilter/Makefile	2004-10-20 
23:59:36.368103807 +0200
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
diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff 
linux-2.6.9-test/net/ipv4/netfilter/ip_conntrack_core.c 
linux-2.6.9-connmark/net/ipv4/netfilter/ip_conntrack_core.c
--- linux-2.6.9-test/net/ipv4/netfilter/ip_conntrack_core.c	2004-10-18 
23:53:05.000000000 +0200
+++ linux-2.6.9-connmark/net/ipv4/netfilter/ip_conntrack_core.c 
2004-10-20 23:59:36.402102626 +0200
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
diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff 
linux-2.6.9-test/net/ipv4/netfilter/ip_conntrack_standalone.c 
linux-2.6.9-connmark/net/ipv4/netfilter/ip_conntrack_standalone.c
--- linux-2.6.9-test/net/ipv4/netfilter/ip_conntrack_standalone.c 
2004-10-18 23:54:07.000000000 +0200
+++ linux-2.6.9-connmark/net/ipv4/netfilter/ip_conntrack_standalone.c 
2004-10-21 00:01:55.101282662 +0200
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

diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff 
linux-2.6.9-test/net/ipv4/netfilter/ipt_CONNMARK.c 
linux-2.6.9-connmark/net/ipv4/netfilter/ipt_CONNMARK.c
--- linux-2.6.9-test/net/ipv4/netfilter/ipt_CONNMARK.c	1970-01-01 
01:00:00.000000000 +0100
+++ linux-2.6.9-connmark/net/ipv4/netfilter/ipt_CONNMARK.c	2004-10-20 
23:59:36.347104537 +0200
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
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 
  USA
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
+		newmark = (ct->mark & ~markinfo->mask) | ((*pskb)->nfmark & 
markinfo->mask);
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
+		    printk(KERN_WARNING "CONNMARK: restore can only be called from 
\"mangle\" table, not \"%s\"\n", tablename);
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
diff -Nru --exclude-from=/sunbeam/home/laforge/scripts/dontdiff 
linux-2.6.9-test/net/ipv4/netfilter/ipt_connmark.c 
linux-2.6.9-connmark/net/ipv4/netfilter/ipt_connmark.c
--- linux-2.6.9-test/net/ipv4/netfilter/ipt_connmark.c	1970-01-01 
01:00:00.000000000 +0100
+++ linux-2.6.9-connmark/net/ipv4/netfilter/ipt_connmark.c	2004-10-20 
23:59:36.349104467 +0200
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
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 
  USA
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
+	struct ip_conntrack *ct = ip_conntrack_get((struct sk_buff *)skb, 
&ctinfo);
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

--------------enigBD80D955F6C4796D07C12B96
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (MingW32)

iQIVAwUBQbMnHiXe0Lt4Z4FpAQG9XhAAhi/tgyLmexM7OIGF8hpD3fEXeSauehUB
hGRFCZiVqg/60Se0rX5jn0nZdy0oqw2zRG8dqb7yY4QuAhBEIbzyREotwKu7MwYs
SKThkJ9p6BXYz4zL3l3ubLhqxuy/qkjz7J0vIN2LPTDZIe67/KRdgqWk+m3/MZyA
d9G+Le8CcR82/KsP/scv4mjblq07stQrgKyZCSa+YMkNHbZIfA0Ggrzk/tsyThzB
n0kg+TRBHE2X7ANlc4sUAiFPBTC45tViTAGZ6pPqO1YTRoRWTVzf1jH0cBtCXCPt
dDPpkCo8MbuwF4+ElAQV6TyJBcSYyqsk6gWWoxNbvMmOIpL3Y+YukRQSWX5M4e9O
bs4FYnM5RG4acljrbknr6K/COmm/UWMdlUgxZHyomfH32dsGTnssqKVA2kHmW0PL
5MWLqp4Xf083W6p0FqBi60V/OjFsubM1qGHUqolzzW3vqZs8Dslii7JzdJ5LVrMJ
qmmyzsfCCWYimVYpijv8m5zmLXXT/E3MHZeDiiUmad45UCpcb8DYP+Zz3GnEyt3C
0TqQtAexvkIRJ0m03nUlIUSb1we5BUz9wcDWuzGJwPkmSDCmYkzFn5oF6Nbm4MOp
k6GQwaLZ555XDi0Tf+DtEI05NlNzF2ynEsYjC5XCtJ/ejXptOMzvi0VPM0EzGFbe
exTUoVpqGgI=
=U3YT
-----END PGP SIGNATURE-----

--------------enigBD80D955F6C4796D07C12B96--


