From: "Michael" <trott@bigpond.net.au>
Subject: problems with NAT script
Date: Sat, 17 May 2003 02:44:35 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001101c31bca$6efc2d30$6400a8c0@titan>
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

im trying to write a script to handle NAT and firewalling.

I have a small lan (192.168.0.x), on the gateway im runnin debian 3.0 with
2.4.20.

        eth0 = cable modem
        eth1 = internal NIC to switch

My cable connection uses dhcp, no static IP.
I've made my adhoc script using pieces of code ive found around the place.
When i execute my script i still have complete net access on the GW but all
my clients do not have external access, i can ping to/from the
clients/gateway.

Just doesn't seem to be doing the NAT, i read the manual regarding nat, as
im using dynamitic IP i thought that all id need to use is the MASQUERADE
command.

I wasn't sure how attachments are handled in the list so I just pasted the
script below,

can anyone offer any suggestions?

thanks

Michael








############################################################################
#######
# IPTABLES Firewall script
# written by ts
# Modified By Sethan0n 13/05/03
############################################################################
#######

#!/bin/sh

IPTABLES="//sbin/iptables"

#Flush old rules

$IPTABLES -F INPUT
$IPTABLES -F OUTPUT
$IPTABLES -F FORWARD
$IPTABLES -X

#Set default policies to DROP
$IPTABLES -F INPUT
$IPTABLES -F OUTPUT
$IPTABLES -F FORWARD
$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT ACCEPT


LOOP_IF="lo"


###########################################################################

#----Set network sysctl options-----#
echo "--Setting sysctl options--"

echo "Disabling IP Spoofing attacks"
echo 2 > /proc/sys/net/ipv4/conf/all/rp_filter

echo "Disabling respond to broadcast pings"
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

echo "Blocking source routing"
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route

echo "Kill timestamps"
echo 0 > /proc/sys/net/ipv4/tcp_timestamps

echo "Enable SYN Cookies"
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

echo "Kill redirects"
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects

echo "Enabling bad error message protection"
echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

echo "Logging martians (packets with impossible addresses)"
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians

echo "Reducing DoS'ing ability by reducing timeouts"
echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout
echo 2400 > /proc/sys/net/ipv4/tcp_keepalive_time
echo 0 > /proc/sys/net/ipv4/tcp_window_scaling
echo 0 > /proc/sys/net/ipv4/tcp_sack
echo "Done..."

#########################################################################
echo "--Setting up standard rules--"


echo "Enabling SYN-FLOODING PROTECTION"
$IPTABLES -N syn-flood
$IPTABLES -A INPUT -p tcp --syn -j syn-flood
$IPTABLES -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
$IPTABLES -A syn-flood -j DROP

echo "Making sure NEW tcp connections are SYN packets"
$IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

echo "Logging fragments caught"
$IPTABLES -N fragments
$IPTABLES -A INPUT -f -j fragments
$IPTABLES -A fragments -j LOG --log-prefix "IPTABLES FRAGMENTS:"
$IPTABLES -A fragments -j DROP

echo "Refusing spoofed packets pretending to be from your IP address"
#$IPTABLES -A INPUT -s $NET_IPADDR -j DROP
echo "Done..."

##########################################################################
echo "--Setting up user defined chains--"

# PREROUTING

$IPTABLES -A POSTROUTING -t nat -o eth0 -j MASQUERADE

# INPUT

$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

   # blanket allow from home network
$IPTABLES -A INPUT -i eth1 -j ACCEPT

   # allow SSH and FTP
$IPTABLES -A INPUT -p tcp --dport 22 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 21 -j ACCEPT

   # allow VNC
$IPTABLES -A INPUT -p tcp --dport 5800 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 5801 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 5802 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 5803 -j ACCEPT

   # allow specif icmp types
$IPTABLES -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type parameter-problem -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT

echo "Allow Allow unlimited traffic on the loopback interface"
$IPTABLES -A INPUT -i lo -j ACCEPT

echo "Allow ftp"
$IPTABLES -A INPUT -p tcp --sport 21 -m state --state ESTABLISHED -j ACCEPT

echo "Active ftp"
$IPTABLES -A INPUT -p tcp --sport 20 -m state --state ESTABLISHED,RELATED -j
ACCEPT

echo "Passive ftp"
$IPTABLES -A INPUT -p tcp --sport 1024:65535 --dport 1024:65535 -m
state --state ESTABLISHED -j ACCEPT

echo "Allow DNS(53/tcp&udp)"
$IPTABLES -A INPUT -p tcp --sport 53 -j ACCEPT
$IPTABLES -A INPUT -p udp --sport 53 -j ACCEPT
$IPTABLES -A INPUT -p tcp --sport 53 -j ACCEPT
$IPTABLES -A INPUT -p udp --sport 53 -j ACCEPT

echo "Allow SFTP(115/tcp)to the internet"
$IPTABLES -A INPUT -p tcp --sport 115 -j ACCEPT

echo "Allow IMAP2"
$IPTABLES -A INPUT -p tcp --sport 143 -j ACCEPT

echo "Allow HTTP(80)(tcp&udp)to the internet"
$IPTABLES -A INPUT -p tcp --sport 80 -j ACCEPT

echo "Allow https"
$IPTABLES -A INPUT -p tcp --sport 443 -j ACCEPT

echo "Rejecting all connections to 137:139"
$IPTABLES -N NETBIOS
$IPTABLES -A INPUT -p udp --sport 137:139 -j NETBIOS
$IPTABLES -A NETBIOS -j LOG --log-prefix "IPTABLES NETBIOS: "
$IPTABLES -A NETBIOS -j DROP

echo "Allowing SMTP"
$IPTABLES -A INPUT -p tcp --sport 25 -j ACCEPT

echo "Allowing POP3"
$IPTABLES -A INPUT -p tcp --sport 110 -j ACCEPT

echo "Allowing Ident"
$IPTABLES -A INPUT -p tcp --sport 113 -j ACCEPT

   # log and drop final packets
#$IPTABLES -A INPUT -j LOG
#$IPTABLES -A INPUT -j DROP


#OUTPUT

$IPTABLES -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

echo "Allow unlimited traffic on the loopback interface"
$IPTABLES -A OUTPUT -o lo -j ACCEPT

$IPTABLES -A OUTPUT -p tcp --dport 22 -j ACCEPT

echo "Allow ftp"
$IPTABLES -A OUTPUT -p tcp --dport 21 -m state --state NEW,ESTABLISHED -j
ACCEPT

echo "Active ftp"
$IPTABLES -A OUTPUT -p tcp --dport 20 -m state --state ESTABLISHED -j ACCEPT

echo "Passive ftp"
$IPTABLES -A OUTPUT -p tcp --sport 1024:65535 --dport 1024:65535 -m
state --state ESTABLISHED,RELATED -j ACCEPT


echo "Allow VNC"
$IPTABLES -A OUTPUT -p tcp --sport 5800 -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --sport 5801 -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --sport 5802 -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --sport 5803 -j ACCEPT


echo "Allow icmp"
$IPTABLES -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
$IPTABLES -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT
$IPTABLES -A OUTPUT -p icmp --icmp-type destination-unreachable -j ACCEPT
$IPTABLES -A OUTPUT -p icmp --icmp-type parameter-problem -j ACCEPT
$IPTABLES -A OUTPUT -p icmp --icmp-type time-exceeded -j ACCEPT


echo "Allow DNS(53/tcp&udp)"
$IPTABLES -A OUTPUT -p tcp --dport 53 -j ACCEPT
$IPTABLES -A OUTPUT -p udp --dport 53 -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --dport 53 -j ACCEPT
$IPTABLES -A OUTPUT -p udp --dport 53 -j ACCEPT

echo "Allow SFTP(115/tcp)to the internet"
$IPTABLES -A OUTPUT -p tcp --dport 115 -j ACCEPT

echo "Allow IMAP2"
$IPTABLES -A OUTPUT -p tcp --dport 143 -j ACCEPT

echo "Allow HTTP(80)(tcp&udp)to the internet"
$IPTABLES -A OUTPUT -p tcp --dport 80 -j ACCEPT

echo "Allow https"
$IPTABLES -A OUTPUT -p tcp --dport 443 -j ACCEPT

echo "Allowing SMTP"
$IPTABLES -A OUTPUT -p tcp --dport 25 -j ACCEPT

echo "Allowing POP3"
$IPTABLES -A OUTPUT -p tcp --dport 110 -j ACCEPT

echo "Allowing Ident"
$IPTABLES -A OUTPUT -p tcp --dport 113 -j ACCEPT


   # log and drop final packets
$IPTABLES -A OUTPUT -j LOG
$IPTABLES -A OUTPUT -j DROP



