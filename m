From: Subhash Gopinath <subhashg@gmail.com>
Subject: problem with hook function for DHCP
Date: Mon, 29 Nov 2004 23:58:44 -0800
Message-ID: <81703d8a041129235876acd876@mail.gmail.com>
Reply-To: Subhash Gopinath <subhashg@gmail.com>
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

Hello all,

I am facing problems capturing DHCP packets sent from a client to a server....
Basically, the hook function (defined below) is not getting called for
each packet going out of the system.. Any ideas ?

Thanks in adv,
Subhash

-------------------------------------------------------------------------------

#define DHCP_SERVER_PORT 67

unsigned int out_hook_func(unsigned int hooknum, 
                       struct sk_buff **skb,
                       const struct net_device *in,
                       const struct net_device *out,
                       int (*okfn)(struct sk_buff *))
{

        struct udphdr *udp_hdr;
        struct sk_buff *sb = *skb;
        unsigned char *dhcp_hdr, *ptr;
        unsigned int len, sub_id, xid;

        printk (KERN_INFO "Here\n");
        /* Check if the message is valid and is a UDP message */
        if(!sb || !sb->nh.iph || sb->nh.iph->protocol != IPPROTO_UDP)
                return NF_ACCEPT;

        /* Check if the UDP message contains DHCP in the payload */
        udp_hdr = (struct udphdr *)(sb->data + ((sb->nh.iph->ihl)<<2));
        if(udp_hdr->dest != htons(DHCP_SERVER_PORT))
                return NF_ACCEPT;

        printk(KERN_INFO "DHCP packet\n");
        return NF_ACCEPT;

}

int init_module()
{
        /* Register Hook for packets sent */
        out_nfho.hook     = out_hook_func;
        //out_nfho.hooknum  = NF_IP_LOCAL_OUT;
        out_nfho.hooknum  = NF_IP_POST_ROUTING;
        out_nfho.pf       = PF_INET;
        out_nfho.priority = NF_IP_PRI_FIRST;
        nf_register_hook(&out_nfho);
}

void cleanup_module()
{
        nf_unregister_hook(&out_nfho);
}

