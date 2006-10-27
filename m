From: Philip Pemberton <usenet06@philpem.me.uk>
Subject: Port forwarding fun (was NATing on a single interface?)
Date: Fri, 27 Oct 2006 20:33:59 +0100
Message-ID: <ehtmuq$nf9$1@sea.gmane.org>
References: <ehptuc$bo6$1@sea.gmane.org>	<ehql65$f08$1@sea.gmane.org>	<ehr6m6$v00$1@sea.gmane.org>	<ehrhod$17a$1@sea.gmane.org>	<ehsic6$has$1@sea.gmane.org>
	<eht5oc$mte$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <eht5oc$mte$1@sea.gmane.org>
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

Robert Nichols wrote:
> Well, you started out saying that your router's limitation of "a
> maximum of 16 firewall port-forward rules" was a problem, so I
> jumped to the conclusion that you were trying to do port forwarding.

What I've done is set my router's DMZ option to "10.1.0.1". In other words, 
everything my router receives is forwarded on to 10.1.0.1 -- the firewall box.

The firewall box is doing a pretty good job of handling the IP masquerading, 
but I'm having trouble getting port-forwarding to work. What I want to do is 
forward port 99 inbound to port 80 on 10.0.0.8. I've added a rule to do this 
(search for 'DNAT') but although it seems to accept the connection, I get a 
Receive Timeout error on the client machine, and the GRC ShieldsUp port 
scanner reports the port as 'stealthed' (i.e. machine is silently dropping 
packets).

The weird thing is, the target machine isn't even receiving the SYN, and I 
can't figure out why. If I change the DNAT rule to forward to 10.0.0.1:80 (the 
firewall box's HTTP server), the rule works fine. If I change the IP to 
10.0.0.8, it doesn't. I'm not seeing anything in syslog from my LOG rules 
either...

Here's my firewall script:

--8<-- cut here --8<--
#!/bin/sh
##############################################################################
# Simple single-NIC IPTables firewall script
# Philip Pemberton -- http://www.philpem.me.uk/
# Rev: 2006-10-27 20:13 BST
#
# Based on Arno's IPtables Firewall Script (<http://rocky.leidenuniv.nl>)
# and Brandon Hutchinson's Multi-Homed IPTables Firewall
# (<http://www.brandonhutchinson.com/multi_homed_iptables_firewall.html>)
##############################################################################
# TODO list:
#   - Get port forwarding working
#     - Allow pf to be configured eg. "1020>10.0.0.18" fwds port 1020 to
#       10.0.0.18; "1234>10.0.0.92:80" fwds port 1234 to port 80 on 10.0.0.92
#   - Coloured stdout log messages - headings white, "firewall up" green, etc.
#   - Easier configuration!
#   - Better documentation!

# Path to IPTables
IPT=/sbin/iptables

# TCP/UDP ports to open
OPEN_TCP="http https ssh"
OPEN_UDP=""

##############################################################################

echo "======================================================================="
echo "= IPTables firewall starting"
echo "======================================================================="

echo "Attempting to flush all rules in the filter table"
$IPT --flush
$IPT -t nat --flush
$IPT -t mangle --flush

# Accept packets from local loopback
echo "Accepting packets from local loopback"
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT

# Set default policy to DROP
echo "Setting default policy to DROP"
$IPT -P INPUT DROP
$IPT -P OUTPUT DROP
$IPT -P FORWARD DROP
$IPT -t nat -P PREROUTING ACCEPT 2>/dev/null
$IPT -t nat -P OUTPUT ACCEPT 2>/dev/null
$IPT -t nat -P POSTROUTING ACCEPT 2>/dev/null
$IPT -t mangle -P OUTPUT ACCEPT 2>/dev/null
$IPT -t mangle -P PREROUTING ACCEPT 2>/dev/null

# Enable some IPv4 tweaks
echo "Enabling some IPv4 security tweaks:"
echo "  Activating IP forwarding"
echo 1 > /proc/sys/net/ipv4/ip_forward

echo "  Enabling broadcast echo protection"
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

echo "  Disabling source-routed packets"
for f in /proc/sys/net/ipv4/conf/*/accept_source_route; do
   echo 0 > $f
done

echo "  Enabling TCP SYN cookie protection"
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

echo "  Disabling ICMP Redirect acceptance"
for f in /proc/sys/net/ipv4/conf/*/accept_redirects; do
   echo 0 > $f
done

echo "  Disabling sending of ICMP Redirect messages"
for f in /proc/sys/net/ipv4/conf/*/send_redirects; do
   echo 0 > $f
done

echo "  Enabling RP_Filter anti-spoof protection"
# Drop spoofed packets coming in on an interface, which if replied to,
# would result in the reply going out a different interface.
for f in /proc/sys/net/ipv4/conf/*/rp_filter; do
   echo 1 > $f
done

echo "  Logging packets with impossible addresses (martians)"
for f in /proc/sys/net/ipv4/conf/*/log_martians; do
   echo 1 > $f
done


echo "Dropping packets with invalid TCP state combinations"
# First list of TCP state flags lists the bits to be tested
# Second list of TCP state flags lists the bits that must be set to match test
#####
# All of the bits are cleared
$IPT -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
# SYN and FIN are both set
$IPT -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
# SYN and RST are both set
$IPT -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
# FIN and RST are both set
$IPT -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
# FIN is set without the expected accompanying ACK
$IPT -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP
# PSH is set without the expected accompanying ACK
$IPT -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP
# URG is set without the expected accompanying ACK
$IPT -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP

# Allow forwarding and masquerading on local net
echo "Allowing forwarding and masquerading on local net"
$IPT -t nat -A POSTROUTING -s 10.0.0.0/16 -d ! 10.0.0.0/16 -j MASQUERADE
$IPT -A FORWARD -i eth0 -o eth0 -s 10.0.0.0/16 -m state --state 
NEW,ESTABLISHED,RELATED -j ACCEPT
$IPT -A FORWARD -i eth0 -o eth0 -d 10.0.0.0/16 -m state --state 
ESTABLISHED,RELATED -j ACCEPT

# Also accept broadcast traffic for the global broadcast address (for DHCP)
echo "Accepting packets from the global broadcast address"
$IPT -A INPUT -i eth0 -d 255.255.255.255 -j ACCEPT

# Accept packets from the local LAN subnet
echo "Accepting packets from the local LAN subnet"
$IPT -A INPUT -i eth0 -s 10.0.0.0/16 -j ACCEPT
$IPT -A OUTPUT -o eth0 -d 10.0.0.0/16 -j ACCEPT
# TODO: use these instead? would these be better? need to rtfm...
#$IPT -A INPUT -i eth0 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
#$IPT -A OUTPUT -o eth0 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

# Allow packets to go out to the gateway
echo "Allowing outbound packets to gateway"
$IPT -A INPUT -i eth0 -d 10.1.0.0/16 -m state --state ESTABLISHED,RELATED  -j 
ACCEPT
$IPT -A OUTPUT -o eth0 -s 10.1.0.0/16 -j ACCEPT
$IPT -A OUTPUT -o eth0 -s 10.0.0.0/16 -j ACCEPT

# Open some TCP ports
echo -n "Opening TCP ports: "
for i in $OPEN_TCP; do
   echo -n "$i "
   $IPT -A INPUT -i eth0 -p tcp --dport $i -j ACCEPT
done
echo "[done]"

# Open some UDP ports
echo -n "Opening UDP ports: "
for i in $OPEN_UDP; do
   echo -n "$i "
   $IPT -A INPUT -i eth0 -p udp --dport $i -j ACCEPT
done
echo "[done]"

# Forward some ports
echo "Forwarding port 99 to 10.0.0.8:80"
$IPT -t nat -A PREROUTING -p tcp -m tcp --dport 99 -j DNAT --to-destination 
10.0.0.8:80

##############################################################################
# BIG FAT WARNING:
#   All IPTables rules MUST be added BEFORE the two logging rules, otherwise
#   you'll get "packet dropped" entries in syslog. Oh, and the packets will
#   get dropped too.
##############################################################################
# LOG rules stolen from Arno's IPTables Firewall Script, which can be
# downloaded from http://rocky.leidenuniv.nl/
echo "Logging dropped packets"
$IPT -A INPUT -m limit --limit 1/sec -j LOG --log-prefix "Dropped INPUT 
packet: " --log-level 7
$IPT -A OUTPUT -m limit --limit 1/sec -j LOG --log-prefix "Dropped OUTPUT 
packet: " --log-level 7

# Let the user know the firewall is running
echo "=== Firewall is up and running ==="
# end of firewall-script
--8<-- cut here --8<--

Can anyone see anything obviously wrong with this?

Thanks.
-- 
Phil.                         |  (\_/)  This is Bunny. Copy and paste Bunny
usenet06@philpem.me.uk        | (='.'=) into your signature to help him gain
http://www.philpem.me.uk/     | (")_(") world domination.
If mail bounces, replace "06" with the last two digits of the current year.


