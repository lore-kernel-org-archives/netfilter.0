From: "dravya" <dravya@magma.ca>
Subject: RE: "No Route: Rusty's brain broke" ??????
Date: Wed, 8 Sep 2004 10:39:02 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409081439.i88Ed2kU026302@webmail1.magma.ca>
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


On Sep 7 , "Daniel Chemko" <dchemko@smgtec.com> wrote:
> 
> dravya wrote:
> > Hi all,
> > 
> > I have two ppp connections setup and I want access the internet via
> > these links.... However, I get the error message "kernel: No Route:
> > Rusty's brain broke". 
> > 
> > Is there a patch associated with this.... or can you suggest any
> > fixes... 
> > 
> > Why would something like this happen??? Is this a problem with the
> > ipt_MASQUERADE.c code??? 
> > 
> > any tips or suggestions are much appreciated.
> > 
> Read the long thread in the development archives from last week or the
> week before. There's two fighting opinions as to what should be done
> about this. Its pretty technical and there isn't a patch available to my
> knowledge. I know Herald Welte might be able to help if he's willing.
> 

Indeed an extensive discussion on whether using inet_select_addr is the way to go...

Rusty recently (Sep 7, 2004) posted a patch to fix the MASQUERADE problem. Can it be used
for kernel 2.4.20-8 or is it for 2.6.9?? Has anyone tested the patch yet?? 

I think I am using an older version of ipt_MASQUERADE.c?? What do I need to do inorder to
try out Rusty's patch??? What changes should I make??

here is an excerpt from /linux-2.4.20-8/net/ipv4/netfilter/ipt_MASQUERADE.c:

--------------------------------------------------------------------------------------
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
	if (ip_route_output_key(&rt, &key) != 0) {
		/* Shouldn't happen */
		printk("MASQUERADE: No route: Rusty's brain broke!\n");
		return NF_DROP;
	}

	newsrc = rt->rt_src;
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
--------------------------------------------------------------------------------------

Any help or tips are greatly appreciated.... 

thank you again Daniel,

cheers
Dravya



