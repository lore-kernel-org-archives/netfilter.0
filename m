From: fernando <fernando@screenlab.com.br>
Subject: Forwarding not working, need help
Date: Mon, 14 Nov 2005 17:49:53 -0200
Message-ID: <200511141749.53457.fernando@screenlab.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi!


I'm having problems with forwarding with my new iptables shell script. All the 
things works fine for me, except the forwarding of the machines in my LAN (I 
think is something with the return of the packages). 

Thanks everyone !!!
(sugestions are welcome !!)


BillieGDJoe



Here is the script (my lan class is 10.0.0.0/8):

#! /bin/sh
# Firewall Script v.0.2 - By BillieGDJoe (billiegdjoe at gmail.com)
# Created in 15/11/05

# Setting script variables:

# Finding the path of IPTables:

IPTABLES=`which iptables`

# Finding the path of echo:

ECHO=`which echo`

# Finding the path of whoami:

WHOAMI=`which whoami`

# List of TCP and UDP ports which have services running in localhost, like 
SSHD and DNS:

ALLOW_TCP="22" 
ALLOW_UDP="53"

# Our private network address with mask, like 192.168.0.0/24:

OUR_NETWORKS="10.0.0.0/8"

# Allow comunication with this ports from localhost, like DNS:

ALLOW_CONNECT_TCP="21 22"

ALLOW_CONNECT_UDP="53"

# Allowed TCP ports that could be forwarded (used) in our network:

LAN_TCP_PORT="21 22 25 80 110"

# Allowed UDP ports that could be forwarded (used) in our network:

LAN_UDP_PORT="53"

# Non-routeable networks (protection against IP Spoofing):

#NON_ROUTEABLE="192.168.0.0/16 127.0.0.0/8 172.16.0.0/12 10.0.0.0/8 0.0.0.0/8 
169.254.0.0/16 192.0.2.0/24 255.255.255.255/32"
NON_ROUTEABLE=""

# Setting interfaces and their MAC addresses:

ETH_WAN="eth0"
ETH_LAN="eth1"
ETH_WAN_MAC="00:40:33:AA:9E:53"
ETH_LAN_MAC="00:40:F4:7C:95:07"

# Setting TCP and UDP PORT FORWARDING, like 6180:6180>192.168.0.3:

TCP_FORWARD=""
UDP_FORWARD=""

# Setting SSH Service to minimum delay, only if is true (only can be TRUE or 
FALSE):

SSH_ACCESS="TRUE"

# All variables set up, initialising IPTables:

if [ `$WHOAMI` = "root" ]
then
	
	case "$1" in
	
		'start')
			
			# Cleaning old rules:
			
			for TABLES in filter nat mangle
			do
				$IPTABLES -t $TABLES -F
				$IPTABLES -t $TABLES -Z
			done
			
			# Allowing interface loopback to have access to system:
														
			$IPTABLES -A INPUT -i lo -j ACCEPT

			# Setting filter polices to drop:
			
 			for TABLES in INPUT FORWARD OUTPUT
 			do
 				$IPTABLES -t filter -P $TABLES DROP
 			done
			
			# Setting nat polices to drop:
			
 			for TABLES in PREROUTING POSTROUTING OUTPUT
 			do
 				$IPTABLES -t nat -P $TABLES DROP
 			done
			
			# Setting mangle polices to drop:
			
 			for TABLES in INPUT PREROUTING POSTROUTING FORWARD OUTPUT
 			do
 				$IPTABLES -t mangle -P $TABLES DROP
 			done
			
			# Enabling tcp forward in kernel:
			
			$ECHO "1" >/proc/sys/net/ipv4/ip_forward
			
			# Blocking packets coming from non-routeable networks:
			
			if [ "$NON_ROUTEABLE" != "" ]
			then
				for NETWORKS in $NON_ROUTEABLE
				do
					${IPTABLES} -A INPUT -s $NETWORKS -i $ETH_WAN -j LOG --log-prefix="TRYING 
TO FORGE A PRIVATE IP "
					${IPTABLES} -A INPUT -s $NETWORKS -i $ETH_WAN -j REJECT
					${IPTABLES} -A FORWARD -s $NETWORKS -i ETH_WAN -m mac --mac-source 
$ETH_WAN_MAC -j REJECT
				done
			fi
			
			# Setting SSH to minimize-delay:
								
			if [ "$SSH_ACCESS" = "TRUE" ]
			then
				$IPTABLES -t mangle -A OUTPUT -o $ETH_WAN -p tcp --dport 22 -j TOS 
--set-tos 16
				$IPTABLES -t mangle -A PREROUTING -i $ETH_WAN -p tcp --sport 22 -j TOS 
--set-tos 16
				$IPTABLES -t mangle -A OUTPUT -o $ETH_LAN -p tcp --dport 22 -j TOS 
--set-tos 16
				$IPTABLES -t mangle -A PREROUTING -i $ETH_LAN -p tcp --sport 22 -j TOS 
--set-tos 16
			fi
			
			# TOS (dns = 8, http = 4, ftp = 2):
			
			$IPTABLES -t mangle -A PREROUTING -i $ETH_LAN -p udp --dport 53 -j TOS 
--set-tos 8
			$IPTABLES -t mangle -A PREROUTING -i $ETH_WAN -p udp --sport 53 -j TOS 
--set-tos 8
			$IPTABLES -t mangle -A POSTROUTING -o $ETH_WAN -p udp --dport 53 -j TOS 
--set-tos 8
			
			
			$IPTABLES -t mangle -A PREROUTING -i $ETH_LAN -p tcp --dport 80 -j TOS 
--set-tos 4
			$IPTABLES -t mangle -A PREROUTING -i $ETH_WAN -p tcp --sport 80 -j TOS 
--set-tos 4
			$IPTABLES -t mangle -A POSTROUTING -o $ETH_WAN -p tcp --dport 80 -j TOS 
--set-tos 4
			
			
			$IPTABLES -t mangle -A PREROUTING -i $ETH_LAN -p tcp --dport 21 -j TOS 
--set-tos 2
			$IPTABLES -t mangle -A PREROUTING -i $ETH_WAN -p tcp --sport 21 -j TOS 
--set-tos 2
			$IPTABLES -t mangle -A POSTROUTING -o $ETH_WAN -p tcp --dport 21 -j TOS 
--set-tos 2
			
			# Allowing ICMP (ping) packets, TCP and UDP ports:
			
			$IPTABLES -t mangle -A PREROUTING -p icmp -j ACCEPT
			$IPTABLES -t nat -A PREROUTING -p icmp -j ACCEPT
			$IPTABLES -t mangle -A INPUT -p icmp -j ACCEPT
			$IPTABLES -t filter -A INPUT -p icmp -j ACCEPT
				
			$IPTABLES -t mangle -A OUTPUT -p icmp -j ACCEPT
			$IPTABLES -t nat -A OUTPUT -p icmp -j ACCEPT
			$IPTABLES -t filter -A OUTPUT -p icmp -j ACCEPT
			$IPTABLES -t mangle -A POSTROUTING -p icmp -j ACCEPT
			$IPTABLES -t nat -A POSTROUTING -p icmp -j ACCEPT
			
			for PORTS in $ALLOW_CONNECT_TCP
			do			
				$IPTABLES -t mangle -A PREROUTING -p tcp --sport $PORTS -j ACCEPT
				$IPTABLES -t nat -A PREROUTING -p tcp --sport $PORTS -j ACCEPT
				$IPTABLES -t mangle -A INPUT -p tcp --sport $PORTS -j ACCEPT
				$IPTABLES -t filter -A INPUT -p tcp --sport $PORTS -j ACCEPT
				
				$IPTABLES -t mangle -A OUTPUT -p tcp --sport $PORTS -j ACCEPT
				$IPTABLES -t nat -A OUTPUT -p tcp --sport $PORTS -j ACCEPT
				$IPTABLES -t filter -A OUTPUT -p tcp --sport $PORTS -j ACCEPT
				$IPTABLES -t mangle -A POSTROUTING -p tcp --sport $PORTS -j ACCEPT
				$IPTABLES -t nat -A POSTROUTING -p tcp --sport $PORTS -j ACCEPT
				
				$IPTABLES -t mangle -A OUTPUT -p tcp --dport $PORTS -j ACCEPT
				$IPTABLES -t nat -A OUTPUT -p tcp --dport $PORTS -j ACCEPT
				$IPTABLES -t filter -A OUTPUT -p tcp --dport $PORTS -j ACCEPT
				$IPTABLES -t mangle -A POSTROUTING -p tcp --dport $PORTS -j ACCEPT
				$IPTABLES -t nat -A POSTROUTING -p tcp --dport $PORTS -j ACCEPT
			done
			
			for PORTS in $ALLOW_CONNECT_UDP
			do			
				$IPTABLES -t mangle -A PREROUTING -p udp --sport $PORTS -j ACCEPT
				$IPTABLES -t nat -A PREROUTING -p udp --sport $PORTS -j ACCEPT
				$IPTABLES -t mangle -A INPUT -p udp --sport $PORTS -j ACCEPT
				$IPTABLES -t filter -A INPUT -p udp --sport $PORTS -j ACCEPT
				
				$IPTABLES -t mangle -A OUTPUT -p udp --sport $PORTS -j ACCEPT
				$IPTABLES -t nat -A OUTPUT -p udp --sport $PORTS -j ACCEPT
				$IPTABLES -t filter -A OUTPUT -p udp --sport $PORTS -j ACCEPT
				$IPTABLES -t mangle -A POSTROUTING -p udp --sport $PORTS -j ACCEPT
				$IPTABLES -t nat -A POSTROUTING -p udp --sport $PORTS -j ACCEPT
				
				$IPTABLES -t mangle -A OUTPUT -p udp --dport $PORTS -j ACCEPT
				$IPTABLES -t nat -A OUTPUT -p udp --dport $PORTS -j ACCEPT
				$IPTABLES -t filter -A OUTPUT -p udp --dport $PORTS -j ACCEPT
				$IPTABLES -t mangle -A POSTROUTING -p udp --dport $PORTS -j ACCEPT
				$IPTABLES -t nat -A POSTROUTING -p udp --dport $PORTS -j ACCEPT
			done
				
			# Opening TCP ports:
			
 			if [ "$ALLOW_TCP" != "" ]
 			then
 				for PORT in $ALLOW_TCP
 				do
 				$IPTABLES -t mangle -A PREROUTING -p tcp --dport $PORT -j ACCEPT
 				$IPTABLES -t nat -A PREROUTING -p tcp --dport $PORT -j ACCEPT
				$IPTABLES -t mangle -A INPUT -p tcp --dport $PORT -j ACCEPT
				$IPTABLES -t filter -A INPUT -p tcp --dport $PORT -j ACCEPT
				done
 			fi
			
			# Opening UDP ports:
			
			if [ "$ALLOW_UDP" != "" ]
			then
				for PORT in $ALLOW_UDP
				do
				$IPTABLES -t mangle -A PREROUTING -p udp --dport $PORT -j ACCEPT
 				$IPTABLES -t nat -A PREROUTING -p udp --dport $PORT -j ACCEPT
				$IPTABLES -t mangle -A INPUT -p udp --dport $PORT -j ACCEPT
				$IPTABLES -t filter -A INPUT -p udp --dport $PORT -j ACCEPT
				done
			fi
			
			# Enabling our networks to communicate with world:
			
			if [ "$OUR_NETWORKS" != "" ]
			then
				for NET in $OUR_NETWORKS
				do
					for PORT in $LAN_TCP_PORT
					do
						$IPTABLES -t mangle -A PREROUTING -s $NET -p tcp --dport $PORT -j ACCEPT
						$IPTABLES -t nat -A PREROUTING -s $NET -p tcp --dport $PORT -j ACCEPT
						$IPTABLES -t mangle -A FORWARD -s $NET -p tcp --dport $PORT -j ACCEPT
						$IPTABLES -t filter -A FORWARD -s $NET -p tcp --dport $PORT -j ACCEPT
						$IPTABLES -t mangle -A POSTROUTING -s $NET -p tcp --dport $PORT -j 
ACCEPT
						$IPTABLES -t nat -A POSTROUTING -s $NET -p tcp --dport $PORT -j ACCEPT
						
						$IPTABLES -t mangle -A PREROUTING -d $NET -p tcp --sport $PORT -j ACCEPT
						$IPTABLES -t nat -A PREROUTING -d $NET -p tcp --sport $PORT -j ACCEPT
						$IPTABLES -t mangle -A FORWARD -d $NET -p tcp --sport $PORT -j ACCEPT
						$IPTABLES -t filter -A FORWARD -d $NET -p tcp --sport $PORT -j ACCEPT
						$IPTABLES -t mangle -A POSTROUTING -d $NET -p tcp --sport $PORT -j 
ACCEPT
						$IPTABLES -t nat -A POSTROUTING -d $NET -p tcp --sport $PORT -j ACCEPT
					done

					#for PORT in $LAN_UDP_PORT
					#do
					
					#done					

					# Now, accepting all packets with flag ESTABLISHED,RELATED (connections 
already established or related):

					$IPTABLES -t filter -A FORWARD -d $NET -m state --state 
ESTABLISHED,RELATED -j ACCEPT
				done
			fi
			
			# Setting TCP forward:
			 			 			 			
 			if [ "$TCP_FORWARD" != "" ]
 			then
  				for RULE in $TCP_FORWARD
  				do
  					echo "$RULE" | {
								IFS=':>' read srcport destport host
								$IPTABLES -t filter -A FORWARD -p tcp -d $host --dport $destport -i 
$ETH_WAN -j ACCEPT
								$IPTABLES -t nat -A PREROUTING -p tcp -i $ETH_WAN --dport $srcport -j 
DNAT --to-destination $host:$destport
							}
  				done
 			fi

			# Setting UDP forward:
			
			if [ "$UDP_FORWARD" != "" ]
 			then
  				for RULE in $UDP_FORWARD
  				do
  					echo "$RULE" | {
								IFS=':>' read srcport destport host
								$IPTABLES -t filter -A FORWARD -p udp -d $host --dport $destport -j 
ACCEPT
								$IPTABLES -t nat -A PREROUTING -p udp -i $ETH_WAN --dport $srcport -j 
DNAT --to-destination $host:$destport
							}
  				done
 			fi
			
			;;
			
		'stop')
			# Cleaning old rules:
			
			for TABLES in filter nat mangle
			do
				$IPTABLES -t $TABLES -F
			done
			
			# Allowing interface loopback to have access to system:
														
			$IPTABLES -A INPUT -i lo -j ACCEPT
			
			;;
			
		'open')
		
			# Opening firewall:
			
			# Cleaning old rules:
			
			for TABLES in filter nat mangle
			do
				$IPTABLES -t $TABLES -F
			done
			
			# Allowing interface loopback to have access to system:
														
			$IPTABLES -A INPUT -i lo -j ACCEPT
			
			# Setting filter polices:
			
			for TABLES in INPUT FORWARD OUTPUT
			do
				$IPTABLES -t filter -P $TABLES ACCEPT
			done
			
			# Setting nat polices:
			
			for TABLES in PREROUTING POSTROUTING OUTPUT
			do
				$IPTABLES -t nat -P $TABLES ACCEPT
			done
			
			# Setting mangle polices:
			
			for TABLES in INPUT FORWARD OUTPUT PREROUTING POSTROUTING
			do
				$IPTABLES -t mangle -P $TABLES ACCEPT
			done
			
			;;
			
		*)
			$ECHO "usage $0 start|stop|open"
			
			;;
	
	esac
else
	$ECHO "This script must be run as root!"
fi


