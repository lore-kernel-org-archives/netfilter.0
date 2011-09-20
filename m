From: rigoberto perez <rigo666beast@yahoo.com>
Subject: Hooks in layer 2
Date: Tue, 20 Sep 2011 09:15:20 -0700 (PDT)
Message-ID: <1316535320.870.YahooMailClassic@web160707.mail.bf1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1316535320; bh=K5k2Fe3QfvfV4j1mNKj7/PP8M9BoAtSbyENnPnsHjeA=; h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Subject:To:MIME-Version:Content-Type; b=IPapOM4P8hi12CULA65s/xYxv1PtBNJjnklBlRh0Dv77H9QSvLbkHoGnTymMmI4tAJJaONOUYgfgKDyLIgx7ETcsaovZrJmFX46uCNmqUGiMd0eg7uvpLCupmWEg8QG05EW9UXvumANfP9dXCdhGvSZjqSU1A8qnu3v3qKibXMw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi:

I compile and insert in kernel a simple netfilter module in order to intercept ethernet traffic and it seems to be ok (no error messages) but something is wrong 'cause not appears the printk messages.

Here is the code:

<p>
#define _KERNEL_

#include <linux/netfilter_ipv4.h>
#include <linux/netfilter_bridge.h>

static struct list_head list = {NULL, NULL};
static struct nf_hook_ops operations[1];

static unsigned int prerouting(unsigned int hook, struct sk_buff *skb, 					
const struct net_device *indev, const struct net_device *outdev, 					
int (*okfn) (struct sk_buff *))
{
unsigned char src[6], dst[6];
const struct ethhdr *eth = eth_hdr(skb);
	memcpy(src, eth->h_source, ETH_ALEN);
	memcpy(dst, eth->h_dest, ETH_ALEN);
	if ( eth->h_proto == htons(ETH_P_IP))
	{
		printk(KERN_ERR"(%d) src %s, dst %s, proto %d\n", ETH_ALEN, src, dst, eth->h_proto);
	}
	printk(KERN_ERR"prerouting\n");
	return NF_ACCEPT; 
}

static int __init init(void)
{
int ret; 
	operations[1].list = list;
	operations[1].hook = (nf_hookfn *)prerouting;
	operations[1].pf = PF_BRIDGE;
	operations[1].hooknum = NF_BR_PRE_ROUTING;
	operations[1].priority = NF_BR_PRI_BRNF;
	operations[1].owner = THIS_MODULE;
	ret = nf_register_hook(&operations[1]);
	if (ret < 0)
	{
		return ret;
	}
	printk(KERN_WARNING"simple up\n");
	return ret;
}


//Funcion para que el modulo termine lo que el mismo inicio
static void __exit exit(void)
{
	printk(KERN_WARNING"simple down\n");
	nf_unregister_hook(&operations[0]);
}


module_init(init);
module_exit(exit);
</p>

Only appears the simple up and down printk messages when i insert and remove my module respectively. I put others hooks in localin, localout, forward and postrouting and nothing happens. I use OpenSUSE 11.2 (with kernel 2.6.31.5-0.1-default).

Thanks,

Rigoberto
