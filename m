From: "Barry A Rich" <barich@trisectrix.com>
Subject: UDP packets not being SNAT-ed
Date: Wed, 30 Jul 2008 21:58:36 -0400
Message-ID: <00bb01c8f2b0$f2875360$d795fa20$@com>
Reply-To: <barich@trisectrix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I've configured an ubuntu PC as a router. All TCP based protocols are
working. The UDP packets are not getting SNAT-ed. Can someone help with the
setup?

The relevant iptables setup is:

$IPTABLES -A OUTPUT -o lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT

$IPTABLES -t nat -A POSTROUTING -o $UPLINK1IF -j SNAT --to $UPLINK1IP

$IPTABLES -t nat -A POSTROUTING -o $UPLINK2IF -j SNAT --to $UPLINK2IP

$IPTABLES -t nat -A POSTROUTING -o $UPLINK3IF -j SNAT --to $UPLINK3IP

The routing setup is:

ip route add $UPLINK1NET dev $UPLINK1IF src $UPLINK1IP table uplink1

ip route add default via $UPLINK1GW table uplink1

ip route add $UPLINK2NET dev $UPLINK2IF src $UPLINK2IP table uplink2

ip route add default via $UPLINK2GW table uplink2

ip route add $UPLINK3NET dev $UPLINK3IF src $UPLINK3IP table uplink3

ip route add default via $UPLINK2GW table uplink3

ip route add default scope global \

 nexthop via $UPLINK1GW dev $UPLINK1IF weight 1 \

 nexthop via $UPLINK2GW dev $UPLINK2IF weight 1 \

 nexthop via $UPLINK3GW dev $UPLINK3IF weight 1



