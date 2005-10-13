From: Brandon Evans <maillists@hosttuls.com>
Subject: Re: HowTo connect a Cisco 2950 switch behind iptables?
Date: Thu, 13 Oct 2005 15:13:50 -0700
Message-ID: <434EDC1E.2050702@hosttuls.com>
References: <200510132202.j9DM22aU007735@virt20t.secure-wi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510132202.j9DM22aU007735@virt20t.secure-wi.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: edvin.seferovic@kolp.at
Cc: netfilter@lists.netfilter.org

Seferovic Edvin wrote:
> Hi,
> 
> how about posting a detailed topology and your firewall script? At this
> point, we can only guess what could be wrong in your setup..

Here is my firewall script.  eth0 is conencted to the WAN, eth0 is the LAN

Thanks,
Brandon

# Firewall configuration written by lokkit
# Manual customization of this file is not recommended.
# Note: ifup-post will punch the current nameservers through the
#       firewall; such entries will *not* be listed here.
*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [150:10999]
:bad_addresses - [0:0]
:win_servers - [0:0]
:win_ports - [0:0]
:webint_ips - [0:0]
:webint_ports - [0:0]

# Allow any traffic originating locally
-A INPUT -i lo -j ACCEPT

# put in your trusted address here so you can't lock yourself out
-A INPUT -i eth0 -s 66.xxx.xxx.32/27 -j ACCEPT
-A INPUT -i eth1 -s 10.10.10.0/24 -j ACCEPT

# Weed out bad addresses
-A INPUT -i eth0 -j bad_addresses

# Allow windows only ports
-A INPUT -i eth0 -j win_servers

# Allow wi ip only ports
-A INPUT -i eth0 -j webint_ips

# Drop stealth scans
-A INPUT -i eth0 -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE 
-j DROP
-A INPUT -i eth0 -p tcp -m tcp --tcp-flags SYN,FIN SYN,FIN 
-j DROP
-A INPUT -i eth0 -p tcp -m tcp --tcp-flags SYN,RST SYN,RST 
-j DROP
-A INPUT -i eth0 -p tcp -m tcp --tcp-flags FIN,RST FIN,RST 
-j DROP
-A INPUT -i eth0 -p tcp -m tcp --tcp-flags ACK,FIN FIN 
-j DROP
-A INPUT -i eth0 -p tcp -m tcp --tcp-flags ACK,URG URG 
-j DROP

# Allow services that have already been established
-A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

# Restrict ICMP traffic
#-A INPUT -i eth0 -p icmp -m icmp --icmp-type echo-reply              -j 
DROP
#-A INPUT -i eth0 -p icmp -m icmp --icmp-type destination-unreachable -j 
DROP
#-A INPUT -i eth0 -p icmp -m icmp --icmp-type echo-request            -j 
DROP
#-A INPUT -i eth0 -p icmp -m icmp --icmp-type time-exceeded           -j 
DROP

#########################################
# Allow services we provide to everyone
#########################################
# SSH
-A INPUT -i eth0 -p tcp -m tcp --dport 22  --tcp-flags SYN,RST,ACK SYN 
-j ACCEPT

# FTP access
-A INPUT -i eth0 -p tcp -m tcp --dport 20  --tcp-flags SYN,RST,ACK SYN 
-j ACCEPT
-A INPUT -i eth0 -p tcp -m tcp --dport 21  --tcp-flags SYN,RST,ACK SYN 
-j ACCEPT
-A INPUT -i eth0 -p tcp -m tcp --dport 1024:65535  --tcp-flags 
SYN,RST,ACK SYN -j ACCEPT

# DNS
#-A INPUT -i eth0 -p tcp -m tcp --dport 53  --tcp-flags SYN,RST,ACK SYN 
-j ACCEPT
#-A INPUT -i eth0 -p udp -m udp --dport 53 
-j ACCEPT

# HTTP
#-A INPUT -i eth0 -p tcp -m tcp --dport 80  --tcp-flags SYN,RST,ACK SYN 
-j ACCEPT

# NTP
-A INPUT -i eth0 -p tcp -m tcp --dport 123 --tcp-flags SYN,RST,ACK SYN 
-j ACCEPT
-A INPUT -i eth0 -p udp -m udp --dport 123 -j ACCEPT

# Log everything else
#-A INPUT -m limit --limit 3 -j LOG --log-level debug

# --- Bad Address tables --- ###########################
-A bad_addresses -s 192.168.0.0/255.255.0.0 -j DROP
#-A bad_addresses -s 10.0.0.0/255.0.0.0      -j DROP
-A bad_addresses -s 172.16.0.0/12           -j DROP
-A bad_addresses -s 127.0.0.0/8             -j DROP
-A bad_addresses -s 0.0.0.0/8               -j DROP
-A bad_addresses -s 169.254.0.0/16          -j DROP
-A bad_addresses -s 224.0.0.0/4             -j DROP
-A bad_addresses -s 240.0.0.0/5             -j DROP
-A bad_addresses -d 224.0.0.0/4 -p ! udp    -j DROP
# hack attempts
-A bad_addresses -s 211.230.148.87          -j DROP
-A bad_addresses -s 211.214.160.231         -j DROP
-A bad_addresses -s 193.126.240.21          -j DROP
-A bad_addresses -s 71.34.213.207           -j DROP
##########################################################

# --- Windows Servers --- ###############################
# win1s
-A win_servers -s 209.xxx.xxx.xxx           -j win_ports
# win2p
-A win_servers -s 209.xxx.xxx.xxx          -j win_ports
# mssql1
-A win_servers -s 209.xxx.xxx.xxx           -j win_ports

-A win_servers -s 209.xxx.xxx.xxx           -j win_ports

##########################################################

# --- Windows Ports --- 
######################################################################
#-A win_ports -i eth0 -p tcp -m multiport --dport 22,80  --tcp-flags 
SYN,RST,ACK SYN -j ACCEPT
-A win_ports -i eth0 -p tcp -m tcp --dport 137:139  --tcp-flags 
SYN,RST,ACK SYN -j ACCEPT
-A win_ports -i eth0 -p udp -m udp --dport 137:139  -j ACCEPT
##############################################################################################

# ---  IP Ranges --- ###########################
# ADN ip's
-A webint_ips -s 207.xxx.xxx.0\24            -j webint_ports

<Snip>

-A webint_ips -s 209.xxx.xxx.0/24           -j webint_ports
##############################################################

# --- for WI servers only --- ########################################
# Cfengine
-A webint_ports -i eth0 -p tcp -m tcp --dport 5308  --tcp-flags 
SYN,RST,ACK SYN -j ACCEPT

# Syslog
-A webint_ports -i eth0 -p udp -m udp --dport 514 -j ACCEPT

# Bacula File Daemon
-A webint_ports -i eth0 -p udp -m udp --dport 9102 -j ACCEPT

#############################################################################################

# Allow all connections OUT and only existing and related ones IN
#-A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -i eth0 -o eth1 -j ACCEPT
-A FORWARD -i eth1 -o eth0 -j ACCEPT
-A FORWARD -j LOG

COMMIT

# Enabling SNAT (MASQUERADE) functionality on eth0
*nat

-A POSTROUTING -o eth0 -j MASQUERADE

COMMIT



-- 

Thanks,
     Brandon Evans

  "I wouldn't recommend sex, drugs or insanity for everyone, but they've 
always worked for me."
-Hunter S. Thompson

