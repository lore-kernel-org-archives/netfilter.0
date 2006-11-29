From: Philippe BRAND <philippe@brand.nom.fr>
Subject: weird multilink problem
Date: Wed, 29 Nov 2006 16:57:05 +0100
Message-ID: <456DADD1.6000709@brand.nom.fr>
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

Hello,

I'm currently facing a weird problem with my setup when using multilink
ISP setup (I have 2 subnets available 81.2xx.xxx.xxx and
83.1xx.xxx.xxx). Please note that I'm using a SINGLE ISP link whith this
test (using my 2 subnets), but production system will have 2 real ISP link.

I'm trying to build a high-available webproxy cluster using
heartbeat/ldirectord.

- 2 nodes
- each node has 4 ethernet interfaces, 2 are defined when cluster is not up.
      - eth0: private addressing 10.1.0.x/24
      - eth1: going to internal LAN, private addressing 10.0.1.x/24
      - eth2/eth3: free to use

eth1 is correctly handled by ldirectord, no problem so far.
node 1 use eth0 to connect to Internet
node 2 use eth2 to connect to Internet.
ethx public addresses are correctly handled by heartbeat, no problem so
far: each node when up do get its wan address using "/sbin/ip -f inet
addr add $myispx_ip/24 brd $myispx_brd dev ethx"


When both nodes are up, no problem. each squid on each node correctly
works. Each node has both prv and pub address on eth0 and eth2, default
route is correctly handled.

Trouble comes when one system fails, and here comes my netfilter
problem: I should equally send packets to both interfaces, which is
correctly done, BUT some packets with my ISP1 IP address are going out
to the 2nd interface, which has ISP2 IP address (as shown by tcmdump).

I'm using the 'fwmark' method to handle multilink. Kernel is a gentoo
2.6.17-hardened-r1 with patch-o-matic-ng 20061114 features applied
(ROUTE, TARPIT, etc), iptables 1.3.5, and also with some kernel patches:

hidden-2.6.12-1.diff
ipvs-nfct-2.6.16-1.diff (Julian Anastasov patch http://www.ssi.bg/~ja/).
linux-2.6.17-imq1.diff
routes-2.6.17-12.diff (Julian Anastasov again jumbo patch ).
x-tables-statistics.patch (random/nth reborned).

When a node has all cluster's ressources, I have:

INT_DEV = eth1
INT_IP = 10.0.1.2 on eth1
INT_VIP = 10.0.1.10 on eth1

EXT_IP1 = 10.1.0.2 on eth0
EXT_DEV1 = eth0
EXT_DEV2 = eth2
EXT_WAN1 = my 1st public adr on eth0
EXT_WAN2 = my 2nd public adr on eth2
EXT_GW1 = my 1st gateway
EXT_GW2 = my 2nd gateway


Here is an extract of my script:

          ip route del default
          ip rule del table 10
          ip rule del table 20

          $IPT -t mangle -N $EXT_DEV2
          $IPT -t mangle -F $EXT_DEV2
          $IPT -t mangle -A $EXT_DEV2 -j MARK --set-mark 1

          $IPT -t mangle -N $EXT_DEV1
          $IPT -t mangle -F $EXT_DEV1
          $IPT -t mangle -A $EXT_DEV1 -j MARK --set-mark 2

	$IPT -t mangle -A OUTPUT -o ! ${INT_DEV} -m statistic --mode random
--probability 0.50 -j ${EXT_DEV2}
	$IPT -t mangle -A PREROUTING -i ${INT_DEV} -m statistic --mode random
--probability 0.50 -j ${EXT_DEV2}
	ip ro add table 10 default via ${EXT_GW2} dev ${EXT_DEV2} src ${EXT_WAN2}
         ip ru add fwmark 1 table 10
         ip ro fl ca

         $IPT -t mangle -A OUTPUT -o ! ${INT_DEV} -m statistic --mode
random --probability 0.50 -j ${EXT_DEV1}
         $IPT -t mangle -A PREROUTING -i ${INT_DEV} -m statistic --mode
random --probability 0.50 -j ${EXT_DEV1}
         ip ro add table 20 default via ${EXT_GW1} dev ${EXT_DEV1} src
${EXT_WAN1}
         ip ru add fwmark 2 table 20
         ip ro fl ca

	# This assures outgoing packets have the proper external address
         $IPT -t nat -N SPOOF_LVS
         $IPT -t nat -F SPOOF_LVS
         $IPT -t nat -A SPOOF_LVS -o ${EXT_DEV2} -j SNAT --to ${EXT_WAN2}
         $IPT -t nat -A SPOOF_LVS -o ${EXT_DEV1} -j SNAT --to ${EXT_WAN1}
         $IPT -t nat -A POSTROUTING -j SPOOF_LVS

         # Now, we need to make sure that the box has a default route,
	# which in our case, is a multipath route
         ip ro add default \
                 nexthop via ${EXT_GW2} dev ${EXT_DEV2} weight 1 \
                 nexthop via ${EXT_GW1} dev ${EXT_DEV1} weight 1

         echo 0> /proc/sys/net/ipv4/conf/${EXT_DEV2}/rp_filter
         echo 0> /proc/sys/net/ipv4/conf/${EXT_DEV1}/rp_filter
         echo "1"> /proc/sys/net/ipv4/ip_forward


Now lots of packets do go out using proper interface and proper source
IP, but some go out using wrong IP, e.g EXT_WAN2 going out on EXT_DEV1
or EXT_WAN1 going out on EXT_DEV2. I've already put traces on iptables
chains and I do see packets getting SNATEd but for some reason, some are
not, or perhaps SNATED but going out on wrong interface.

Does somebody have any clue on this ?
Thanks for any input you may have, I'm quite desperate and need a fresh
look.





