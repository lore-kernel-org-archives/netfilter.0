From: "Bill D'Anjou" <danjou@rocketinternet.net>
Subject: help with DNAT
Date: Wed, 19 Mar 2003 16:52:00 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <58FEB9DD479FA04ABC4D6AE1FFBF40C022DBAD@caleb.rocketinternet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

Newbie warning!

My box is doing everything I need (SNAT, DHCP & Squid proxy, etc) EXCEPT
DNAT! =20

I don't think the problem is syntax or filters (I have filtering "turned
off" right now to try to troubleshoot the problem - see script)

Appreciate help.

Thanks,
Bill

INET_IP=3D"(public IP)"
INET_IFACE=3D"eth0"
INET_BROADCAST=3D"(public)"

LAN_IP=3D"192.168.0.254"
LAN_IP_RANGE=3D"192.168.0.0/24"
LAN_BROADCAST_ADDRESS=3D"192.168.0.255"
LAN_IFACE=3D"eth1"

LO_IFACE=3D"lo"
LO_IP=3D"127.0.0.1"

IPTABLES=3D"/sbin/iptables"
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
$IPTABLES -F
$IPTABLES -t nat -F
$IPTABLES -t mangle -F
#

$IPTABLES -X
$IPTABLES -t nat -X
$IPTABLES -t mangle -X


$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT

$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source
$INET_IP
$IPTABLES -t nat -A PREROUTING -p tcp -i eth0 --dport 80 -j DNAT
--to-destination 192.168.0.105:80
######################################################################
Attention:=20
This e-mail message is privileged and confidential. If you are not the=20
intended recipient please delete the message and notify the sender.=20
Any views or opinions presented are solely those of the author.

This e-mail has been scanned for viruses and cleared by MailMarshal
software @ rocketinternet.net
######################################################################

