From: Gary Smith <gary.smith@holdstead.com>
Subject: RE: access to terminal server in DMZ with 2 isp
Date: Tue, 20 Oct 2009 10:56:47 -0700
Message-ID: <034DEBCAE934A74991E6E76B8DA72D14185DD50995@HSSBS.holdstead.local>
References: <000301ca51ac$5efe4f70$7600a8c0@VALFREDO>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000301ca51ac$5efe4f70$7600a8c0@VALFREDO>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

> I have been trying to configure access to a terminal server from
> several
> days without any luck. I have two routers from 2 diferrent isp
> 
> (called ono and neo) with a range of public in each. I want to access
> my
> terminal server from internet from each isp, so as if one is down I
> 
> can use the other one.
> 
> 
>   /-------\  neo(isp1)  eth1 +----------+
>  /         \            +----+          |
> +-----------------+
> / Internet |------------|    | Firewall |---eth0-+-- DMZ -| Terminal
> Server
> |
> \          /            +----+          |
> +-----------------+
>  \--------/  ono (isp2) eth2 +----------+
> 
> 
> IP1 is the public ip of eth1
> P1 is the ip of the neo's router
> IP2 is the public ip of eth2
> P2 is the ip of the ono's router
> 
> 
> My script to configure the firewall is as follows:
> #eth0 -> Internal network (DMZ) 192.168.0.0/24
> #eth1 -> Neo (First ISP)
> #eth2 -> Ono (Second ISP)
> set -x#Script:
> 
>                 echo 255 local > /etc/iproute2/rt_tables
>                 echo 254 main >> /etc/iproute2/rt_tables
>                 echo 253 default >> /etc/iproute2/rt_tables
>                 echo 0 unspec >> /etc/iproute2/rt_tables
>                 echo 200 neo >> /etc/iproute2/rt_tables
>                 echo 201 ono >> /etc/iproute2/rt_tables
> 
>                 iptables -F
>                 iptables -t nat -F
>                 iptables -t mangle -F
> 
>                 # neo
>                 IP1="213.172.XXXX"
>                 P1_NET="213.172.XXXX/29"
>                 P1="213.172.XXXX"
>                 IF1="eth1"
> 
>                 # ono
>                 IP2="84.124.XXXXX"
>                 P2_NET="84.124.87.224/29"
>                 P2="84.124.XXXX"
>                 IF2="eth2"
>                 IP0="192.168.0.249"
>                 P0_NET="192.168.0.0/24"
>                 #P0=
>                 IF2="eth0"
> 
>                 ip route add $P2_NET dev $IF2 src $IP2 table ono
>                 ip route add default via $P2 table ono
>                 ip route add $P1_NET dev $IF1 src $IP1 table neo
>                 ip route add default via $P1 table neo
>                 ip route add $P1_NET dev $IF1 src $IP1
>                 ip route add $P2_NET dev $IF2 src $IP2
>                 ip route add default via $P1
>                 ip route add $P0_NET     dev $IF0 table neo
>                 ip route add $P2_NET     dev $IF2 table neo
>                 ip route add 127.0.0.0/8 dev lo   table neo
>                 ip route add $P0_NET     dev $IF0 table ono
>                 ip route add $P1_NET     dev $IF1 table ono
>                 ip route add 127.0.0.0/8 dev lo   table ono
> 
> 
>                 ip rule add fwmark 2 table ono
>                 ip rule add fwmark 1 table neo
>                 ip rule add from $IP2 table ono
>                 ip rule add from $IP1 table neo
>                 # -----------
>                 echo 1 > /proc/sys/net/ipv4/ip_forward
>                 iptables -F
>                 iptables -t nat -F
>                 iptables -t mangle -F
> 
>                 #iptables -t mangle -A PREROUTING -m conntrack --
> ctstate
> DNAT --ctorigdst $IP1 -j MARK --set-mark 1
>                 #iptables -t mangle -A PREROUTING -m conntrack --
> ctstate
> DNAT --ctorigdst $IP2 -j MARK --set-mark 2
>                 iptables -t mangle -A PREROUTING -m conntrack --
> ctorigdst
> $IP1 -j MARK --set-mark 1
>                 iptables -t mangle -A PREROUTING -m conntrack --
> ctorigdst
> $IP2 -j MARK --set-mark 2
> 
>                 # Habilito el NAT para que la red interna pueda salir
>                 iptables -t nat -A POSTROUTING -o $IF1 -s $P0_NET -d
> 0.0.0.0/0 -j SNAT --to $IP1
>                 iptables -t nat -A POSTROUTING -o $IF2 -s $P0_NET -d
> 0.0.0.0/0 -j SNAT --to $IP2
>                 #iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -d
> 0.0.0.0/0  -j MASQUERADE
>                 # Redirecciono el puerto de las publicas a la privada
>                 iptables -A PREROUTING -t nat -p tcp -i eth2 --dport
> 3389 -j
> DNAT --to 192.168.0.118:3389
>                 iptables -A PREROUTING -t nat -p tcp -i eth1 --dport
> 3389 -j
> DNAT --to 192.168.0.118:3389
>                 #iptables -A PREROUTING -t nat -p tcp --dport 3389 -j
> DNAT --to 192.168.0.118:3389
>                 #iptables -A PREROUTING -t nat -p tcp --dport 6000 -j
> DNAT --to 192.168.0.118:6666
> 
> When I try to connect from outside to each of my isps, for example ono,
> I
> see packets entering eth2 and then
> going out eth2 immediately without being routed to eth0.
> I see dnat has changed the destination ip so packets go out eth2 having
> the
> source ip from which I'm connecting from (not the ip of the
> 
> adapter) and destination ip 192.168.0.118 (the internal server) but
> through
> the wrong interface.
> These packets should have being sent by eth0 and not eth2. If I connect
> to
> the other isp, neo, it's the same but packets going out eth1
>  instead of eth0.
> Any suggestions?
> 
> 

We did something similar for a client a few years back.  The only difference is that we used two IP's for the terminal server and for the NAT we NAT'd provider1 IP to terminal server IP1, and provider2 IP to terminal server IP2.  We used a similar script for handling the routes and mark's as well.

The only problem we ran into, which we did later fix, is that we had to fight with the default gateway (if router 1 when down then the route on router 2 didn't seem to work well).  We did fix that, but I can't remember how for sure.  The key was assigning multiple internal IP's to the terminal server so there was no confusion on default route on the PRE/POST ROUTING.

Hope that helps.
