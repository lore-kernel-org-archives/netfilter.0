From: "unixsecurity" <unixsecurity@aagthosting.com>
Subject: IP TABLES CONFIGURATION
Date: Wed, 12 Jan 2005 11:09:39 -0800
Message-ID: <20050112190246.M21312@aagthosting.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I am setting up a server using linux and iptables as my firewall. The server 
handles http, https, ssh, ftp, smtp, pop3, mySQL and all the things a web 
server does. The server runs it's own firewall with no other firewall in 
front of it.

I have a script I am posting in this email. i would like to know if there is 
an IPTables expert out there that can tell me if my configuration is 
correct. If there is anything missing on my script please let me know.

# IPTABLES Firewall Example (you are here) 


# Red Hat Linux firewall using iptables
# Revised December, 2002
# configured by Dennis G. Allard and Don Cohen, http://oceanpark.com
# This script has been used on servers running Red Hat 7.3 and 8.0
#
# Permission to copy is granted provided that credit is given
# to the author and whatever HOWTOs are used to understand this
# stuff.
#
# No warranty is implied.  Use at your own risk!!

# Using this script
# -----------------
#
# I save this file as /etc/sysconfig/iptables-precursor
# and then source it and run iptables-save to create
# /etc/sysconfig/iptables, which is an input file
# consumed by the script /etc/rc.d/init.d/iptables,
# which in turn makes use of the script /sbin/iptables-restore.
#
# Before mucking with setting up iptables, you should
# disconnect the machine from the internet.  Examine
# and understand the current set of iptables rules
# before you reconnect to the internet.
#
# To configure the set of iptables rules:
#
#   /etc/rc.d/init.d/iptables stop
#   source /etc/sysconfig/iptables-precursor
#
# To save the current set of iptables rules for use at next reboot:
#   
#   iptables-save > /etc/sysconfig/iptables
#   
# To dynamically restart iptables after modifying /etc/sysconfig/iptables:
#
#   /etc/rc.d/init.d/iptables restart
#
# Note that /etc/rc.d/init.d/iptables is a script.  You can read it to
# gain understanding of how iptables uses iptables-restore to restore
# iptables firewall rules at reboot.
#
# To examine the current set of rules in effect:
#
#   /etc/rc.d/init.d/iptables status
#
# However, I prefer to show the current set of rules via:
#
#   iptables -nvL -t filter   
#   iptables -nvL -t nat
#
# or 
#
#   iptables -vL -t filter   
#   iptables -vL -t nat
#
#
# To configure iptables to be used at next system reboot:
#   
#   chkconfig --add iptables
#
# To see if iptables is currently configured to start at boot, do:
#   
#   chkconfig --list iptables
#
# (You might have to do chkconfig --del ipchains to remove ipchains)
#
# The rest of this file is derived from my old ipchains script.
#

# A word about routing
# --------------------
# 
# Note that this web page does not discuss routing decisions.  Routing
# (see the 'ifconfig' and 'route' commands) decides which interface an
# incoming packet will be delivered to, i.e. if a given packet will be
# 'input' to this machine or be 'forwarded' to some interface for
# delivery to another machine, say on an internal network.  You should
# have your routing configured before you attempt to configure your
# firewall.

# The network
# -----------
#
# This firewall is running on a gateway machine having multiple ethernet
# interfaces, a public one, eth0, which is a DSL connection to an ISP,
# and one or more internal ones, including eth1, which is assigned to
# 192.168.0.1, an IP number on my internal private network.  My public
# network has static IP numbers 66.14.136.144 through 66.14.136.148.
# Currently, all of my static IP numbers are assigned as virtual IPs to
# interface eth0 of the firewall machine itself.  For this reason, most
# of the rules below are INPUT rules.  Were I to route some of my public
# static IP numbers to interfaces on one or more machines inside the
# firewall on the internal network, I would modify certain rules to be
# FORWARD rules instead of INPUT rules.  I show some examples below of
# FORWARD rules.
#
# The gateway at my ISP is 66.14.136.1.  I run a few web servers on
# 66.14.136.148, a DNS server on 66.14.136.144, and sendmail (someday
# hopefully soon to be qmail) on 66.14.136.145.  I sometimes run dnscache
# on 66.14.136.145.
#
# Using this file in a more complex network would require some
# modifications. Particular attention would need to be given to using
# the right the IP numbers and interfaces, among other things. :-)

# Preliminaries
# -------------
#
# To permit machines internal to the network to be able to
# send IP packets to the outside world, enable IP Forwarding:
#
#   echo 1 > /proc/sys/net/ipv4/ip_forward
#
# Prevent SYN floods from consuming memory resources:
#
#   echo 1 > /proc/sys/net/ipv4/tcp_syncookies
#
# I place the above echo commands into /etc/rc.d/rc.local
# so that they will be executed at boot time.


# The basic idea of this firewall
# -------------------------------
#
# Provide rules that are applied in the following order:
#
# ACCEPT all UDP packets for certain UDP services
#
# Currently the only UDP connections I accept are to my secure DNS
# server, tinydns. For an explanation of why tinydns is secure, see:
# http://www.faqts.com/knowledge_base/view.phtml/aid/8739/fid/699.
#
# DENY all other UDP packets.
#
# ACCEPT SYN packets just for certain TCP services
#
# SYN packets are specified via the -syn flag in the input
# rules defined below.  Note that certain services can be
# further filtered by xinetd.
#
# DENY all other TCP SYN packets.
#
# ACCEPT all other TCP packets that are part of existing connections
#
# DENY all other TCP packets.
#
# In other words, we allow any TCP packet through that is part of an
# established TCP connection, but we are very selective in just which
# connections we permit to be made to start off with.
#
# A brief explanation of SYN packets goes as follows.  TCP connections
# are initiated via a hand shaking protocol between the client and server
# programs at either end of the connection.  The very first TCP packet
# is sent by the client to the server and is called a SYN packet,
# because it has the SYN flag set to 1 in the TCP packet header.  We
# only allow SYN packets for the specific servers running on specific
# ports of specific hosts.  Subsequently, we only permit further TCP
# packets in that are determined to be part of a connection whose
# initial SYN packet was already accepted and responded to by one of our
# servers.  This is done via 'Stateful Packet Inspection' provided by the
# netfilter functionality added to linux as of kernel 2.4.  By stopping all
# other packets in their tracks, we limit attempts to attack our internal
# network.
# 
# There are subtle ways that Denial of Service attacks can be performed
# if an attacker is able to somehow gain access to a machine inside our
# network or otherwise hijack a connection.  However, even in such
# cases, current research is leading to ways to greatly limit the effect
# of such attacks. For further reading, see: http://www.cs3-
inc.com/ddos.html.
#
# For detailed background reading about iptables, please refer to:
# http://www.netfilter.org/documentation/tutorials/blueflux/iptables-
tutorial.html
#


# begin oceanpark.com firewall rules (using iptables)
# ---------------------------------------------------

# Here we go...

# Configure default policies (-P), meaning default rule to apply if no
# more specific rule below is applicable.  These rules apply if a more 
specific rule below
# is not applicable.  Defaults are to DROP anything sent to firewall or 
internal
# network, permit anything going out.
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Flush (-F) all specific rules
iptables -F INPUT 
iptables -F FORWARD 
iptables -F OUTPUT 
# iptables -F -t nat

# The rest of this file contains specific rules that are applied in the order
# listed.  If none applies, then the above policy rules are used.

# Forward all packets from eth1 (internal network) to eth0 (the internet).
# iptables -A FORWARD -i venet0 -o eth0 -j ACCEPT

# Forward packets that are part of existing and related connections from 
eth0 to eth1.
# iptables -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELATED -
j ACCEPT

# Permit packets in to firewall itself that are part of existing and related 
connections.
# iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

# Note, in the above two rules, a connection becomes ESTABLISHED in the
# iptables PREROUTING chain upon receipt of a SYNACK packet that is a
# response to a previously sent SYN packet. The SYNACK packet itself is
# considered to be part of the established connection, so no special
# rule is needed to allow the SYNACK packet itself.

# Allow all inputs to firewall from the internal network and local interfaces
# iptables -A INPUT -i venet0 -s 0/0 -d 0/0 -j ACCEPT
# iptables -A INPUT -i lo -s 0/0 -d 0/0 -j ACCEPT


# Enable SNAT functionality on eth0
#
# SNAT is used to map private IP numbers of interfaces on the internal LAN 
to one of
# my public static IP numbers.  SNAT performs this mapping when a client 
running
# on one of the internal machines initiates a TCP connection (SYN) through 
eth0.

# iptables -A POSTROUTING -t nat -s 192.168.0.0/24 -o eth0 -j SNAT --to-
source 66.14.136.144

# Alternative to SNAT -- MASQUERADE
#
# If your firewall has a dynamic IP number because it connects to the
# internet itself via DHCP, then you probably cannot predict what the IP
# number is of your firewall's interface connected to the internet. In 
# this case, you need a rule like the following that assigns the (an) IP
# number associated with eth0 to outgoing connections without you needing
# to know in advance (at time of writing this rule) what that IP number is:
#
# iptables -A POSTROUTING -t nat -o eth0 -j MASQUERADE
#
# Note that the above SNAT and MASQUERADE rules are applicable
# independent of how a host on the internal network is assigned its own
# internal IP number.  The host could be assigned a static IP number on
# an internal nonpublic network (e.g. 10. or 192.168.)  or it could be
# itself assigned a dynamic IP number from your own DHCP server running
# on the firewall, or it could even have a public static IP number.
# However, it seems unlikely that one would want to assign a public IP
# number to a host and then proceed to hide that number from the public.

# Deny any packet coming in on the public internet interface eth0
# which has a spoofed source address from our local networks:

# iptables -A INPUT -i eth0 -s 66.14.136.144/32 -j DROP
# iptables -A INPUT -i eth0 -s 66.14.136.145/32 -j DROP
# iptables -A INPUT -i eth0 -s 66.14.136.146/32 -j DROP
# iptables -A INPUT -i eth0 -s 66.14.136.147/32 -j DROP
# iptables -A INPUT -i eth0 -s 66.14.136.148/32 -j DROP
# iptables -A INPUT -i eth0 -s 192.168.0.0/24 -j DROP
# iptables -A INPUT -i eth0 -s 127.0.0.0/8 -j DROP

# Accept all tcp SYN packets for protocols SMTP, HTTP, HTTPS, and SSH:
# (SMTP connections are further audited by our SMTP server)
iptables -A INPUT -p tcp -s 0/0 -d 65.19.177.166 --destination-port 1 --syn -
j ACCEPT
iptables -A INPUT -p tcp -s 0/0 -d 65.19.177.166 --destination-port 20 --
syn -j ACCEPT
iptables -A INPUT -p tcp -s 0/0 -d 65.19.177.166 --destination-port 21 --
syn -j ACCEPT
iptables -A INPUT -p tcp -s 0/0 -d 65.19.177.166 --destination-port 22 --
syn -j ACCEPT
iptables -A INPUT -p tcp -s 0/0 -d 65.19.177.166 --destination-port 25 --
syn -j ACCEPT
iptables -A INPUT -p tcp -s 0/0 -d 65.19.177.166 --destination-port 43 --
syn -j ACCEPT
iptables -A INPUT -p tcp -s 0/0 -d 65.19.177.166 --destination-port 53 --
syn -j ACCEPT
iptables -A INPUT -p tcp -s 0/0 -d 65.19.177.166 --destination-port 63 --
syn -j ACCEPT
iptables -A INPUT -p tcp -s 0/0 -d 65.19.177.166 --destination-port 70 --
syn -j ACCEPT
iptables -A INPUT -p tcp -s 0/0 -d 65.19.177.166 --destination-port 80 --
syn -j ACCEPT
iptables -A INPUT -p tcp -s 0/0 -d 65.19.177.166 --destination-port 110 --
syn -j ACCEPT
iptables -A INPUT -p tcp -s 0/0 -d 65.19.177.166 --destination-port 443 --
syn -j ACCEPT
iptables -A INPUT -p tcp -s 0/0 -d 65.19.177.166 --destination-port 465 --
syn -j ACCEPT
iptables -A INPUT -p tcp -s 0/0 -d 65.19.177.166 --destination-port 3306 --
syn -j ACCEPT

# Notice that the above rules are all INPUT rules.  My current network
# does not require me to make use of FORWARD rules, since I run all
# publicly accessible servers directly on my firewall machine.  But I
# promised above in the description of my network to give examples of
# rules used when there are servers running on machines on the internal
# network.  Following are examples of FORWARD rules I would use if I ran
# mail, web, and ssh servers on machines on the internal network inside
# the firewall.
#
# iptables -A FORWARD -p tcp -s 0/0 -d 66.14.136.145/32 --destination-port 
25 --syn -j ACCEPT
# iptables -A FORWARD -p tcp -s 0/0 -d 0/0 --destination-port 80 --syn -j 
ACCEPT
# iptables -A FORWARD -p tcp -s 0/0 -d 0/0 --destination-port 443 --syn -j 
ACCEPT
# iptables -A FORWARD -p tcp -s 0/0 -d 0/0 --destination-port 22 --syn -j 
ACCEPT
#
# The first of the above four rules would be used if my routing
# delivered packets having destination 66.14.136.145 to any interface
# connected to my internal network. The second through fourth of the
# above four rules would be used if I my routing delivered packets
# having some public static IP as destination to some internal interface
# running a server listening to HTTP, HTTPS, or SSH ports.  The
# difference between an INPUT rule and a FORWARD rule is that an INPUT
# rule applies to packets that are 'input' to this machine (the machine
# on which these iptables rules are installed), whereas a FORWARD rule
# applies to packets that are being 'fowarded', i.e. to packets that are
# passing through this machine to some other machine, such as a machine
# on my internal network.
# 
# If I ran my mail server on an internal machine, I would no longer
# need my previous INPUT rule for 66.14.136.145 and would use the above
# FORWARD rule instead

# Finally, DENY all connection requests to any UDP port not yet provided
# for and all SYN connection requests to any TCP port not yet provided
# for.  Using DENY instead of REJECT means that no 'ICMP port
# unreachable' response is sent back to the client attempting to
# connect.  I.e., DENY just ignores connection attempts.  Hence, use of
# DENY causes UDP connection requests to time out and TCP connection
# requests to hang.  Hence, using DENY instead of REJECT may have
# the effect of frustrating attackers due to increasing the amount of
# time taken to probe ports.

# Note that there is a fundamental difference between UDP and TCP
# protocols.  With UDP, there is no 'successful connection' response.
# With TCP, there is.  So an attacking client will be left in the dark
# about whether or not the denied UDP packets arrived and will hang
# waiting for a response from denied TCP ports.  An attacker will not
# be able to immediately tell if UDP connection requests are simply
# taking a long time, if there is a problem with connectivity between
# the attacking client and the server, or if the packets are being
# ignored.  This increases the amount of time it takes for an attacker
# to scan all UDP ports.  Similarly, TCP connection requests to denied
# ports will hang for a long time.  By using REJECT instead of DENY, you
# would prevent access to a port in a more 'polite' manner, but give out
# more information to wannabe attackers, since the attacker can positively
# detect that a port is not accessible in a small amount of time from
# the 'ICMP port unreachable' response.

#-A input -s 0/0 -d 0/0 -p udp -j DENY
#-A input -s 0/0 -d 0/0 -p tcp -y -j DENY

iptables -A INPUT -s 0/0 -d 0/0 -p udp -j DROP
iptables -A INPUT -s 0/0 -d 0/0 -p tcp --syn -j DROP


# end oceanpark.com firewall rules (using iptables)
# -------------------------------------------------

 


--
Greg Tibbetts


