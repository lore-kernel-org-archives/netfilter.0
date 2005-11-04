From: "P theodorou" <props666999@hotmail.com>
Subject: DNAT failure
Date: Fri, 04 Nov 2005 21:30:32 +0000
Message-ID: <BAY102-F32CE5F4C40CDF72DAE41DBAE600@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello

I  face problem with DNAT  this is my testing script

INET_IP="84.9.x.x"
INET_IFACE="eth0"

LAN_IP="192.168.0.1"
LAN_IFACE="eth1"
DMZ_HTTP_IP="192.168.0.4"


O_IFACE="lo"
LO_IP="127.0.0.1"


IPTABLES="/usr/sbin/iptables"


/sbin/depmod -a




/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_state



echo "1" > /proc/sys/net/ipv4/ip_forward



$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT



$IPTABLES -t nat -A PREROUTING -p tcp  -d $INET_IP --dport 80 \
-j DNAT --to-destination $DMZ_HTTP_IP



$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP



i do not  have a clue what the problem  but whenever i type
the real ip on the browser i get error page doesn't exist .

any hint would be really appreciated



