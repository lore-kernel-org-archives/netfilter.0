From: Piotr Bratkowski <pioterbrat@o2.pl>
Subject: Firewall
Date: Thu, 01 Jan 2009 18:42:10 +0100
Message-ID: <495D0072.40809@o2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello

I'm trying to write simple firewall. But I have problem with tcp filtering.

I'm using 2.6.27 kernel.

Here is my code which supposed to block everything except www.

#define __KERNEL__
#define MODULE

#include <linux/kernel.h>        /* Kernel */
#include <linux/module.h>        /* Module */
#include <linux/netfilter.h>        /* Netfilter */
#include <linux/netfilter_ipv4.h>    /* Netfiletr for IPv4 */
#include <linux/skbuff.h>        /* Socket Kernel Buffers */
#include <linux/ip.h>            /* IP Header*/
#include <linux/tcp.h>

static struct nf_hook_ops netfilter_ops;            

/* Adres odblokowany: 212.77.100.101 (wp.pl) */
static unsigned char *ip_address = "\xD4\x4D\x64\x65";
unsigned char *port = "\x00\x50";

unsigned int main_hook(unsigned int hooknum,
          struct sk_buff *skb,
          const struct net_device *in,
          const struct net_device *out,
          int (*okfn)(struct sk_buff*))
{

    struct tcphdr *tcpH;
    tcpH=(struct tcphdr *) skb_transport_header(skb);
    //tcpH=tcp_hdr(skb)dr(skb); no difference
    if(tcpH->dest==*(unsigned short*) port)
    return NF_ACCEPT;
    else
    return NF_DROP;

    /*struct iphdr * ipHead;
    ipHead = ip_hdr( skb );
   
    if (ipHead == NULL)
        return NF_DROP;
       
    if (ipHead->saddr == *(unsigned int*)ip_address)
        return NF_ACCEPT;
    else
        return NF_DROP;*/
   
    //return NF_ACCEPT;
}

int init_module()
{
    netfilter_ops.hook        =    main_hook;
    netfilter_ops.hooknum        =    NF_INET_PRE_ROUTING;
    netfilter_ops.pf        =    PF_INET;
    netfilter_ops.priority        =    NF_IP_PRI_FIRST;

    nf_register_hook(&netfilter_ops);
   
return 0;
}

void cleanup_module() {
    nf_unregister_hook(&netfilter_ops);
}




