From: Vilmos Branyik <vbranyik@piopc.com>
Subject: Firewall script...
Date: Wed, 4 Jun 2003 19:19:08 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <30E7B49F378ED711AC0F00E02917CD8B0DBD@POLLY>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hello,

I haven't written many iptables scripts but would like your input on this
one.

What I am attempting to do is to only allow connection from my dial up
routers on my public subnet on ports 645 & 646. Then use NAT to forward to
my Radius server behind the firewall. 

Also I would allow ssh in from the public subnet only.

I welcome any input you may have.

$IPTABLES - location of iptables
$INTIF - Internal interface
$EXTIF - External interface
$INTNET - Internal subnet (address ie. 192.168.1.0/24)
$EXTNET - External subnet (local to us)
$EXTIP - External IP address

# Flush rules
$IPTABLES -P INPUT ACCEPT
$IPTABLES  -P OUTPUT ACCEPT
$IPTABLES -P FORWARD DROP
$IPTABLES -F
$IPTABLES -X
$IPTABLES -t nat -F
$IPTABLES -t nat -X
$IPTABLES -t mangle -F
$IPTABLES -t mangle -X

# Drop everything
$IPTABLES -A INPUT DROP

# Kill invalid packets (too short, illegal, zero length)
$IPTABLES -A INPUT -m unclean -j DROP
$IPTABLES -A FORWARD -m unclean -j DROP

# Kill invalid packets (illegal combinations of flags)
$IPTABLES -A INPUT -m state INVALID -j DROP
$IPTABLES -A FORWARD -m state INVALID -j DROP

# Allow connections from local interface
$IPTABLES -A INPUT -i lo -j ACCEPT

# Drop connections to lo from the outside
$IPTABLES -A INPUT -d 127.0.0.0/8 -j REJECT

# Allow traffic from the inside
$IPTABLES -A INPUT -i $INTIF -s $INTNET -j ACCEPT

# Reject anything from the outside claiming to be from the inside
$IPTABLES -A INPUT -i $EXTIF -s $INTNET -j REJECT

# Allow established connections
$IPTABLES -A INPUT -m state -state ESTABLISHED, RELATED -j ACCEPT

# Allow forwarding from the inside
$IPTABLES -A FORWARD -o $EXTIF -i $INTIF -j ACCEPT

# Allow replies coming in
$IPTABLES -A FORWARD -i $EXTIF -m state -state ESTABLISHED,RELATED -j ACCEPT

# Allow ssh from local external subnet
$IPTABLES -A INPUT -s $EXTNET -p tcp -dport 22 -j ACCEPT

# Block anything directly addresses to the internal net
$IPTABLES -A PREROUTING -t nat -i $EXTIF -d $INTIF -j DROP

# Start NAT

# Service at port 645 tcp
$IPTABLES -A FORWARD -i eth0 -o eth1 -p tcp --dport 645 -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 645 \
  -j DNAT --to $PORTFWIP:645

# Service at port 645 udp
$IPTABLES -A FORWARD -i eth0 -o eth1 -p udp --dport 645 -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p udp -d $EXTIP --dport 645 \
  -j DNAT --to $PORTFWIP:645

# Service at port 646 tcp
$IPTABLES -A FORWARD -i eth0 -o eth1 -p tcp --dport 646 -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 646 \
  -j DNAT --to $PORTFWIP:646

# Service at port 646 udp
$IPTABLES -A FORWARD -i eth0 -o eth1 -p udp --dport 646 -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p udp -d $EXTIP --dport 646 \
  -j DNAT --to $PORTFWIP:646

echo "   Enabling SNAT (MASQUERADE) functionality on $EXTIF"
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

Thanks for all your help.

Vilmos

