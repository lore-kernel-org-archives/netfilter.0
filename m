From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Wrong addresses passed to warn_if_extra_mangle() ?
Date: Mon, 13 Nov 2006 17:01:48 +0100
Message-ID: <455896EC.9060309@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>

Hello,

Since Linux 2.6.11, DNAT of locally generated packets does no implicit 
source NAT to match the new destination any more.

 From ChangeLog-2.6.11 :
>   [PATCH] Remove do_extra_mangle: double NAT on LOCAL_OUT
> 
>   On NF_IP_LOCAL_OUT, when destination NAT changes the destination
>   interface, we also change the source address, so the packet is the
>   same as if it were generated to go that way in the first place.  This
>   is not strictly necessary, I believe.
> 
>   This patch rips that code out to see what breaks.

[One thing that breaks is that now you cannot do things like this any more :

iptables -t nat -A OUTPUT -d 127.x.y.z -j DNAT --to <remote_ip>

because the default source address for a destination in 127.0.0.0/8 is 
the same as the destination, and the output routing prohibits using such 
source address to send a packet to a remote destination.

But this is not the subject of this message.]

Consider a host 192.168.0.4/24, a gateway 192.168.0.1/24 with public 
address 81.56.x.y and HTTP port forwarding to a local server 
192.168.0.6/24. When using the following rule on the host :

iptables -t nat -A OUTPUT -d 81.56.x.y -p tcp --dport 80 \
   -j DNAT --to-destination 192.168.0.6

the first time a locally generated packet matches the rule, the kernel 
prints the following message :

> NAT: no longer support implicit source local NAT
> NAT: packet src 192.168.0.6 -> dst 81.56.x.y

This message is printed by the function warn_if_extra_mangle(). But the 
"src" and "dst" addresses look strange. I would expect "src" to be the 
packet source address (192.168.0.4) instead of the new destination 
address (192.168.0.6) and "dst" to be the new destination address 
(192.168.0.6) instead of the original destination address (81.56.x.y). 
Besides, if I understand correctly, this message should not be printed 
in this situation because the source address would be the same for both 
the original and the new destination addresses. Am I correct ?

 From net/ipv4/netfilter/ip_nat_rule.c :

> /* Before 2.6.11 we did implicit source NAT if required. Warn about change. */
> static void warn_if_extra_mangle(u32 dstip, u32 srcip)
> {
> 	static int warned = 0;
> 	struct flowi fl = { .nl_u = { .ip4_u = { .daddr = dstip } } };
> 	struct rtable *rt;
> 
> 	if (ip_route_output_key(&rt, &fl) != 0)
> 		return;
> 
> 	if (rt->rt_src != srcip && !warned) {
> 		printk("NAT: no longer support implicit source local NAT\n");
> 		printk("NAT: packet src %u.%u.%u.%u -> dst %u.%u.%u.%u\n",
> 		       NIPQUAD(srcip), NIPQUAD(dstip))
> 	warned = 1;
> 	}
> 	ip_rt_put(rt);
> }

warn_if_extra_mangle() is called in ipt_dnat_target() :

> 	if (hooknum == NF_IP_LOCAL_OUT
> 	    && mr->range[0].flags & IP_NAT_RANGE_MAP_IPS)
> 		warn_if_extra_mangle((*pskb)->nh.iph->daddr,
> 				     mr->range[0].min_ip);
> 

If I understand correctly :
- dstip = (*pskb)->nh.iph->daddr which is the original destination address ;
- srcip = mr->range[0].min_ip which is the new destination address.

However I am not sure whether mr->range[0].min_ip is the actual new 
destination address or the lower address in the DNAT --to range.

Shouldn't it be rather :
- dstip = the new destination address ;
- srcip = the source address ((*pskb)->nh.iph->saddr ?) ?

