From: Tasha Smith <natasha3641@yahoo.com>
Subject: Why are XMAS and NULLS scans not filtered with these rules?
Date: Fri, 25 Oct 2002 18:13:29 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021026011329.71679.qmail@web40707.mail.yahoo.com>
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

Why when scanning my system using nmap from a machine on a different network for
NULL scans and XMAS scans these rules still dont filter my ports from these
sorts of scans?  Here are my rules...anoything else i can try to get them to
filter these scans??? I tyred REJECT instead of DROP also but nothing they still
get through!

#!/bin/bash

# Enable broadcast echo protection
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

# Disable source routed packets
for f in /proc/sys/net/ipv4/conf/*/accept_source_route; do
	echo 0 > $f
done

# Disable ICMP Redirect Acceptence
for f in /proc/sys/net/ipv4/conf/*/accept_redirects; do
	echo 0 > $f
done
# Dont't send Redirect Messages
for f in /proc/sys/net/ipv4/conf/*/send_redirects; do
	echo 0 > $f
done

# Enable TCP SYN Cookie protection
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

# This will also update my ipaddress.
INET_IP=`/sbin/ifconfig eth0 | grep inet | cut -d -f2: | cut -d\ -f1`

# Remove any existing rules from all chains.
iptables --flush
iptables -t nat --flush
iptables -t mangle --flush

# Unlimited access on the loopback interface.
iptables -A INPUT  -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Set the default policy to drop.
iptables --policy INPUT DROP
iptables --policy FORWARD DROP
iptables --policy OUTPUT ACCEPT

# iptables -t nat --policy PREROUTING DROP
# iptables -t nat --policy OUTPUT DROP
# iptables -t nat --policy POSTROUTING DROP

# All of the bits are cleared
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP# tryed REJECT
iptables -A FORWARD -p tcp --tcp-flags ALL NONE -j DROP# tryed REJECT
# SYN and FIN are both set
iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP # tryed REJECT
iptables -A FORWARD -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP# tryed REJECT
# SYN and RST are both set.
iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP# tryed REJECT
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN,RST -j DROP# tryed REJECT
# FIN and RST are both set
iptables -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j DROP# tryed REJECT
iptables -A FORWARD -p tcp --tcp-flags FIN,RST FIN,RST -j DROP# tryed REJECT
# FIN is the only bit set, without the expected accompanyuing ACK
iptables -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP# tryed REJECT
iptables -A FORWARD -p tcp --tcp-flags ACK,FIN FIN -j DROP# tryed REJECT
# PSH is the only bit set, without the expected accompaying ACK
iptables -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP# tryed REJECT
iptables -A FORWARD -p tcp --tcp-flags ACK,PSH PSH -j DROP# tryed REJECT
# URG is the only bit set, without the expected accompayning ACK
iptables -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP# tryed REJECT
iptables -A FORWARD -p tcp --tcp-flags ACK,URG URG -j DROP# tryed REJECT

# Log Policy for first 25 ports UDP/TCP.
iptables -I INPUT -i eth0 -p tcp \
         --dport 0:25 -j LOG --log-prefix "PortScans to 0-25TCP: "

iptables -I INPUT -i eth0 -p udp \
         --dport 0:25 -j LOG --log-prefix "PortScan-to 0-25UDP: "

# Allow stateful connections 
iptables -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow access for accessing remote web servers.
if [ "$CONNECTION_TRACKING" = "1" ]; then
    iptables -A OUTPUT -o eth0 -p tcp \
             --sport 1024:65535 \
             --dport 80 -m state --state NEW -j ACCEPT
fi

iptables -A OUTPUT -o eth0 -p tcp --dport 80 -s $eth0_address --sport 1024:65535
-j ACCEPT

        
          

# FOR MY ISP DHCP
#iptables -A INPUT -i eth0 -p udp \
#         -s xxx.53.4.149 --sport 67 \
#         --dport 68 -j ACCEPT
#iptables -A OUTPUT -o eth0 -p udp \
#         -s eth0 --sport 68 \
#         -d xxx.53.4.149 --dport 67 -j ACCEPT


# echo 1 > /proc/sys/net/ipv4/ip_forward


# Forwarding is allowed in the direction
iptables -A FORWARD -i eth1 -o eth0 -s 192.168.0.0/24 -j ACCEPT 

# Enables Packet Forwarding
iptables -t nat -A POSTROUTING -o eth0  -j MASQUERADE


__________________________________________________
Do you Yahoo!?
Y! Web Hosting - Let the expert host your web site
http://webhosting.yahoo.com/

