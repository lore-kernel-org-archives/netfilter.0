From: seberino@spawar.navy.mil
Subject: problems converting iptables script from eth2 to ppp0....
Date: Tue, 28 Jan 2003 21:58:05 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030128215805.A6872@spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I made the following iptables script for a firewall
with 3 NICS *originally for static ip*.  There is nothing special... it just
only allows incoming SSH in addition to ESTABLISHED and
RELATED connections.....

Well I just switched from cable to DSL which uses
PPPoE instead of static ip setup i had before.

"Oh, I'll just change $INTERNET_INTERFACE to be ppp0
instead of eth2".....

This thinking shuts down DNS and other stuff and just
plain does not work.  I cannot seem to figure out
why and how to fix.  Is there some subtle difference
between ppp0 and eth2 for iptables I'm missing or
something??

(Firewall works great with DSL if no packet filtering
so only problem is getting packing filtering to be
DSL friendly.)

thanks in advance,

Chris

-- 

#!/bin/sh

# Definitions

IPTABLES="/usr/sbin/iptables"

LOOPBACK_INTERFACE="lo"
PROTECTED_NETWORK_INTERFACE_0="eth0"
PROTECTED_NETWORK_INTERFACE_1="eth1"
INTERNET_INTERFACE="eth2"

INTERNET_ADDRESS="24.30.154.55"
PROTECTED_SERVER_ADDRESS="192.168.1.2"

PROTECTED_NETWORK_0="192.168.1.0/29"
PROTECTED_NETWORK_1="192.168.2.0/29"
PROTECTED_NETWORK_SPACE="192.168.0.0/16"
RESERVED_NETWORKS="                                                           \
   0.0.0.0/8   1.0.0.0/8   2.0.0.0/8   5.0.0.0/8     7.0.0.0/8   10.0.0.0/8   \
   23.0.0.0/8  27.0.0.0/8  31.0.0.0/8  36.0.0.0/8    37.0.0.0/8  39.0.0.0/8   \
   41.0.0.0/8  42.0.0.0/8  58.0.0.0/8  59.0.0.0/8    60.0.0.0/8  69.0.0.0/8   \
   70.0.0.0/8  71.0.0.0/8  72.0.0.0/8  73.0.0.0/8    74.0.0.0/8  75.0.0.0/8   \
   76.0.0.0/8  77.0.0.0/8  78.0.0.0/8  79.0.0.0/8    80.0.0.0/8  82.0.0.0/8   \
   83.0.0.0/8  84.0.0.0/8  85.0.0.0/8  86.0.0.0/8    87.0.0.0/8  88.0.0.0/8   \
   89.0.0.0/8  90.0.0.0/8  91.0.0.0/8  92.0.0.0/8    93.0.0.0/8  94.0.0.0/8   \
   95.0.0.0/8  96.0.0.0/8  97.0.0.0/8  98.0.0.0/8    99.0.0.0/8  100.0.0.0/8  \
   101.0.0.0/8 102.0.0.0/8 103.0.0.0/8 104.0.0.0/8   105.0.0.0/8 106.0.0.0/8  \
   107.0.0.0/8 108.0.0.0/8 109.0.0.0/8 110.0.0.0/8   111.0.0.0/8 112.0.0.0/8  \
   113.0.0.0/8 114.0.0.0/8 115.0.0.0/8 116.0.0.0/8   117.0.0.0/8 118.0.0.0/8  \
   119.0.0.0/8 120.0.0.0/8 121.0.0.0/8 122.0.0.0/8   123.0.0.0/8 124.0.0.0/8  \
   125.0.0.0/8 126.0.0.0/8 127.0.0.0/8 172.16.0.0/12 197.0.0.0/8 201.0.0.0/8  \
   217.0.0.0/8 218.0.0.0/8 219.0.0.0/8 220.0.0.0/8   221.0.0.0/8 222.0.0.0/8  \
   223.0.0.0/8 224.0.0.0/4 240.0.0.0/5 241.0.0.0/8   242.0.0.0/8 243.0.0.0/8  \
   244.0.0.0/8 245.0.0.0/8 246.0.0.0/8 247.0.0.0/8   248.0.0.0/8 249.0.0.0/8  \
   250.0.0.0/8 251.0.0.0/8 252.0.0.0/8 253.0.0.0/8   254.0.0.0/8 255.0.0.0/8  "

CLOSED_TCP_PORTS="2049 6000:6063 20034 12345:12346 27374 27665 27444 27444    \
                  31335 10498 12754"
CLOSED_UDP_PORTS="2049 31337 27444 31335 10498"

# Initialization

$IPTABLES -t filter -F
$IPTABLES -t mangle -F
$IPTABLES -t nat    -F 

$IPTABLES -t filter -X
$IPTABLES -t mangle -X
$IPTABLES -t nat    -X

$IPTABLES -t filter -P INPUT   DROP
$IPTABLES -t filter -P OUTPUT  DROP
$IPTABLES -t filter -P FORWARD DROP

# Chains

$IPTABLES -t filter -N DROP_RULES

   # Inappropriate packets

   $IPTABLES -t filter -A DROP_RULES -m unclean                         -j DROP
   $IPTABLES -t filter -A DROP_RULES -m state --state INVALID           -j DROP
   $IPTABLES -t filter -A DROP_RULES -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
   $IPTABLES -t filter -A DROP_RULES -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
   $IPTABLES -t filter -A DROP_RULES -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
   $IPTABLES -t filter -A DROP_RULES -p tcp --tcp-flags ACK,FIN FIN     -j DROP
   $IPTABLES -t filter -A DROP_RULES -p tcp --tcp-flags ACK,PSH PSH     -j DROP
   $IPTABLES -t filter -A DROP_RULES -p tcp --tcp-flags ACK,URG URG     -j DROP
   $IPTABLES -t filter -A DROP_RULES -p tcp --tcp-flags ALL     NONE    -j DROP

   # Closed ports

   for PORT in $CLOSED_TCP_PORTS; do
      $IPTABLES -t filter -A DROP_RULES -p tcp --sport $PORT -j DROP
      $IPTABLES -t filter -A DROP_RULES -p tcp --dport $PORT -j DROP
   done
   for PORT in $CLOSED_UDP_PORTS; do
      $IPTABLES -t filter -A DROP_RULES -p udp --sport $PORT -j DROP
      $IPTABLES -t filter -A DROP_RULES -p udp --dport $PORT -j DROP
   done

   # Reserved networks

   for NETWORK in $RESERVED_NETWORKS; do
      $IPTABLES -t filter -A DROP_RULES -s $NETWORK -j DROP
      $IPTABLES -t filter -A DROP_RULES -d $NETWORK -j DROP
   done

# Rules

$IPTABLES -t filter -A INPUT  -i $LOOPBACK_INTERFACE -j ACCEPT
$IPTABLES -t filter -A OUTPUT -o $LOOPBACK_INTERFACE -j ACCEPT

$IPTABLES -t filter -A INPUT   -j DROP_RULES
$IPTABLES -t filter -A OUTPUT  -j DROP_RULES
$IPTABLES -t filter -A FORWARD -j DROP_RULES

$IPTABLES -t filter -A INPUT       -i $INTERNET_INTERFACE                     \
          -s ! $PROTECTED_NETWORK_SPACE -d   $INTERNET_ADDRESS                \
          -m state --state ESTABLISHED,RELATED                                \
          -j ACCEPT
$IPTABLES -t filter -A OUTPUT      -o $INTERNET_INTERFACE                     \
          -s   $INTERNET_ADDRESS        -d ! $PROTECTED_NETWORK_SPACE         \
          -j ACCEPT

$IPTABLES -t filter -A FORWARD     -i $PROTECTED_NETWORK_INTERFACE_0          \
          -s   $PROTECTED_NETWORK_0     -d ! $PROTECTED_NETWORK_SPACE         \
          -j ACCEPT
$IPTABLES -t filter -A FORWARD     -o $PROTECTED_NETWORK_INTERFACE_0          \
          -s ! $PROTECTED_NETWORK_SPACE -d   $PROTECTED_NETWORK_0             \
          -j ACCEPT

$IPTABLES -t filter -A FORWARD     -i $PROTECTED_NETWORK_INTERFACE_1          \
          -s   $PROTECTED_NETWORK_1     -d ! $PROTECTED_NETWORK_SPACE         \
          -j ACCEPT
$IPTABLES -t filter -A FORWARD     -o $PROTECTED_NETWORK_INTERFACE_1          \
          -s ! $PROTECTED_NETWORK_SPACE -d   $PROTECTED_NETWORK_1             \
          -j ACCEPT

$IPTABLES -t filter -A FORWARD     -i $INTERNET_INTERFACE                     \
          -s ! $PROTECTED_NETWORK_SPACE -d   $PROTECTED_SERVER_ADDRESS        \
          -p tcp --dport ssh                                                  \
          -j ACCEPT
$IPTABLES -t filter -A FORWARD     -o $INTERNET_INTERFACE                     \
          -s   $PROTECTED_NETWORK_0     -d ! $PROTECTED_NETWORK_SPACE         \
          -j ACCEPT
$IPTABLES -t filter -A FORWARD     -o $INTERNET_INTERFACE                     \
          -s   $PROTECTED_NETWORK_1     -d ! $PROTECTED_NETWORK_SPACE         \
          -j ACCEPT

$IPTABLES -t nat    -A PREROUTING  -i $INTERNET_INTERFACE                     \
          -s ! $PROTECTED_NETWORK_SPACE -d   $INTERNET_ADDRESS                \
          -p tcp --dport ssh                                                  \
          -j DNAT --to-destination $PROTECTED_SERVER_ADDRESS
$IPTABLES -t nat    -A POSTROUTING -o $INTERNET_INTERFACE                     \
          -s   $PROTECTED_NETWORK_0     -d ! $PROTECTED_NETWORK_SPACE         \
          -j SNAT --to-source      $INTERNET_ADDRESS
$IPTABLES -t nat    -A POSTROUTING -o $INTERNET_INTERFACE                     \
          -s   $PROTECTED_NETWORK_1     -d ! $PROTECTED_NETWORK_SPACE         \
          -j SNAT --to-source      $INTERNET_ADDRESS

# Kernel configuration

echo "1" > /proc/sys/net/ipv4/ip_forward

