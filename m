From: "Tyler Kemp" <tylerk4@sbcglobal.net>
Subject: NAT problem
Date: Wed, 8 May 2002 21:41:26 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <MGEOKCAIJIIHPHKAFOFIAEDLCAAA.tylerk4@sbcglobal.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hey,
	I recently installed linux on a spare box I had, in order to share my DSL
connection throughout the house. I've run into a problem with iptables.

Linux distro: Debian Woody
Kernel: 2.4.17
iptables version: 1.2.6a

	Iptables modules are loaded completely, local LAN is setup correctly, and
the windows machine I've been testing the connection with is configured to
use the linux box as it's gateway (no firewall on the windows machine).

Rules I'm using:
#!/bin/sh
#
#   Firewall
#


echo "Setting up Netfilter Firewall"
#flush
iptables -F
iptables -t nat -F

#allow anything already established
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#allow anything new from LAN
iptables -A INPUT -m state --state NEW -i ! ppp0 -j ACCEPT

#drop mySQL
iptables -A INPUT -p tcp --dport 3306 -j REJECT --reject-with tcp-reset

#open ident
#iptables -A INPUT -p tcp --dport 113 -j ACCEPT

#open httpd
#iptables -A INPUT -p tcp --dport 80 -m limit --limit 2/s -j
LOG --log-prefix "Apache "
#iptables -A INPUT -p tcp --dport 80 -j ACCEPT

#open ssh
#iptables -A INPUT -p tcp --dport 22 -m limit --limit 2/s -j
LOG --log-prefix "SSH "
#iptables -A INPUT -p tcp --dport 22 -j ACCEPT

#allow identd
#iptables -A INPUT -p tcp --dport 53 -j ACCEPT

#log specific curious ports before accepting/denying them
iptables -A INPUT -i ppp0 -p tcp --dport 31337 -m limit --limit 2/s -j
LOG --log-prefix "Trojan "
iptables -A INPUT -i ppp0 -p tcp --dport 27374 -m limit --limit 2/s -j
LOG --log-prefix "Trojan "
iptables -A INPUT -i ppp0 -p tcp --dport 12345 -m limit --limit 2/s -j
LOG --log-prefix "Trojan "

#iptables -A INPUT -i ppp0 -p tcp --dport 6666:7000 -m limit --limit 2/s -j
LOG --log-prefix "IRC "
iptables -A INPUT -i ppp0 -p tcp --dport 6346 -m limit --limit 2/s -j
LOG --log-prefix "6346 DoS "

#allow anything out of service range for tcp/udp (ports over 1024)
iptables -A INPUT -p tcp --dport 1024: -j ACCEPT
iptables -A INPUT -p udp --dport 1024: -j ACCEPT

#Log everything else below 1024
iptables -A INPUT -i ppp0 -p tcp -m limit --limit 1/s -j LOG --log-prefix
"DROPPED "
iptables -A INPUT -i ppp0 -p udp -m limit --limit 1/s -j LOG --log-prefix
"DROPPED "
iptables -A INPUT -i ppp0 -p icmp -m limit --limit 1/s -j LOG --log-prefix
"DROPPED "

#drop the rest with devious tcp reset
iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset
iptables -A INPUT -j DROP

#setup NAT
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE


#forward chain

#syn flood limiting
iptables -A FORWARD -p tcp --syn -m limit --limit 1/s -j ACCEPT
iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit
1/s -j ACCEPT


#enable ip forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

echo "Starting IP Forwarding"


The symptoms:
	The linux box connects properly to my DSL service, and can see the windows
box on the local LAN (windows box can see the linux box aswell). I can
access services on the linux box such as ssh and http, but something is
preventing the windows box from seeing anything on the outside world via the
DSL. Any ideas/solutions?

		Cheers,
			Tyler

Tyler Kemp
----------
tylerk4@sbcglobal.net
tyler@strtok.co.uk
tylerk4@softhome.net


