From: "Phiphat Watanasard [KLIM]" <klim@sepionsoftware.com>
Subject: my iptables rules is not work for DNAT redirect to internal IP
Date: Fri, 31 Oct 2003 03:04:03 +0000 (UTC)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <oprxxu5bepxfqk2w@10.20.1.181>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Date: Sat, 01 Nov 2003 10:11:25 +0700
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

Dear sir/madam
	my this iptables rules is not work but this rules useto use on yesterday
but this day my mechine is reboot (Power down) and boot again but cannot 
work
i compile kernel to 2.4.22 and update iptables to 1.2.9.rc1 please help me
# ---------------------------------------- Start Rules !!
#!/bin/sh

IPTABLES="/usr/local/sbin/iptables"
IFCONFIG="/sbin/ifconfig"
ROUTE="/sbin/route"

#flush all rules
$IPTABLES -F
$IPTABLES -X
$IPTABLES -P INPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -t nat -F
$IPTABLES -t nat -P PREROUTING ACCEPT
$IPTABLES -t nat -P POSTROUTING ACCEPT
$IPTABLES -t nat -P OUTPUT ACCEPT
#$IPTABLES -X icmp_packets
#$IPTABLES -X tcp_packets
#$IPTABLES -X udpincoming_packets
#$IPTABLES -X allowed

#init real ip
$IFCONFIG eth0:0 203.147.41.160 netmask 255.255.255.0
#$IFCONFIG eth0:1 203.147.41.150 netmask 255.255.255.0
$IFCONFIG eth0:2 203.147.41.161 netmask 255.255.255.0
$IFCONFIG eth0:3 203.147.41.171 netmask 255.255.255.0
$IFCONFIG eth0:4 203.147.41.172 netmask 255.255.255.0
$IFCONFIG eth0:5 203.147.41.162 netmask 255.255.255.0

$IFCONFIG eth1 192.168.9.1 netmask 255.255.255.0

LOCAL_IP="127.0.0.1/32"
LOCAL_DEV="lo"

#define outside device
IP_DEV="eth0"
IP_IP="203.147.41.152"
IP_NET="203.147.41.0/255.255.255.0"
IP_BCAST="203.147.41.255/255.255.255.0"
IP_MASK="255.255.255.0"

#defineinside device
LAN_DEV="eth1"
LAN_IP="192.168.9.1"
LAN_NET="192.168.9.0/255.255.255.0"
LAN_BCAST="192.168.9.255/255.255.255.0"
LAN_MASK="255.255.255.0"

#define import inside mchines
WEB_S_OUT="203.147.41.160"
WEB_S_IN="192.168.9.2"
WEB_S_DEV="eth0:0"

MAIL_S_OUT="203.147.41.150"
MAIL_S_IN="192.168.9.18"
MAIL_S_DEV="eth0:1"

WEB1_S_OUT="203.147.41.161"
WEB1_S_IN="192.168.9.4"
WEB1_S_DEV="eth0:2"

WEB2_S_OUT="203.147.41.162"
WEB2_S_IN="192.168.9.9"
WEB2_S_DEV="eth0:5"

AS400F_S_OUT="203.147.41.171"
AS400F_S_IN="192.168.9.5"
AS400F_S_DEV="eth0:3"

AS400B_S_OUT="203.147.41.172"
AS400B_S_IN="192.168.9.6"
AS400B_S_DEV="eth0:4"

echo "add route interface"
#add route to interface
$ROUTE add -host $MAIL_S_OUT dev $IP_DEV
$ROUTE add -host $WEB_S_OUT dev $IP_DEV
$ROUTE add -host $WEB1_S_OUT dev $IP_DEV
$ROUTE add -host $AS400F_S_OUT dev $IP_DEV
$ROUTE add -host $AS400B_S_OUT dev $IP_DEV

echo "set up forwarding"
#set up forwarding
$IPTABLES -t nat -A POSTROUTING -o $IP_DEV -j SNAT --to $IP_IP
$IPTABLES -A FORWARD -p tcp --syn -m limit --limit 1/s -j ACCEPT
$IPTABLES -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit 
--limit 1/s -j ACCEPT
$IPTABLES -A FORWARD -p icmp --icmp-type echo-request -m limit --limit 1/s 
-j ACCEPT

$IPTABLES -A FORWARD -i $LAN_DEV -j ACCEPT

$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG 
--log-level DEBUG --log-prefix "FORWARD packet died: "

#create new chains
$IPTABLES -N icmp_packets
$IPTABLES -N tcp_packets
$IPTABLES -N udpincoming_packets

$IPTABLES -N allowed
$IPTABLES -A allowed -p TCP --syn -j ACCEPT
$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 0 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 3 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 5 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT

$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 21 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 23 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 25 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 443 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 113 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 110 -j allowed

$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 53 -j ACCEPT
$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 123 -j ACCEPT
$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 2074 -j ACCEPT
$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 4000 -j ACCEPT
$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 68 -j ACCEPT
$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 67 -j ACCEPT

/sbin/ifconfig eth3 192.168.10.1 netmask 255.255.255.0
/sbin/ifconfig eth2 210.4.134.162 netmask 255.255.255.0
/usr/sbin/iptables -t nat -A POSTROUTING -s 192.168.10.0/255.255.255.0 -d 
0/0 -o eth2 -j SNAT --to-source 210.4.134.162
/usr/sbin/iptables -A FORWARD -i eth3 -o eth2 -j ACCEPT

# ------------------------------------------- End Rules
my firewall is have 4 interface

	eth0-eth0:5			  eth1 192.168.9.1
  isp1 <-----------		 ----------> Internal 1
			|-----------|
			|	FW	|
	eth2		|-----------| eth3 192.168.10.1
  isp2 <-----------		 ----------> Internal 2

all eth3 will forward all to eth2
all eth1 will forward all to eth0

eth0 is real ip for internal server and redirect port to mail & web to 
internal

											please help me
											Thank you
-- 
Phiphat Watanasard [KLIM]
Thailand

