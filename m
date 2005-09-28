From: "Guillermo Javier Nardoni" <gjnardoni@yahoo.com.ar>
Subject: QoS-iptables-tc (doesn't work together) why?
Date: Wed, 28 Sep 2005 04:28:41 -0300
Message-ID: <006501c5c3fe$44ab1760$5b00a8c0@ripst>
Reply-To: Guillermo Javier Nardoni <gjnardoni@yahoo.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-9"
To: netfilter@lists.netfilter.org

Hello i'm having some issues trying to match packets
using iptables mark, iproute filter and tc filter.-
i mean, when i do
iptables -t mangle -A INPUT -p tcp --dport 80 -j MARK
--set-mark 20

iptables -t mangle -A PREROUTING -p tcp --dport 25 -j
MARK --set-mark 10

iptables -t mangle -A FORWARD -p tcp -i eth0 -o eth1
--dport 25 -j MARK --set-mark 10

$TC qdisc del dev $INET_IFACE root
$TC qdisc add dev $INET_IFACE root handle 1: htb
default 60
$TC class add dev $INET_IFACE parent 1: classid 1:1
htb rate 2048kbit  burst 2k

$TC class add dev $INET_IFACE parent 1:1 classid 1:10
htb rate 10kbit ceil 128kbit prio 5 quantum 1 burst 2k
$TC qdisc add dev $INET_IFACE parent 1:10 handle 10:
sfq perturb 10

$TC class add dev $INET_IFACE parent 1:1 classid 1:20
htb rate 10kbit ceil 512kbit prio 2  quantum 2 burst
2k
$TC qdisc add dev $INET_IFACE parent 1:20 handle 20:
sfq perturb 10

$TC class add dev $INET_IFACE parent 1:1 classid 1:30
htb rate 10kbit ceil 1024kbit prio 2  quantum 6 burst
2k
$TC qdisc add dev $INET_IFACE parent 1:30 handle 30:
sfq perturb 10

$TC class add dev $INET_IFACE parent 1:1 classid 1:40
htb rate 10kbit ceil 128kbit prio 5 quantum 4 burst 2k
$TC qdisc add dev $INET_IFACE parent 1:40 handle 40:
sfq perturb 10

$TC class add dev $INET_IFACE parent 1:1 classid 1:50
htb rate 10kbit ceil 512kbit prio 2  quantum 5  burst
2k
$TC qdisc add dev $INET_IFACE parent 1:50 handle 50:
sfq perturb 10

$TC class add dev $INET_IFACE parent 1:1 classid 1:60
htb rate 350kbit ceil 1020kbit prio 0  quantum 6 burst
2k
$TC qdisc add dev $INET_IFACE parent 1:60 handle 60:
sfq perturb 10
echo "Defino los Filtros"
$TC filter add dev $INET_IFACE parent 1: protocol ip
handle 10 fw classid 1:10
$TC filter add dev $INET_IFACE parent 1: protocol ip
handle 20 fw classid 1:20
$TC filter add dev $INET_IFACE parent 1: protocol ip
handle 30 fw classid 1:30
$TC filter add dev $INET_IFACE parent 1: protocol ip
handle 40 fw classid 1:40
$TC filter add dev $INET_IFACE parent 1: protocol ip
handle 50 fw classid 1:50
$TC filter add dev $INET_IFACE parent 1: protocol ip
handle 60 fw classid 1:60


ip rule add from 20.0.0.3 table 20
ip rule add from 20.0.0.4 table 10


ip rule add fwmark 20 table 20
ip rule add fwmark 10 table 10

BUT I DOESN'T SEEMS TO WORK FINE
ALL TRAFFIC GOES THROUGH THE DEFAULT LEAF OF THE TC'S
TREE

COULD YOU HELP ME P=D1LEASE?

i added to=20
for f in /proc/sys/net/ipv4/conf/*/rp_filter;do
echo > $f
done
echo 1 > /proc/sys/net/ipv4/route/flush

i use:
iproute version: ip utility, iproute2-ss050330

iptables : iptables v1.3.2

 tc utility, iproute2-ss050330

whyyyyyyyyyyyyyy mr anderson
whyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy

i really aprreciatte your help

regards
Guillermo from Argentina

