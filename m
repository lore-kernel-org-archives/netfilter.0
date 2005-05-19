From: "Limbert Fuentes Quiroga" <Limbert.Fuentes@unilever.com>
Subject: Iptables Configuring my Firewall with DMZ
Date: Thu, 19 May 2005 19:21:10 -0400
Message-ID: <ISSMTP.2000_62_.20050519192110.202F@unilever.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Language: es-ESP
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
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Dear All

 =20
Please they could help me to configure my firewall server to block the whole
ports of the interface that this connected one to internet (except the port=
s 25
and 53 that it is forwarded to DMZ server), also to block the users of my n=
et
LAN so that alone they can enter to internet to transparent proxy (SQUID) t=
hat
this installed in my DMZ server. =20
I attach the file with the configurations of my firewall server.

Thank's and regard's



			   INTERNET
				i
				i
				i
			+---------------+=09
			i    ROUTER     i
			+---------------+   =20
				i=20
				i
				i
				i
				i
				i
				i eth0
				i Public IP:
				i 200.87.64.50/29			Public IP: 200.87.64.54/30
			  +----------+					+-------------+
		        i Firewall i					i    DMZ      i
			  i	       i					i Sendmail    i
			  i	       i		   			i   Squid     i
	Linux		  i	       i----------------------------i (Trasparent i
	Redhat 9.0	  i	       i eth2				i  Proxy)     i
			  i	       i Public IP:           	i    DNS      i
			  +----------+ 200.87.64.53/30		i   Apache	  i
				i						+-------------+
				i eth1					Linux Redhat 9.0
				i IP LAN:
				i 192.168.0.2/24
				i
				i
				i
				i
			  +-----------+
			  i  Switch   i
			  i   LAN     i
			  +-----------+



INET_IP=3D"200.87.64.50"
INET_IFACE=3D"eth0"

LAN_IP=3D"192.168.0.2"
LAN_IFACE=3D"eth1"

# 1.3 DMZ Configuration

DMZ_HTTP_IP=3D=94200.87.64.54"
DMZ_DNS_IP=3D"200.87.64.54"
DMZ_IP=3D"200.87.64.54"
DMZ_IFACE=3D"eth2"

# 1.4 Localhost Configuration

LO_IFACE=3D"lo"
LO_IP=3D"127.0.0.1"

echo "1" > /proc/sys/net/ipv4/ip_forward

# Configuration DROP

IPTABLES -P INPUT DROP
IPTABLES -P OUTPUT DROP
IPTABLES -P FORWARD DROP

# Create chain for =93bad tcp packets=94

IPTABLES -N bad_tcp_packets

# To create the separate chains for the ICMP, TCP y el UDP
#

IPTABLES -N allowed
IPTABLES -N icmp_packets

# Chain for bad_tcp_packets=20

IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK -m state --s=
tate
NEW -j REJECT --reject-with tcp-reset
IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG
--log-prefix "New not syn:"
IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

# allowed chain=20
#
IPTABLES -A allowed -p TCP --syn -j ACCEPT
IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A allowed -p TCP -j DROP

# Rules ICMP
#
# Change rule totality
IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT


# 4.1.4  Regla INPUT

# Bad TCP packets we don't want=20
#

IPTABLES -A INPUT -p tcp -j bad_tcp_packets

#
# Internet packets for the box

IPTABLES -A INPUT -p ICMP -i eth0 -j icmp_packets

# From DMZ Interface to DMZ firewall IP

IPTABLES -A INPUT -p ALL -i eth2 -d 200.87.64.53 -j ACCEPT

# From LAN Interface to LAN firewall IP
#=20

IPTABLES -A INPUT -p ALL -i eth1 -d 192.168.0.2 -j ACCEPT

# From Localhost interface to Localhost IP's
#

IPTABLES -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
IPTABLES -A INPUT -p ALL -i lo -s 192.168.0.2 -j ACCEPT
IPTABLES -A INPUT -p ALL -i lo -s 200.87.64.50 -j ACCEPT

IPTABLES -A INPUT -p ALL -d 200.87.64.50 -m state --state ESTABLISHED,RELAT=
ED
-j ACCEPT

# Log weird packets that don't match the above.
#

IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG --log-le=
vel
DEBUG --log-prefix "IPT INPUT packet died: "

#
# 4.1.5 Rule FORWARD
#

# Bad TCP packets we don't want
#

IPTABLES -A FORWARD -p tcp -j bad_tcp_packets

# Section of the DMZ
#
# General rules

IPTABLES -A FORWARD -i eth2 -o eth0 -j ACCEPT
IPTABLES -A FORWARD -i eth0 -o eth2 -m state --state ESTABLISHED,RELATED -j
ACCEPT
IPTABLES -A FORWARD -i eth1 -o eth2 -j ACCEPT
IPTABLES -A FORWARD -i eth2 -o eth1 -m state --state ESTABLISHED,RELATED -j
ACCEPT

#
#  DNS Server for the DMZ

IPTABLES -A FORWARD -p TCP -i eth0 -o eth2 -d 200.87.64.54 --dport 53 -j al=
lowed
IPTABLES -A FORWARD -p UDP -i eth0 -o eth2 -d 200.87.64.54 --dport 53 -j AC=
CEPT
IPTABLES -A FORWARD -p ICMP -i eth0 -o eth2 -d 200.87.64.54 -j icmp_packets

#
# LAN Section
#

IPTABLES -A FORWARD -i eth1 -j ACCEPT
IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

#
# Log weird packets that don't match the above.
#

IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG
--log-level DEBUG --log-prefix "IPT FORWARD packet died: "

#
# 4.1.6 OUTPUT Chain
#





# Bad TCP packets we don't want.
#

IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets

# Special OUTPUT rules to decide which IP's to allow.
#

IPTABLES -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
IPTABLES -A OUTPUT -p ALL -s 192.168.0.2 -j ACCEPT
IPTABLES -A OUTPUT -p ALL -s 200.87.64.50 -j ACCEPT

#
# Log weird packets that don't match the above.
#

IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG --log-l=
evel
DEBUG --log-prefix "IPT OUTPUT packet died: "

# 4.2.4  PREROUTING Chain
#

IPTABLES -t nat -A PREROUTING -p TCP -i eth0 -d 200.87.64.50 --dport 80 -j =
DNAT
--to-destination 200.87.64.54
IPTABLES -t nat -A PREROUTING -p TCP -i eth0 -d 200.87.64.50 --dport 53 -j =
DNAT
--to-destination 200.87.64.54
IPTABLES -t nat -A PREROUTING -p UDP -i eth0 -d 200.87.64.50 --dport 53 -j =
DNAT
--to-destination 200.87.64.54

# 4.2.5 POSTROUTING Chain
#

# Enable simple IP Forwarding and Network Address Translation

IPTABLES -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 200.87.64.50

