From: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Subject: Re: rules for Real's Helix Universal Media Server?
Date: Wed, 05 Mar 2003 18:08:03 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E65BE73.5080401@mega-bucks.co.jp>
References: <3E62E020.2090004@mega-bucks.co.jp>
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

For those who are facing the same problem as me I've finally come up 
with these rules. Don't know if they are the tightest or if they could 
be improved but they seem to work.

Any suggestions welcomed.

#!/bin/sh

IPT="/usr/local/sbin/iptables"
IP=""
LAN=""
MBX=""
INTERNALBCAST=""

# Delete any old rules
for i in filter
do
   $IPT -t $i -F
   $IPT -t $i -X
done

$IPT --policy INPUT   DROP
$IPT --policy OUTPUT  ACCEPT
$IPT --policy FORWARD DROP

# Loopback accepts everything
$IPT -A INPUT  -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT

# Allow previously established connections
$IPT -A INPUT -d $IP -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

# SMTP needed so I can email the results of the backup jobs
$IPT -A INPUT -p tcp -s $MBX -i eth0 -d $IP --sport 25 -m state --state 
NEW,ESTABLISHED,RELATED -j ACCEPT

# Allow SSH from LAN
$IPT -A INPUT -p TCP -s $LAN -i eth0 -d $IP --dport 22 -m state --state 
NEW,ESTABLISHED,RELATED -j ACCEPT

# Folding@Home
$IPT -A INPUT -p TCP -i eth0 -d $IP --sport 8080 -m state --state 
NEW,ESTABLISHED,RELATED -j ACCEPT
$IPT -A INPUT -p TCP -i eth0 -d $IP --sport 80   -m state --state 
NEW,ESTABLISHED,RELATED -j ACCEPT

#################################################
#
# Ports needed by the server
#
# Listen on :
#
# 554         control channel for RTSP (tcp)
# 80          HTTP (tcp)
# 1755        control channel for MMS  (tcp/udp)
# 7070        control channel for PNA  (tcp)
# 9090        Server Monitor Traffice (tcp)
# 14185       Helix Admin port (tcp)
# 34445-34459 RDT/RTP client replies for UDP resends (udp)
#
# Send on:
#
# 1024-5000  MMS media packet delivery (udp)
# 1-65000    MMS Multicast (mutlicast) NOT NEEDED
# 6970-32000 data channel (UDP)
#
#################################################

$IPT -A INPUT  -p tcp -i eth0 -d $IP --dport 80          -j ACCEPT
$IPT -A INPUT  -p tcp -i eth0 -d $IP --dport 554         -j ACCEPT
$IPT -A INPUT  -p tcp -i eth0 -d $IP --dport 1755        -j ACCEPT
$IPT -A INPUT  -p udp -i eth0 -d $IP --dport 1755        -j ACCEPT
$IPT -A INPUT  -p tcp -i eth0 -d $IP --dport 7070        -j ACCEPT
$IPT -A INPUT  -p tcp -i eth0 -d $IP --dport 9090        -j ACCEPT
$IPT -A INPUT  -p tcp -i eth0 -d $IP --dport 14185       -j ACCEPT
$IPT -A INPUT  -p udp -i eth0 -d $IP --dport 34445:34459 -j ACCEPT

# These rules are really needed since the OUTPUT policy is set to ACCEPT
$IPT -A OUTPUT -p udp  --sport 1024:5000   -j ACCEPT
$IPT -A OUTPUT -p udp  --sport 6970:32000  -j ACCEPT

##################################################
#
# ping flood protection
# Deny icmp to broadcast address
# allow :
#         0 : Echo reply
#         3 : Destination Unreachable
#         11: TTL exceeded
#
# deny  :
#         4 : Source Quench
#         12: Parameter Problem
#
##################################################

$IPT -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j 
REJECT
$IPT -A INPUT -i eth0 -p icmp -m icmp --icmp-type 0  -j ACCEPT
$IPT -A INPUT -i eth0 -p icmp -m icmp --icmp-type 3  -j ACCEPT
$IPT -A INPUT -i eth0 -p icmp -m icmp --icmp-type 11 -j ACCEPT
$IPT -A INPUT -i eth0 -p icmp -m icmp --icmp-type 4  -j REJECT
$IPT -A INPUT -i eth0 -p icmp -m icmp --icmp-type 12 -j REJECT
$IPT -A INPUT -p icmp -d $INTERNALBCAST -j DROP

##################################################
#
# Drop crap so that it does not clog up the log file
#
# Drop ports :
#              67  : BOOTP/DHCP             (UDP)
#              113 : identd, need to send RST
#              137 : NetBIOS                (UDP)
#              139 : Samba and print shares (TCP/UDP)
#
# Drop bcasts:
#              192.168.255.255 (TCP/UDP)
#              255.255.255.255 (TCP/UDP)
#
##################################################

$IPT -A INPUT -p udp --dport 67  -j DROP
$IPT -A INPUT -p tcp --dport 113 -j REJECT --reject-with tcp-reset
$IPT -A INPUT -p udp --dport 137 -j REJECT
$IPT -A INPUT -p udp --dport 139 -j REJECT
$IPT -A INPUT -p tcp --dport 139 -j REJECT
$IPT -A INPUT -p tcp -i eth0 -d $INTERNALBCAST  -j DROP
$IPT -A INPUT -p udp -i eth0 -d $INTERNALBCAST  -j DROP
$IPT -A INPUT -p tcp -i eth0 -d 255.255.255.255 -j DROP
$IPT -A INPUT -p udp -i eth0 -d 255.255.255.255 -j DROP

#log anything that made it this far w/o being caught
$IPT -A INPUT -j LOG --log-level debug --log-prefix "DROP:"


