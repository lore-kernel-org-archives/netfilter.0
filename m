From: Felipe Maya <fmay@midiacom.uff.br>
Subject: change sk_buff iph saddr... how?
Date: Mon, 17 Jul 2006 10:39:32 -0300
Message-ID: <1153143572.2471.24.camel@gneax.admatel.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello.

I'm trying to send a packet using other net device. I'm taking all
information of device, the IP header source address is changing, the
packet is checksumed, and the dst_entry is updated. Can any help me to
send a packet using other interface?...The next source is KERNEL BUG
result. 

struct sk_buff *nskb;
struct rtable *rt;
struct iphdr *iph = (*skb)->nh.iph;
struct flowi fl = { };
fl.oif = (*skb)->sk ? (*skb)->sk->sk_bound_dev_if : 0;
fl.nl_u.ip4_u.daddr = iph->daddr;
fl.nl_u.ip4_u.saddr = nsaddr;
fl.nl_u.ip4_u.tos = RT_TOS(iph->tos);
fl.proto = iph->protocol;

switch(iph->protocol){
	case IPPROTO_TCP:
		fl.fl_ip_sport = (*skb)->h.th->source;
		fl.fl_ip_dport = (*skb)->h.th->dest;
	break;
	case IPPROTO_UDP:
		fl.fl_ip_sport = (*skb)->h.uh->source;
		fl.fl_ip_dport = (*skb)->h.uh->dest;
	break;
}
			
if (!skb_make_writable(skb, sizeof(*skb)))
	return NF_STOLEN;
if (ip_route_output_key(&rt, &fl) != 0){
	DEBUGP("ip_route_output_key error\n");
	//ip_rt_put(rt);
	//dev_put(dev);
	return NF_STOLEN;
}
//xfrm_lookup((struct dst_entry **)&rt, &fl, NULL, 0);

dst_release((*skb)->dst);
(*skb)->dst = &rt->u.dst;

if ((*skb)->dst->error)
	return NF_STOLEN;

//if (!(IPCB(*skb)->flags & IPSKB_XFRM_TRANSFORMED) &&
xfrm_decode_session(*skb, &fl, AF_INET) == 0)

if (xfrm_lookup(&(*skb)->dst, &fl, (*skb)->sk, 0))
	return NF_STOLEN;

iph->saddr = nsaddr;
iph->check = ip_fast_csum((unsigned char *)iph, iph->ihl);
ip_send_check(iph);
if (skb_headroom(*skb) < (*skb)->dst->dev->hard_header_len) {
	struct sk_buff *pskb;
	pskb = skb_realloc_headroom(*skb,
				(*skb)->dst->dev->hard_header_len);
	if (!pskb) {
		return NF_STOLEN;
	}
	if ((*skb)->sk) skb_set_owner_w(pskb, (*skb)->sk);
		kfree_skb(*skb);
		*skb = pskb;
	}
}
return NF_ACCEPT;




