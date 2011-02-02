From: Patrick McHardy <kaber@trash.net>
Subject: Re: netfilter: ipset: fix linking with CONFIG_IPV6=n
Date: Wed, 02 Feb 2011 23:49:09 +0100
Message-ID: <4D49DF65.1030708@trash.net>
References: <4D49188B.2030002@trash.net> <alpine.DEB.2.00.1102022049230.29563@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050903010800000202000408"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1102022049230.29563@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

This is a multi-part message in MIME format.
--------------050903010800000202000408
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 02.02.2011 20:52, schrieb Jozsef Kadlecsik:
> Hi Patrick,
> 
> On Wed, 2 Feb 2011, Patrick McHardy wrote:
> 
>> Add some #ifdefs to unconditionally return false in
>> ip_set_get_ip6_port() when CONFIG_IPV6=n and convert
>> to ipv6_skip_exthdr() to avoid pulling in the ip6_tables
>> module when loading ipset.
> 
> You left out checking fragmented packets. Is it intentional?

Yes, ipv6_skip_exthdr() returns an error for non-first fragments.
For the first fragment skb_header_pointer() checks that enough
data for the port numbers is present.

>> A slightly more code-saving alternative would be to add
>> a dummy inline function or ifdef the callsites. Please
>> let me know which way you prefer.
> 
> A dummy inline looks nicer to me, because that way the IPv6 and non-IPv6 
> cases were clearly separated.

OK, I'm going to commit this patch.


--------------050903010800000202000408
Content-Type: text/plain;
 name="05.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="05.diff"

diff --git a/include/linux/netfilter/ipset/ip_set_getport.h b/include/linux/netfilter/ipset/ip_set_getport.h
index 694c433..3882a81 100644
--- a/include/linux/netfilter/ipset/ip_set_getport.h
+++ b/include/linux/netfilter/ipset/ip_set_getport.h
@@ -3,8 +3,18 @@
 
 extern bool ip_set_get_ip4_port(const struct sk_buff *skb, bool src,
 				__be16 *port, u8 *proto);
+
+#if defined(CONFIG_IP6_NF_IPTABLES) || defined(CONFIG_IP6_NF_IPTABLES_MODULE)
 extern bool ip_set_get_ip6_port(const struct sk_buff *skb, bool src,
 				__be16 *port, u8 *proto);
+#else
+static inline bool ip_set_get_ip6_port(const struct sk_buff *skb, bool src,
+				       __be16 *port, u8 *proto)
+{
+	return false;
+}
+#endif
+
 extern bool ip_set_get_ip_port(const struct sk_buff *skb, u8 pf, bool src,
 				__be16 *port);
 
diff --git a/net/netfilter/ipset/ip_set_getport.c b/net/netfilter/ipset/ip_set_getport.c
index 4dd2785..8d52272 100644
--- a/net/netfilter/ipset/ip_set_getport.c
+++ b/net/netfilter/ipset/ip_set_getport.c
@@ -13,6 +13,7 @@
 #include <linux/icmpv6.h>
 #include <linux/netfilter_ipv6/ip6_tables.h>
 #include <net/ip.h>
+#include <net/ipv6.h>
 
 #include <linux/netfilter/ipset/ip_set_getport.h>
 
@@ -93,21 +94,23 @@ ip_set_get_ip4_port(const struct sk_buff *skb, bool src,
 }
 EXPORT_SYMBOL_GPL(ip_set_get_ip4_port);
 
+#if defined(CONFIG_IP6_NF_IPTABLES) || defined(CONFIG_IP6_NF_IPTABLES_MODULE)
 bool
 ip_set_get_ip6_port(const struct sk_buff *skb, bool src,
 		    __be16 *port, u8 *proto)
 {
-	unsigned int protooff = 0;
-	int protocol;
-	unsigned short fragoff;
+	int protoff;
+	u8 nexthdr;
 
-	protocol = ipv6_find_hdr(skb, &protooff, -1, &fragoff);
-	if (protocol <= 0 || fragoff)
+	nexthdr = ipv6_hdr(skb)->nexthdr;
+	protoff = ipv6_skip_exthdr(skb, sizeof(struct ipv6hdr), &nexthdr);
+	if (protoff < 0)
 		return false;
 
-	return get_port(skb, protocol, protooff, src, port, proto);
+	return get_port(skb, nexthdr, protoff, src, port, proto);
 }
 EXPORT_SYMBOL_GPL(ip_set_get_ip6_port);
+#endif
 
 bool
 ip_set_get_ip_port(const struct sk_buff *skb, u8 pf, bool src, __be16 *port)

--------------050903010800000202000408--
