From: Mike McLean <libolt@libolt.net>
Subject: NAT slowdown
Date: 13 May 2003 18:15:30 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052874930.2090.6.camel@tbird>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-DZ34v1+CSIvUdB5QjPGH"
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
To: netfilter@lists.samba.org


--=-DZ34v1+CSIvUdB5QjPGH
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I'm using iptables for NAT on 5 networks at different locations.  I'm
using almost exactly the same rules at each location.  The only
difference being the ports that are opened.  4 of the 5 locations have
no problems and are functioning properly.

However, at the 5th location I'm seeing a slowdown when traffic passes
through the NATed box vs direct connection.  Each location is on a
fractional T1 line that the NATed box connects directly to.

All systems run Debian Woody with the default iptables package:
1.2.6a-5.  I am wondering if there is something I am doing wrong.  I
have tried totally replacing the NATed system, ethernet cards and,
ethernet cables and even the switch that connects all the systems.

Here's my iptables script,

Any help is appreciated,

Mike


IPTABLES script:



--=-DZ34v1+CSIvUdB5QjPGH
Content-Disposition: attachment; filename=firewall
Content-Type: text/plain; name=firewall; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 7bit

echo "Loading IPTABLES modules"
echo -en "ip_tables, "
/sbin/insmod ip_tables

echo -en "ip_conntrack, "
/sbin/insmod ip_conntrack

echo -en "ip_conntrack_ftp, "
/sbin/insmod ip_conntrack_ftp

echo -en "ip_conntrack_irc, "
/sbin/insmod ip_conntrack_irc

echo -en "iptable_nat, "
/sbin/insmod iptable_nat

echo -en "ip_nat_ftp, "
/sbin/insmod ip_nat_ftp

# Flush iptables
iptables -F
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables -F -t mangle
iptables -F -t nat
iptables -X

#Policies

#iptables -P INPUT DROP
#iptables -P OUTPUT ACCEPT
#iptables -P FORWARD ACCEPT

# Blocking
iptables -N block
iptables -A block -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A block -m state --state NEW -i ! eth0 -j ACCEPT
iptables -A block -j DROP
iptables -A INPUT -f -i eth0 -j DROP

# Port Blocking
iptables -A OUTPUT -o eth0 -p tcp --dport 31337 -j DROP 
iptables -A OUTPUT -o eth0 -p tcp --dport 31335 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 27444 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 27665 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 20034 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 9704 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 137:139 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 1433 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 2049 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 5432 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 5999 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 6063 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 5900:5910 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 9 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 13 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 25 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 37 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 113 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 515 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 1024 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 863 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 111 -j DROP

iptables -A OUTPUT -o eth0 -p tcp --sport 31337 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 31335 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 27444 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 27665 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 20034 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 9704 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 137:139 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 1433 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 2049 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 5432 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 5999 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 6063 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 5900:5910 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 9 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 13 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 25 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 37 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 113 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 515 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 1024 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 111 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --sport 863 -j DROP
#iptabls
# Ports Opened
iptables -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT
# NAT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# set ip forwarding policy
echo 1 > /proc/sys/net/ipv4/ip_forward

# setup SYN cookie protection

#echo 1 > /proc/sys/net/ipv4/tcp_syncookies

--=-DZ34v1+CSIvUdB5QjPGH--


