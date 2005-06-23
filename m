From: Colin Tree <coltree@tpg.com.au>
Subject: dual/triple adsl router natting problem
Date: Thu, 23 Jun 2005 22:44:31 +1000
Message-ID: <42BAAEAF.7060908@tpg.com.au>
Reply-To: coltree@tpg.com.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
I'm new to the list and a babe with iptables.
I've tried various routing and filtering cominations
as described on different sites around the net and
for the moment am trying multihomed host as described on
routeskeeper.sourceforge

sorry its a bit long

My setup -
Debian Sarge (stable) no udev, etc, clean and simple
kernel 2.6.11 (from unstable)
iptables 1.2.11 (stable) should I go to 1.3.1 ?? (from unstable)
fiaif firewall disabled till we get the routing correct
at present testing with one internal pc

2x100M network cards eth0-2 each connected to an adsl bridged modem
each adsl line is layer 3 bridged with separate IP, GW, NET, BCAST /30
subnets.
1x1000M network card to internal switch and numerous pcs


ip rule add prio 1 from $IPE1 lookup 1
ip rule add prio 1 from $IPE2 lookup 2

### I couldn't get anything until I included the gateway
today I tried again with no gateway, now I can't get in from home.
ip route add table 1 to default dev $IFE1 via $GWE1
ip route add table 2 to default dev $IFE2 via $GWE2

ip route add to default \
    nexthop dev $IFE1 via $GWE1 weight 1 \
    nexthop dev $IFE2 via $GWE2 weight 1

iptables -A POSTROUTING -t mangle -j MARK --set-mark 1 \
    -m state --state NEW -o  $IFE1
iptables -A POSTROUTING -t mangle -j MARK --set-mark 2 \
    -m state --state NEW -o  $IFE2

iptables -A POSTROUTING -t mangle -j CONNMARK --save-mark \
    -m state --state NEW

iptables -A PREROUTING -t mangle -j CONNMARK --restore-mark

ip rule add fwmark 1 lookup 1
ip rule add fwmark 2 lookup 2

iptables -A POSTROUTING -t nat -m mark --mark 1 \
    -j SNAT --to-source $IPE1
iptables -A POSTROUTING -t nat -m mark --mark 2 \
    -j SNAT --to-source $IPE2

###I can access the net and internal network from the gateway

I can ssh and vnc into the gateway from home


the dual path is nicely load sharing ??
root@mantrix:~# ping -I 58.6.33.214 google.com
PING google.com (216.239.39.99) from 58.6.33.214 : 56(84) bytes of data.
64 bytes from 216.239.39.99: icmp_seq=1 ttl=239 time=256 ms

root@mantrix:~# ping -I 58.6.33.210 google.com
PING google.com (216.239.37.99) from 58.6.33.210 : 56(84) bytes of data.
64 bytes from 216.239.37.99: icmp_seq=1 ttl=238 time=265 ms

root@mantrix:~# ping google.com
PING google.com (216.239.57.99) 56(84) bytes of data.
64 bytes from 216.239.57.99: icmp_seq=1 ttl=240 time=180 ms


Can access the gateway from the internal network.

We can't SNAT from the network out to the real world


Cheers,
Colin



