From: "H. Blackwell" <h.w.blackwell@durham.ac.uk>
Subject: Routing multiple uplinks to a single gateway
Date: Sat, 13 Nov 2004 21:27:05 +0000
Message-ID: <41967C29.3070202@dur.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I am using devil Linux on as a router. In it are 3 Ethernet cards. eth0
10Mps connection to ISP, eth1 100Mps connection to internal network,
eth2 a second 10Mps connection to the same ISP, and with the same
gateway as eth0.

I have set up the tables as described in the advance routing Howto (see
link below)

http://www.tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.rpdb.multiple-links.html

However I cannot implement load balancing using the command

ip route add default scope global nexthop via gateway dev eth0 weight 1
~  nexthop via gateway dev eth2 weight 1

This appears in the main routing table, but the router stops allowing
computers on the internal network accessing the outside world.

The router functions correctly if I remove this route with

ip route add default via gateway dev eth0 (or eth2)

and only use one NIC.

I can ping both NICs externally and receive responses.

Additionally port forwarding set up in the firewall rules will only
function on the NIC set as the default  gateway. Although the second NIC
responds to pings, no port forwarded connections can be made to it.

Below are the firewall rules.

This has stumped me for 2 weeks or so any help is greatly appreciated.

Thanks

Chewwit


START FIREWALL RULES

# Path to executables
IPTABLES=/usr/sbin/iptables
MODPROBE=/sbin/modprobe

INT_DEV=eth1	# Internal/protected network.

# Stop forwarding while setting up.
echo "0" > /proc/sys/net/ipv4/ip_forward

# Optional Modules:
${MODPROBE} ip_conntrack_ftp
${MODPROBE} ip_nat_ftp
${MODPROBE} ip_conntrack_irc
${MODPROBE} ip_nat_irc
${MODPROBE} ip_conntrack_quake3
${MODPROBE} ip_nat_quake3

# Flush tables & setup Policy
${IPTABLES} -F  # flush chains
${IPTABLES} -X  # delete user chains
${IPTABLES} -Z	# zero counters
for t in `cat /proc/net/ip_tables_names`
do
	${IPTABLES} -F -t $t
	${IPTABLES} -X -t $t
	${IPTABLES} -Z -t $t
done
${IPTABLES} -P INPUT DROP	# Policy = DROP
${IPTABLES} -P OUTPUT DROP	#  Drop all packets that are
${IPTABLES} -P FORWARD DROP	#  not specifically accepted.

# Local interface - do not delete!
${IPTABLES} -A INPUT -i lo -j ACCEPT
${IPTABLES} -A OUTPUT -o lo -j ACCEPT

# We accept anything from the inside.
${IPTABLES} -A INPUT -i ${INT_DEV} -j ACCEPT
${IPTABLES} -A OUTPUT -o ${INT_DEV} -j ACCEPT

# Allow our firewall to connect.
${IPTABLES} -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
${IPTABLES} -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

# Allow Ping and friends.
${IPTABLES} -A INPUT  -p icmp -j ACCEPT
${IPTABLES} -A OUTPUT -p icmp -j ACCEPT

# Fast reject for Ident to eliminate email delays.
${IPTABLES} -A INPUT -p TCP --dport 113 -i eth0 -j REJECT --reject-with
tcp-reset
${IPTABLES} -A INPUT -p TCP --dport 113 -i eth2 -j REJECT --reject-with
tcp-reset

# Masquerading (aka NAT, PAT, ...)
${IPTABLES} -t nat -A POSTROUTING -o eth0 -j MASQUERADE
${IPTABLES} -t nat -A POSTROUTING -o eth2 -j MASQUERADE

# Quake3 Server.
#SERVER_IP=192.168.1.3	# Internal IP of server.
#PORT=27960		# 22 = SSH.  Change to 80 for web server, etc.
${IPTABLES} -A FORWARD -i eth2 -o ${INT_DEV} -p UDP --dport 27960 -m
state --state NEW,ESTABLISHED,RELATED -j ACCEPT
${IPTABLES} -A PREROUTING -t nat -p UDP -d STATICIPETH2 --dport 27960 -j
DNAT --to 192.168.1.3:27960

# Half Life Server.
#SERVER_IP=192.168.1.3	# Internal IP of server.
#PORT=27015		# 22 = SSH.  Change to 80 for web server, etc.
${IPTABLES} -A FORWARD -i eth2 -o ${INT_DEV} -p UDP --dport 27015 -m
state --state NEW,ESTABLISHED,RELATED -j ACCEPT
${IPTABLES} -A PREROUTING -t nat -p UDP -d STATICIPETH2 --dport 27015 -j
DNAT --to 192.168.1.3:27015

#MSN TO 1 COMPUTER
#SERVER_IP=192.168.1.3	# Internal IP of server.
#PORT=6891		# 22 = SSH.  Change to 80 for web server, etc.
${IPTABLES} -A FORWARD -i eth0 -o ${INT_DEV} -p TCP --dport 6891 -m
state --state NEW,ESTABLISHED,RELATED -j ACCEPT
${IPTABLES} -A PREROUTING -t nat -p TCP -d STATICIPTH0 --dport 6891 -j
DNAT --to 192.168.1.3:6891

#Remote Connection to 1 Computer
#SERVER_IP=192.168.1.3	# Internal IP of server.
#PORT=3389		# 22 = SSH.  Change to 80 for web server, etc.
${IPTABLES} -A FORWARD -i eth2 -o ${INT_DEV} -p TCP --dport 3389 -m
state --state NEW,ESTABLISHED,RELATED -j ACCEPT
${IPTABLES} -A PREROUTING -t nat -p TCP -d STATICIPETH2 --dport 3389 -j
DNAT --to 192.168.1.3:3389

#SSH Remote Connection
#SERVER_IP=192.168.1.2	# Internal IP of server.
#PORT=22		# 22 = SSH.  Change to 80 for web server, etc.
${IPTABLES} -A FORWARD -i eth2 -o ${INT_DEV} -p TCP --dport 22 -m state
- --state NEW,ESTABLISHED,RELATED -j ACCEPT
${IPTABLES} -A PREROUTING -t nat -p TCP -d STATICIPETH2 --dport 22 -j
DNAT --to 192.168.1.2:22

# Block invalid connections from the internet.
${IPTABLES} -A FORWARD -m state --state INVALID -i eth0 -j DROP
${IPTABLES} -A FORWARD -m state --state INVALID -i eth2 -j DROP

# Allow connections to the internet from the internal network.
${IPTABLES} -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
${IPTABLES} -A FORWARD -m state --state NEW -i ${INT_DEV} -j ACCEPT

# make interactive sesions a bit more interactive under load
${IPTABLES} -A PREROUTING -t mangle -p TCP --sport ssh -j TOS --set-tos
Minimize-Delay
${IPTABLES} -A PREROUTING -t mangle -p TCP --sport ftp -j TOS --set-tos
Minimize-Delay
${IPTABLES} -A PREROUTING -t mangle -p TCP --sport ftp-data -j TOS
- --set-tos Maximize-Throughput

# enable dynamic IP address following
echo 2 > /proc/sys/net/ipv4/ip_dynaddr

# stop some smurf attacks.
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

# Don't accept source routed packets.
echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route

# Syncookies
echo "1" > /proc/sys/net/ipv4/tcp_syncookies

# Stop IP spoofing,
for interface in /proc/sys/net/ipv4/conf/*/rp_filter; do
	echo "1" > $interface
done

# Stop ICMP redirect
for interface in /proc/sys/net/ipv4/conf/*/accept_redirects; do
	echo "0" > ${interface}
done

# Enable bad error message protection.
echo "1" > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

# Enabling IP forwarding.
echo "1" > /proc/sys/net/ipv4/ip_forward

END FIREWALL RULES
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFBlnwpp56x38tIhFoRAjGPAJ9WbmsfN7i0C19ndad16x2Vnb23QwCfXfI3
n3Lq4WHJxWU7gWNymMeVASg=
=v8Sa
-----END PGP SIGNATURE-----

