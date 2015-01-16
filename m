From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Fri, 16 Jan 2015 03:02:34 +0100
Message-ID: <m99rfq$g8c$1@ger.gmane.org>
References: <CAJb3rWBxWAUNiszThyq95Wm5azPAC92QBFS1zgqPRVdVBHAhVw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJb3rWBxWAUNiszThyq95Wm5azPAC92QBFS1zgqPRVdVBHAhVw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

For diagnose try this:

# iptables -t mangle -nvL
Chain PREROUTING (policy ACCEPT 6063 packets, 5929K bytes)
  pkts bytes target     prot opt in     out     source 
destination
    17  1052 MARK       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0 
            multiport ports 8443:8447 MARK set 0x65

This above is from my setup (using other ports and marks).
It shows that 17 packets were marked as requested.



The Media Server wrote, On 01/16/2015 02:53 AM:
> yes indeed:
> ip rule add* It was just a typo error sorry.
>
> Yes I tried it with let say:
> 2 ht
>
> I also disabled and enabled in the kernel rp_filter and forward for ipv4:
> sudo sysctl -w net.ipv4.conf.eth0.rp_filter=0 &&
> sudo sysctl -w net.ipv4.conf.tun0.rp_filter=0 &&
> sudo sysctl -w net.ipv4.conf.all.rp_filter=0 &&
> sudo sysctl -w net.ipv4.conf.default.rp_filter=0 &&
> sudo sysctl -w net.ipv4.conf.lo.rp_filter=0  &&
>
> sudo sysctl -w net.ipv4.conf.all.forwarding=1 &&
> sudo sysctl -w net.ipv4.conf.default.forwarding=1 &&
> sudo sysctl -w net.ipv4.conf.eth0.forwarding=1 &&
> sudo sysctl -w net.ipv4.conf.lo.forwarding=1 &&
> sudo sysctl -w net.ipv4.conf.tun0.forwarding=1 &&
>
> sudo sysctl -w net.ipv6.conf.all.forwarding=1 &&
> sudo sysctl -w net.ipv6.conf.default.forwarding=1 &&
> sudo sysctl -w net.ipv6.conf.eth0.forwarding=1 &&
> sudo sysctl -w net.ipv6.conf.lo.forwarding=1 &&
> sudo sysctl -w net.ipv6.conf.tun0.forwarding=1
>
> the result of my rule list is:
> 0:      from all lookup local
> 32765:  from all fwmark 0x2 lookup ht
> 32766:  from all lookup main
> 32767:  from all lookup default
>
> my ht (2) table is:
> default via 192.168.0.1 dev eth0
> 192.168.0.0/24 dev eth0  proto kernel  scope link  src 192.168.2.20  metric 1
>
> I tried these rules:
> sudo iptables -t mangle -A PREROUTING -j MARK --set-mark 2
> sudo iptables -t mangle -A OUTPUT -p tcp --dport 80 -j MARK --set-mark 2
> sudo iptables -t mangle -A OUTPUT -p tcp --sport 80 -j MARK --set-mark 2
>
> Nothing work..
>
>
> --
> The weird part is that the OUTPUT rules works:
>
> sudo iptables -t mangle -A OUTPUT -p tcp --dport 80 -j MARK --set-mark 2
> sudo iptables --table nat --append POSTROUTING -o eth0 -j MASQUERADE
>
> and this work too:
> sudo ip rule add from 192.168.2.0/24 table ht
> ---
>
> Looks like it doesn't want to mark anything only the PREROUTING /
> INPUT phase.. or an option somewhere is not enabled..
>
> Thks
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


