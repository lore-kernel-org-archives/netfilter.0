From: Piotr Bratkowski <pioterbrat@o2.pl>
Subject: Re: Firewall
Date: Thu, 01 Jan 2009 23:10:13 +0100
Message-ID: <495D3F45.3010508@o2.pl>
References: <163335.69140.qm@web8705.mail.in.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <163335.69140.qm@web8705.mail.in.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: veera kumar <veera_kumar2983@yahoo.co.in>, netfilter@vger.kernel.org

Ok I've worked it out.

I was trying to telnet to web on port 80. But
1) I was trying by domain name
2) I didn't allowed returning traffic

So I watched film with Jackie Chan and got this briliant idea to use ip 
and see on wireshark what is happening :)

Thanks for help!!

P.S

if(tcpH->dest==*(unsigned short*) port)

was ok so there was no need to use htonl, but anyway thanks for tip for future :)




veera kumar pisze:
> Please you do cc to netfiletr groups
>
> --- On *Fri, 2/1/09, Piotr Bratkowski /<pioterbrat@o2.pl>/* wrote:
>
>     From: Piotr Bratkowski <pioterbrat@o2.pl>
>     Subject: Re: Firewall
>     To: "veera kumar" <veera_kumar2983@yahoo.co.in>
>     Date: Friday, 2 January, 2009, 1:50 AM
>
>     Thank you for your reply.
>
>     I've changed this:
>
>     if(tcpH->dest==*(unsigned short*) port)
>
>     into
>
>     if(tcpH->dest==ntohl(80))
>
>     with no positive result.
>
>
>     Part with IP is commented so it's not a problem. I think. Or maybe you want
>     to say that I additionaly need to match IP to TCP matching ??
>
>     Regards
>     Piotr Bratkowski
>
>
>
>     veera kumar pisze:
>     > I think you need to use ntohl conversion for IP address and port 
>     > number while matching
>     >
>     > --- On *Thu, 1/1/09, Piotr Bratkowski /<pioterbrat@o2.pl>/* wrote:
>     >
>     >     From: Piotr Bratkowski <pioterbrat@o2.pl>
>     >     Subject: Firewall
>     >     To: netfilter@vger.kernel.org
>     >     Date: Thursday, 1 January, 2009, 11:12 PM
>     >
>     >     Hello
>     >
>     >     I'm trying to write simple firewall. But I have problem with tcp
>     filtering.
>     >
>     >     I'm using 2.6.27 kernel.
>     >
>     >     Here is my code which supposed to block everything except www.
>     >
>     >     #define __KERNEL__
>     >     #define MODULE
>     >
>     >     #include <linux/kernel.h>        /* Kernel */
>     >     #include <linux/module.h>        /* Module */
>     >     #include <linux/netfilter.h>        /* Netfilter */
>     >     #include <linux/netfilter_ipv4.h>    /* Netfiletr for IPv4 */
>     >     #include <linux/skbuff.h>        /* Socket Kernel Buffers */
>     >     #include <linux/ip.h>            /* IP Header*/
>     >     #include <linux/tcp.h>
>     >
>     >     static struct nf_hook_ops netfilter_ops;            
>     >     /* Adres odblokowany: 212.77.100.101 (wp.pl) */
>     >     static unsigned char *ip_address =
>     >     "\xD4\x4D\x64\x65";
>     >     unsigned char *port = "\x00\x50";
>     >
>     >     unsigned int main_hook(unsigned int hooknum,
>     >              struct sk_buff *skb,
>     >              const struct net_device *in,
>     >              const struct net_device *out,
>     >              int (*okfn)(struct sk_buff*))
>     >     {
>     >
>     >        struct tcphdr *tcpH;
>     >        tcpH=(struct tcphdr *) skb_transport_header(skb);
>     >        //tcpH=tcp_hdr(skb)dr(skb); no difference
>     >        if(tcpH->dest==*(unsigned short*) port)
>     >        return NF_ACCEPT;
>     >        else
>     >        return NF_DROP;
>     >
>     >        /*struct iphdr * ipHead;
>     >        ipHead = ip_hdr( skb );
>     >          if (ipHead == NULL)
>     >            return NF_DROP;
>     >              if (ipHead->saddr == *(unsigned int*)ip_address)
>     >            return NF_ACCEPT;
>     >        else
>     >            return NF_DROP;*/
>     >          //return NF_ACCEPT;
>     >     }
>     >
>     >     int init_module()
>     >     {
>     >        netfilter_ops.hook        =    main_hook;
>     >        netfilter_ops.hooknum        =    NF_INET_PRE_ROUTING;
>     >        netfilter_ops.pf        =    PF_INET;
>     >        netfilter_ops.priority        =    NF_IP_PRI_FIRST;
>     >
>     >        nf_register_hook(&netfilter_ops);
>     >       return 0;
>     >     }
>     >
>     >     void cleanup_module() {
>     >        nf_unregister_hook(&netfilter_ops);
>     >     }
>     >
>     >
>     >
>     >
>     >     --
>     >     To unsubscribe from this list: send the line "unsubscribe
>     netfilter"
>     >     in
>     >     the body of a message to majordomo@vger.kernel.org
>     >     More majordomo info at  http://vger.kernel.org/majordomo-info.html
>     >               
>     >
>     >
>     > ------------------------------------------------------------------------
>     > Add more friends to your messenger and enjoy! Invite them now. 
>     >
>     <http://in.rd.yahoo.com/tagline_messenger_6/*http://messenger.yahoo.com/invite/>
>
>
>
>               
>
>
> ------------------------------------------------------------------------
> Add more friends to your messenger and enjoy! Invite them now. 
> <http://in.rd.yahoo.com/tagline_messenger_6/*http://messenger.yahoo.com/invite/> 


