From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Changing default route causes packet drop
Date: Mon, 05 Jul 2010 12:06:11 +0200
Message-ID: <4C31AE93.70309@freemail.hu>
References: <20100705090326.BF7B134502@john>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100705090326.BF7B134502@john>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: John Meissen <john@meissen.org>
Cc: netfilter@vger.kernel.org

Hi John,

1. Set up multiple routing tables.

a.) I have the following in my /etc/iproute2/rt_tables: [cat=20
/etc/iproute/rt_tables]

#
# reserved values
#
255    local
254    main
253    default
0    unspec
#
# local
#
#1    inr.ruhep
201    PPP2
200    PPP1


b.) I have a route setup script: [cat /etc/network/routes]

#!/bin/bash

WAN1_IF=3D'ppp1'
WAN1_TB=3D'PPP1'
WAN1_MARK=3D'1'
WAN1_IP=3D`ip addr show dev $WAN1_IF | grep 'inet ' | awk '{print $2}' =
|=20
awk 'BEGIN{FS=3D"/"}{print $1}'`
WAN1_GW=3D`ip addr show dev $WAN1_IF | grep 'inet ' | awk '{print $4}' =
|=20
awk 'BEGIN{FS=3D"/"}{print $1}'`

WAN2_IF=3D'ppp2'
WAN2_TB=3D'PPP2'
WAN2_MARK=3D'2'
WAN2_IP=3D`ip addr show dev $WAN2_IF | grep 'inet ' | awk '{print $2}' =
|=20
awk 'BEGIN{FS=3D"/"}{print $1}'`
WAN2_GW=3D`ip addr show dev $WAN2_IF | grep 'inet ' | awk '{print $4}' =
|=20
awk 'BEGIN{FS=3D"/"}{print $1}'`

ip route flush table $WAN1_TB
ip route flush table $WAN2_TB

test ! "$WAN1_IP" =3D=3D "" && ip route add table $WAN1_TB dev $WAN1_IF=
=20
default via $WAN1_GW src $WAN1_IP
test ! "$WAN2_IP" =3D=3D "" && ip route add table $WAN2_TB dev $WAN2_IF=
=20
default via $WAN2_GW src $WAN2_IP

for prio in `ip rule show | grep $WAN1_TB | awk 'BEGIN{FS=3D":"}{print =
$1}'`
  do
  ip rule del prio $prio
  done
for prio in `ip rule show | grep $WAN2_TB | awk 'BEGIN{FS=3D":"}{print =
$1}'`
  do
  ip rule del prio $prio
  done

test ! "$WAN2_IP" =3D=3D "" && ip rule add fwmark $WAN1_MARK table $WAN=
1_TB
test ! "$WAN2_IP" =3D=3D "" && ip rule add fwmark $WAN2_MARK table $WAN=
2_TB

test ! "$WAN1_IP" =3D=3D "" && ip rule add from $WAN1_IP table $WAN1_TB
test ! "$WAN2_IP" =3D=3D "" && ip rule add from $WAN2_IP table $WAN2_TB

test -e /proc/sys/net/ipv4/conf/$WAN1_IF/rp_filter && echo '0'=20
 >/proc/sys/net/ipv4/conf/$WAN1_IF/rp_filter
test -e /proc/sys/net/ipv4/conf/$WAN2_IF/rp_filter && echo '0'=20
 >/proc/sys/net/ipv4/conf/$WAN2_IF/rp_filter

ip route del default
ip route add default dev $WAN1_IF scope link

ip route flush cache

exit 0

c.) Call this script whenever a WAN interface is coming up.

In my /etc/interfaces:

auto adsl1
iface adsl1 inet ppp
    provider PPP1
    up /bin/sleep 10
    up /etc/network/routes

auto adsl2
iface adsl2 inet ppp
    provider PPP2
    up /bin/sleep 10
    up /etc/network/routes

2. Do the Netfilter/Iptables part:

Mark the outgoing packets in the mangle table's POSTROUTING chain with=20
WAN1_MARK or WAN2_MARK:
iptables -t mangle -A POSTROUTING -j MARK --set-mark 1 .... (your=20
matching criteria for WAN1....)
iptables -t mangle -A POSTROUTING -j MARK --set-mark 2 .... (your=20
matching criteria for WAN2....)


Hope I could help:

  Swifty

2010-07-05 11:03 keltez=E9ssel, John Meissen =EDrta:
> I'm not sure if this is the right place to ask, or if it's even the r=
ight
> question. Hopefully someone can point me in the right direction.
>
> I had a traditional setup with two ethernet interfaces on my Linux bo=
x
> (WAN=3Deth0/LAN=3Deth1), and NATing the traffic that was forwarded be=
tween them.
>
> I added another interface (eth2), and simply want to change the defau=
lt
> routing to go through it. I'm leaving various services listening on a=
ll
> interfaces.
>
> If I change the default route to use eth2, I can route from the inter=
nal
> network to the outside just fine, and I can connect from the internal=
 net
> to services on the system fine. But incoming connections on the origi=
nal
> WAN (eth0) don't complete. They hang at SYN_RECV, as if I had a DROP =
rule.
>
> I.e., what used to be
>
>    internal<->  (eth1) gateway forward (eth0)<->  WAN
>    internal<->  (eth1) gateway local service
>                  gateway local service (eth0)<->  WAN
> is now
>
>    internal<->  (eth1) gateway forward (eth2)<->  WAN
>    internal<->  (eth1) gateway local service
>
> but
>                  gateway local service (eth0)<->  WAN
>
> now drops connection attempts.
>
> I don't see what difference there should be between eth0 and eth1, ex=
cept
> that eth0 isn't forwarded. That shouldn't affect connections to proce=
sses
> listening on that interface.
>
> I've tried to keep the iptables config simple for this. The only chan=
ge I'm
> making is changing the default route with the 'route' command.
>
> # iptables -L -v -n
> Chain INPUT (policy ACCEPT 63555 packets, 73M bytes)
>   pkts bytes target     prot opt in     out     source               =
destination
>
>     11  3626 ACCEPT     udp  --  eth1   *       0.0.0.0/0            =
0.0.0.0/0
>          udp spt:68 dpt:67
>      0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0            =
0.0.0.0/0
>          tcp spt:68 dpt:67
>      0     0 ACCEPT     udp  --  eth1   *       0.0.0.0/0            =
0.0.0.0/0
>          udp spt:67 dpt:68
>      0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0            =
0.0.0.0/0
>          tcp spt:67 dpt:68
>   1937  127K ACCEPT     udp  --  eth1   *       0.0.0.0/0            =
0.0.0.0/0
>          udp dpt:53
>      0     0 ACCEPT     tcp  --  eth1   *       0.0.0.0/0            =
0.0.0.0/0
>          tcp dpt:53
>
> Chain FORWARD (policy ACCEPT 39362 packets, 42M bytes)
>   pkts bytes target     prot opt in     out     source               =
destination
>
> 31533 2844K ACCEPT     all  --  *      *       192.168.10.0/24      0=
=2E0.0.0/0
>
>
> Chain OUTPUT (policy ACCEPT 42150 packets, 5745K bytes)
>   pkts bytes target     prot opt in     out     source               =
destination
>
>
> and
>
> # iptables -t nat -L -v -n
> Chain PREROUTING (policy ACCEPT 859K packets, 57M bytes)
>   pkts bytes target     prot opt in     out     source               =
destination
>
>
> Chain POSTROUTING (policy ACCEPT 584K packets, 46M bytes)
>   pkts bytes target     prot opt in     out     source               =
destination
>
>   755K   72M MASQUERADE  all  --  *      *       192.168.10.0/24     =
 0.0.0.0/0
>
>
> Chain OUTPUT (policy ACCEPT 1015K packets, 100M bytes)
>   pkts bytes target     prot opt in     out     source               =
destination
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   =20

