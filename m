From: "Alyn Ashworth" <alyn@emph.com>
Subject: Adding Telnet to a Working Setup
Date: Wed, 27 Aug 2003 14:44:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <023a01c36ca1$54a1f320$0500a8c0@emph05>
Reply-To: <alyn@emph.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have a working iptables setup that uses the following script, and that I
would like to change to allow telnet connexions from the local network
(eth0) but nor from ppp0. Can anyone suggest the best way to do this
(politely and in words of one sylable, please!), and I would also welcome
any other comments on my script....

#============================SCRIPT STARTS==================================
# Load modules
modprobe ip_tables
modprobe ip_conntrack
modprobe ip_conntrack_ftp

# (1) Policies (default)
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# (2) User-defined chain for ACCEPTed TCP packets - called okay
iptables -N okay
#next line would allow new connections
#iptables -A okay -p TCP --syn -j ACCEPT
iptables -A okay -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A okay -p TCP -j DROP

# (3) INPUT chain rules

# Rules for incoming pakets from LAN
iptables -A INPUT -p ALL -i eth0 -s 192.168.0.0/16 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 192.168.0.0/16 -j ACCEPT

#Rules for incoming packets from the Internet

#Packets for established connexions
iptables -A INPUT -p ALL -i ppp0 -m state --state ESTABLISHED,RELATED -j
ACCEPT

#TCP rules (not used as pres as no services running over net)

#UDP rules
iptables -A INPUT -p UDP -i ppp0 -s 0/0 --destination-port 53 -j ACCEPT
iptables -A INPUT -p UDP -i ppp0 -s 0/0 --destination-port 2074 -j ACCEPT
iptables -A INPUT -p UDP -i ppp0 -s 0/0 --destination-port 4000 -j ACCEPT

#ICMP rules
iptables -A INPUT -p ICMP -i ppp0 -s 0/0 --icmp-type 8 -j ACCEPT
iptables -A INPUT -p ICMP -i ppp0 -s 0/0 --icmp-type 11 -j ACCEPT

# (4) FORWARD chain rules
# Accept packets we want to forward
iptables -A FORWARD -i eth0 -s 192.168.0.0/16 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# (5) OUTPUT chain rules
# only output packets with local addreses (no spoofing)
iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -p ALL -s 192.168.0.88 -j ACCEPT
iptables -A OUTPUT -p ALL -s 192.168.0.0/24 -j ACCEPT

# (6) POSTROUTING chain rules
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
#==========================================================SCRIPT ENDS
==================

Many thanks

Alyn.


Alyn W. Ashworth



