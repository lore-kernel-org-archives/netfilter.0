From: Rob <netfilter@cloudtown.com>
Subject: IPTABLES config problem.
Date: Tue, 03 Dec 2002 15:56:30 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20021203155057.009e9020@cloudtown.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm confused why I can't get an IRC server running on ports 6661-6669 to 
run and allow
people to connect, along with running a Counter-Strike server on port 27015 
to work.
If you could help me.  I tried re-configuring the current IRC and CS lines 
in the INPUT
to use UDP but that didn't allow it either.

I thought I had it setup where anything on internal network would connect 
to server but
it's not seeing those either?  do I need an output line for each of these 
processes too?
Do they use TCP or UDP as a protocol?

Just upgraded from RH 6.2 to 8.0 and this IPTABLES thing has me confused.

sorry for the long email, but hope you can help.

Thanks,
Rob

--------------------------

#!/bin/sh
IPTABLES=/sbin/iptables
LSMOD=/sbin/lsmod
DEPMOD=/sbin/depmod
INSMOD=/sbin/insmod
GREP=/bin/grep
AWK=/bin/awk
SED=/bin/sed
IFCONFIG=/sbin/ifconfig
EXTIF="eth0"
INTIF="eth1"
EXTIP="my-ip"
INTNET="192.168.1.0/24"
INTIP="192.168.1.1/24"

UNIVERSE="0.0.0.0/0"

$DEPMOD -a

if [ -z "` $LSMOD | $GREP ip_tables | $AWK {'print $1'} `" ]; then
    $INSMOD ip_tables
fi

if [ -z "` $LSMOD | $GREP ip_conntrack | $AWK {'print $1'} `" ]; then
    $INSMOD ip_conntrack
fi

if [ -z "` $LSMOD | $GREP ip_conntrack_irc | $AWK {'print $1'} `" ]; then
    $INSMOD ip_conntrack_irc
fi

if [ -z "` $LSMOD | $GREP iptable_nat | $AWK {'print $1'} `" ]; then
    $INSMOD iptable_nat
fi

echo "  Enabling forwarding.."
echo "1" > /proc/sys/net/ipv4/ip_forward

$IPTABLES -P INPUT DROP
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT DROP
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -F -t nat

# Flush the user chain.. if it exists
if [ -n "`$IPTABLES -L | $GREP drop-and-log-it`" ]; then
    $IPTABLES -F drop-and-log-it
fi

# Delete all User-specified chains
$IPTABLES -X

# Reset all IPTABLES counters
$IPTABLES -Z

$IPTABLES -N drop-and-log-it
#$IPTABLES -A drop-and-log-it -j LOG --log-level info
$IPTABLES -A drop-and-log-it -j DROP

$IPTABLES -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT

# local interface, local machines, going anywhere is valid
#
$IPTABLES -A INPUT -i $INTIF -s $INTNET -d $UNIVERSE -j ACCEPT

# remote interface, claiming to be local machines, IP spoofing, get lost
#
$IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j drop-and-log-it

# external interface, from any source, for ICMP traffic is valid
#
$IPTABLES -A INPUT -i $EXTIF -p ICMP -s $UNIVERSE -d $EXTIP -j ACCEPT

# remote interface, any source, going to permanent PPP address is valid
#
$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -j ACCEPT

# Allow any related traffic coming back to the MASQ server in
#
$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -m state --state \
  ESTABLISHED,RELATED -j ACCEPT

# ----- Begin OPTIONAL Section -----

# HTTPd - Enable the following lines if you run an EXTERNAL WWW server
#
echo -e "      - Allowing EXTERNAL access to the WWW server"
$IPTABLES -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED \
  -p tcp -s $UNIVERSE -d $EXTIP --dport 80 -j ACCEPT

# SSH - Enable the following lines if you run an EXTERNAL SSH server
#
echo -e "      - Allowing EXTERNAL access to the SSH server"
$IPTABLES -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED \
  -p tcp -s $UNIVERSE -d $EXTIP --dport 22 -j ACCEPT

# IRC - Enable the following lines if you run an EXTERNAL IRC server
#
echo -e "      - Allowing EXTERNAL access to the IRC 6667 server"
$IPTABLES -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED \
  -p tcp -s $UNIVERSE -d $EXTIP --dport 6667 -j ACCEPT

# CSTRIKE - Enable the following lines if you run an EXTERNAL CS server
#
echo -e "      - Allowing EXTERNAL access to the C-Strike 27015 server"
$IPTABLES -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED \
  -p tcp -s $UNIVERSE -d $EXTIP --dport 27015 -j ACCEPT

# ----- End OPTIONAL Section -----

# Catch all rule, all other incoming is denied and logged.
#
$IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it

#######################################################################
# OUTPUT: Outgoing traffic from various interfaces.  All rulesets are
#         already flushed and set to a default policy of DROP.

# loopback interface is valid.
#
$IPTABLES -A OUTPUT -o lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT

# local interfaces, any source going to local net is valid
#
$IPTABLES -A OUTPUT -o $INTIF -s $EXTIP -d $INTNET -j ACCEPT

# local interface, any source going to local net is valid
#
$IPTABLES -A OUTPUT -o $INTIF -s $INTIP -d $INTNET -j ACCEPT

# outgoing to local net on remote interface, stuffed routing, deny
#
$IPTABLES -A OUTPUT -o $EXTIF -s $UNIVERSE -d $INTNET -j drop-and-log-it

# anything else outgoing on remote interface is valid
#
$IPTABLES -A OUTPUT -o $EXTIF -s $EXTIP -d $UNIVERSE -j ACCEPT

# ----- Begin OPTIONAL Section -----

# Catch all rule, all other outgoing is denied and logged.
#
$IPTABLES -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it

  #######################################################################
# FORWARD: Enable Forwarding and thus IPMASQ

echo "     - FWD: Allow all connections OUT and only existing/related IN"
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state ESTABLISHED,RELATED \
  -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT

# Catch all rule, all other forwarding is denied and logged.
#
$IPTABLES -A FORWARD -j drop-and-log-it


echo "     - NAT: Enabling SNAT (MASQUERADE) functionality on $EXTIF"
#
#More liberal form
#$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
#
#Stricter form
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP

#######################################################################
	


