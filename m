From: Tasha Smith <tashamaillist@yahoo.com>
Subject: VPN and getting through IPTABLES firewall
Date: Wed, 3 Dec 2003 18:35:00 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031204023500.15431.qmail@web60301.mail.yahoo.com>
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

Hi Boyz,

Details:
IPTABLES-1.2.7a
Kernel-2-4.20
RedHat-7.3 - Firewall Machine

Windows 2000 (192.168.0.1) LAN MAchine
VPN Client:
4_65.18
Security ESP,Triple DES, SHA
Windows 2000 (192.168.0.1) LAN MAchine
 
I am having troubles trying to get my VPN to work working. I am running Windows 2000
on my LAN and have a Redhat 7.3 machine as my firewall running iptables-1.2.7a. I
have my rules set up to forward to port UDP 500 but it still wont connect it makes
it to BANNER check then CUTS out. I will post all my rules at the bottom. The thing
is i can connect when i add this rule:
$iptables -A FORWARD -i eth1 -o eth0 -s 192.168.0.0/24 -j ACCEPT

I didnt want to just add this rule because of secruity and i really would like to
know why it doesnt work when i added these rules which i thought they were used by
VPN:

$iptables -A FORWARD -i eth1 -p tcp -m multiport
--dport1040,1043,1046,1047,1048,1050,1051,1052,1098,1054 -j ACCEPT
$iptables -A FORWARD -i eth1 -p udp --dport 500 -j ACCEPT
$iptables -A FORWARD -i eth1 -p udp --dport 10000 -j ACCEPT

If somebody could please shed some light on this for me ;) please and or help me
create my rules to get VPN connected to my work. If you need anymore informationi
could post right away. 
Here are all my rules, and yes the IP's all have been changed ;-)

---SNIP---


#!/bin/bash/
#
# chkconfig: 2345 08 92
# description: This script applies iptables.
#
# Enable broadcast echo protection
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

# Disable source routed packets
for f in /proc/sys/net/ipv4/conf/*/accept_source_route; do
        echo 0 > $f
done

# Enable syn cookie protection.
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

# Disable ICMP Redirect Acceptence
for f in /proc/sys/net/ipv4/conf/*/accept_redirects; do
        echo 0 > $f
done

# Drop spoofed packets comeing in on an interface, ehich if replied
# to,would result the reply going out another interface.
for f in /proc/sys/net/ipv4/conf/*/rp_filter; do
     echo 1 > $f
done

# Dont't send Redirect Messages
for f in /proc/sys/net/ipv4/conf/*/send_redirects; do
        echo 0 > $f
done

# Log packets with impossiable addreses.
for f in /proc/sys/net/ipv4/conf/*/log_martians; do
    echo 1 > $f
done

#Where my iptables are located
iptables="/usr/local/sbin/iptables"

# This will also update my ipaddress.
IP_INET=`/sbin/ifconfig eth0 | grep inet | cut -d: -f2 | cut -d\  -f1`

# Remove any existing rules from all chains.
$iptables --flush
$iptables -t nat --flush
$iptables -t mangle --flush

# Unlimited access on the loopback interface.
$iptables -A INPUT  -i lo -j ACCEPT
$iptables -A OUTPUT -o lo -j ACCEPT

# Set the default policy to drop.
$iptables --policy INPUT DROP
$iptables --policy FORWARD DROP
$iptables --policy OUTPUT ACCEPT

$iptables -t nat --policy PREROUTING ACCEPT
$iptables -t nat --policy OUTPUT ACCEPT
$iptables -t nat --policy POSTROUTING ACCEPT

$iptables -t mangle --policy PREROUTING ACCEPT
$iptables -t mangle --policy OUTPUT ACCEPT

# All of the bits are cleared
$iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
$iptables -A FORWARD -p tcp --tcp-flags ALL NONE -j DROP
# SYN and FIN are both set
$iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
$iptables -A FORWARD -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
# SYN and RST are both set.
$iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
$iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
# FIN and RST are both set
$iptables -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
$iptables -A FORWARD -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
# FIN is the only bit set, without the expected accompanyuing ACK
$iptables -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP
$iptables -A FORWARD -p tcp --tcp-flags ACK,FIN FIN -j DROP
# PSH is the only bit set, without the expected accompaying ACK
$iptables -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP
$iptables -A FORWARD -p tcp --tcp-flags ACK,PSH PSH -j DROP
# URG is the only bit set, without the expected accompayning ACK
$iptables -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP
$iptables -A FORWARD -p tcp --tcp-flags ACK,URG URG -j DROP

# Allow stateful connections
$iptables -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
$iptables -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
$iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Drop Invalid connection
$iptables -A INPUT -m state --state INVALID -j LOG \
          --log-prefix "Invalid input: "
$iptables -A INPUT -m state --state INVALID -j DROP

$iptables -A OUTPUT -m state --state INVALID -j LOG \
          --log-prefix "Invalid output: "
$iptables -A OUTPUT -m state --state INVALID -j DROP

$iptables -A FORWARD -m state --state INVALID -j LOG \
          --log-prefix "Invalid forward: "
$iptables -A FORWARD -m state --state INVALID -j DROP

# Dropped packets that pretend to be coming in from PRIVATE ADDRESSes.
$iptables -A INPUT   -i eth0 -s 10.0.0.1/8     -j DROP
$iptables -A FORWARD -i eth0 -s 10.0.0.1/8     -j DROP
$iptables -A INPUT   -i eth0 -s 169.254.0.0/16 -j DROP
$iptables -A FORWARD -i eth0 -s 169.254.0.0/16 -j DROP
$iptables -A INPUT   -i eth0 -s 172.16.0.0/12  -j DROP
$iptables -A FORWARD -i eth0 -s 172.16.0.0/12  -j DROP
$iptables -A INPUT   -i eth0 -s 192.168.0.0/24 -j DROP
$iptables -A FORWARD -i eth0 -s 192.168.0.0/24 -j DROP
# iptables -A INPUT   -i eth0 -s 127.0.0.1/8    -j DROP
$iptables -A FORWARD -i eth0 -s 127.0.0.1/8    -j DROP

# Allow SSH Access
if [ "$CONNECTION_TRACKING" = "1" ]; then
   $iptables -A INPUT -i $eth0 -p tcp \
   -s 132.161.42.159  --sport 1024:65985 \
   -d $IP_INET --dport 22 \
   -m state --state NEW -j ACCEPT
fi

$iptables -A INPUT -i eth0 -p tcp \
   -s 132.161.42.159 --sport 1024:65985 \
   -d $IP_INET --dport 22 -j ACCEPT


# Allow Access for DNS UDP for my ISP DNS server.
if [ "$CONNECTION_TRACKING" = "1" ]; then
   $iptables -A OUTPUT -o eth0 -p udp \
            -s $IP_INET --sport 1024:65985 \
            -d 202.98.4.130 --dport 98 \
            -m state --state NEW -j ACCEPT
fi

$iptables -A OUTPUT -o eth0 -p udp \
         -s $IP_INET     --sport 1024:65985 \
         -d 202.98.4.130 --dport 98 -j ACCEPT


if [ "$CONNECTION_TRACKING" = "1" ]; then
    $iptables -A OUTPUT -o eth0 -p udp \
             -s $IP_INET --sport 1024:65985 \
             -d 202.98.4.150 --dport 98 \
             -m state --state NEW -j ACCEPT
fi

$iptables -A OUTPUT -o eth0 -p udp \
         -s $IP_INET --sport 1024:65985 \
         -d 202.98.4.150 --dport 98 -j ACCEPT

$iptables -A INPUT -i eth1 -p udp --dport 98 -j ACCEPT

# Allow access for my ISP DHCP server.
if [ "$CONNECTION_TRACKING" = "1" ]; then
    $iptables -A OUTPUT -o eth0 -p udp \
             -s $IP_NET --sport 1024:65985 \
             -d 202.98.4.129 --dport 67 \
             -m state --state NEW -j ACCEPT
fi

$iptables -A OUTPUT -o eth0 -p udp \
         -s $IP_INET      --sport 1024:65985 \
         -d 202.98.4.129  --dport 67 -j ACCEPT

$iptables -A INPUT -i eth0 -p udp \
         -s 202.98.4.129 --sport 67 \
         -d $IP_INET     --dport 1024:65985 -j ACCEPT

# Allow outgoing access for ftp sites
if [ "$CONNECTION_TRACKING" = "1" ]; then
    $iptables -A OUTPUT -o eth0 -p tcp \
              -s $IP_INET --sport 1024:65985 \
              --dport 21 -m state --state NEW -j ACCEPT
fi

$iptables -A OUTPUT -o eth0 -p tcp \
          -s $IP_INET --sport 1024:65985 \
          --dport 21 -j ACCEPT


# Allow my Windows machine to SSH here on Port 22
$iptables -A INPUT -i eth1 -p tcp --dport 22 -j ACCEPT

# Allow access to remote webservers PORT 80.
if [ "$CONNECTION_TRACKING" = "1" ]; then
    $iptables -A OUTPUT -o eth0 -p tcp \
              -s $IP_INET --sport 1024:65985 \
              --dport 80 -m state --state NEW -j ACCEPT
fi

$iptables -A OUTPUT -o eth0 -p tcp \
         -s $IP_INET --sport 1024:65985 \
         --dport 80 -j ACCEPT

$iptables -A INPUT -i eth0 -p tcp ! --syn \
          --sport 80 \
          -d $IP_INET --dport 1024:65985 -j ACCEPT


#Allow access from LAN to this Webserver for ACID+WebMin
$iptables -A INPUT -i eth1 -p tcp --dport 80 -j ACCEPT
$iptables -A INPUT -i eth1 -p tcp --dport 10000 -j ACCEPT

# Attempt to connect to HHTPS 443 connections.
if [ "$CONNECTION_TRACKING" = "1" ]; then
    $iptables -A OUTPUT -o eth0 -p tcp \
              -m state --state NEW --dport 443 \
              --sport 1024:65985 -j ACCEPT
fi

$iptables -A OUTPUT -o eth0 -p tcp \
          -s $IP_INET --sport 1024:65985 \
          --dport 443 -j ACCEPT

$iptables -A INPUT -i eth0 -p tcp \
          --sport 443 \
          -d $IP_INET --dport 1024:65985 -j ACCEPT

# Fragmented ICMP Messages.
$iptables -A INPUT -i eth0 --fragment -p icmp -j LOG \
          --log-prefix "Fragmented ICMP: "
$iptables -A INPUT -i eth0 --fragment -p icmp -j DROP \

# Source Quench Control
$iptables -A INPUT -i eth0 -p icmp \
          --icmp-type source-quench -d $IP_INET -j ACCEPT
$iptables -A OUTPUT -o eth0 -p icmp \
          -s $IP_INET --icmp-type source-quench -j ACCEPT

# Parameter Problem Status.
$iptables -A INPUT -i eth0 -p icmp \
          --icmp-type parameter-problem -d $IP_INET -j ACCEPT
$iptables -A OUTPUT -o eth0 -p icmp \
          -s $IP_INET --icmp-type parameter-problem -j ACCEPT

# Destination Unreachable Error.
$iptables -A INPUT -i eth0 -p icmp \
          --icmp-type destination-unreachable -d $IP_INET -j ACCEPT
$iptables -A OUTPUT -o eth0 -p icmp \
          -s $IP_INET --icmp-type fragmentation-needed -j ACCEPT
$iptables -A OUTPUT -o eth0 -p icmp \
          -s $IP_INET --icmp-type destination-unreachable -j DROP

# Time Exceeded Status
$iptables -A INPUT -i eth0 -p icmp \
          --icmp-type time-exceeded -d $IP_INET -j ACCEPT

# Allow Outgoing pings to remote hosts
if [ "$CONNECTION_TRACKING" = "1" ]; then
    $iptables -A OUTPUT -o eth0 -p icmp \
              -s $IP_INET --icmp-type echo-request \
              -m state --state NEW -j ACCEPT
fi

$iptables -A OUTPUT -o eth0 -p icmp \
          -s $IP_INET --icmp-type echo-request -j ACCEPT

# Incoming ping from Remote Hosts.
if [ "$CONNECTION_TRACKING" = "1" ]; then
     $iptables -A INPUT -i eth0 -p icmp \
               -s 202.98.1.231 --icmp-type echo-request -d $IP_INET \
               -m state --state NEW -j ACCEPT
fi

$iptables -A INPUT -i eth0 -p icmp \
          -s 202.98.1.231 --icmp-type echo-request -d $IP_INET -j ACCEPT
$iptables -A OUTPUT -o eth0 -p icmp \
          -s $IP_INET --icmp-type echo-reply -d 202.98.1.231 -j ACCEPT

# Allow ping ICMP coming from LAN interface.
$iptables -A INPUT -i eth1 -p icmp \
          -s 192.168.0.0/24 -j ACCEPT

#$iptables -A INPUT -i eth0 -p tcp --dport 137:139 -j ACCEPT
#$iptables -A INPUT -i eth0 -p udp --dport 137:139 -j ACCEPT
#$iptables -t nat -A PREROUTING -i eth0 -p tcp \
#         --sport 1024:65985 -d 132.161.60.183 --dport 135:139 \
#         -j DNAT --to-destination 192.168.0.69
#$iptables -t nat -A PREROUTING -i eth0 -p udp \
#          --sport 1024:65985 -d 132.161.60.183 --dport 135:139 \
#          -j DNAT --to-destination 192.168.0.69


#My rules for EMULE;
$iptables -A INPUT -p tcp --dport 4662 -j ACCEPT
$iptables -A OUTPUT -p tcp -m multiport --sport 4661,4662 -j ACCEPT
$iptables -t nat -A PREROUTING -p tcp --dport 4662 -j DNAT --to 192.168.0.69
#These are my Forwarding rules.
$iptables -A FORWARD -i eth1 -p tcp --dport 80 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp -m multiport --dport 25,80,110,443 -j 
ACCEPT
$iptables -A FORWARD -i eth1 -p tcp --dport 21 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp --dport 22 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp -m multiport --dport 
1040,1043,1046,1047,1048,1050,1051,1052,1098,1054 -j ACCEPT
$iptables -A FORWARD -i eth1 -p udp --dport 500 -j ACCEPT
$iptables -A FORWARD -i eth1 -p udp --dport 10000 -j ACCEPT
$iptables -A FORWARD -i eth1 -p udp --dport 1863 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp --dport 1863 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp -m multiport --dport 135,137,138,139 -j 
ACCEPT
$iptables -A FORWARD -i eth1 -p udp -m multiport --dport 135,137,138,139 -j 
ACCEPT
$iptables -A FORWARD -i eth1 -p tcp --dport 1214 -j ACCEPT
$iptables -A FORWARD -i eth1 -p udp --dport 1214 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp --dport 3389 -j ACCEPT
$iptables -A FORWARD -i eth1 -p udp --dport 3389 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp --dport 6346 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp -m multiport --dport 4242,4661,4662 -j 
ACCEPT
$iptables -A FORWARD -i eth1 -p udp -m multiport --dport 4661,4662,4772 -j 
ACCEPT
$iptables -A FORWARD -p tcp --dport 4662 -i eth0 -o eth1 -j ACCEPT
$iptables -A FORWARD -p udp --dport 4662 -i eth0 -o eth1 -j ACCEPT
#$iptables -A FORWARD -i eth1 -j LOG --log-prefix "Unhandled Forward: "
# Fowarding is allowed in the direction
####$iptables -A FORWARD -i eth1 -o eth0 -s 192.168.0.0/24 -j ACCEPT *******

# Enables Packet Forwarding
$iptables -t nat -A POSTROUTING -o eth0  -j MASQUERADE

echo 1 > /proc/sys/net/ipv4/ip_forward



__________________________________
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
http://antispam.yahoo.com/whatsnewfree

