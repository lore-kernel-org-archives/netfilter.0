From: ng techorder <ngtechorder@yahoo.com>
Subject: Persistence in connection tracking for port forwarded traffic?
Date: Wed, 10 Aug 2005 09:15:46 -0700 (PDT)
Message-ID: <20050810161546.63554.qmail@web30507.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hello Everyone, 
   If I am double posting to the list, my apology.  I
seem to not see my previous post within the archive.
   I need some assistance in getting this Multi-WAN'ed
linux box working correctly.  The box is multi-WAN'ed
because I want to only present a single gateway to the
machines on the LAN, yet take advantage of always
having a path to the internet if one of the ISP goes
down.
   Onward to the problem.  From the LAN side, I can
surf the internet with no problem.  However, I am
encountering issues when I try to provide
port-forwarded services like FTP, HTTP to servers
located on the LAN side.  
   For example, I am port forwarding all HTTP request
from the WAN to 99.134.126.45 to an internal server
located at 192.168.10.24.  About 50% of the time, that
worked normaly.  192.168.10.24's reply packets went
back out on the 99.134.126.40/29 interface.  However,
on the other 50% of the time, the reply packet went
out on the 219.225.92.96/28 interface, and the
client's web browser just timed out because it ignored
this "unrelated" reply packet.  
   This can happen on the start of the new connection
(where the client's browser never got the correctly
sourced initial reply packet), or midway throught the
webpages access session.
   How do I get the system to send the reply back on
the correct interface all the time?  A big thank you
in advance.


My router/firewall setup:
	- running RedHat ES 4.0 (stock kernel  2.6.9-11.ELsmp
from install CD).
	- running bastille-linux
"Bastille-3.0.4-1.0.noarch.rpm"
	- have three physical NIC.
		- eth0 is to my private LAN of 192.168.x.x/24.  
		- eth1 has WAN address of 219.225.92.96/28. 
		- eth2 has WAN address of 99.134.126.40/29.


The script I use to spread the traffic on both WAN.
*************************************************************************
#!/bin/sh
#
# /scripts/dualwanrouting.sh
# This script is to add dualwan capability on a dual
wan'ed linux box.

WAN1IP=219.225.92.110
WAN1GW=219.225.92.97
WAN1NET=219.225.92.96\/28
WAN1ETH=eth1
WAN1TABLENAME=NE

WAN2IP=99.134.126.45
WAN2IP2=99.134.126.44
WAN2GW=99.134.126.46
WAN2NET=99.134.126.40\/29
WAN2ETH=eth2
WAN2TABLENAME=SW

LAN1IP=192.168.10.4
LAN1NET=192.168.10.0\/24
LAN1ETH=eth0

LAN2IP=192.168.11.241
LAN2NET=192.168.11.0\/24

echo "delete the default route"
ip route del default

echo "Adding routes to default table"
ip route add $WAN2NET dev $WAN2ETH src $WAN2IP
ip route add $WAN1NET dev $WAN1ETH src $WAN1IP
ip route add $LAN1NET dev $LAN1ETH src $LAN1IP
ip route add 127.0.0.0/8 dev lo src 127.0.0.1

echo "Setup source IP routing rules for SW (WAN2)"
ip rule add from $WAN2IP lookup $WAN2TABLENAME
ip rule add from $WAN2IP2 lookup $WAN2TABLENAME
ip route add $LAN1NET via $LAN1IP table $WAN2TABLENAME
ip route add 0/0 via $WAN2GW table $WAN2TABLENAME

echo "Setup source IP routing rules for NE (WAN1)"
ip rule add from $WAN1IP lookup $WAN1TABLENAME
ip route add $LAN1NET via $LAN1IP table $WAN1TABLENAME
ip route add 0/0 via $WAN1GW table $WAN1TABLENAME

echo "Balancing the outgoing"
ip route add default equalize nexthop via $WAN2GW dev
$WAN2ETH nexthop via $WAN1GW dev $WAN1ETH
*************************************************************************


My additions in Bastille-Linux's firewall scripts
(/etc/Bastille/bastille-firewall-early.sh):
*************************************************************************
 if [ -n "${IPTABLES}" ]; then
#       # using 2.4/iptables, add iptables rules
#       #${IPTABLES} -A INPUT ...etc...

        #80 to STARMINE_PDC on 192.168.10.24
        ${IPTABLES} -t nat -A PREROUTING -i eth2+ -p
tcp -d 99.134.126.45 --dport 80 -j DNAT --to
192.168.10.24:80
        ${IPTABLES} -A FORWARD -i eth2+ -o eth0 -p tcp
-d 192.168.10.24 --dport 80 -j ACCEPT
        ${IPTABLES} -A FORWARD -i eth0 -o eth2+ -p tcp
-s 192.168.10.24 --sport 80 -j ACCEPT
        ${IPTABLES} -t nat -A PREROUTING -i eth0 -p
tcp -d 99.134.126.45 --dport 80 -j DNAT --to
192.168.10.24:80
        ${IPTABLES} -A FORWARD -i eth0 -o eth0 -p tcp
-d 192.168.10.24 --dport 80 -j ACCEPT
        ${IPTABLES} -A FORWARD -i eth0 -o eth0 -p tcp
-s 192.168.10.24 --dport 80 -j ACCEPT


#FTP
        #21 to 192.168.10.5
        iptables -t nat -A PREROUTING -i eth2+ -p tcp
-d 99.134.126.45 --dport 21 -m state --state
NEW,ESTABLISHED -j LOG --log-prefix "21_05preroute"
        iptables -t nat -A PREROUTING -i eth2+ -p tcp
-d 99.134.126.45 --dport 21 -m state --state
NEW,ESTABLISHED -j DNAT --to 192.168.10.5:21
        iptables -A FORWARD -i eth2+ -o eth0 -p tcp -d
192.168.10.5 --dport 21 -j LOG --log-prefix
"21_05fwd2_0d"
        iptables -A FORWARD -i eth2+ -o eth0 -p tcp -d
192.168.10.5 --dport 21 -j ACCEPT
        iptables -A FORWARD -i eth0 -o eth2+ -p tcp -s
192.168.10.5 --sport 21 -j LOG --log-prefix
"21_05fwd0_2s"
        iptables -A FORWARD -i eth0 -o eth2+ -p tcp -s
192.168.10.5 --sport 21 -j ACCEPT
        iptables -t nat -A PREROUTING -i eth0 -p tcp
-d 99.134.126.45 --dport 21 -m state --state
NEW,ESTABLISHED -j LOG --log-prefix
"21_05preroute_inside"
        iptables -t nat -A PREROUTING -i eth0 -p tcp
-d 99.134.126.45 --dport 21 -m state --state
NEW,ESTABLISHED -j DNAT --to 192.168.10.5:21
        iptables -A FORWARD -i eth0 -o eth0 -p tcp -d
192.168.10.5 --dport 21 -j LOG --log-prefix
"21_05fwd0_0d"
        iptables -A FORWARD -i eth0 -o eth0 -p tcp -d
192.168.10.5 --dport 21 -j ACCEPT
        iptables -A FORWARD -i eth0 -o eth0 -p tcp -s
192.168.10.5 --dport 21 -j LOG --log-prefix
"21_05fwd0_0s"
        iptables -A FORWARD -i eth0 -o eth0 -p tcp -s
192.168.10.5 --dport 21 -j ACCEPT

        #51000-51020 to 192.168.10.5
        iptables -t nat -A PREROUTING -i eth2+ -p tcp
-d 99.134.126.45 --dport 51000:51020 -m state --state
ESTABLISHED,RELATED -j LOG --log-prefix "X_05preroute"
#        iptables -t nat -A PREROUTING -i eth2+ -p tcp
-d 99.134.126.45 --dport 51000:51020 -m state --state
ESTABLISHED,RELATED -j DNAT --to
192.168.10.5:51000-51020
        iptables -t nat -A PREROUTING -i eth2+ -p tcp
-d 99.134.126.45 --dport 51000:51020 -m state --state
NEW,RELATED,ESTABLISHED -j DNAT --to
192.168.10.5:51000-51020
        iptables -A FORWARD -i eth2+ -o eth0 -p tcp -d
192.168.10.5 --dport 51000:51020 -j LOG --log-prefix
"X_05fwd2_0d"
        iptables -A FORWARD -i eth2+ -o eth0 -p tcp -d
192.168.10.5 --dport 51000:51020 -j ACCEPT
        iptables -A FORWARD -i eth0 -o eth2+ -p tcp -s
192.168.10.5 --sport 51000:51020 -j LOG --log-prefix
"X_05fwd0_2s"
        iptables -A FORWARD -i eth0 -o eth2+ -p tcp -s
192.168.10.5 --sport 51000:51020 -j ACCEPT
        iptables -t nat -A PREROUTING -i eth0 -p tcp
-d 99.134.126.45 --dport 51000:51020 -m state --state
ESTABLISHED,RELATED -j LOG --log-prefix
"X_05preroute_inside"
#        iptables -t nat -A PREROUTING -i eth0 -p tcp
-d 99.134.126.45 --dport 51000:51020 -m state --state
ESTABLISHED,RELATED -j DNAT --to
192.168.10.5:51000-51020
        iptables -t nat -A PREROUTING -i eth0 -p tcp
-d 99.134.126.45 --dport 51000:51020 -m state --state
ESTABLISHED,RELATED -j DNAT --to
192.168.10.5:51000-51020
        iptables -A FORWARD -i eth0 -o eth0 -p tcp -d
192.168.10.5 --dport 51000:51020 -j LOG --log-prefix
"X_05fwd0_0d"
        iptables -A FORWARD -i eth0 -o eth0 -p tcp -d
192.168.10.5 --dport 51000:51020 -j ACCEPT
        iptables -A FORWARD -i eth0 -o eth0 -p tcp -s
192.168.10.5 --dport 51000:51020 -j LOG --log-prefix
"X_05fwd0_0s"
        iptables -A FORWARD -i eth0 -o eth0 -p tcp -s
192.168.10.5 --dport 51000:51020 -j ACCEPT


        ${IPTABLES} -t nat -A POSTROUTING -d
192.168.10.0/24 -j SNAT --to-source 192.168.10.3
        ${IPTABLES} -t nat -A POSTROUTING -o eth1 -j
MASQUERADE
        ${IPTABLES} -t nat -A POSTROUTING -o eth2 -j
MASQUERADE

fi
*************************************************************************



Content of /etc/Bastille/bastille-firewall.cfg
*************************************************************************
DNS_SERVERS="0.0.0.0/0"
TRUSTED_IFACES="lo"
PUBLIC_IFACES="eth1 eth2"
INTERNAL_IFACES="eth0"
TCP_AUDIT_SERVICES="telnet ftp imap pop3 finger sunrpc
exec login linuxconf ssh"
UDP_AUDIT_SERVICES="31337"
ICMP_AUDIT_TYPES=""
TCP_PUBLIC_SERVICES="ssh"
UDP_PUBLIC_SERVICES=""
TCP_INTERNAL_SERVICES="ssh"
UDP_INTERNAL_SERVICES=""
FORCE_PASV_FTP="N"
TCP_BLOCKED_SERVICES="2049 2065:2090 6000:6020 7100"
UDP_BLOCKED_SERVICES="2049 6770"
ICMP_ALLOWED_TYPES="destination-unreachable echo-reply
time-exceeded echo-request"
ENABLE_SRC_ADDR_VERIFY="Y"
IP_MASQ_NETWORK="192.168.10.0/24"
IP_MASQ_MODULES="ftp"
REJECT_METHOD="DENY"
DHCP_IFACES=""
NTP_SERVERS=""
ICMP_OUTBOUND_DISABLED_TYPES="destination-unreachable
time-exceeded"
LOG_FAILURES="N"                                # do
not log blocked packets
ALLOW_FRAGMENTS="Y"                             # old
behavior
DROP_SMB_NAT_BCAST="Y"          # drop those packets
IP_LOG_LEVEL=4                  # iptables/netfilter
default
IP_ALWAYS_USE_STATE="N"         # default, ensures
services remain available
*************************************************************************



		
____________________________________________________
Start your day with Yahoo! - make it your home page 
http://www.yahoo.com/r/hs 
 

