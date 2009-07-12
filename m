From: Patrick McHardy <kaber@trash.net>
Subject: Re: nf_nat_sip & nf_conntrack_sip
Date: Sun, 12 Jul 2009 16:28:36 +0200
Message-ID: <4A59F314.6010309@trash.net>
References: <1982.192.168.1.3.1246005268.squirrel@webmail.decimal.pt>    <4A44C5B2.9030408@trash.net>    <2164.87.196.204.28.1246043247.squirrel@webmail.decimal.pt>    <1892.192.168.1.3.1246263728.squirrel@webmail.decimal.pt>    <4A48B3F4.8000705@trash.net>    <2152.192.168.1.3.1246280022.squirrel@webmail.decimal.pt>    <4A48B97C.1060803@trash.net>    <3238.192.168.1.3.1247247415.squirrel@webmail.decimal.pt>    <4A58C81E.4010606@trash.net> <2026.87.196.17.191.1247346190.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030203020405090505020303"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2026.87.196.17.191.1247346190.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jorge Bastos <mysql.jorge@decimal.pt>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------030203020405090505020303
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Jorge Bastos wrote:
>>> Hi Patrick,
>>> continuing this matter, after updating to 2.6.31-rc2-git4 (i needed
>>> 'cause
>>> a fix for pty.c for PPTPD connections), loading the modules:
>>>
>>> /sbin/modprobe nf_conntrack_sip sip_direct_signalling=0
>>> sip_direct_media=0
>>> /sbin/modprobe nf_nat_sip
>>>
>>> When the other person disconnects from the other side, the call remains
>>> active in my side.
>>> Unloading the modules works as expected.
>>> A bug?
>> What exactly do you mean with "remains active"? The expectations?
>>
> 
> Let me see if i can explain myself.
> When I'm on a call, and the person for the other side ends the call, the
> sessions remains active.
> Without loadling the modules, it works fine.

That sounds like some packets are dropped by the helper. You could
try this patch in combination with ulogd(2) to capture the packet
in pcap format.


--------------030203020405090505020303
Content-Type: text/plain;
 name="x"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="x"

commit 78384e4b2e7ddb21709b0d8abac0d37b060dd3b7
Author: Patrick McHardy <kaber@trash.net>
Date:   Fri Jul 10 14:16:57 2009 +0200

    netfilter: nf_conntrack: log packets dropped by helpers
    
    Signed-off-by: Patrick McHardy <kaber@trash.net>

diff --git a/net/ipv4/netfilter/nf_conntrack_l3proto_ipv4.c b/net/ipv4/netfilter/nf_conntrack_l3proto_ipv4.c
index 7d2ead7..44fa394 100644
--- a/net/ipv4/netfilter/nf_conntrack_l3proto_ipv4.c
+++ b/net/ipv4/netfilter/nf_conntrack_l3proto_ipv4.c
@@ -26,6 +26,7 @@
 #include <net/netfilter/ipv4/nf_conntrack_ipv4.h>
 #include <net/netfilter/nf_nat_helper.h>
 #include <net/netfilter/ipv4/nf_defrag_ipv4.h>
+#include <net/netfilter/nf_log.h>
 
 int (*nf_nat_seq_adjust_hook)(struct sk_buff *skb,
 			      struct nf_conn *ct,
@@ -113,8 +114,11 @@ static unsigned int ipv4_confirm(unsigned int hooknum,
 
 	ret = helper->help(skb, skb_network_offset(skb) + ip_hdrlen(skb),
 			   ct, ctinfo);
-	if (ret != NF_ACCEPT)
+	if (ret != NF_ACCEPT) {
+		nf_log_packet(AF_INET, hooknum, skb, in, out, NULL,
+			      "nf_ct_%s: dropping packet", helper->name);
 		return ret;
+	}
 
 	if (test_bit(IPS_SEQ_ADJUST_BIT, &ct->status)) {
 		typeof(nf_nat_seq_adjust_hook) seq_adjust;
diff --git a/net/ipv6/netfilter/nf_conntrack_l3proto_ipv6.c b/net/ipv6/netfilter/nf_conntrack_l3proto_ipv6.c
index 2a15c2d..6b76778 100644
--- a/net/ipv6/netfilter/nf_conntrack_l3proto_ipv6.c
+++ b/net/ipv6/netfilter/nf_conntrack_l3proto_ipv6.c
@@ -27,6 +27,7 @@
 #include <net/netfilter/nf_conntrack_l3proto.h>
 #include <net/netfilter/nf_conntrack_core.h>
 #include <net/netfilter/ipv6/nf_conntrack_ipv6.h>
+#include <net/netfilter/nf_log.h>
 
 static bool ipv6_pkt_to_tuple(const struct sk_buff *skb, unsigned int nhoff,
 			      struct nf_conntrack_tuple *tuple)
@@ -176,8 +177,11 @@ static unsigned int ipv6_confirm(unsigned int hooknum,
 	}
 
 	ret = helper->help(skb, protoff, ct, ctinfo);
-	if (ret != NF_ACCEPT)
+	if (ret != NF_ACCEPT) {
+		nf_log_packet(AF_INET6, hooknum, skb, in, out, NULL,
+			      "nf_ct_%s: dropping packet", helper->name);
 		return ret;
+	}
 out:
 	/* We've seen it coming out the other side: confirm it */
 	return nf_conntrack_confirm(skb);

--------------030203020405090505020303--
