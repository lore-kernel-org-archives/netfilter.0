From: "Fredrik Dahlberg" <fdaa@algonet.se>
Subject: Firewall design....
Date: Thu, 26 Sep 2002 20:52:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c2658d$d18b8110$6400a8c0@s2522>
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

I have been reading all I can find about netfilter some time now and
start to get some basic understanding about different ways to design my
chains and rules. But I would really appreciate if some of you experts
out there could give your opinion about the pro's and con's of my
design. My main goal is to make it as easy as possible on cpu resources
and at the same time get a clean and understandable structure. Would it
be "better" to base chain design on type of protocol or interface or a
mix or...? If so, why? Appart from logging and icmp rules do I miss
anything else? How much would it affect performance if I use hostnames
instead of ip adresses?



Let's use the following as an example:

The firewall is connected to internet(eth0), dmz(eth1) and lan(eth2)

firewall: internet-ip: x.x.x.1, dmz-ip: 192.168.1.1, lan-ip: 192.168.2.1
nameserver 1: internet-ip: x.x.x.2, dmz-ip: 192.168.1.2
nameserver 2: internet-ip: x.x.x.3, dmz-ip: 192.168.1.3
external smtpserver: internet-ip: x.x.x.4, dmz-ip: 192.168.1.4
internal smtpserver: lan-ip: 192.168.2.2

					____________
					|		|
					|		|
Internet------eth0(x.x.x.x/24)|	FW	|eth2---LAN(192.168.2.0/24)
					|		|
					|___________|
						eth1
						|
						|
						DMZ
					(192.168.1.0/24)



# Default rules
iptables -P INPUT DROP
iptables -p FORWARD DROP
iptables -P OUTPUT DROP

# SNAT
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.1.0/24 -j SNAT
--to-source x.x.x.1
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.2.0/24 -j SNAT
--to-source x.x.x.1

# DNAT
iptables -t nat -A PREROUTING -p tcp -d x.x.x.4 --dport 25 -j DNAT
--to-destination 192.168.1.4
iptables -t nat -A PREROUTING -p udp -d x.x.x.2 --dport 53 -j DNAT
--to-destination 192.168.1.2
iptables -t nat -A PREROUTING -p udp -d x.x.x.3 --dport 53 -j DNAT
--to-destination 192.168.1.3

# Base chain design on "routing"
iptables -N lan-inet
iptables -N dmz-inet
iptables -N inet-dmz
iptables -N inet-lan
iptables -N lan-dmz
iptables -N dmz-lan

# Accept everything on loopback interface
iptables -A INPUT -i lo -j ACCEPT
iptables -A FORWARD -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A FORWARD -o lo -j ACCEPT

# Accept all RELATED and ESTABLISHED in FORWARD chain
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Forwarding... (in traffic ammount order?)
iptables -A FORWARD -i eth2 -o eth0 -j lan-inet
iptables -A FORWARD -i eth2 -o eth1 -j lan-dmz
iptables -A FORWARD -i eth1 -o etho -j dmz-inet
iptables -A FORWARD -i eth0 -o eth1 -j inet-dmz
iptables -A FORWARD -i eth1 -o eth2 -j dmz-lan
iptables -A FORWARD -i eth0 -o eth2 -j inet-lan

# lan-inet
iptables -A lan-inet -p tcp --dport 80 -m state --state NEW -j ACCEPT

# lan-dmz
iptables -A lan-dmz -p tcp -s 192.168.2.2 -d 192.168.1.4 --dport 25 -m
state --state NEW -j ACCEPT
iptables -A lan-dmz -p udp -d 192.168.1.2 --dport 53 -m state --state
NEW -j ACCEPT
iptables -A lan-dmz -p udp -d 192.168.1.3 --dport 53 -m state --state
NEW -j ACCEPT

# dmz-inet
iptables -A -dmz-inet -p tcp --dport 25 -m state --state NEW -j ACCEPT
iptables -A -dmz-inet -p udp --dport 53 -m state --state NEW -j ACCEPT

# inet-dmz
iptables -A inet-dmz -p tcp -d 192.168.1.4 --dport 25 -m state --state
NEW -j ACCEPT
iptables -A inet-dmz -p udp -d 192.168.1.2 --dport 53 -m state --state
NEW -j ACCEPT
iptables -A inet-dmz -p udp -d 192.168.1.3 --dport 53 -m state --state
NEW -j ACCEPT

# dmz-lan
iptables -A dmz-lan -p tcp --dport 25 -m state --state NEW -j ACCEPT

# inet-lan


