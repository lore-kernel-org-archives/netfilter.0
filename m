From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: can someone check this simple firewall?
Date: Wed, 13 Aug 2003 15:39:39 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E21@alderaan.smgtec.com>
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
To: Payal Rathod <payal-iptables@staticky.com>, netfilter@lists.netfilter.org

#!/bin/sh

LAN_IP_RANGE=3D"192.168.10.0/24"
LAN_IP=3D"192.168.10.100"
#LAN_BCAST_ADRESS=3D"192.168.10.100"
LOCALHOST_IP=3D"127.0.0.1"
STATIC_IP=3D"1.2.3.4"
INET_IFACE=3D"eth0"
LAN_IFACE=3D"eth1"
IPTABLES=3D"/sbin/iptables"

#/sbin/depmod -a
#/sbin/modprobe ipt_LOG
#/sbin/modprobe ipt_MASQUERADE
->> You probably want at least:
->> modprobe ipt_conntrack_ftp
->> modprobe ipt_nat_ftp


$IPTABLES -F
$IPTABLES -F -t nat

->> Set this AFTER you have setup all your rules, otherwise you have a
hole for hackers to reach through while applying rules
echo "1" > /proc/sys/net/ipv4/ip_forward
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source
$STATIC_IP

# MAKE DEFAULT AS DROP

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
->> OUTPUT description below
$IPTABLES -P FORWARD DROP

# ACCEPT ANY CONNECTION FROM LAN
# ACCEPT CONNECTION TO ONLY 21, 22, 80 FROM OUTSIDE
# DENY REST
# ALLOW PING FROM EVERYWHERE

$IPTABLES -A INPUT -s $LAN_IP_RANGE -d $LAN_IP -j ACCEPT

$IPTABLES -A INPUT -s $LOCALHOST_IP -d $LAN_IP -j ACCEPT
$IPTABLES -A INPUT -s $LOCALHOST_IP -d 0/0 -j ACCEPT
->> Should instead be a related rule:
->> $IPTABLES -A INPUT -i lo -j ACCEPT # All Outbounds are ok
->> $IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT #
Allow valid responses back in

->>Only TCP connections, not UDP and -s 0/0 is redundant
$IPTABLES -A INPUT -p tcp -s 0/0  --dport 21 -j ACCEPT
$IPTABLES -A INPUT -p udp -s 0/0  --dport 21 -j ACCEPT
$IPTABLES -A INPUT -p tcp -s 0/0  --dport 22 -j ACCEPT
$IPTABLES -A INPUT -p udp -s 0/0  --dport 22 -j ACCEPT
$IPTABLES -A INPUT -p tcp -s 0/0  --dport 80 -j ACCEPT
$IPTABLES -A INPUT -p udp -s 0/0  --dport 80 -j ACCEPT
->> This will not work for responses. Use this as well:
->> $IPTABLES -A INPUT -p icmp --icmp-type 0 -j ACCEPT if you want
internet pings from the firewall to work
$IPTABLES -A INPUT -p icmp -s $LAN_IP_RANGE -j ACCEPT

# ALLOW LAN CLIENTS TO GO ANYWHERE ON NET

$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -p icmp -s $LAN_IP_RANGE -j ACCEPT
->> $IPTABLES -A FORWARD -p icmp --icmp-type 0 -j ACCEPT
$IPTABLES -A FORWARD -s 192.168.10.0/24 -m state --state NEW -j ACCEPT
->> What is covered in this line that the first forward line does not??

# ALLOW ANY CONNECTION FROM LINUX SERVER TO INTERNET
->> This section is not needed. Set:
->> iptables -P OUTPUT ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $LOCALHOST_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $STATIC_IP -j ACCEPT
$IPTABLES -A OUTPUT -p icmp s 0/0 -j ACCEPT


