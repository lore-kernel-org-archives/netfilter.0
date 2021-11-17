From: Florian Westphal <fw@strlen.de>
Subject: Re: bridge-nf-filter-pppoe-tagged not working as expected
Date: Wed, 17 Nov 2021 11:33:10 +0100
Message-ID: <20211117103310.GH6326@breakpoint.cc>
References: <5c23297e-2943-2868-a1c7-acdb3172bd3a@3g.co.za>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5c23297e-2943-2868-a1c7-acdb3172bd3a@3g.co.za>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amish Chana <amish@3g.co.za>
Cc: netfilter@vger.kernel.org

Amish Chana <amish@3g.co.za> wrote:
> I start a ping from a computer on the network behind the router.
> If I run "echo 1 > bridge-nf-filter-pppoe-tagged" in /proc/sys/net/bridge
> then all PPPoE traffic to the fibre to ethernet converter is dropped.
> "echo 0 > bridge-nf-filter-pppoe-tagged" is required to allow traffic to
> pass again.
> 
> If I enable logging in iptables and netfilter I see that the PPPoE packets
> are received by iptables. It passes through the PREROUTING, FORWARD and
> POSTROUTING chains.
> However, the IP packets are not leaving the computer encapsulated in PPPoE.

Uhm.  Does this fix it? (wild guess, not even compile tested):

diff --git a/net/bridge/br_netfilter_hooks.c b/net/bridge/br_netfilter_hooks.c
--- a/net/bridge/br_netfilter_hooks.c
+++ b/net/bridge/br_netfilter_hooks.c
@@ -743,6 +743,9 @@ static int br_nf_dev_queue_xmit(struct net *net, struct sock *sk, struct sk_buff
 	if (nf_bridge->frag_max_size && nf_bridge->frag_max_size < mtu)
 		mtu = nf_bridge->frag_max_size;
 
+	nf_bridge_update_protocol(skb);
+	nf_bridge_push_encap_header(skb);
+
 	if (skb_is_gso(skb) || skb->len + mtu_reserved <= mtu) {
 		nf_bridge_info_free(skb);
 		return br_dev_queue_push_xmit(net, sk, skb);
@@ -760,8 +763,6 @@ static int br_nf_dev_queue_xmit(struct net *net, struct sock *sk, struct sk_buff
 
 		IPCB(skb)->frag_max_size = nf_bridge->frag_max_size;
 
-		nf_bridge_update_protocol(skb);
-
 		data = this_cpu_ptr(&brnf_frag_data_storage);
 
 		if (skb_vlan_tag_present(skb)) {
@@ -789,8 +790,6 @@ static int br_nf_dev_queue_xmit(struct net *net, struct sock *sk, struct sk_buff
 
 		IP6CB(skb)->frag_max_size = nf_bridge->frag_max_size;
 
-		nf_bridge_update_protocol(skb);
-
 		data = this_cpu_ptr(&brnf_frag_data_storage);
 		data->encap_size = nf_bridge_encap_header_len(skb);
 		data->size = ETH_HLEN + data->encap_size;
