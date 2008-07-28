From: "Barry A Rich" <barich@trisectrix.com>
Subject: RE: UDP stream load balancing across multiple uplinks
Date: Mon, 28 Jul 2008 09:33:09 -0400
Message-ID: <000801c8f0b6$7a804580$6f80d080$@com>
References: <000501c8edf5$19903230$4cb09690$@com> <a43edf1b0807241837n7e6dceb4id5a16dd56c6344a9@mail.gmail.com> <000001c8ee61$67e4b7a0$37ae26e0$@com> <4889ECB9.3090206@riverviewtech.net>
Reply-To: <barich@trisectrix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: 
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Mail List - Netfilter' <netfilter@vger.kernel.org>

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org 
> [mailto:netfilter-owner@vger.kernel.org]
> On Behalf Of Grant Taylor
> Sent: Friday, July 25, 2008 11:10 AM
> 
> Given that the source IP of your packets can change mid stream, you 
> could use the "nth" match extension.  Using "nth" you would match 
> packets to decide how to mark them and then use the mark to determine 
> what routing table to use which would ultimately decide which outbound 
> path to use.

The following setup does load balancing across the uplinks. However, the
source address in the outgoing packets is not being SNAT'ed. Any
suggestions?

iptables -t raw -A PREROUTING -i eth0 -p udp --sport $SPORT -j NOTRACK

iptables -t mangle -A PREROUTING -p udp --sport $SPORT -m statistic --mode
nth --every 3 --packet 1 -j MARK --set-mark 1
iptables -t mangle -A PREROUTING -p udp --sport $SPORT -m statistic --mode
nth --every 3 --packet 2 -j MARK --set-mark 2
iptables -t mangle -A PREROUTING -p udp --sport $SPORT -m statistic --mode
nth --every 3 --packet 3 -j MARK --set-mark 3

iptables -t nat -A POSTROUTING -o $UPLINK1IF -j SNAT --to $UPLINK1IP
iptables -t nat -A POSTROUTING -o $UPLINK2IF -j SNAT --to $UPLINK2IP
iptables -t nat -A POSTROUTING -o $UPLINK3IF -j SNAT --to $UPLINK3IP

ip route add $UPLINK1NET dev $UPLINK1IF src $UPLINK1IP table uplink1
ip route add default via $UPLINK1GW table uplink1
ip rule add fwmark 1 table uplink1
ip route add $UPLINK2NET dev $UPLINK2IF src $UPLINK2IP table uplink2
ip route add default via $UPLINK2GW table uplink2
ip rule add fwmark 2 table uplink2
ip route add $UPLINK3NET dev $UPLINK3IF src $UPLINK23P table uplink3
ip route add default via $UPLINK3GW table uplink3
ip rule add fwmark 3 table uplink3


