From: Gordon Fisher <gordfisherman@gmail.com>
Subject: Re: Netfilter hook doesn't see all packets
Date: Thu, 21 Nov 2019 10:08:23 -0800
Message-ID: <5DD6D297.8010609@gmail.com>
References: <CAFqmWq_+GgO3uiu6omDxiUPiiV5OcJ9d6A--RHC3-jZCy_sV0A@mail.gmail.com> <CAFqmWq_Ha3ces2AAnU_s-Dzbxv7g-pGE4ikg-+HGGq-WNX=gow@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=yjuNlSW7gFHkjMLv/QPhh1czLrbn9nIckppbW+rdbMU=;
        b=Exv9vNzGHTAQ4yPJt8VCSBnsBZncQXb0lQ6JwZeM0P53lNep75ERQ2wuq+LdnRnjdF
         3Texc0jckhBZEOAalVtaM8kn98SdZPqEYmMYgmpBmt89DMRVz5lkgDk7wFE7RqjC4Dpt
         BZfkyMFsiYjKU9x/IqCDyoOxX5BfbJEA8pKEJEUz+fusRL1Q7sMtYkY8n4nUdwcXwJ8h
         pl8JhNYa5B96iZoL+/vLfXazo3k34NjbSNG8L+acZ8jvSmVGO27vYWeSFidCdStxO4X8
         0CbopOzRC0jK2etpAxSySScoARuayASXPPxGooPT4aeVYCrz/V0OOBQDI2BzLeiPZi6Q
         IJGw==
In-Reply-To: <CAFqmWq_Ha3ces2AAnU_s-Dzbxv7g-pGE4ikg-+HGGq-WNX=gow@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Looks like your problem is that your iptables LOG rule tests for sport 
5353 while your hook code tests for dport 5353, which would explain why 
you're seeing different results.

 > Adding this log rule logs all packets: iptables -t mangle -I
 > PREROUTING 1 -j LOG --log-prefix="mylog" --log-level 4 --ipv4
 > -p udp --sport 5353

 >     if (dport == 5353)
 >         pr_err("sip: %pI4h, sport: %u; dip: %pI4h, dport: %u\n",
 > &sip, sport, &dip, dport);

-- 
gordonfish


On 11/20/2019 10:01 AM, Psyspy rambo wrote:
> Note: I am seeing this issue only on a specific host. It works fine on
> another host running in router mode. Any ideas to debug this?
>
> Adding this log rule logs all packets: iptables -t mangle -I
> PREROUTING 1 -j LOG --log-prefix="mylog" --log-level 4 --ipv4 -p udp
> --sport 5353
> The kernel module doesn't see ALL multicast dns packets. I assume
> iptables uses netfilter hooks too, which makes this issue strange.
> Here is the module code:
>
> static uint32_t myhook(uint32_t hooknum, struct sk_buff *skb, const
> struct net_device *in,  const struct net_device *out, int (*okfn)
> (struct sk_buff *))
> {
>      struct iphdr *ip_header;
>      uint8_t proto;
>      struct udphdr *udp_header;
>      unsigned int sip, dip, sport = 0, dport = 0;
>
>      if(!skb)
>          return NF_ACCEPT;
>
>      if(ntohs(skb->protocol) != ETH_P_IP)
>          return NF_ACCEPT;
>
>      ip_header = (struct iphdr *)skb_network_header(skb);
>      proto = ip_header->protocol;
>
>      if (proto != IPPROTO_UDP)
>          return NF_ACCEPT;
>
>      udp_header = (struct udphdr *)skb_transport_header(skb);
>      sip = (unsigned int)ntohl(ip_header->saddr);
>      dip = (unsigned int)ntohl(ip_header->daddr);
>      sport = (unsigned int)ntohs(udp_header->source);
>      dport = (unsigned int)ntohs(udp_header->dest);
>      if (dport == 5353)
>          pr_err("sip: %pI4h, sport: %u; dip: %pI4h, dport: %u\n", &sip,
> sport, &dip, dport);
>      return NF_ACCEPT;
> }
>
> /*
> pre_routing_hook_ops.hooknum = NF_INET_PRE_ROUTING;
> pre_routing_hook_ops.pf = PF_INET;
> pre_routing_hook_ops.priority = NF_IP_PRI_FIRST;
> pre_routing_hook_ops.hook = (nf_hookfn *) myhook;
> */
>
> On Thu, Nov 14, 2019 at 1:23 PM Psyspy rambo <psyspy2020@gmail.com> wrote:
>> Hello,
>>
>> I implemented a kernel module that hooks into netfilter PREROUTING
>> hook and tries to log multicast dns packet tuple. If I add a iptables
>> log rule for mdns (port 5353), it logs all mdns packets. Verified that
>> it matches tcpdump output. However, the netfilter hook sees only a few
>> packets. Any ideas why? Thanks in advance.

