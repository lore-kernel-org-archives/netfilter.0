From: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Subject: Web server rules
Date: Mon, 03 Mar 2003 16:58:30 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E630B26.8020807@mega-bucks.co.jp>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I've written some rules to help protect my web server.

However I'm no security or networking expert ... can anyone comment on
my rules?

What I would like is to restrict traffic to:

- incoming HTTP/HTTPS requests
- send email using SMTP
- retrieve email using POP
- outgoing connections to my DB server
- SSH connections from from LAN PC.
- I also connect to a CC verification server so allow outgoing queries 
and the replies that come back
- outgoing DNS queries (my machine needs to resolve host names into ips) 
and the incoming replies

#!/bin/sh

IPT="/usr/local/sbin/iptables"
IP1= #my WAN IP
IP2= #my LAN IP
JC=  #IP of my PC on the LAN
LAN= #LAN subnet x/24"
PG=  #Postgres DB on the LAN
INTERNALBCAST= #bcast address for my LAN x.255

$IPT --policy INPUT   DROP
$IPT --policy OUTPUT  ACCEPT
$IPT --policy FORWARD DROP

# Loopback accepts everything

$IPT -A INPUT  -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT

##################################################
#
# Kill invalid packets (illegal combinations of flags)
# Kill connections to the local interface from the outside world.
#
# from http://orbital.wiretapped.net/~technion/iptables
##################################################

$IPT -A INPUT -m state --state INVALID -j DROP
$IPT -A INPUT -d 127.0.0.0/8           -j REJECT

# For some I reason need this ...
$IPT -A INPUT -p TCP -s 0/0  -i eth0 -d $IP1 --sport 53  -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPT -A INPUT -p UDP -s 0/0  -i eth0 -d $IP1 --sport 53  -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT

# Allow SSH from LAN only, HTTP, HTTPS, FOLDING@HOME (80/8080) from
anywhere for new and previously established connections

$IPT -A INPUT -p TCP -s $LAN -i eth0 -d $IP1 --dport 22  -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPT -A INPUT -p TCP -s $LAN -i eth0 -d $IP1 --dport 80  -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPT -A INPUT -p TCP -s $LAN -i eth0 -d $IP1 --dport 443 -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
$IPT -A INPUT -p TCP -i eth0 -d $IP1 --sport 8080 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
$IPT -A INPUT -p TCP -i eth0 -d $IP1 --sport 80   -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT

# Needed for CC verification server answer coming back to us
$IPT -A INPUT -p TCP -i eth0 --sport 443 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT

# Postgres DB connections
$IPT -A INPUT -p TCP -s $PG --sport 5432 -i eth1 -d $IP2 -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT

# Allow outgoing mail, so need to allow incoming SMTP
$IPT -A INPUT -p tcp --sport 25 -j ACCEPT

##################################################
#
# ping flood protection (2 rules)
# Deny icmp to broadcast address
# Allow all other icmp
#
##################################################

$IPT -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j
REJECT
$IPT -A INPUT -p icmp --icmp-type echo-request -j REJECT
$IPT -A INPUT -p icmp -d $INTERNALBCAST -j DROP
$IPT -A INPUT -p icmp -j ACCEPT

# NETBIOS, reject b/c they clog up my logs
$IPT -A INPUT -p udp --dport 137 -j REJECT

# SAMBA and print shares, reject b/c they clog up my logs
$IPT -A INPUT -p udp --dport 139 -j REJECT
$IPT -A INPUT -p tcp --dport 139 -j REJECT

# Drop anything sent to the broadcast address b/c they clog up my logs
$IPT -A INPUT -p tcp -i eth1 -d $INTERNALBCAST  -j DROP
$IPT -A INPUT -p udp -i eth1 -d $INTERNALBCAST  -j DROP

# BOOTP and DHCP, reject b/c they clog up my logs
$IPT -A INPUT -p udp -i eth1 -d 255.255.255.255 --dport 67 -j DROP

# LAN broadcast traffic, drop it b\c it clogs up the logs
$IPT -A INPUT -p tcp -i eth1 -d 255.255.255.255 -j DROP
$IPT -A INPUT -p udp -i eth1 -d 255.255.255.255 -j DROP

#log anything that made it his far w/o being caught
$IPT -A INPUT -j LOG --log-level debug --log-prefix "DROP:"

Would these rules be addequate?

Thanks,

Jc


