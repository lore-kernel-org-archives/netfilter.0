From: =?utf-8?q?Fr=C3=A9d=C3=A9ric=20Gonzatti?= <fred99@qualiflow.com>
Subject: Firewall IP change
Date: Fri, 23 Jul 2004 14:57:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407231457.30104.fred99@qualiflow.com>
References: <40FEE340.8090907@ctwa.com> <200407212302.53814.Antony@Soft-Solutions.co.uk> <1090450600.2112.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1090450600.2112.3.camel@localhost>
Content-Disposition: inline
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

Hi all,

I've got a big problem with my firewall which have three ethernet cards.
eth0 : 172.16.2.1/255.255.255.0 ---->LAN
eth1: 192.168.2.1/255.255.255.0----->DMZ
eth2: 192.168.3.1/255.255.255.0-----> WAN

This firewall is connect to a router which have Wan IP 192.168.3.254 and a 
public IP for WAN : 62.160.X.X/255.255.255.255
This configurations is working !!!

I have tried to replace the Wan IP of my firewall by a public IP : 62.160.X.Y
# ifconfig eth2 62.160.X.Y netmask 255.255.255.248
# route add default gw 62.160.X.Z (which is new Ip of the router (WAN and LAN 
interfaces of the router are the same)

I can access to the internet from my firewall but unfortunately not from my 
LAN.
So now I come back to my old configuration until I ask why it was not working.
Have you got any idea please ?

My iptables script is :

iptables -t filter -F
iptables -t nat -F

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t filter -P INPUT DROP
iptables -t filter -P FORWARD DROP
iptables -t filter -P OUTPUT DROP

iptables -t filter -A INPUT -i lo -j ACCEPT
iptables -t filter -A OUTPUT -o lo -j ACCEPT



###########
# FORWARD #
###########

			##############
			# LAN -->DMZ #
			##############


iptables -t nat -A PREROUTING -d 172.16.2.1 -p tcp --dport 110 -j DNAT 
--to-destination 192.168.2.150:110
iptables -t filter -A FORWARD -i eth0 -o eth1 -s 172.16.0.0/16 -d 
192.168.2.150/32 -p tcp --dport 110 -m state --state NEW,ESTABLISHED -j 
ACCEPT
iptables -t filter -A FORWARD -i eth1 -o eth0 -s 192.168.2.150/32 -d 
172.16.0.0/16 -p tcp --sport 110 -m state --state ESTABLISHED -j ACCEPT




			###############
			# LAN --> WAN #
			###############




####################################
# PROTOCOLE IDENT : TCP et UDP 113 #
####################################
iptables -t filter -A FORWARD -p tcp --dport 113 -j ACCEPT
iptables -t filter -A FORWARD -p tcp --sport 113 -j ACCEPT
iptables -t filter -A FORWARD -p udp --dport 113 -j ACCEPT
iptables -t filter -A FORWARD -p udp --sport 113 -j ACCEPT



###################################
# HTTP, HTTPS : TCP 80 et TCP 443 #
###################################
iptables -t filter -A FORWARD -i eth0 -o eth2 -s 172.16.0.0/16 -d 0/0 -p tcp 
--dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -t filter -A FORWARD -i eth2 -o eth0 -s 0/0 -d 172.16.0.0/16 -p tcp 
--sport 80 -m state --state ESTABLISHED -j ACCEPT
iptables -t filter -A FORWARD -i eth0 -o eth2 -s 172.16.0.0/16 -d 0/0 -p tcp 
--dport 443 -j ACCEPT
iptables -t filter -A FORWARD -i eth2 -o eth0 -s 0/0 -d 172.16.0.0/16 -p tcp 
--sport 443 -j ACCEPT
iptables -t filter -A FORWARD -i eth0 -o eth2 -s 172.16.0.0/16 -d 0/0 -p udp 
--dport 443 -j ACCEPT
iptables -t filter -A FORWARD -i eth2 -o eth0 -s 0/0 -d 172.16.0.0/16 -p udp 
--sport 443 -j ACCEPT

##################
# Protocole POP3 #
##################

iptables -t filter -A FORWARD -i eth0 -o eth2 -s 172.16.0.0/16 -d 0/0 -p tcp 
--dport 110 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -t filter -A FORWARD -i eth2 -o eth0 -s 0/0 -d 172.16.0.0/16 -p tcp 
--sport 110 -m state --state ESTABLISHED -j ACCEPT

#################
# Protocole FTP #
#################


modprobe ip_conntrack_ftp
modprobe ip_nat_ftp

iptables -t filter -A FORWARD -s 172.16.0.0/16 -d 0/0 -p tcp --dport 21 -m 
state --state NEW,ESTABLISHED -j ACCEPT
iptables -t filter -A FORWARD -s 0/0 -d 172.16.0.0/16 -p tcp --sport 21 -m 
state --state ESTABLISHED -j ACCEPT
iptables -t filter -A FORWARD -s 172.16.0.0/16 -d 0/0 -p tcp --dport 20 -m 
state --state ESTABLISHED -j ACCEPT
iptables -t filter -A FORWARD -s 0/0 -d 172.16.0.0/16 -p tcp --sport 20 -m 
state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A FORWARD -s 172.16.0.0/16 -d 0/0 -p tcp --dport 
1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A FORWARD -s 0/0 -d 172.16.0.0/16 -p tcp --sport 
1024:65535 -m state --state ESTABLISHED -j ACCEPT





			
iptables -t filter -A INPUT -j DROP
iptables -t filter -A OUTPUT -j DROP
iptables -t filter -A FORWARD -j DROP


Thanks

Fred99


