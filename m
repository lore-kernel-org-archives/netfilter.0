From: Tasha Smith <tashamaillist@yahoo.com>
Subject: Trying to setup EMULE and IIS on LAN machine, behind firewall.
Date: Wed, 18 Jun 2003 01:31:35 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030618083135.92164.qmail@web80511.mail.yahoo.com>
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

Hi Boys

Hi im running RedHat 7.3 - 2.4.20 Iptables 1.2.7a on my FIREWALl/ROUTER machine.I am
having some probles creating some rules for 2 programs im running on my WIndows 2000
machine which is behind the FIREWALL/ROUTER machine (LAN). First im trying to get
EMULE(P2P) working properly, those of you who are familiar with it...I keep getting
a LOWID error even though i created a FORWARD rule. I can connect to the network but
with a LOWID for those of you who do not know what that means here is a link to what
it is. 
http://www.edonkey2000.com/documentation/lowid.html

I think i need a rule to FORWARD my connection straight to my windows 2000 machine.
Secondly i want to run IIS on my windows 2000 machine, What would be the rules soo
my LINUX(FIREWALL/ROUTER) would FORWARD request to my WINDOWS machine on the LAN.
WOuld these 2 rules for EMULE and IIS be similiar? Thanks for the help guys.

Here are my rules:

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
$iptables -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j REJECT
$iptables -A FORWARD -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
# FIN is the only bit set, without the expected accompanyuing ACK
$iptables -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP
$iptables -A FORWARD -p tcp --tcp-flags ACK,FIN FIN -j REJECT
# PSH is the only bit set, without the expected accompaying ACK
$iptables -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP
$iptables -A FORWARD -p tcp --tcp-flags ACK,PSH PSH -j REJECT
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
 
# Allow Access for DNS UDP for my ISP DNS server.
if [ "$CONNECTION_TRACKING" = "1" ]; then
   $iptables -A OUTPUT -o eth0 -p udp \
            -s $IP_INET --sport 1024:65535 \
            -d 111.xx.4.130 --dport 53 \
            -m state --state NEW -j ACCEPT
fi

$iptables -A OUTPUT -o eth0 -p udp \
         -s $IP_INET     --sport 1024:65535 \
         -d 111.xx.4.130 --dport 53 -j ACCEPT


if [ "$CONNECTION_TRACKING" = "1" ]; then
    $iptables -A OUTPUT -o eth0 -p udp \
             -s $IP_INET --sport 1024:65535 \
             -d 111.xx.4.150 --dport 53 \
             -m state --state NEW -j ACCEPT
fi

$iptables -A OUTPUT -o eth0 -p udp \
         -s $IP_INET --sport 1024:65535 \
         -d 111.xx.4.150 --dport 53 -j ACCEPT
       
$iptables -A INPUT -i eth1 -p udp --dport 53 -j ACCEPT

# Allow access for my ISP DHCP server.
if [ "$CONNECTION_TRACKING" = "1" ]; then
    $iptables -A OUTPUT -o eth0 -p udp \
             -s $IP_NET --sport 1024:65535 \
             -d 111.xx.4.129 --dport 67 \
             -m state --state NEW -j ACCEPT
fi

$iptables -A OUTPUT -o eth0 -p udp \
         -s $IP_INET      --sport 1024:65535 \
         -d 111.xx.4.129  --dport 67 -j ACCEPT

$iptables -A INPUT -i eth0 -p udp \
         -s 111.xx.4.129 --sport 67 \
         -d $IP_INET     --dport 1024:65535 -j ACCEPT

# Allow outgoing access for ftp sites
if [ "$CONNECTION_TRACKING" = "1" ]; then
    $iptables -A OUTPUT -o eth0 -p tcp \
              -s $IP_INET --sport 1024:65535 \
              --dport 21 -m state --state NEW -j ACCEPT

$iptables -A OUTPUT -o eth0 -p tcp \
          -s $IP_INET --sport 1024:65535 \
          --dport 21 -j ACCEPT
fi

# Allow my Windows machine to SSH here on Port 22
$iptables -A INPUT -i eth1 -p tcp --dport 22 -j ACCEPT

# Allow access to remote webservers PORT 80.
if [ "$CONNECTION_TRACKING" = "1" ]; then
    $iptables -A OUTPUT -o eth0 -p tcp \
             -s $IP_INET --sport 1024:65535 \
             --dport 80 -m state --state NEW -j ACCEPT
fi

$iptables -A OUTPUT -o eth0 -p tcp \
         -s $IP_INET --sport 1024:65535 \
         --dport 80 -j ACCEPT

$iptables -A INPUT -i eth0 -p tcp ! --syn \
          --sport 80 \
          -d $IP_INET --dport 1024:65535 -j ACCEPT

#Allow access from LAN to this Webserver for ACID+WebMin
$iptables -A INPUT -i eth1 -p tcp --dport 80 -j ACCEPT 
$iptables -A INPUT -i eth1 -p tcp --dport 10000 -j ACCEPT

# Attempt to connect to HHTPS 443 connections.
if [ "$CONNECTION_TRACKING" = "1" ]; then
    $iptables -A OUTPUT -o eth0 -p tcp \
              -m state --state NEW --dport 443 \
              --sport 1024:65535 \
              -j ACCEPT
fi

$iptables -A OUTPUT -o eth0 -p tcp \
         -s $IP_INET --sport 1024:65535 \
         --dport 443 -j ACCEPT
 
$iptables -A INPUT -i eth0 -p tcp \
          --sport 443 \
         -d $IP_INET --dport 1024:65535 -j ACCEPT

$iptables -A INPUT -i eth1 -p tcp --dport 1241 -j ACCEPT


# Allow ping ICMP coming from LAN interface.
$iptables -A INPUT -i eth1 -p icmp \
	  -s 192.168.0.0/24 -j ACCEPT	 

#These are my Forwarding rules.
$iptables -A FORWARD -i eth1 -p tcp --dport 80 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp -m multiport --dport 25,80,110,443 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp --dport 21 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp --dport 22 -j ACCEPT
$iptables -A FORWARD -i eth1 -p udp --dport 1863 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp --dport 1863 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp --dport 1214 -j ACCEPT
$iptables -A FORWARD -i eth1 -p udp --dport 1214 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp -m multiport --dport 4242,4224,4661,6667 -j
ACCEPT
$iptables -A FORWARD -i eth1 -p udp -m multiport --dport 4662,4672 -j ACCEPT

#Enables Packet Forwarding
$iptables -t nat -A POSTROUTING -o eth0  -j MASQUERADE

echo 1 > /proc/sys/net/ipv4/ip_forward 

Tasha@---<-----

__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com

