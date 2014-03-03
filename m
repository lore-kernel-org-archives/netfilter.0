From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Multipath routing x kernel > 3.6 (without routing cache)
Date: Mon, 3 Mar 2014 13:54:37 -0400
Message-ID: <CACuyg25Jzj6VAXhTOj3sz4TYaP6Y13vAhwVEPyer6M3LBcGHSw@mail.gmail.com>
References: <CACuyg26ntrABcy39_Obtf+cUKMnOcMtwoE45ZEJkdR=WtwvPdA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=8Hn9TE0vZNl66oiRGOciFP2/mqnAsgnycHQ2ezDOTSw=;
        b=IuyM0euQZj+6iNOgEQoPQUUWoVpXkW6kJeMQX4PUN/EIKxPykiJkWXqsKxfWIA7byL
         bh3VoJ83evAGkE3LoUu4w8EoIWFEmCcgaONL/9qxKz1lpCBmAYXgfQZwGzUqo2FEqBjS
         Zg8lx0tFS9bHYnW6LBrNkWVFPgBZTzs0Kb7r5Wa1JjnCPL1Si5eGhZoHUFrGEhKfSJ73
         Ww/IvijHuxX4uURU2ZkMBr51p4iOUFS+wsl9j071tZam35PpLsbhtZz8v3ujYN4iw1ut
         pHa5f4b0cx2Yf27HwJ1NyUSFDOAu7X5TyvHjduhDzsgOd6WxUraGPfO3WvbBelA50auL
         FqfA==
In-Reply-To: <CACuyg26ntrABcy39_Obtf+cUKMnOcMtwoE45ZEJkdR=WtwvPdA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

I made some adjustments this week and i will do more tests to see if
it was good LB.
So... i trie something like this:

1. Routing rules (RPDB and FIB)

ip route add default via <gw_1> lable link1
ip route add <net_gw1> dev <dev_gw1> table link1
ip route add default via <gw_2> table link2
ip route add <net_gw2> dev <dev_gw2> table link2

/sbin/ip route add default  proto static scope global table lb \
 nexthop  via <gw_1> weight 1 \
 nexthop  via <gw_2> weight 1

ip rule add prio 10 table main
ip rule add prio 20 from <net_gw1> table link1
ip rule add prio 21 from <net_gw2> table link2
ip rule add prio 50 fwmark 0x301 table link1
ip rule add prio 51 fwmark 0x302 table link2
ip rule add prio 100 table lb

ip route del default


2. Firewall rules (using ipset to force a "flow" LB mode)

ipset create lb_link1 hash:ip,port,ip timeout 1200
ipset create lb_link2 hash:ip,port,ip timeout 1200

# Set firewall marks and ipset hash
iptables -t mangle -N SETMARK
iptables -t mangle -A SETMARK -o <if_gw1> -j MARK --set-mark 0x301
iptables -t mangle -A SETMARK -m mark --mark 0x301 -m set !
--match-set lb_link1 src,dstport,dst -j SET \
          --add-set lb_link1 src,dstport,dst
iptables -t mangle -A SETMARK -o <if_gw2> -j MARK --set-mark 0x302
iptables -t mangle -A SETMARK -m mark --mark 0x302 -m set !
--match-set lb_link2 src,dstport,dst -j SET \
          --add-set lb_link2 src,dstport,dst

# Reload marks by ipset hash
iptables -t mangle -N GETMARK
iptables -t mangle -A GETMARK -m mark --mark 0x0 -m set --match-set
lb_link1 src,dstport,dst -j MARK --set-mark 0x301
iptables -t mangle -A GETMARK -m mark --mark 0x0 -m set --match-set
lb_link2 src,dstport,dst -j MARK --set-mark 0x302

# Defining and save firewall marks
iptables -t mangle -N CNTRACK
iptables -t mangle -A CNTRACK -o <if_gw1> -m mark --mark 0x0 -j SETMARK
iptables -t mangle -A CNTRACK -o <if_gw2> -m mark --mark 0x0 -j SETMARK
iptables -t mangle -A CNTRACK -m mark ! --mark 0x0 -j CONNMARK --save-m=
ark
iptables -t mangle -A POSTROUTING -j CNTRACK

# Reload all firewall marks
# Use OUTPUT chain for local access (Squid proxy, for example)
iptables -t mangle -A OUTPUT -m mark --mark 0x0 -j CONNMARK --restore-m=
ark
iptables -t mangle -A OUTPUT -m mark --mark 0x0 -j GETMARK
iptables -t mangle -A PREROUTING -m mark --mark 0x0 -j CONNMARK --resto=
re-mark
iptables -t mangle -A PREROUTING -m mark --mark 0x0 -j GETMARK

Apparently it's working as I would like.
Thanks

2014-03-02 9:09 GMT-04:00 Humberto Juc=E1 <betolj@gmail.com>:
> Hi,
>
> This issue has already been discussed here, but we have not reached a
> conclusion. I'm reviewing my firewall script (iptables yet) and I
> would like to review the configuration of link load balancing.
>
> The problem is that setting too complicated without the routing cache=
=2E
>
> With cache I could set a per-flow balancing. To do this, i configured
> "gc_interval" as 1 and defined a higher value for "gc_timeout". Thus =
I
> forced distribution by origin and destination every second (1s), but
> the routing path was maintained by "gc_timeout".
>
> This was the best way I found to balancing Internet links. IMHO, this
> worked well because it was a flow load balance. So, my connection
> could be distributed by different links, but not in a short time to
> the same destination. This avoided problems with HTTS sessions or
> webmail, for example.
>
> From what I understand... without routing cache, i need to do a
> firewall configuration via CONNMARK. To do this its simple. However
> this creates a balancing per connection, not per flow. I didn't like
> to see a routing path changed in a https session - In many cases,
> local socket is changed constantly.
>
> I know that I can set the path for certain cases by the firewall rule=
,
> but that would be too much unproductive.
>
> I don't understand why such a radical step in the kernel code. Would
> have been much better to have the possibility to enable or disable th=
e
> routing cache instead of removing the code completely. Recently I
> needed to return the kernel version of one firewall (I need to review
> my scripts first).
>
> How do the load balancing per flow without routing cache?
> Any ideas?
>
> Thanks
