From: kate <kate7234@yahoo.com>
Subject: static IP to dynamic IP
Date: Fri, 15 Oct 2004 10:44:56 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041015174456.20376.qmail@web21523.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi, I am trying to modify a fw script that would work
for my small lan, except I need to change references
of static IP and SNAT. to eth0 and MASQUERADE, - but
when I run the script it gives me Bad argument `eth0'

The script is below, with my notes on changes I've
made so far. Any help greatly appreciated.

#(1) Policies (default) - modified with notation
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# (2) User defined chain for ACCEPTed TCP packets
iptables -N okay
iptables -A okay -p TCP --syn -j ACCEPT
iptables -A okay -p TCP -m state --state
ESTABLISHED,RELATED -j ACCEPT
iptables -A okay -p TCP -j DROP

# (3) INPUT chain rules

# Rules for incoming packets from LAN
iptables -A INPUT -p ALL -i eth1 -s 192.168.0.0/16 -j
ACCEPT
iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 192.168.1.1 -j
ACCEPT
iptables -A INPUT -p ALL -i lo -s -i eth0 -j ACCEPT
## WAS -> ... 123.45.67.89 -j ACCEPT
iptables -A INPUT -p ALL -i eth1 -d 192.168.0.255 -j
ACCEPT

# Rules for incoming packets from Internet
# Packets for established connections
iptables -A INPUT -p ALL -d -i eth0 -m state --state
ESTABLISHED,RELATED -j ACCEPT
## WAS - > ... -d 123.45.67.89 -m...

# TCP Rules (edit as services needed)
iptables -A INPUT -p TCP -i eth0 -s 0/0
--destination-port 21 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0
--destination-port 22 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0
--destination-port 80 -j okay
iptables -A INPUT -p TCP -i eth0 -s 0/0
--destination-port 443 -j okay

# UDP Rules
# iptables -A INPUT -p UDP -i eth0 -s 0/0
--destination-port 53 -j okay
# iptables -A INPUT -p UDP -i eth0 -s 0/0
--destination-port 2074 -j okay

# ICMP rules
iptables -A INPUT -p ICMP -i eth0 -s 0/0 --icmp-type 8
-j ACCEPT
iptables -A INPUT -p ICMP -i eth0 -s 0/0 --icmp-type
11 -j ACCEPT

# (4) FORWARD chain rules
# Accept the packets we want to forward
iptables -A FORWARD -i eth1 -j ACCEPT
iptables -A FORWARD -m state --state
ESTABLISHED,RELATED -j ACCEPT

# (5) OUTPUT chain rules
# Only output packets with local addresses (no
spoofing)
iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -p ALL -s 192.168.1.1 -j ACCEPT
iptables -A OUTPUT -p ALL -s -i eth0 -j ACCEPT
## WAS -> ... 123.45.67.89 -j ACCEPT

# (6) POSTROUTING chain rules
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
## was -> ... -j SNAT --to-source 123.45.67.89



		
__________________________________
Do you Yahoo!?
Yahoo! Mail Address AutoComplete - You start. We finish.
http://promotions.yahoo.com/new_mail 

