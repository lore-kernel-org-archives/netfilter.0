From: "Christopher Davis" <cldavis@speakeasy.net>
Subject: Firewall Script Help
Date: Mon, 8 Mar 2004 13:47:07 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <JKELJHHMDHPOLKFBOEGHOECGFDAA.cldavis@speakeasy.net>
Reply-To: <cldavis@speakeasy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello Netfilter Friends!

I am trying to block incoming traffic on the INPUT chain
with reserved ip's.  I am still able to connect to the
server from a reserved ip.  Below is my entire script if
someone would like to review and comment -- all coments
welcome!  This is for a webserver -- port 80 and ssh port 22
only.  I have not yet included the logging option so those
options are commented out at this point...

Thanks!
Christopher Davis

#!/bin/sh

# Assignments
IPTABLES=/sbin/iptables
BADIP="0.0.0.0/8 10.0.0.0/8 127.0.0.0/8 169.254.0.0/16
172.16.0.0/12 192.0.0.0/24 192.168.0.0/16 192.0.34.0/24
224.0.0.0/4 240.0.0.0/5 255.255.255.255"
SHUNIP=""
case "$1" in
start)
	echo -n "Starting Firewall..."
	# Clear Old Rules
	$IPTABLES -X
	$IPTABLES -F
	$IPTABLES -Z

	# Default policy to DROP
	$IPTABLES -P INPUT DROP
	$IPTABLES -P OUTPUT DROP
	$IPTABLES -P FORWARD DROP

	# Logging chain
	$IPTABLES -N LDROP
	#$IPTABLES -A LDROP -j LOG --log-prefix "IPT DROP:   "
$LOGOPT
	$IPTABLES -A LDROP -j DROP

	$IPTABLES -N LBADIP
	$IPTABLES -A LBADIP -p tcp --dport 137:139 -j DROP
	$IPTABLES -A LBADIP -p udp --dport 137:139 -j DROP
	#$IPTABLES -A LBADIP -j LOG --log-prefix "IPT BAD:   "
$LOGOPT
	$IPTABLES -A LBADIP -j DROP

	$IPTABLES -N LSHUN
	#$IPTABLES -A LSHUN -j LOG --log-prefix "IPT Shun:   "
$LOGOPT
	$IPTABLES -A LSHUN -j DROP

	# Cleaning up traffic for INPUT
	$IPTABLES -N BADIP
	for ip in $BADIP; do
		$IPTABLES -A BADIP -s $ip -j LBADIP
		$IPTABLES -A BADIP -d $ip -j LBADIP
	done

	$IPTABLES -N SHUN
	for ip in $SHUNIP; do
		$IPTABLES -A SHUN -s $ip -j LSHUN
		$IPTABLES -A SHUN -d $ip -j LSHUN
	done

	# Traffic on INPUT chain
	$IPTABLES -A INPUT -m state --state INVALID -j DROP
	$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j
ACCEPT
	$IPTABLES -A INPUT -i lo -j ACCEPT
	$IPTABLES -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP
	$IPTABLES -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP
	$IPTABLES -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP
	$IPTABLES -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j
DROP
	$IPTABLES -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j
DROP
	$IPTABLES -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j
DROP
	$IPTABLES -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
	$IPTABLES -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
	$IPTABLES -A INPUT -p tcp --tcp-flags ALL FIN,PSH,URG -j
DROP
	$IPTABLES -A INPUT -p tcp --tcp-flags ALL
SYN,FIN,PSH,URG -j DROP
	$IPTABLES -A INPUT -p tcp --tcp-flags ALL
SYN,RST,ACK,FIN,URG -j DROP
	$IPTABLES -A INPUT -s 0/0 -p tcp --destination-port 80 -j
ACCEPT
	$IPTABLES -A INPUT -s 0/0 -p tcp --destination-port 22 -j
ACCEPT
	$IPTABLES -A INPUT -p tcp --tcp-flags SYN SYN -j DROP
	$IPTABLES -A INPUT -p tcp --syn -j DROP
	$IPTABLES -A INPUT -p icmp --icmp-type
destination-unreachable -j ACCEPT
	$IPTABLES -A INPUT -p icmp --icmp-type source-quench -j
ACCEPT
	$IPTABLES -A INPUT -p icmp --icmp-type time-exceeded -j
ACCEPT
	$IPTABLES -A INPUT -p icmp --icmp-type parameter-problem -j
ACCEPT

	#Authorized traffic on Output
	#$IPTABLES -A OUTPUT -s 66.93.253.104 -p tcp --source-port
80 -j ACCEPT
	#$IPTABLES -A OUTPUT -s 66.93.253.104 -p tcp --source-port
22 -j ACCEPT
	$IPTABLES -A OUTPUT -s 66.93.253.104 -j ACCEPT
	echo "Done."
	;;
stop)

	echo -n "Stopping Firewall..."
	$IPTABLES -X
	$IPTABLES -F
	$IPTABLES -Z
	# Allow established connections only
	$IPTABLES -A INPUT -i eth0 -m state --state
ESTABLISHED,RELATED -j ACCEPT
	$IPTABLES -A INPUT -i eth0 -j REJECT
	echo "Done."
	;;

restart)

	echo -n "Restarting Firewall..."
	$0 stop > /dev/null
	sleep 1
	$0 start > /dev/null
	echo "Done."
	;;

*)

	echo "Usage: $0 {start|stop|restart"
	;;

esac



