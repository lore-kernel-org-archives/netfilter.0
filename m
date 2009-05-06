From: "Barry A Rich" <barich@trisectrix.com>
Subject: How to reset everything
Date: Wed, 6 May 2009 18:03:38 -0400
Message-ID: <002c01c9ce96$8336c230$89a44690$@com>
Reply-To: <barich@trisectrix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

We use Netfilter to load balance UDP packets across multiple uplinks (ppp0,
ppp1, ppp2, ppp3). Uplinks can be added or removed on the fly. When this
happens, we reset everything and run the firewall/routing script that
matches the new uplink configuration. The reset looks like this:

######################### Begin reset #########################

iptables -F INPUT
iptables -P INPUT DROP
iptables -F OUTPUT
iptables -P OUTPUT DROP
iptables -F FORWARD
iptables -P FORWARD DROP
iptables -F -t raw
iptables -F -t nat
iptables -F -t mangle

ip route del default
ip route flush table uplink1
ip route flush table uplink2
ip route flush table uplink3
ip route flush table uplink4
ip route flush dev ppp0
ip route flush dev ppp1
ip route flush dev ppp2
ip route flush dev ppp3

tc qdisc del dev ppp0 root
tc qdisc del dev ppp1 root
tc qdisc del dev ppp2 root
tc qdisc del dev ppp3 root

ip route flush cache

######################### End reset #########################

For two uplinks, the setup looks like this:

######################### Begin setup #########################

iptables -t raw -A PREROUTING -i eth0 -p udp --sport 6970 -j NOTRACK

iptables -t mangle -A PREROUTING -p udp --sport 6970 -m statistic --mode nth
--every 2 --packet 0 -j MARK --set-mark 1

iptables -t mangle -A PREROUTING -p udp --sport 6970 -m statistic --mode nth
--every 2 --packet 1 -j MARK --set-mark 2

tc qdisc add dev ppp0 root handle 1: prio

tc qdisc add dev ppp1 root handle 1: prio

tc filter add dev ppp0 parent 1:0 protocol ip prio 1 \
    handle 1 fw flowid 1:1 action nat egress x.x.x.x/32 y.y.y.y

tc filter add dev ppp1 parent 1:0 protocol ip prio 1 \
    handle 2 fw flowid 1:1 action nat egress x.x.x.x/32 z.z.z.z

######################### End setup #########################

The UDP stream continues to be received on the LAN interface during the
reset/setup. The reset/setup works most of the time, but occasionally the
packets going out ppp0 do not get NAT'd after a reset/setup. Repeating the
setup/reset sequence a second time seems to make it work, but I'd rather
understand what's wrong and fix it.

All help is appreciated.

Thanks.



