From: <netfilter@sbgit.com>
Subject: Re-2: Is my script good and secure?
Date: 15 Mar 2004 14:32:05 UT
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DIIE.000000E400002A95@sbgit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
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

 
 
> > iptables -A INPUT lo -p tcp --destination-port 10024 -j ACCEPT
> > iptables -A OUTPUT -o lo -p tcp --destination-port 10024 -j ACCEPT
> > iptables -A INPUT -i lo -p tcp --destination-port 10025 -j ACCEPT
> > iptables -A OUTPUT -o lo -p tcp --destination-port 10025 -j ACCEPT
> 
> You specified you want want to accept all lo traffic. Why add rules ?
> 
> -- 
I changed some rules, some rules are removed and the position of the rules are
changed. So i hope the script is more secure.
I wan't to use an separate file to be included like an blacklist of trajan ports,
but i'm very new with iptables (work since one week with it).
How i have to build the rule do include an seperate file with near of 351 entries of ports
wich are used by trojans?
How i have to build the file (like "65536   #Adore Worm/Linux" ??)

Thanx Peter

But here my current script:

#! /bin/sh


modprobe ip_conntrack
modprobe ip_conntrack_ftp
modprobe ip_conntrack_irc
modprobe ip_conntrack_pptp
modprobe ip_conntrack_proto_gre
modprobe ip_nat
modprope ip_nat_pptp
modprobe ip_nat_proto_gre

# Flushen, Deleting, Create#
################################################################
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X

iptables -N input_sperre
iptables -N forward_sperre

# Antworten zulassen #
######################
iptables -A sperre -m state --state ESTABLISHED,RELATED -j ACCEPT

# first contact #
#################
iptables -A sperre -i eth1 -s ! 192.168.1.0/255.255.255.0 -j DROP                 # Drop everything how not comes from lokal LAN
iptables -A sperre -i eth1 --dport 22,19,21,22,25,3389,1723,23000:23001 -j ACCEPT # Allow outbound only for specific ports
iptables -A sperre -i lo -s 127.0.0.1/255.0.0.0 -j ACCEPT                         # Allow everything from loopback
iptables -A sperre -i eth0 -s 192.168.1.0/255.255.255.0 -j DROP                   # Drop everyting how comes fro outside to inside  with LAN IP's

# acceptstuff #
###############
iptables -A sperre -p tcp --dport 21 -j ACCEPT             # ftp 
iptables -A sperre -p tcp --dport 23000:23001 -j ACCEPT    # Battlefield Server
iptables -A sperre -p tcp --dport 90 -j ACCEPT             # DVISE
iptables -A sperre -p tcp --dport 80 -j ACCEPT             # HTTP
iptables -A sperre -p tcp --dport 3389 -j ACCEPT           # VPN


# Reject everything else (RFC-conform) #
#######################################
iptables -A sperre -p tcp -j REJECT --reject-with tcp-reset
iptables -A sperre -p udp -j REJECT --reject-with icmp-port-unreachable

# activating sperre#
#####################
iptables -A INPUT -j input_sperre
iptables -A FORWARD -j forward_sperre
iptables -P INPUT DROP
iptables -P FORWARD DROP

iptables -P OUTPUT ACCEPT # output accept
iptables -P OUTPUT ACCEPT -t nat

# NAT #
#######
iptables -A POSTROUTING -t nat -o eth0 -j MASQUERADE 
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 21 -j DNAT --to 192.168.1.198        # FTP to FTP-Server
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 1723 -j DNAT --to 192.168.1.2        # VPN Server
iptables -A PREROUTING -t nat -i eth0 -p 47  -j DNAT --to 192.168.1.2                     # VPN Server
iptables -A PREROUTING -t nat -i eth0 -p 37  -j DNAT --to 192.168.1.2                     # VPN Server
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 4661:4662 -j DNAT --to 192.168.1.198 # EDONKEY
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 6343 -j DNAT --to 192.168.1.198      # EDONKEY
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 6300 -j DNAT --to 192.168.1.198      # EDONKEY
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 4242 -j DNAT --to 192.168.1.198      # EDONKEY
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 8888 -j DNAT --to 192.168.1.198      # EDONKEY
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 6661:6662 -j DNAT --to 192.168.1.198 # EDONKEY
iptables -A PREROUTING -t nat -i eth0 -p udp --dport 4665 -j DNAT --to 192.168.1.198      # EDONKEY
iptables -A PREROUTING -t nat -i eth0 -p udp --dport 4672 -j DNAT --to 192.168.1.198      # EDONKEY
iptables -A PREROUTING -t nat -i eth0 -p udp --dport 6665 -j DNAT --to 192.168.1.198      # EDONKEY

# Special Rules
iptables -A INPUT -i eth0 -s 0/0 -p tcp --destination-port 25 -j ACCEPT
iptables -A OUTPUT -o eth1 -s 0/0 -p tcp --destination-port 25 -j ACCEPT
iptables -A INPUT -i eth0 -s 192.168.1.0/24 -p tcp --destination-port 25 -j ACCEPT
iptables -A OUTPUT -o eth0 -s 0/0 -p tcp --destination-port 25 -j ACCEPT

iptables -A INPUT lo -p tcp --destination-port 10024 -j ACCEPT
iptables -A OUTPUT -o lo -p tcp --destination-port 10024 -j ACCEPT

iptables -A INPUT -i lo -p tcp --destination-port 10025 -j ACCEPT
iptables -A OUTPUT -o lo -p tcp --destination-port 10025 -j ACCEPT

echo "1" > /proc/sys/net/ipv4/ip_forward # Initialising of Forwarding

echo "Firewall started"


To: blancher@cartel-securite.fr
Cc: netfilter@lists.netfilter.org


