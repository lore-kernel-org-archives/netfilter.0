From: "Brent Clark" <bclark@eccotours.biz>
Subject: Gate rules, is this OK
Date: Tue, 6 Jul 2004 11:58:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HAEOIFPIBBBLGLHOMLLICEMKCCAA.bclark@eccotours.biz>
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
To: iptables <netfilter@lists.netfilter.org>

Hi all

I dont know if this is an over kill, or something (Rather have an over kill,
therefore I can learn with iptables options). But I have a linux box that
does a simple dial up connection.

Would someone please have a look at mine and see where I can tweak it a bit
more.

Also, I see that on my FW i cant resolve DNS queries.
If I do a simple apt-get update (debian box). I get all this resolving
error.
Weird thing is though, my other linux workstation (also debian ), browses
the net, updates perfectly.

Thanks in advance.
Kind Regards
Brent Clark

============================================================================
========
#!/bin/sh

# Rules for gateway

#Clear \ Flush all the rules from the different chains and tables

/sbin/iptables -F
/sbin/iptables -t nat -F
/sbin/iptables -t mangle -F
/sbin/iptables -X
/sbin/iptables -F INPUT
/sbin/iptables -F OUTPUT
/sbin/iptables -F FORWARD

#Accepting traffic for and to internal interface
/sbin/iptables -A INPUT -p all -i lo -j ACCEPT
/sbin/iptables -A OUTPUT -p all -o lo -j ACCEPT

#Denying access from invalid sources
/sbin/iptables -A INPUT -i ppp0 -s 10.0.0.0/8 -j DROP
/sbin/iptables -A INPUT -i ppp0 -s 172.16.0.0/12 -j DROP
#/sbin/iptables -A INPUT -i ppp0 -s 192.168.0.0/16 -j DROP

#Creating the rules
/sbin/iptables -A INPUT -i ppp0 -m state --state ESTABLISHED,RELATED -j
ACCEPT
/sbin/iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
/sbin/iptables -A INPUT -m state --state NEW -i ! ppp0 -j ACCEPT

#Using Connection tracking for DNS
/sbin/iptables -A INPUT -p udp --dport 53 -m state --state NEW -j ACCEPT

#Allowing me to ping from here
/sbin/iptables -A OUTPUT -p icmp --icmp-type ping -m state --state NEW -j
ACCEPT

#Allow access to port 22
/sbin/iptables -A INPUT -p tcp -i eth0 --dport 22 -j ACCEPT
/sbin/iptables -A INPUT -p udp -i eth0 --dport 22 -j ACCEPT

#Deny access to port 80(http) and 443(https)
#/sbin/iptables -A INPUT -p tcp --dport 443 -j DROP
#/sbin/iptables -A INPUT -p tcp --dport 80 -j DROP

/sbin/iptables -A FORWARD -i ppp0 -o eth0 -m state --state
ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -A FORWARD -i eth0 -o ppp0 -j ACCEPT
/sbin/iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
/sbin/iptables -A FORWARD -i ppp0 -o ppp0 -j REJECT

#Drop all netbios connections etc
/sbin/iptables -A FORWARD -p UDP --dport 135 -j DROP
/sbin/iptables -A FORWARD -p TCP --dport 135 -j DROP
/sbin/iptables -A FORWARD -p UDP --dport 137 -j DROP
/sbin/iptables -A FORWARD -p TCP --dport 137 -j DROP
/sbin/iptables -A FORWARD -p UDP --dport 138 -j DROP
/sbin/iptables -A FORWARD -p TCP --dport 138 -j DROP
/sbin/iptables -A FORWARD -p UDP --dport 139 -j DROP
/sbin/iptables -A FORWARD -p TCP --dport 139 -j DROP

#Block NFS, X-windows, Printer Port, Sun rpc/NFS
/sbin/iptables -A INPUT -p TCP -s 0/0 -d 0/0 --dport 2049 -j DROP	#BLOCK NFS
/sbin/iptables -A INPUT -p UDP -s 0/0 -d 0/0 --dport 2049 -j DROP	#BLOCK NFS
/sbin/iptables -A INPUT -p TCP -s 0/0 -d 0/0 --dport 6000:6009 -j DROP
#BLOCK X-Windows
/sbin/iptables -A INPUT -p TCP -s 0/0 -d 0/0 --dport 7100 -j DROP	#BLOCK
X-Windows Font Server
/sbin/iptables -A INPUT -p TCP -s 0/0 -d 0/0 --dport 515 -j DROP	#BLOCK
Printer Port
/sbin/iptables -A INPUT -p UDP -s 0/0 -d 0/0 --dport 515 -j DROP	#BlOCK
Printer Port
/sbin/iptables -A INPUT -p TCP -s 0/0 -d 0/0 --dport 111 -j DROP	#BLOCK Sun
rpc/NFS
/sbin/iptables -A INPUT -p UDP -s 0/0 -d 0/0 --dport 111 -j DROP	#BLOCK Sun
rpc/NFS

#Setting the default Policies for the chains
/sbin/iptables -P INPUT DROP
/sbin/iptables -P FORWARD DROP
/sbin/iptables -P OUTPUT DROP

#Create some logging
/sbin/iptables -A INPUT -p igmp -j DROP
#/sbin/iptables -A INPUT -i ppp0  -j LOG --log-prefix "\iptables "
/sbin/iptables -A INPUT -j LOG --log-prefix "INPUT_DROP: "
/sbin/iptables -A OUTPUT -j LOG --log-prefix "OUTPUT_DROP: "

echo "1" > /proc/sys/net/ipv4/ip_dynaddr
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "2" > /proc/sys/net/ipv4/conf/all/rp_filter
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route
echo "0" > /proc/sys/net/ipv4/conf/all/accept_redirects
echo "32768 61000" > /proc/sys/net/ipv4/ip_local_port_range


