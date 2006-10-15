From: Wakko Warner <wakko@animx.eu.org>
Subject: Confusion about MAC address in FORWARD chain (iptables)
Date: Sun, 15 Oct 2006 13:00:14 -0400
Message-ID: <20061015170014.GC402@animx.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Please keep me in CC.

I've read the man page for iptables and added -j LOG to attempt to log the
failure I was seeing with no success.  I'm using the MAC match to control
access from one ethernet card (being that it's connected directly to a
wireless AP)

I have the following interfaces:
br0: enslaved eth0 and tap[01]
eth0: Local network
tap0: vpn to my other network
tap1: vpn for the laptop I use on wireless.
eth1: connected to the wireless ap.
ppp0: internet

I'm going to refer to IPs and MACs symbollically as I do not want the IPs to
be known.

IFACE=eth1

# This sets up the rules for INPUT and FORWARDING for the wireless interface
# This is excerpts from my script that is called by ifupdown.  I use insert
# instead of append so that these rules are guaranteed to be hit.
iptables -I INPUT 1 -j wireless-in -i "$IFACE"
iptables -I INPUT 2 -j DROP -i "$IFACE"
iptables -I FORWARD 1 -j wireless-in -i "$IFACE"
iptables -I FORWARD 2 -j DROP -i "$IFACE"

# wireless-in is supposed to only operate on packets coming from eth1
# This is why the forward rule above jumps to wireless-in with -i
# Anything coming from another interface to eth1 should be allowed.
# The for loop has a list of MAC addresses I'm willing to even consider
# listening too.  If they don't match, I ignore them.
# IF_WAP_MAC contains 1 mac address for the WAP
# IF_CLIENT_MAC contains 1 mac address for the laptop
iptables -N wireless-in
for mac in $IF_WAP_MAC $IF_CLIENT_MAC;do
	iptables -A wireless-in -j wireless-ip -m mac --mac-source $mac
done
iptables -A wireless-in -j DROP

# This defines the packets I'm willing to accept.  Basically, I want to
# allow ICMP (pings), the VPN port (obviously =), and port 80 so that I can
# configure the WAP.  This machine does not have X and the WAP requires a
# java compatible browser so I need to access that port.
iptables -N wireless-ip
iptables -A wireless-ip -j ACCEPT -p icmp
iptables -A wireless-ip -j ACCEPT -p udp --dport vpnport
iptables -A wireless-ip -j DROP -m conntrack --ctstate NEW
iptables -A wireless-ip -j ACCEPT -m conntrack --ctstate ESTABLISHED \
	-p tcp --sport 80

NOTE: br0.x.x and eth1.x.x are representations of IP addresses, not VLAN
interfaces below.  Also note that the network on br0 is not the same class B
as eth1

On the firewall machine, pinging eth1.1.2 works as expected.
On a machine on the local lan, pinging eth1.1.2 failes (source br0.2.1).
The problem is the MAC source matching.  My understanding is (layer 2):
Laptop mac to firewall eth1 mac.  This should be seen in the FORWARD chain
since it is coming from eth1.  Then from the firewall mac (br0) to the other
machine's mac.  I thought that the MAC address that the mac matching would
see is the mac of the laptop.  This confused me.  I just decided to add the
mac of br0 to the wireless-in (insert at the beginning) and everything is
working.  My problem is, I do not understand why.

I could have added -I FORWARD 3 -j ACCEPT  above, but I saw no reason to add
this and ping packet did reach the laptop.  A tcpdump -eni eth1 icmp shows
that the MAC of the laptop and eth1 and also shows that echorq and echo
packets are going to/coming from the laptop.  So I figured the problem was
with the input side of the FORWARD chain.  Adding logging just before the
DROP in wireless-in shows that packets were indeed getting dropped. 
Unfortunately, the logging does not log source/destination mac and I saw no
way to enable that.

Here's another problem I ran into.  Originally, I added the MAC of BR0
in the FORWARD chain instead of the wireless-in chain.  This caused ALL
blocking I had (DNAT'd packets) to be ignored.  Basically the packet was
-i ppp0 and -o br0 and the MAC source test of br0 caused it to accept all
traffic.

Can anyone explain/comment on this?  I'd like to understand why this
happens.

-- 
 Lab tests show that use of micro$oft causes cancer in lab animals
 Got Gas???

