From: cable linux <cablelinux@yahoo.com>
Subject: I implement that script plz check it again
Date: Tue, 24 Jun 2003 12:22:18 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030624192218.996.qmail@web14404.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I sucessfully implement that script but, when i do
iptables -NL command it shows only ethernet ip address
information. i want to see the internet issues that is
not showing to me.


# Internal and External Devices
#dev_world=ppp0
dev_world=`/sbin/ifconfig ppp0|grep -w "inet addr"|awk
-F: '{print $2}'|awk '{print $1}'`
dev_int=eth0

# Firewall IP
addr_int=192.168.1.1

# Internal Net
net_int=192.168.1.0/24

#Loading Modules

insmod ip_tables
insmod iptable_filter
insmod ip_conntrack
insmod ip_conntrack_ftp
insmod ipt_state
insmod iptable_nat
insmod ipt_MASQUERADE
insmod ipt_limit
insmod ipt_LOG
insmod ipt_REJECT
insmod iptable_mangle

#Disabling IP Spoofing attacks.
#Comment this line out when using IPSEC
echo 2 > /proc/sys/net/ipv4/conf/all/rp_filter

#Don't respond to broadcast pings
echo "1" >
/proc/sys/net/ipv4/icmp_echo_ignore_broadcasts


#Enable forwarding
echo 1 >/proc/sys/net/ipv4/ip_forward

#Block source routing
echo 0
>/proc/sys/net/ipv4/conf/all/accept_source_route

#Kill timestamps.  These have been the subject of a
recent bugtraq thread
echo 0 > /proc/sys/net/ipv4/tcp_timestamps

#Enable SYN Cookies
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

#Kill redirects
echo 0 >/proc/sys/net/ipv4/conf/all/accept_redirects

#Enable bad error message protection
echo 1 >
/proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

#Allow dynamic ip addresses
echo "1" > /proc/sys/net/ipv4/ip_dynaddr

#Log martians (packets with impossible addresses)
#RiVaL said that certain NICs don't like this. 
Comment out if necessary.
echo 1 >/proc/sys/net/ipv4/conf/all/log_martians

#Set out local port range
echo "32768 61000"
>/proc/sys/net/ipv4/ip_local_port_range

#Reduce DoS'ing ability by reducing timeouts
echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout
echo 1800 > /proc/sys/net/ipv4/tcp_keepalive_time
echo 1 > /proc/sys/net/ipv4/tcp_window_scaling
echo 0 > /proc/sys/net/ipv4/tcp_sack
echo 1280 > /proc/sys/net/ipv4/tcp_max_syn_backlog

#################################################################
# Delete all Rules in Filtertable
iptables -F

#######################################################
# Define new chains
iptables -N BLOCK
iptables -N EXT-INT
iptables -N INT-EXT
iptables -N ICMP-DENY
iptables -N INT-IF
iptables -N EXT-IF

#######################################################

iptables -A BLOCK -m state --state ESTABLISHED,RELATED
-j ACCEPT
iptables -A BLOCK -m state --state NEW -i ! $dev_world
-j ACCEPT
iptables -A BLOCK -j DROP

iptables -A INPUT -j BLOCK
iptables -A FORWARD -j BLOCK

#################################################################
# Point to chains
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i $dev_int -s $net_int -j INT-IF
iptables -A INPUT -d ! $addr_int -i $dev_world -s !
$net_int -j EXT-IF
iptables -A INPUT -j DROP

iptables -A FORWARD -d ! $net_int -i $dev_world -s
$net_int -j INT-EXT
iptables -A FORWARD -d $net_int -i $dev_int -s !
$net_int -j EXT-INT
iptables -A FORWARD -j DROP

iptables -A OUTPUT -j ACCEPT

#################################################################
# Chain Rules
iptables -A EXT-INT -j DROP

iptables -A EXT-IF -i ! $dev_world -j DROP
iptables -A EXT-IF -p tcp --dport 22 -j ACCEPT
iptables -A EXT-IF -p tcp --dport 5901 -j ACCEPT
iptables -A EXT-IF -p tcp --dport 1024: -j ACCEPT
iptables -A EXT-IF -p udp --dport 1024: -j ACCEPT
iptables -A EXT-IF -j DROP

iptables -A INT-IF -j ACCEPT

################################################################
# NAT Rules
# Standard Routing
iptables -A POSTROUTING -t nat -o $dev_world -j
MASQUERADE -s $net_int







__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com

