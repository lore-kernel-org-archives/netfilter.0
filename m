From: Mathias Koehrer <mathias.koehrer@etas.com>
Subject: Re: netfilter-queue: Incorrect UDP checksum computation in
 nfq_udp_compute_checksum_ipv4
Date: Fri, 1 Apr 2016 13:39:44 +0200
Message-ID: <56FE5E00.1070707@etas.com>
References: <56FE35C2.2070202@etas.com> <20160401104431.GA1318@salvia>
 <56FE5CE0.9050604@etas.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="------------030403040209000607050302"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56FE5CE0.9050604@etas.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

--------------030403040209000607050302
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Hi Pablo,

>>> the function nfq_udp_compute_checksum_ipv4 (src/extra/udp.c) does not
>>> compute the correct UDP checksum.
>>> The issue is caused by the called function checksum_tcpudp_ipv4()
>>> (src/extra/checksum.c) that uses the hard coded protocol id IPPROTO_TCP
>>> which is fine for TCP but fails for UDP.
>>> A possible solution might be to pass the protocol id (IPPROTO_TCP /
>>> IPPROTOC_UDP) as parameter to the function checksum_tcpudp_ipv4().
>>>
>>> The very same is also true for the IPv6 versions of these functions.
>>>
>>> Any feedback is welcome.
>>
>> Would you send us a patch to fix this? Thanks!
> Here it is:

It looks as if the line-structure of the patch is broken.
I have attached the patch as file to this mail.

Mathias

--------------030403040209000607050302
Content-Type: text/x-patch; name="fix-udp-checksum.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="fix-udp-checksum.patch"

Correct the computation of the UDP checksum
Index: libnetfilter_queue-1.0.2/src/extra/checksum.c
===================================================================
--- libnetfilter_queue-1.0.2.orig/src/extra/checksum.c
+++ libnetfilter_queue-1.0.2/src/extra/checksum.c
@@ -35,7 +35,7 @@ uint16_t checksum(uint32_t sum, uint16_t
 	return (uint16_t)(~sum);
 }
 
-uint16_t checksum_tcpudp_ipv4(struct iphdr *iph)
+uint16_t checksum_tcpudp_ipv4(struct iphdr *iph, uint16_t protocol_id)
 {
 	uint32_t sum = 0;
 	uint32_t iph_len = iph->ihl*4;
@@ -46,13 +46,13 @@ uint16_t checksum_tcpudp_ipv4(struct iph
 	sum += (iph->saddr) & 0xFFFF;
 	sum += (iph->daddr >> 16) & 0xFFFF;
 	sum += (iph->daddr) & 0xFFFF;
-	sum += htons(IPPROTO_TCP);
+	sum += htons(protocol_id);
 	sum += htons(len);
 
 	return checksum(sum, (uint16_t *)payload, len);
 }
 
-uint16_t checksum_tcpudp_ipv6(struct ip6_hdr *ip6h, void *transport_hdr)
+uint16_t checksum_tcpudp_ipv6(struct ip6_hdr *ip6h, void *transport_hdr, uint16_t protocol_id)
 {
 	uint32_t sum = 0;
 	uint32_t hdr_len = (uint32_t *)transport_hdr - (uint32_t *)ip6h;
@@ -68,7 +68,7 @@ uint16_t checksum_tcpudp_ipv6(struct ip6
 		sum += (ip6h->ip6_dst.s6_addr16[i] >> 16) & 0xFFFF;
 		sum += (ip6h->ip6_dst.s6_addr16[i]) & 0xFFFF;
 	}
-	sum += htons(IPPROTO_TCP);
+	sum += htons(protocol_id);
 	sum += htons(ip6h->ip6_plen);
 
 	return checksum(sum, (uint16_t *)payload, len);
Index: libnetfilter_queue-1.0.2/src/extra/tcp.c
===================================================================
--- libnetfilter_queue-1.0.2.orig/src/extra/tcp.c
+++ libnetfilter_queue-1.0.2/src/extra/tcp.c
@@ -91,7 +91,7 @@ nfq_tcp_compute_checksum_ipv4(struct tcp
 {
 	/* checksum field in header needs to be zero for calculation. */
 	tcph->check = 0;
-	tcph->check = checksum_tcpudp_ipv4(iph);
+	tcph->check = checksum_tcpudp_ipv4(iph, IPPROTO_TCP);
 }
 EXPORT_SYMBOL(nfq_tcp_compute_checksum_ipv4);
 
@@ -105,7 +105,7 @@ nfq_tcp_compute_checksum_ipv6(struct tcp
 {
 	/* checksum field in header needs to be zero for calculation. */
 	tcph->check = 0;
-	tcph->check = checksum_tcpudp_ipv6(ip6h, tcph);
+	tcph->check = checksum_tcpudp_ipv6(ip6h, tcph, IPPROTO_TCP);
 }
 EXPORT_SYMBOL(nfq_tcp_compute_checksum_ipv6);
 
Index: libnetfilter_queue-1.0.2/src/extra/udp.c
===================================================================
--- libnetfilter_queue-1.0.2.orig/src/extra/udp.c
+++ libnetfilter_queue-1.0.2/src/extra/udp.c
@@ -91,7 +91,7 @@ nfq_udp_compute_checksum_ipv4(struct udp
 {
 	/* checksum field in header needs to be zero for calculation. */
 	udph->check = 0;
-	udph->check = checksum_tcpudp_ipv4(iph);
+	udph->check = checksum_tcpudp_ipv4(iph, IPPROTO_UDP);
 }
 EXPORT_SYMBOL(nfq_udp_compute_checksum_ipv4);
 
@@ -110,7 +110,7 @@ nfq_udp_compute_checksum_ipv6(struct udp
 {
 	/* checksum field in header needs to be zero for calculation. */
 	udph->check = 0;
-	udph->check = checksum_tcpudp_ipv6(ip6h, udph);
+	udph->check = checksum_tcpudp_ipv6(ip6h, udph, IPPROTO_UDP);
 }
 EXPORT_SYMBOL(nfq_udp_compute_checksum_ipv6);
 
Index: libnetfilter_queue-1.0.2/src/internal.h
===================================================================
--- libnetfilter_queue-1.0.2.orig/src/internal.h
+++ libnetfilter_queue-1.0.2/src/internal.h
@@ -13,8 +13,8 @@ struct iphdr;
 struct ip6_hdr;
 
 uint16_t checksum(uint32_t sum, uint16_t *buf, int size);
-uint16_t checksum_tcpudp_ipv4(struct iphdr *iph);
-uint16_t checksum_tcpudp_ipv6(struct ip6_hdr *ip6h, void *transport_hdr);
+uint16_t checksum_tcpudp_ipv4(struct iphdr *iph, uint16_t protocol_id);
+uint16_t checksum_tcpudp_ipv6(struct ip6_hdr *ip6h, void *transport_hdr, uint16_t protocol_id);
 
 struct pkt_buff {
 	uint8_t *mac_header;

--------------030403040209000607050302--

