From: Sebastian Poehn <sebastian.poehn@gmail.com>
Subject: [RFC] nf_conntrack_dns: Workaround parallel DNS resolve
Date: Thu, 26 Feb 2015 14:46:32 +0100
Message-ID: <1424958392.6774.18.camel@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:message-id:subject:to:date:content-type:mime-version
         :content-transfer-encoding;
        bh=yg4Ua5xwvoP0+A0HI2NzkCHcXRt0EF+i2FNafWRD7t0=;
        b=cnR5zRQKWiMMmkklLtwcxUT10OqIJtEP4165Zw58fF7eTokFA9Zr9u1xAa+M8VUhJY
         7clrFb02FGDZMgUKLQYZWbac2ErDA86YOlMhWw2hDkSoNG8XRKMH1+SGy0Hg6dC6MPNL
         leEDTf1hXW48ZLG1rCgQ8nwPu+o0Wuv2nDAKgThVkEtsczEGoiL9VnBucG/oMhVOeDlg
         FWIYWkv3ny5GZlW2rUyzxG014Y7YMWeidurBuHPwb8fhrnNjiXwFlTCTwZNSYztJlGVg
         1GsZaU+lCbbpXcecpy8/Ff4+Akm8c9++pEP5krzj6yOTXL2nOo7r7nueutKfsRBg69lG
         IRVg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Some versions of glibc make use of parallel DNS lookup in case ipv6 is enabled on the machine.
They send out one A and one AAAA query for a domain in short timeframes.
However they use the same port, resulting in same 4-way tuple. As the conntrack is NEW the second packet is
dropped resulting in a significant delay on client side (5sec) due to retransmission.

Doing some major changes in kernel for the sake of one protocol does not seem to be a good solution. See reference:
http://www.spinics.net/lists/netfilter-devel/msg15860.html

What I tried in this workaround-fix is to get the desired functionality (AAAA query can pass) with as little change as possible.
So I added a conntrack helper for DNS keeping track of A queries in union nf_conntrack_proto. If AAAA query matches, it's
associated with the first conntrack and source port is mangled back from 1024 to original value.

Built and tested on 3.12.30. Honestly spoken I don't think that this should go into mainline - but it may be interesting for other people.
    
Signed-off-by: Sebastian Poehn <sebastian.poehn@googlemail.com>

diff --git a/include/linux/netfilter/nf_conntrack_dns.h b/include/linux/netfilter/nf_conntrack_dns.h
new file mode 100644
index 0000000..5c709d2
--- /dev/null
+++ b/include/linux/netfilter/nf_conntrack_dns.h
@@ -0,0 +1,25 @@
+#ifndef _SOP_NF_CONNTRACK_DNS_H
+#define _SOP_NF_CONNTRACK_DNS_H
+
+#define DNS_PORT 53
+#define	DNS_RECORD_TYPE				2
+#define	DNS_RECORD_CLASS			2
+#define	DNS_RECORD_TYPE_AND_CLASS		(DNS_RECORD_TYPE + DNS_RECORD_CLASS)
+#define	DNS_RECORD_MIN				(sizeof("A") + DNS_RECORD_TYPE_AND_CLASS)
+
+struct nf_ct_dns {
+	u8 usage;
+	char query[0];
+};
+
+struct dnshdr {
+	__be16 query_id;
+	__be16 flags;
+	__be16 question_count;
+	__be16 answer_count;
+	__be16 authority_count;
+	__be16 additional_record_count;
+	char query[0];
+};
+
+#endif /* _SOP_NF_CONNTRACK_DNS_H */
diff --git a/include/net/netfilter/nf_conntrack.h b/include/net/netfilter/nf_conntrack.h
index a776541..afeba0a 100644
--- a/include/net/netfilter/nf_conntrack.h
+++ b/include/net/netfilter/nf_conntrack.h
@@ -18,6 +18,7 @@
 #include <linux/compiler.h>
 #include <linux/atomic.h>
 
+#include <linux/netfilter/nf_conntrack_dns.h>
 #include <linux/netfilter/nf_conntrack_tcp.h>
 #include <linux/netfilter/nf_conntrack_dccp.h>
 #include <linux/netfilter/nf_conntrack_sctp.h>
@@ -33,6 +34,8 @@ union nf_conntrack_proto {
 	struct ip_ct_sctp sctp;
 	struct ip_ct_tcp tcp;
 	struct nf_ct_gre gre;
+//FIXME: Has to be changed! Will do in the very end as it break my build setup
+//	struct nf_ct_dns dns;
 };
 
 union nf_conntrack_expect_proto {
diff --git a/net/netfilter/Kconfig b/net/netfilter/Kconfig
index 91077a6..e6fe611 100644
--- a/net/netfilter/Kconfig
+++ b/net/netfilter/Kconfig
@@ -320,6 +320,16 @@ config NF_CONNTRACK_TFTP
 
 	  To compile it as a module, choose M here.  If unsure, say N.
 
+config NF_CONNTRACK_DNS
+	tristate "DNS protocol support"
+	depends on NETFILTER_ADVANCED
+	help
+	  This is a workaround for dns resolvers sending out A and AAAA requests
+	  in a short timeframe. This will rewrite source port of the second request
+	  so we do not drop the packet due to NEW conntrack.
+
+	  To compile it as a module, choose M here.  If unsure, say N.
+
 config NF_CT_NETLINK
 	tristate 'Connection tracking netlink interface'
 	select NETFILTER_NETLINK
diff --git a/net/netfilter/Makefile b/net/netfilter/Makefile
index 4002bb5..cc6edb9 100644
--- a/net/netfilter/Makefile
+++ b/net/netfilter/Makefile
@@ -44,6 +44,8 @@ obj-$(CONFIG_NF_CONNTRACK_SANE) += nf_conntrack_sane.o
 obj-$(CONFIG_NF_CONNTRACK_SIP) += nf_conntrack_sip.o
 obj-$(CONFIG_NF_CONNTRACK_TFTP) += nf_conntrack_tftp.o
 
+obj-$(CONFIG_NF_CONNTRACK_DNS) += nf_conntrack_dns.o
+
 nf_nat-y	:= nf_nat_core.o nf_nat_proto_unknown.o nf_nat_proto_common.o \
 		   nf_nat_proto_udp.o nf_nat_proto_tcp.o nf_nat_helper.o
 
diff --git a/net/netfilter/nf_conntrack_dns.c b/net/netfilter/nf_conntrack_dns.c
new file mode 100644
index 0000000..3299e62
--- /dev/null
+++ b/net/netfilter/nf_conntrack_dns.c
@@ -0,0 +1,268 @@
+/* (C) 2001-2002 Magnus Boden <mb@ozaba.mine.nu>
+ * (C) 2006-2012 Patrick McHardy <kaber@trash.net>
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/in.h>
+#include <linux/udp.h>
+#include <linux/netfilter.h>
+
+#include <net/netfilter/nf_log.h>
+#include <net/netfilter/nf_conntrack.h>
+#include <net/netfilter/nf_conntrack_zones.h>
+#include <net/netfilter/nf_conntrack_core.h>
+#include <net/netfilter/nf_conntrack_tuple.h>
+#include <net/netfilter/nf_conntrack_expect.h>
+#include <net/netfilter/nf_conntrack_ecache.h>
+#include <net/netfilter/nf_conntrack_helper.h>
+#include <linux/netfilter/nf_conntrack_dns.h>
+
+#include <net/netfilter/nf_nat.h>
+#include <net/netfilter/nf_nat_helper.h>
+
+MODULE_AUTHOR("Sebastian Poehn <sebastian.poehn@googlemail.com>");
+MODULE_DESCRIPTION("DNS connection tracking helper");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("ip_conntrack_dns");
+MODULE_ALIAS_NFCT_HELPER("dns");
+
+#define	MAX_PACKETS			1
+#define MAX_PORTS			8
+#define MAX_QUERY_LEN		(sizeof(union nf_conntrack_proto) - 1)
+#define MIN(a, b)			((a < b) ? a : b)
+
+static unsigned short ports[MAX_PORTS];
+static unsigned int ports_c;
+module_param_array(ports, ushort, &ports_c, 0400);
+MODULE_PARM_DESC(ports, "Port numbers of DNS servers");
+
+enum dns_query_type {
+	QUERY_A = 1, QUERY_AAAA = 0x1C,
+};
+
+struct nf_conn *search_ct_for_me(struct nf_conntrack_tuple *tuple,
+		struct nf_conn *ct)
+{
+	u16 zone = nf_ct_zone(ct);
+	struct net *net = nf_ct_net(ct);
+	struct nf_conntrack_tuple_hash *h;
+
+	/* look for tuple match */
+	h = nf_conntrack_find_get(net, zone, tuple);
+	if (NULL == h)
+		return NULL;
+
+	return nf_ct_tuplehash_to_ctrack(h);
+}
+
+int is_response(const struct dnshdr *dnsh_)
+{
+	u16 response = ntohs(dnsh_->flags);
+	response &= 0x8000;
+	response = response >> 15;
+	return response;
+}
+
+/* Somewhere in the stack the second packet of a connection gets mangled. Source
+ * port is changed to 1024. As we have the original port still conserved in the
+ * conntrack tuple we can restore it in this place.
+ */
+void fixup_udp_sport(struct sk_buff *skb, struct nf_conn *ct,
+		enum ip_conntrack_info ctinfo, unsigned int protoff,
+		struct udphdr *uh)
+{
+
+	__be16 port_wanted =
+			ct->tuplehash[IP_CT_DIR_ORIGINAL].tuple.src.u.udp.port;
+	__be16 *port_actual = &uh->source;
+
+	if (*port_actual == port_wanted)
+		return;
+
+	*port_actual = port_wanted;
+	if (!nf_nat_mangle_udp_packet(skb, ct, ctinfo, protoff, 0, 0, NULL, 0)) {
+		nf_ct_helper_log(skb, ct,
+				"Recalculation of UDP header fields failed\n");
+		return;
+	}
+
+	pr_debug("Changed port to %d\n", ntohs(port_wanted));
+}
+
+/*a
+ * Release the nf_conn of skb and assign @ct also taking one refence on it
+ */
+
+void attach_ct_to_skb(struct sk_buff *skb, struct nf_conn *ct)
+{
+	nf_conntrack_put(skb->nfct);
+	skb->nfct = &ct->ct_general;
+	nf_conntrack_get(skb->nfct);
+}
+
+static int dns_help(struct sk_buff *skb, unsigned int protoff,
+		struct nf_conn *ct, enum ip_conntrack_info ctinfo)
+{
+
+	u8 buffer[sizeof(struct udphdr)
+			  + sizeof(struct dnshdr)
+			  + MAX_QUERY_LEN];
+
+	struct udphdr *uh;
+	struct dnshdr *dnsh;
+	char *query;
+	u16 *type_ptr;
+	u16 type;
+
+	struct nf_conntrack_tuple *tuple =
+			&ct->tuplehash[IP_CT_DIR_ORIGINAL].tuple;
+
+	struct nf_ct_dns *store;
+
+	int packet_len = skb->len - protoff;
+	int query_len = packet_len
+			- sizeof(struct udphdr)
+			- sizeof(struct dnshdr);
+	int string_len = 0;
+
+	/* Only handle new connections */
+	if (IP_CT_NEW != ctinfo)
+		return NF_ACCEPT;
+
+	/* Basic length validation */
+	if (packet_len <= 0 || query_len < DNS_RECORD_MIN) {
+		nf_ct_helper_log(skb, ct,
+				"DNS packet of insuffient length: %d\n",
+				packet_len);
+		return NF_ACCEPT;
+	}
+
+	/* Get UDP header */
+	uh = skb_header_pointer(skb, protoff, MIN(packet_len, sizeof(buffer)),
+			buffer);
+	if (NULL == uh) {
+		nf_ct_helper_log(skb, ct,
+				"Cannot get sufficient length skb part of %d: %p",
+				MIN(packet_len, sizeof(buffer)), skb);
+		return NF_ACCEPT;
+	}
+
+	/* Get DNS header */
+	dnsh = (struct dnshdr *) (uh + 1);
+	query = dnsh->query;
+
+	/* Get first record */
+	string_len = strnlen(query, MIN(MAX_QUERY_LEN, query_len));
+	if ((query_len - string_len) < DNS_RECORD_TYPE_AND_CLASS) {
+		nf_ct_helper_log(skb, ct,
+				"Inappropriately formated record: Only %d left for type and class\n",
+				query_len - string_len);
+		return NF_ACCEPT;
+	}
+	type_ptr = (u16 *) (query + string_len + 1);
+	type = ntohs(*type_ptr);
+
+	/* Only work on Query */
+	if (is_response(dnsh)) {
+		pr_debug("DNS RESPONSE for %s\n", query);
+		return NF_ACCEPT;
+	}
+
+	pr_debug("DNS QUERY for %s type %s\n", query,
+			(type == QUERY_A) ? "A" : "AAAA");
+
+	if (ntohs(dnsh->question_count) < 1)
+		return NF_ACCEPT;
+
+	switch (type) {
+	case QUERY_A:
+		/* Store query in opaque storage of ct */
+		store = (struct nf_ct_dns *) &ct->proto;
+		strncpy(store->query, query, MAX_QUERY_LEN);
+		store->usage = 0;
+		break;
+	case QUERY_AAAA:{
+			char *stored_query;
+			struct nf_conn *stored = search_ct_for_me(tuple, ct);
+			if (NULL == stored)
+				return NF_ACCEPT;
+
+			store = (struct nf_ct_dns *) &stored->proto;
+
+			/* Only allow MAX_PACKETS for one connection */
+			if (store->usage >= MAX_PACKETS)
+				return NF_ACCEPT;
+
+			store->usage++;
+			stored_query = store->query;
+
+			if (0 == strncmp(stored_query, query, MIN(MAX_QUERY_LEN,
+					string_len))) {
+				attach_ct_to_skb(skb, stored);
+				fixup_udp_sport(skb, ct, ctinfo, protoff, uh);
+			}
+			break;
+		}
+	/* do nothing and NF_ACCEPT for all other query types */
+	}
+
+	return NF_ACCEPT;
+}
+
+static struct nf_conntrack_helper dnsp[MAX_PORTS][2] __read_mostly;
+
+static const struct nf_conntrack_expect_policy dns_exp_policy = {
+		.max_expected = 1, .timeout = 5 * 60, };
+
+static void nf_conntrack_dns_fini(void)
+{
+	int i, j;
+
+	for (i = 0; i < ports_c; i++) {
+		for (j = 0; j < 2; j++)
+			nf_conntrack_helper_unregister(&dnsp[i][j]);
+	}
+}
+
+static int __init nf_conntrack_dns_init(void)
+{
+	int i, j, ret;
+
+	if (ports_c == 0)
+		ports[ports_c++] = DNS_PORT;
+
+	for (i = 0; i < ports_c; i++) {
+		memset(&dnsp[i], 0, sizeof(dnsp[i]));
+
+		dnsp[i][0].tuple.src.l3num = AF_INET;
+		dnsp[i][1].tuple.src.l3num = AF_INET6;
+		for (j = 0; j < 2; j++) {
+			dnsp[i][j].tuple.dst.protonum = IPPROTO_UDP;
+			dnsp[i][j].tuple.src.u.udp.port = htons(ports[i]);
+			dnsp[i][j].expect_policy = &dns_exp_policy;
+			dnsp[i][j].me = THIS_MODULE;
+			dnsp[i][j].help = dns_help;
+
+			if (ports[i] == DNS_PORT)
+				sprintf(dnsp[i][j].name, "dns");
+			else
+				sprintf(dnsp[i][j].name, "dns-%u", i);
+
+			ret = nf_conntrack_helper_register(&dnsp[i][j]);
+			if (ret) {
+				pr_err("nf_ct_dns: failed to register helper for pf: %u port: %u\n",
+					dnsp[i][j].tuple.src.l3num, ports[i]);
+				nf_conntrack_dns_fini();
+				return ret;
+			}
+		}
+	}
+	return 0;
+}
+
+module_init(nf_conntrack_dns_init);
+module_exit(nf_conntrack_dns_fini);

