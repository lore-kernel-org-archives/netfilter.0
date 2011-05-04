From: Menyhart Zoltan <Zoltan.Menyhart@bull.net>
Subject: Cannot unload nf_conntrack
Date: Wed, 04 May 2011 11:08:38 +0200
Message-ID: <4DC11796.4080702@bull.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I cannot unload nf_conntrack because nf_conntrack_untracked.ct_general.use.counter  == 7.

The last_unloaded_module is "nf_conntrack_ipv6".

Probably the following has happend:

nf_conntrack_in(struct net *net, u_int8_t pf, unsigned int hooknum, struct sk_buff *skb):

	ret = l4proto->error(net, skb, dataoff, &ctinfo, pf, hooknum):
/* e.g. */	icmpv6_error(struct net *net, struct sk_buff *skb, unsigned int dataoff,
			     enum ip_conntrack_info *ctinfo, u_int8_t pf, unsigned int hooknum):
			if (type >= 0 && type < sizeof(noct_valid_new) && noct_valid_new[type]) {
				skb->nfct = &nf_conntrack_untracked.ct_general;
				skb->nfctinfo = IP_CT_NEW;
				nf_conntrack_get(skb->nfct);
				return NF_ACCEPT;
		}

	ct = resolve_normal_ct(net, skb, dataoff, pf, protonum, l3proto, l4proto, &set_reply, &ctinfo);
		skb->nfct = &ct->ct_general;
		skb->nfctinfo = *ctinfo;

Is it normal for resolve_normal_ct() to overwrite skb->nfct without putting the previous conntrack?

It has actually happened on a 2.6.32, but the source is the same for 2.6.38, too.
A dump is available at ftp://visibull.frec.bull.fr/pub/linux/tmp.

Thanks in advance,

Zoltan Menyhart
