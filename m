From: "Nathan Cassano" <nathan@cjhunter.com>
Subject: RE: TCP delay
Date: Tue, 11 Jun 2002 15:00:27 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <00d901c21193$685c7670$2901a8c0@amos>
References: <20020611173448.GB21405@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020611173448.GB21405@cannon.eng.us.uu.net>
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


Okay folks,
	I've narrowed this problem down a bit. There is a delay between
the firewall and the external network when I telnet to ports 23 or 25 on
any host on the external network. The weird thing is that port 22 (ssh)
will give me a quick response. My only thought is that the state
tracking is slow when allowing packets back in.

I have confirmed that DNS is working A and PTR on all hosts tested.

Below is the relevant parts of the firewall boot script.

/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_state
/sbin/modprobe ipt_REJECT
/sbin/modprobe ipt_MASQUERADE

# Disable Smurf amplifier attacks
/bin/echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts 

# Disable ICMP redirect acceptance. ICMP redirects can be used to alter
your routing 
# tables, possibly to a bad end. 
/bin/echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects 

# Don't accept source routed packets. Attackers can use source routing
to generate 
# traffic pretending to be from inside your network, but which is routed
back along 
# the path from which it came, namely outside, so attackers can
compromise your 
# network. Source routing is rarely used for legitimate purposes. 
/bin/echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route 

# Enable bad error message protection. 
/bin/echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses 

###########################################
#
# Setup iptables rules
#

# Set all default Chain Policies to DROP

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

# Allow unlimited traffic on the loopback interface. 

$IPTABLES -A INPUT  -i lo -j ACCEPT 
$IPTABLES -A OUTPUT -o lo -j ACCEPT 

# Setup packet mangling for services

$IPTABLES -A OUTPUT -t mangle -p tcp --dport 22 -j TOS --set-tos
Minimize-Delay
$IPTABLES -A OUTPUT -t mangle -p tcp --dport 23 -j TOS --set-tos
Minimize-Delay
$IPTABLES -A OUTPUT -t mangle -p tcp --dport 80 -j TOS --set-tos
Minimize-Delay
$IPTABLES -A OUTPUT -t mangle -p tcp --dport 25 -j TOS --set-tos
Minimize-Delay

# Create chain targets segregated by the ethernet device's INPUTs and
OUTPUTs

$IPTABLES -N EXT_INPUT
$IPTABLES -N EXT_OUTPUT

# Direct traffic to go to their matching device input or output chain
targets

$IPTABLES -A INPUT -i $EXT_IFACE -j EXT_INPUT
$IPTABLES -A OUTPUT -o $EXT_IFACE -j EXT_OUTPUT

# Allow inbound connections to external device that are already
established
$IPTABLES -A EXT_INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow outbound traffic from external device
$IPTABLES -A EXT_OUTPUT -s $EXT_IP -j ACCEPT






