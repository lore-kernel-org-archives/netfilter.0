From: "dravya" <dravya@magma.ca>
Subject: latest version of ipt_MASQUERDADE.c ????
Date: Fri, 10 Sep 2004 10:23:48 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409101423.i8AENmq1013420@webmail1.magma.ca>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@lists.netfilter.org>


Hi I am wondering what is the latest version of the ipt_MASQUERADE.c out there. I guess it
comes with the 2.6.* kernels... I am using 2.4.20-8.

Rusty had posted a patch (on devel list) for ipt_MASQUERADE.c for the kernel 2.6.9. I
tried to match the (2.4.20-8) code with the patch and there seem to be some differences.
Can anyone help me in making the transition, or can anyone advise me as to how to test the
patch. The following link is the patch for MASQUERADE that I am refering to:

http://lists.netfilter.org/pipermail/netfilter-devel/2004-September/016708.html

and the following is the code snippet of the ipt_MASQUERADE.c of my kernel:

static unsigned int
masquerade_target(struct sk_buff **pskb,
		  unsigned int hooknum,
		  const struct net_device *in,
		  const struct net_device *out,
		  const void *targinfo,
		  void *userinfo)
{
	struct ip_conntrack *ct;
	enum ip_conntrack_info ctinfo;
	const struct ip_nat_multi_range *mr;
	struct ip_nat_multi_range newrange;
	u_int32_t newsrc;
	struct rtable *rt;
	struct rt_key key;

	IP_NF_ASSERT(hooknum == NF_IP_POST_ROUTING);

	/* FIXME: For the moment, don't do local packets, breaks
	   testsuite for 2.3.49 --RR */
	if ((*pskb)->sk)
		return NF_ACCEPT;

	ct = ip_conntrack_get(*pskb, &ctinfo);
	IP_NF_ASSERT(ct && (ctinfo == IP_CT_NEW
				  || ctinfo == IP_CT_RELATED));

	mr = targinfo;

	key.dst = (*pskb)->nh.iph->daddr;
	key.src = 0; /* Unknown: that's what we're trying to establish */
	key.tos = RT_TOS((*pskb)->nh.iph->tos)|RTO_CONN;
	key.oif = out->ifindex;
#ifdef CONFIG_IP_ROUTE_FWMARK
	key.fwmark = (*pskb)->nfmark;
#endif
	
	printk("MASQUERADE: output iface: %d\n", key.oif);
	if (ip_route_output_key(&rt, &key) != 0) {
		/* Shouldn't happen */
		printk("MASQUERADE: No route: Rusty's brain broke!\n");
		return NF_DROP;
	}

	newsrc = rt->rt_src;
              printk("newsrc = %u.%u.%u.%u\n", NIPQUAD(newsrc));
	DEBUGP("newsrc = %u.%u.%u.%u\n", NIPQUAD(newsrc));
	ip_rt_put(rt);

	WRITE_LOCK(&masq_lock);
	ct->nat.masq_index = out->ifindex;
	WRITE_UNLOCK(&masq_lock);

	/* Transfer from original range. */
	newrange = ((struct ip_nat_multi_range)
		{ 1, { { mr->range[0].flags | IP_NAT_RANGE_MAP_IPS,
			 newsrc, newsrc,
			 mr->range[0].min, mr->range[0].max } } });

	/* Hand modified range to generic setup. */
	return ip_nat_setup_info(ct, &newrange, hooknum);
}


I really appreciate any help or suggestions

thank you

dravya

