From: Mike Nielsen <mike@getbent.net>
Subject: How to force an internal IP to use a certain external interface when failover routing is enabled
Date: Fri, 18 Jun 2004 12:16:37 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406181216.37711.mike@getbent.net>
References: <200406181203.32675.mike@privateit.net>
Reply-To: mike@getbent.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406181203.32675.mike@privateit.net>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


 
I setup failover routing according to the nano.txt howto
 http://www.ssi.bg/~ja/nano.txt

We are setting up a VOIP system that requires a static route to the VOIP
switch which is DNATed from two real ips to 10.0.0.13 10.0.0.14 respectivly

In the script I specified a SNAT statement to map the internal IP of
10.0.0.13 to the corresponding external IP.

When the switch generates a new session going out to a phone somewhere in
the internet,  the traffic sometimes goes to the backup interface (Not the
interface or IP specified by the SNAT statement)  and thus the setup
between the switch and the VOIP phone fails.

How do I force traffic from a given internal IP address to skip the
failover routing all together and only route through specified interface?


Below are the ip route and iptables statements I use:


echo "Setting Loopback route"
ip link set lo up
ip addr add 127.0.0.1/8 brd + dev lo

echo "Setting ETH0/Internal route"
ip link set $IFI up
ip addr add $IPI/$NMI brd + dev $IFI
ip rule add prio 50 table main

ip route del default table main

echo "Setting External Interfaces without gateway or Route"
ip link set $IFE1 up
ip addr flush dev $IFE1
ip addr add $IPE1/$NME1 brd $BRD1 dev $IFE1

ip link set $IFE2 up
ip addr flush dev $IFE2
ip addr add $IPE2/$NME2 brd $BRD2 dev $IFE2
ip addr add $PHONEID1/$NME2 brd $BRD2 dev $IFE2 label eth2:2
ip addr add $PHONEID2/$NME2 brd $BRD2 dev $IFE2 label eth2:3

#
#Routing
#

echo "Set Established traffic to use same IF"
ip rule add prio 201 from $NWE1/$NME1 table 201
ip route add default via $GWE1 dev $IFE1 src $IPE1 proto static table 201
ip route append prohibit default table 201 metric 1 proto static

ip rule add prio 202 from $NWE2/$NME2 table 202
ip route add 10.0.0.13/32 via $GWE2 dev $IFE2 src $PHONEID1 proto static
table \
202
ip route add 10.0.0.14/32 via $GWE2 dev $IFE2 src $PHONEID2 proto static
table \
202
ip route add default via $GWE2 dev $IFE2 src $IPE2 proto static table 202
ip route append prohibit default table 202 metric 1 proto static

echo "Default Multipath Route and setting weights!"

ip rule add prio 222 table 222
ip route add 10.0.0.13/32 table 222 proto static \
   nexthop via $GWE2 dev $IFE2 weight 1
ip route add 10.0.0.14/32 table 222 proto static \
   nexthop via $GWE2 dev $IFE2 weight 1

ip route add default table 222 proto static \
   nexthop via $GWE1 dev $IFE1 weight 1 \
   nexthop via $GWE2 dev $IFE2 weight 1

echo "Running Firewalling Scripts for Interfaces"

#echo "        SNAT-For Special"

echo "Setting the Chains on Filter and Nat"
$IPTABLES -t filter -N keep_state
$IPTABLES -t filter -A keep_state -m state --state RELATED,ESTABLISHED \
   -j ACCEPT
$IPTABLES -t filter -A keep_state -j RETURN

$IPTABLES -t nat -N keep_state
$IPTABLES -t nat -A keep_state -m state --state RELATED,ESTABLISHED \
   -j ACCEPT
$IPTABLES -t nat -A keep_state -j RETURN

echo "Setting Jumps for PRE POST OUT IN FORWARD OUT for NAT and FILTER"
$IPTABLES -t nat -A PREROUTING -j keep_state
$IPTABLES -t nat -A POSTROUTING -j keep_state
$IPTABLES -t nat -A OUTPUT -j keep_state
$IPTABLES -t filter -A INPUT -j keep_state
$IPTABLES -t filter -A FORWARD -j keep_state
$IPTABLES -t filter -A OUTPUT -j keep_state

echo "        SNAT-Default"

$IPTABLES -t nat -A POSTROUTING -o $IFE2 -s 10.0.0.13 -j SNAT --to
$PHONEID1 $IPTABLES -t nat -A POSTROUTING -o $IFE2 -s 10.0.0.14 -j SNAT
--to $PHONEID2 $IPTABLES -t nat -A POSTROUTING -o $IFE2 -s 10.0.0.150 -j
SNAT --to $IPE2 $IPTABLES -t nat -A POSTROUTING -o $IFE2 -s $NWI/$NMI -j
SNAT --to $IPE2 $IPTABLES -t nat -A POSTROUTING -o $IFE1 -s $NWI/$NMI -j
SNAT --to $IPE1

$IPTABLES -A FORWARD -p ALL -i ipsec0 -s 0/0 -d 0/0 -j ACCEPT
$IPTABLES -A INPUT -p ALL -i ipsec0 -s 0/0 -j ACCEPT
#echo "Default Policies"
#$IPTABLES -P INPUT DROP
#$IPTABLES -P OUTPUT DROP
#$IPTABLES -P FORWARD DROP

echo"        Per IF Scripts"
/etc/rc.d/rc.firewall_eth1
/etc/rc.d/rc.firewall_eth2

echo "Allowing All LAN traffic to enter Chains"
$IPTABLES -A INPUT -i $IFI -j ACCEPT

echo "Ipsec Traffic"
$IPTABLES -A INPUT -p 50 -s $IPE1 -j ACCEPT
$IPTABLES -A INPUT -p 51 -s $IPE1 -j ACCEPT
$IPTABLES -A INPUT -p 50 -d $IPE2 -j ACCEPT
$IPTABLES -A INPUT -p 51 -d $IPE2 -j ACCEPT
$IPTABLES -A INPUT -p ALL -i ipsec0 -s 0/0 -j ACCEPT

#echo "Dropping Everything else in INPUT chain"
#$IPTABLES -P INPUT DROP

-- 


-----------------------------
|\/|ike@GetBent.net

