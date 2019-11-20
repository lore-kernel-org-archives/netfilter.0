From: Psyspy rambo <psyspy2020@gmail.com>
Subject: Re: Netfilter hook doesn't see all packets
Date: Wed, 20 Nov 2019 11:01:32 -0700
Message-ID: <CAFqmWq_Ha3ces2AAnU_s-Dzbxv7g-pGE4ikg-+HGGq-WNX=gow@mail.gmail.com>
References: <CAFqmWq_+GgO3uiu6omDxiUPiiV5OcJ9d6A--RHC3-jZCy_sV0A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=my2+hKeYdiBi+eVfgNi/X1I/SCK1Ofo+/8SaF+W4Zpg=;
        b=nJRp3DCQxE8Gw8CM1qCtP5bqMEtmH75088t37ivHJBtcTZUPolCwJhJENHIfqcZRoT
         9kzJCiazJ8qv4HkQ6qJN5pUJfeqln/NYncbHAPujlMf+YhcHCx7+p6/k4iE2K/ge8Eog
         b825mBxfCUD/8fyuj8AqMAgVx2X9afKr52Qb4AbXieji5RqtT6fiUNgKJIUzlnGhBb9V
         B9Qxs8t7XnlqxvDYubF0blp6YRXnfR6i5FRpjf/HzaRo3KrlpcDA7sPNiqBBrWTy07jg
         wSbKRJE8Ez19J5pi7QRPIaS1k5r2KwH0sykDrEQTSxFdX2xgwrypW63WVoHJ25a+Hikf
         4+nQ==
In-Reply-To: <CAFqmWq_+GgO3uiu6omDxiUPiiV5OcJ9d6A--RHC3-jZCy_sV0A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Note: I am seeing this issue only on a specific host. It works fine on
another host running in router mode. Any ideas to debug this?

Adding this log rule logs all packets: iptables -t mangle -I
PREROUTING 1 -j LOG --log-prefix="mylog" --log-level 4 --ipv4 -p udp
--sport 5353
The kernel module doesn't see ALL multicast dns packets. I assume
iptables uses netfilter hooks too, which makes this issue strange.
Here is the module code:

static uint32_t myhook(uint32_t hooknum, struct sk_buff *skb, const
struct net_device *in,  const struct net_device *out, int (*okfn)
(struct sk_buff *))
{
    struct iphdr *ip_header;
    uint8_t proto;
    struct udphdr *udp_header;
    unsigned int sip, dip, sport = 0, dport = 0;

    if(!skb)
        return NF_ACCEPT;

    if(ntohs(skb->protocol) != ETH_P_IP)
        return NF_ACCEPT;

    ip_header = (struct iphdr *)skb_network_header(skb);
    proto = ip_header->protocol;

    if (proto != IPPROTO_UDP)
        return NF_ACCEPT;

    udp_header = (struct udphdr *)skb_transport_header(skb);
    sip = (unsigned int)ntohl(ip_header->saddr);
    dip = (unsigned int)ntohl(ip_header->daddr);
    sport = (unsigned int)ntohs(udp_header->source);
    dport = (unsigned int)ntohs(udp_header->dest);
    if (dport == 5353)
        pr_err("sip: %pI4h, sport: %u; dip: %pI4h, dport: %u\n", &sip,
sport, &dip, dport);
    return NF_ACCEPT;
}

/*
pre_routing_hook_ops.hooknum = NF_INET_PRE_ROUTING;
pre_routing_hook_ops.pf = PF_INET;
pre_routing_hook_ops.priority = NF_IP_PRI_FIRST;
pre_routing_hook_ops.hook = (nf_hookfn *) myhook;
*/

On Thu, Nov 14, 2019 at 1:23 PM Psyspy rambo <psyspy2020@gmail.com> wrote:
>
> Hello,
>
> I implemented a kernel module that hooks into netfilter PREROUTING
> hook and tries to log multicast dns packet tuple. If I add a iptables
> log rule for mdns (port 5353), it logs all mdns packets. Verified that
> it matches tcpdump output. However, the netfilter hook sees only a few
> packets. Any ideas why? Thanks in advance.
