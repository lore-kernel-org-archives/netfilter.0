From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Routing locally generated traffic on fwmark
Date: Thu, 29 Sep 2011 12:28:44 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1109291224580.18982@frira.zrqbmnf.qr>
References: <1317248412.26402.39.camel@andybev-desktop> <1317279076.26402.52.camel@andybev-desktop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1317279076.26402.52.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org, Pandu Poluan <pandu@poluan.info>


On Thursday 2011-09-29 08:51, Andrew Beverley wrote:
>> iptables -A OUTPUT -t mangle -d 89.16.176.81 -j MARK --set-mark 0x800
>> ip rule add fwmark 0x800/0xffff table T2
>> ip route add table T2 default dev ppp1 via 94.30.127.76
>
>I've also added the following, which makes no difference:
>
>iptables -t nat -A POSTROUTING -o ppp1 \
>	-j SNAT --to-source 109.224.134.110

Of course it makes no difference, because SNAT is applied after routing.
("POST" "ROUTING", see?)

>So, I assume the problem is that the packet is marked too late to affect
>the routing.
>Looking at the packet flow diagram[1] though, there should
>be a re-route check after the mangle table, which should re-route if a
>packet's mark has changed. Does this feature need enabling?

mangle is the right place; in its code you will find

        ret = ipt_do_table(skb, NF_INET_LOCAL_OUT, NULL, out,
                           dev_net(out)->ipv4.iptable_mangle);
        /* Reroute for ANY change. */
        if (ret != NF_DROP && ret != NF_STOLEN) {
                iph = ip_hdr(skb);
                if (iph->saddr != saddr ||
                    iph->daddr != daddr ||
                    skb->mark != mark ||  
                    iph->tos != tos)
                        if (ip_route_me_harder(skb, RTN_UNSPEC))
                                ret = NF_DROP;
