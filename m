From: Scott van Looy <scott@ethosuk.org.uk>
Subject: firewall rules
Date: Wed, 11 Sep 2002 15:12:23 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209111458010.2195-100000@fire.ethosuk.org.uk>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm using ADSL and have 6 IP addresses available - So I've (starting from 
an example firewall I found on the internet) slowly built the IPtables 
stuff up to the following mess :)
I was wondering if any of you expert types could look it over and give me 
pointers as to where I might be able to improve upon the rules, etc.

Also, if I'm using pre and postrouting, do these filters bypass the 
FORWARD chain? If so I'm probably wasting my time with lots of the forward 
rules ;)

It's meant to block any port below 1024 except for exceptions and 
provide 1:1 NAT for my internal network

Here goes!

#Default rules (there's no problem with a default accept on output is 
#there?)

$IPTABLES -F INPUT
$IPTABLES -P INPUT DROP
$IPTABLES -F OUTPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F FORWARD
$IPTABLES -P FORWARD DROP
$IPTABLES -t nat -F

echo "   Assigning IPs"
/sbin/ifconfig ppp0:1 213.152.47.234 netmask 255.255.255.248
/sbin/ifconfig ppp0:2 213.152.47.235 netmask 255.255.255.248
/sbin/ifconfig ppp0:3 213.152.47.236 netmask 255.255.255.248
/sbin/ifconfig ppp0:4 213.152.47.237 netmask 255.255.255.248
/sbin/ifconfig ppp0:5 213.152.47.238 netmask 255.255.255.248

echo "   Setting pre and post routing"
$IPTABLES -t nat -A POSTROUTING -s 192.168.0.2 -o ppp0 -j SNAT \
        --to-source 213.152.47.234
$IPTABLES -t nat -A PREROUTING -i ppp0 -d 213.152.47.234 -j DNAT \ 
        --to-destination 192.168.0.2
$IPTABLES -t nat -A POSTROUTING -s 192.168.0.27 -o ppp0 -j SNAT \
        --to-source 213.152.47.235
$IPTABLES -t nat -A PREROUTING -i ppp0 -d 213.152.47.235 -j DNAT \
        --to-destination 192.168.0.27
$IPTABLES -t nat -A POSTROUTING -s 192.168.0.3 -o ppp0 -j SNAT \
        --to-source 213.152.47.236
$IPTABLES -t nat -A PREROUTING -i ppp0 -d 213.152.47.236 -j DNAT \
        --to-destination 192.168.0.3

#Is setting the forward here setting it to globally forward 
# everything thus making the rest of the forward ruleset pintless?

$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT

#Forward rules for other machines on the internal network
#Open ports > 1023
$IPTABLES -A FORWARD -p tcp --dport ! 0:1023 -j ACCEPT
$IPTABLES -A FORWARD -p udp --destination-port ! 0:1023 -j ACCEPT

#Except certain stuff (Netmeeting/SSH/dns/identd/etc)
$IPTABLES -A FORWARD -p udp --destination-port 111 -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 111 -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 113 -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 522 -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 443 -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 22 -j ACCEPT
$IPTABLES -A FORWARD -p udp --destination-port 53 -j ACCEPT
$IPTABLES -A FORWARD -p icmp -j ACCEPT

#Input rules for the firewall/server

#Open ports > 1023
$IPTABLES -A INPUT -p tcp --dport ! 0:1023 -j ACCEPT
$IPTABLES -A INPUT -p udp --destination-port ! 0:1023 -j ACCEPT

#Except certain stuff (Netmeeting/SSH/dns/http/etc)
$IPTABLES -A INPUT -i $INTIF -p udp --destination-port 137 -j ACCEPT
$IPTABLES -A INPUT -p udp --destination-port 111 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 111 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 993 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 113 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 389 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 522 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 80 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 443 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 22 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 25 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 110 -j ACCEPT
$IPTABLES -A INPUT -p udp --destination-port 53 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 143 -j ACCEPT
$IPTABLES -A INPUT -p udp --destination-port 138 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 139 -j ACCEPT
$IPTABLES -A INPUT -p icmp -j ACCEPT

#Stuff to transparent proxy using squid
$IPTABLES -t nat -A PREROUTING -i $INTIF -p tcp --dport 80 -j \
        REDIRECT --to-port 3128

#Stuff to enable Netmeeting/MSN
$IPTABLES -t nat -A PREROUTING -i br0 -p tcp --dport 1863 -j \
        REDIRECT --to-ports 1863
$IPTABLES -t nat -A PREROUTING -i br0 -p tcp --dport 389 -j \
        REDIRECT --to-ports 389
$IPTABLES -t nat -A PREROUTING -i br0 -p tcp --dport 522 -j \
        REDIRECT --to-ports 522

How's that? Is it likely to be reasonably secure?

Regards,
Scott

-- 
Scott van Looy - email:me@ethosuk.org.uk | web:www.ethosuk.org.uk
PGP Fingerprint: 7180 5543 C6C4 747B 7E74  802C 7CF9 E526 44D9 D4A7
      -------------------------------------------
      |/// /// /// /// WIDE LOAD /// /// /// ///|
      -------------------------------------------

A tall, dark stranger will have more fun than you.


