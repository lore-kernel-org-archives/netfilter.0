From: Tasha Smith <natasha3641@yahoo.com>
Subject: SSL and TLS not working on FIrewall machine?
Date: Wed, 30 Oct 2002 19:36:47 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021031033647.13247.qmail@web40710.mail.yahoo.com>
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

Hiii,
1.>Umm i was wandering how come SSL or TSL doesnt connect to my banks website
from the firewall machine. But i can connect with my machines on my LAN to the
Banks website....I put  #<----- near port 443 and you can see how open i lift
it? I get a error of 
"operation timed out when attempting to" from my browser??? 
2.>Why CAN i acccess it from my LAN machines and NOT from my firewall machine??
HERE is my script: 


#!/bin/bash

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

# This will help me with mmy Dynammic ip address
eth0_address=`ifconfig eth0 | grep "inet addr" | awk '{print $2} ' | sed
's/addr://'` 
# This will also update my ipaddress.
IP_INET=`/sbin/ifconfig eth0 | grep inet | cut -d: -f2 | cut -d\  -f1`
# This will will grab it too
#INET_IP=`ifconfig eth0 | grep "inet addr"|awk -F : '{ print $2 }'|cut -d \ -f
1`;

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
iptables --policy OUTPUT DROP

# All of the bits are cleared
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A FORWARD -p tcp --tcp-flags ALL NONE -j DROP
# SYN and FIN are both set
iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
iptables -A FORWARD -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
# SYN and RST are both set.
iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
# FIN and RST are both set
iptables -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j REJECT
iptables -A FORWARD -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
# FIN is the only bit set, without the expected accompanyuing ACK
iptables -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP
iptables -A FORWARD -p tcp --tcp-flags ACK,FIN FIN -j REJECT
# PSH is the only bit set, without the expected accompaying ACK
iptables -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP
iptables -A FORWARD -p tcp --tcp-flags ACK,PSH PSH -j REJECT
# URG is the only bit set, without the expected accompayning ACK
iptables -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP
iptables -A FORWARD -p tcp --tcp-flags ACK,URG URG -j DROP

# Log Policy for first 25 ports UDP/TCP.
iptables -I INPUT -i eth0 -p tcp \
         --dport 0:25 -j LOG --log-prefix "PortScans to 0-25TCP: "

iptables -I INPUT -i eth0 -p udp \
         --dport 0:25 -j LOG --log-prefix "PortScan-to 0-25UDP: "

# Allow stateful connections 
iptables -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Drop Invalid connection
iptables -A INPUT -m state --state INVALID -j LOG \
         --log-prefix "Invalid input: "
iptables -A INPUT -m state --state INVALID -j DROP
         
iptables -A OUTPUT -m state --state INVALID -j LOG \
         --log-prefix "Invalid output: " 
iptables -A OUTPUT -m state --state INVALID -j DROP

iptables -A FORWARD -m state --state INVALID -j LOG \
         --log-prefix "Invalid forward: "
iptables -A FORWARD -m state --state INVALID -j DROP
 

# Dropped packets that pretend to be coming in from PRIVATE ADDRESSes.
iptables -A INPUT   -i eth0 -s 10.0.0.1/8     -j DROP
iptables -A FORWARD -i eth0 -s 10.0.0.1/8     -j DROP
iptables -A INPUT   -i eth0 -s 169.254.0.0/16 -j DROP
iptables -A FORWARD -i eth0 -s 169.254.0.0/16 -j DROP
iptables -A INPUT   -i eth0 -s 172.16.0.0/12  -j DROP
iptables -A FORWARD -i eth0 -s 172.16.0.0/12  -j DROP
iptables -A INPUT   -i eth0 -s 192.168.0.0/24 -j DROP
iptables -A FORWARD -i eth0 -s 192.168.0.0/24 -j DROP
iptables -A INPUT   -i eth0 -s 127.0.0.1/8    -j DROP
iptables -A FORWARD -i eth0 -s 127.0.0.1/8    -j DROP

# Allow Access for DNS UDP for my ISP DNS server.
if [ "$CONNECTION_TRACKING" = "1" ]; then
   iptables -A OUTPUT -o eth0 -p udp \
            -s $IP_INET --sport 1024:65535 \
            -d 239.73.4.130 --dport 53 \
            -m state --state NEW -j ACCEPT
fi

iptables -A OUTPUT -o eth0 -p udp \
         -s $IP_INET     --sport 1024:65535 \
         -d 239.73.4.130 --dport 53 -j ACCEPT


if [ "$CONNECTION_TRACKING" = "1" ]; then
    iptables -A OUTPUT -o eth0 -p udp \
             -s $IP_INET --sport 1024:65535 \
             -d 239.73.4.150 --dport 53 \
             -m state --state NEW -j ACCEPT
fi

iptables -A OUTPUT -o eth0 -p udp \
         -s $IP_INET --sport 1024:65535 \
         -d 239.73.4.150 --dport 53 -j ACCEPT
       
# Allow access for my ISP DHCP server.
if [ "$CONNECTION_TRACKING" = "1" ]; then
    iptables -A OUTPUT -o eth0 -p udp \
             -s $IP_NET --sport 1024:65535 \
             -d 239.73.4.129 --dport 67 \
             -m state --state NEW -j ACCEPT
fi

iptables -A OUTPUT -o eth0 -p udp \
         -s $IP_INET      --sport 1024:65535 \
         -d 239.73.4.129  --dport 67 -j ACCEPT

iptables -A INPUT -i eth0 -p udp \
         -s 239.73.4.129 --sport 67 \
         -d $IP_INET     --dport 1024:65535 -j ACCEPT

# Allow access to remote webservers PORT 80.
if [ "$CONNECTION_TRACKING" = "1" ]; then
    iptables -A OUTPUT -o eth0 -p tcp \
             -s $IP_INET --sport 1024:65535 \
             --dport 80 -m state --state NEW -j ACCEPT
fi

iptables -A OUTPUT -o eth0 -p tcp \
         -s $IP_INET --sport 1024:65535 \
         --dport 80 -j ACCEPT

iptables -A INPUT -i eth0 -p tcp ! --syn \
         --sport 80 \
         -d $IP_INET --dport 1024:65535 -j ACCEPT

# Allow access for SSL and TLS on Port 443.
if [ "$CONNECTION_TRACKING" = "1" ]; then
    iptables -A OUTPUT -o eth0 -p tcp \ #<------------------
             -s $IP_INET --sport 1024:65535 \
             --dport 443 -m state --state NEW -j ACCEPT
fi

iptables -A OUTPUT -o eth0 -p tcp \
         -s $IP_INET --sport 1024:65535 \   #<----------------
         --dport 443 -j ACCEPT   

iptables -A INPUT -i eth0 -p tcp ! --syn \
         --sport 443 \
         -d $IP_INET --dport 1024:65535 -j ACCEPT #<-----------------

iptables -A OUTPUT -o eth0 \
        -p tcp -m multiport --dport 80,443 \
        ! --syn -s $IP_INET --sport 1024:65535 -j ACCEPT  #<--------------

iptables -A INPUT -i eth0 -p tcp -m multiport \
        --sport 80,443 \
       ! --syn -s $IP_INET --dport 1024:65535 -j ACCEPT  #<------------

# Forwarding is allowed in the direction
iptables -A FORWARD -i eth1 -o eth0 -s 192.168.0.0/24 -j ACCEPT 

# Enables Packet Forwarding
iptables -t nat -A POSTROUTING -o eth0  -j MASQUERADE

echo 1 > /proc/sys/net/ipv4/ip_forward 


__________________________________________________
Do you Yahoo!?
HotJobs - Search new jobs daily now
http://hotjobs.yahoo.com/

