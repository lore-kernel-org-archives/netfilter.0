From: "Stuart Lamble" <stu@gateway10.homeip.net>
Subject: Varification of firewall script
Date: Sun, 11 Apr 2004 16:59:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c41fd5$a02e4ae0$0264a8c0@stu>
Reply-To: <stu@gateway10.homeip.net>
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

Hello netfilter users.

I would like your opinion on the script below. Before that you will need
to know a bit about my configuration.
I have an ADSL line (ppp0) and two ethernet cards. Eth0 is directly
connected to the DSL modem. Eth1 is connected to my LAN
(192.168.100.0/255.255.255.0). This range is masqueraded.
I want the following services on my firewall server to be accessible
from the internet (22,25,80,443,10000), not good idea I know, but cost
constraints...
I have a server on the LAN that is hosting ssh and 7783, oracle web
server. I have a dnat for this server 555 = 22, and 7783 = 7783. Once
again cost constraints.
I have allowed pritty much any port from the LAN out to the internet,
will still work on restricting this on the FORWARD rules, not too
worried about this yet ;-), however, I will want prevent kazaa etc.
I am also a little restrictive on what goes out from the firewall server
itself, I have limited it to certain ports only.
I have tested everything from the a machine on the internet inwards,
from the Lan outwards, and from the firewall itself outwards. Everything
is working as expected, so based on that I think I have it right.
My question is, am I sufficiently covered on what comes in from the
internet. Can I do more on my INPUT table to prevent spoofing, DOS
attachs, and whatever else is suspicious?

Thanks in advance, Stuart.


#
# IPTABLES script
#

# some kernel flag settings
#
# preventing smurf amplification attacks
/bin/echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
# do not accept source routed packets
/bin/echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route
# dissable icmp redirect acceptance
/bin/echo "0" > /proc/sys/net/ipv4/conf/all/accept_redirects
# enable bad error message protection
/bin/echo "1" > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

# initial cleanup
iptables -F
iptables -X
iptables -Z

# INPUT table
iptables -P INPUT DROP
iptables -A INPUT -i ppp0 -p tcp -m tcp ! --tcp-flags SYN SYN -m state
--state NEW -j DROP
iptables -A INPUT -m state --state INVALID -j DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -s 192.168.100.0/255.255.255.0 -i eth1 -j ACCEPT
iptables -A INPUT -i ppp0 -p tcp -m tcp -m multiport --dports
22,25,80,443,10000 -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -j LOG --log-prefix "IN-Default-drop "

# FORWARD table
iptables -P FORWARD DROP
iptables -A FORWARD -s 192.168.100.0/255.255.255.0 -i eth1 -j ACCEPT
iptables -A FORWARD -d 192.168.100.6 -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A FORWARD -d 192.168.100.6 -p tcp -m tcp --dport 7783 -j
ACCEPT
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state INVALID -j LOG --log-prefix
"Drop-INV-FWD "
iptables -A FORWARD -m state --state INVALID -j DROP

# OUTPUT table
iptables -P OUTPUT DROP
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -o eth1 -j ACCEPT
iptables -A OUTPUT -o ppp0 -p udp -m udp -m multiport --ports 53 -j
ACCEPT
iptables -A OUTPUT -o ppp0 -p tcp -m tcp -m multiport --dports
21,22,25,80,443 -j ACCEPT
iptables -A OUTPUT -o ppp0 -p tcp -m tcp -m multiport --sports
25,53,80,443,10000 -j ACCEPT
iptables -A OUTPUT -o ppp0 -p icmp -j ACCEPT
iptables -A OUTPUT -m state --state INVALID -j LOG --log-prefix
"Drop-INV-OUT "
iptables -A OUTPUT -m state --state INVALID -j DROP

# NAT table
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -A PREROUTING -i ppp0 -p tcp -m tcp --dport 555 -j DNAT
--to-destination 192.168.100.6:22
iptables -t nat -A PREROUTING -i ppp0 -p tcp -m tcp --dport 7783 -j DNAT
--to-destination 192.168.100.6:7783
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.100.0/255.255.255.0 -o ppp0 -j
MASQUERADE

# The end

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.656 / Virus Database: 421 - Release Date: 4/9/2004
 


