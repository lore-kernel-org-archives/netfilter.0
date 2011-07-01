From: Nader Al-Naji <nbal@princeton.edu>
Subject: Generating Ethernet Header in Prerouting?
Date: Fri, 01 Jul 2011 10:12:02 -0400
Message-ID: <41268.1309529522@princeton.edu>
Reply-To: nbal@princeton.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello, I'm writing a netfilter prerouting hook and my goal is to intercept an incoming packet, change the IP  information, ports, etc.. and send it back to the host it came from (and hopefully other hosts once I get this working) without ever exposing it to the higher layers. I'm modifying the packet information, making enough space for an ethernet header to be written (but not writing any ethernet information myself), and then calling dev_queue_xmit and returning NF_STOLEN. The problem I'm running into is the ethernet header is incorrect; it's actually uaually backwards, ie src followed by dst just the way it came in and appears to not send at all when random IP's are written. I was actually quite surprised when I found out that dev_queue_xmit apparently does some ARP'ing; I still don't q
 uite see where the ARP'ing happens in the code. That said, I'm pretty sure it's just an ARP table look-up gone awry. I was wondering if anyone could help me out. I've been looking this up online for a while now and nobody really has any good information on how to send a packet before a struct sock is attained, which is the case in prerouting.

This is a snippet the offending code. I would really appreciate any help at all. And if more information is needed let me know!:

//The main hook function
static unsigned int myhook_in_func(unsigned int hooknum,
               struct sk_buff *skb,
               const struct net_device *in,
               const struct net_device *out,
               int (*okfn)(struct sk_buff *))
{
      .....
      MODIFY THE PACKET IN SOME WAY HERE.
      .....

      skb_push(skb, ETH_HLEN);
      dev_queue_xmit(skb);

     return NF_STOLEN;
}

//This is a netfilter hook.
static struct nf_hook_ops my_hook_in =
{
       .hook = myhook_in_func, // Function that executes when a packet hits this hook.
       .hooknum = NF_IP_PRE_ROUTING, // For inbound traffic only.
       .pf = PF_INET, // Only for IP packets.
       .priority = NF_IP_PRI_FIRST, // My hook executes first.
};

static int __init my_hook_init(void)
{
       printk(KERN_ALERT "Starting up!\n");
       nf_register_hook(&my_hook_in);
       start_time = jiffies;
       return 0;
}

static void __exit my_hook_exit(void)
{
       printk(KERN_ALERT "Exiting...\n");
       nf_unregister_hook(&my_hook_in);
}

MODULE_LICENSE("GPL");
module_init(my_hook_init);
module_exit(my_hook_exit);

Thanks in advance!
--Nader Al-Naji





