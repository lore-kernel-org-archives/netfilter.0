From: Wes Crucius <wesc@wi.rr.com>
Subject: Firewall won't let me out, please help
Date: 10 Feb 2004 23:22:34 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076476954.5436.33.camel@KilliansRed>
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

I have a fedora core 1 machine with two Realtek Ethernet cards
installed.  The system seems to be a bit flakey, but is basically
working.  For example, if either of the two ethernet cables is not
connected to a live node, the system won't bring up either interface on
boot up.  Also, the PS/2 keyboard won't work then?!  If both cables are
in, (external) eth0 gets an IP from the cable modem and (internal) eth1
gets the proper assigned static IP.  From another machine on the
internal side, both IP's are pingable, and ssh and httpd are
accessible.  The problem is the Masquerade doesn't seem to work at all. 
My 99.9% plagarized script is below.  Can anyone see why the firewall
won't let SNAT?/Masquerade through for me as I'd like it to?  I thought
I fully understood this script, but clearly I'm missing something... 
With the firewall logging on, I don't appear to get any log messages
about dropped packets from the inside interface, and mozilla, for
example, reports "connection refused".  Rdesktop reports a similar error
( no route?).

Thanks for any thoughts,
Wes

yes, ip forwarding is on:
#cat /proc/sys/net/ipv4/ip_forward
1

#!/bin/sh
#
# Set an absolute path to IPTABLES and define the interfaces.
#
IPTABLES="/sbin/iptables"
#
# OUTSIDE is the outside or untrusted interface that connects to the
Internet
# and INSIDE is, well that ought to be obvious. 
#
OUTSIDE=eth0
INSIDE=eth1
INSIDE_IP=10.0.0.1
#
# Clear out any existing firewall rules, and any chains that might have
# been created. Then set the default policies.
#
$IPTABLES -F
$IPTABLES -F INPUT
$IPTABLES -F OUTPUT
$IPTABLES -F FORWARD
$IPTABLES -F -t mangle
$IPTABLES -F -t nat
$IPTABLES -X
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT
#
# Begin setting up the rulesets. First define some rule chains to handle
# exception conditions. These chains will receive packets that we aren't
# willing to pass. Limiters on logging are used so as to not to swamp
the
# firewall in a DOS scenario.
#
# silent       - Just drop the packet
# tcpflags     - Log packets with bad flags, most likely an attack
# firewalled   - Log packets that that we refuse, possibly from an
attack
# 
$IPTABLES -N silent
$IPTABLES -A silent -j DROP

$IPTABLES -N tcpflags
#$IPTABLES -A tcpflags -m limit --limit 15/minute -j LOG --log-prefix
TCPflags:
$IPTABLES -A tcpflags -j DROP

$IPTABLES -N firewalled
#$IPTABLES -A firewalled -m limit --limit 15/minute -j LOG --log-prefix
Firewalled:
$IPTABLES -A firewalled -j DROP
#
# Use  NPAT if you have a dynamic IP. Otherwise comment out the
following
# line and use the Source NAT below.
#
$IPTABLES -t nat -A POSTROUTING -o $OUTSIDE -j MASQUERADE
#
# Use Source NAT if to do the NPAT you have a static IP or netblock.
# Remember to change the IP to be that of your OUTSIDE NIC.
#
#$IPTABLES -t nat -A POSTROUTING -o $OUTSIDE -j SNAT --to 1.2.3.4
#
# These are all TCP flag combinations that should never, ever, occur in
the
# wild. All of these are illegal combinations that are used to attack a
box
# in various ways.
#
$IPTABLES -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -j tcpflags
$IPTABLES -A INPUT -p tcp --tcp-flags ALL ALL -j tcpflags
$IPTABLES -A INPUT -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j
tcpflags
$IPTABLES -A INPUT -p tcp --tcp-flags ALL NONE -j tcpflags
$IPTABLES -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j tcpflags
$IPTABLES -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j tcpflags
#
# Allow selected ICMP types and drop the rest.
#
$IPTABLES -A INPUT -p icmp --icmp-type 0 -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type 3 -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type 11 -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type 8 -m limit --limit 1/second -j
ACCEPT
$IPTABLES -A INPUT -p icmp -j firewalled
#
# If you want to be able to connect via SSH from the Internet
# uncomment the next line.
#
$IPTABLES -A INPUT -i $OUTSIDE -d 0/0 -p tcp --dport 22 -j ACCEPT
#
# If you want to be able to connect via HTTP from the Internet
# uncomment the next line.
#
$IPTABLES -A INPUT -i $OUTSIDE -d 0/0 -p tcp --dport 80 -j ACCEPT
#
# If you want to be able to connect via HTTPS from the Internet
# uncomment the next line.
#
$IPTABLES -A INPUT -i $OUTSIDE -d 0/0 -p tcp --dport 443 -j ACCEPT
#
# The loopback interface is inheritly trustworthy. Don't disable it or
# a number of things on the firewall will break. 
#
$IPTABLES -A INPUT -i lo -j ACCEPT
#
# Uncomment the following  if the inside machines are trustworthy and
# there are services on the firewall, like DNS, web, etc., that they
need to access.
# And remember to change the  IP to be that of the INSIDE interface of
the firewall.
#
$IPTABLES -A INPUT -i $INSIDE -d $INSIDE_IP -j ACCEPT
#
# Allow packets that are part of an established connection to pass
# through the firewall. This is required for normal Internet activity
# by inside clients.
#
$IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
#
# Silently drop any SMB traffic. We've slipped the surly bonds of
windows
# and are dancing on the silvery wings of Linux, so don't leak that
windows trash.
#
$IPTABLES -A INPUT -p udp --sport 137 --dport 137 -j silent
$IPTABLES -A INPUT -p udp --sport 138 --dport 138 -j silent
$IPTABLES -A INPUT -p udp --sport 139 --dport 139 -j silent
$IPTABLES -A INPUT -p udp --sport 445 --dport 445 -j silent
#
# Anything that hasn't already matched gets logged and then dropped.
#
$IPTABLES -A INPUT -j firewalled



