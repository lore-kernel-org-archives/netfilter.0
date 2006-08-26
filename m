From: longraider <longraider@gazeta.pl>
Subject: Two inet connections and stateful SNAT
Date: Sat, 26 Aug 2006 12:12:27 +0200
Message-ID: <44F01E8B.1040504@gazeta.pl>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi
I've got a problem with proper configuration of firewall described in:
10.4.1. Outbound traffic Using Multiple Connections to the Internet
described at http://linux-ip.net/html/adv-multi-internet.html

There is a router with four IFaces, one to LAN, one to SERVer, one to
DSL net connection and one to T1 connection.
The DSL connection has 8-address subnet, the T1 has 4-address subnet +
128-address subnet.
There is a proxy arp working (on $SERV_IF, $DSL_IF and $LAN_IF), and
server has an IP from the 128-address subnet ($SERV_IP is from
$RIPE_NET_IP/128).
The kernel is linux-2.6.14.2

Here is the most important a part of my firewall code:

for num in 12 14 20; do
    $IP route add  $T1_MODEM_IP dev  $T1_IF table $num
    $IP route add $DSL_MODEM_IP dev $DSL_IF table $num
    $IP route add ${LAN_PREFIX}0/24 dev $LAN_IF table $num
    $IP route add $RIPE_NET_IP/128 dev $LAN_IF table $num
    $IP route add $SERV_IP dev $SERV_IF table $num
done
$IP rule add from all table 20 prio 32765
$IP route add default via $T1_MODEM_IP dev $T1_IF table 12
$IP route add default via $DSL_MODEM_IP dev $DSL_IF table 14

$IPTABLES -t mangle -A PREROUTING -i $SERV_IF \
    -s $SERV_IP -p tcp --dport 80 -j MARK --set-mark 8

$IP rule add from $SERV_IP fwmark 8 table 14 prio 58
$IP rule add from $SERV_IP          table 12 prio 59

$IPTABLES -t nat -A POSTROUTING -s $SERV_IP -o $DSL_IF \
    -j SNAT --to-source $SERV_DSL_IP

After a few experiments I've discovered that packets are sent out
properly but probably they do not get de-SNATed. Here is an example from
the log from -t mangle PREROUTING chain. (eth1 is $DSL_IF)

IN=eth1 OUT= MAC=(cut) SRC=72.14.221.147 DST=80.53.195.58 LEN=44
TOS=0x00 PREC=0x00 TTL=244 ID=5450 PROTO=TCP SPT=80 DPT=53778
WINDOW=8190 RES=0x00 ACK SYN URGP=0

And following LOGs give nothing:
iptables -t mangle -I FORWARD 1 -i eth1 -j LOG
iptables -I FORWARD 1 -i eth1 -j LOG

I've discovered that packet do get de-SNATed if I delete the "fwmark 8"
from the ip rules, or add a rule with higher prio (without fwmark)
before, example:
ip rule add from $SERV_IP table 14 prio 50

Apparently the conntrack has something to do with routes (or maybe I'm
wrong here?), and I really don't know where to dig in order to make this
configuration work.

I've also tried this (that was just a blind shot, and hasn't worked of
course)
iptables -t mangle -A PREROUTING -i $DSL_IF -d $SERV_DSL_IP -p tcp
--dport 80 -j MARK --set-mark 8


-- 
mati



