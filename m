From: Marcel Koppe <m.koppe@lrz.tu-muenchen.de>
Subject: problem with recent iptables and ftp-server in dmz
Date: Thu, 20 Jan 2005 16:29:40 +0100
Message-ID: <200501201629.40493.m.koppe@lrz.tu-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,

till today I've used a firewallscript on a "SuSE Linux 7.1" system based on=
=20
iptables 1.2.6a. (script is at the end of this message)

Today I've created a new firewallsystem on a "SuSE Linux 9.2" system based =
on=20
iptabels 1.2.11.

It seemed to work without any problems like the old firewall till I tried t=
o=20
use ftp on my ftpserver on the dmz from outside the network.

The ftpserver asks for a username and password which means that the routing=
=20
works to the dmz but if I type ls and it changes to "extendes passive mode"=
=20
I'm getting a timeout error from the "real" ip adress of the ftp server.

Thats strange because I'm sure that all preferences are the same on the new=
=20
machine as on the old machine. (networkdevices are in the same order too)

I would be very grateful if anyone can help me find a way to fix this probl=
em.

kind regards

Marcel
=2D-=20
UNIX Administrator
EDV Nuklearmedizin
Klinikum rechts der Isar der TU M=FCnchen
Ismaninger Stra=DFe 22 BAU 557
81675 M=FCnchen


=46irewallscript (IPs removed):

#!/bin/bash

# Firewallscript for the nuc-dmz-firewall
# gewrzt, zusammengestellt und abgeschmeckt von Mathias von Bredow, Regeln=
=20
teilweise bernommen vom=20
# Original, authored by Jan und Andreas

# Setting some variables
# if you call this script with -debug, logging for dropped packets will be=
=20
enabled

=46W_LAN_IP=3D"x.x.x.x" 				# That's the internal Internet-IP from the fire=
wall
LAN_IP=3D"x.x.x.x/25"
LAN_BCAST_ADRESS=3D"x.x.x.x/25"		# Our internal broadcast adress
LAN_IFACE=3D"eth1"				# Our internal LAN is connected on eth1 on the firewa=
ll

=46W_INET_IP=3D"x.x.x.x"			# That's the IP of our firewall on the internet
INET_IFACE=3D"eth0"				# The internet is connected to eth0 on the firewall

HTTP_IP=3D"x.x.x.x"				# That's the IP our WWW and FTP server will be reach=
able=20
from the outside
DMZ_HTTP_IP=3D"x.x.x.x" 			# That's the real adress of our WWW server
DMZ_FTP_IP=3D"x.x.x.x" 			# That's the real adress of our FTP server
DMZ_IP=3D"x.x.x.x/24"
=46W_DMZ_IP=3D"x.x.x.x" 				# That's the adress of the firewall in the DMZ
DMZ_IFACE=3D"eth2"				# The DMZ is connected to eth2 on the firewall

LO_IP=3D"127.0.0.1/32"				# Loopback adress
LO_IFACE=3D"lo"					# Loopback device

LRZ_TIME_SERVER=3D"x.x.x.x/32"		# That's the time server in LRZ

IPTABLES=3D"/usr/local/sbin/iptables"		# Path to iptables
#IPTABLES=3D"iptables"
CHAIN_POLICY=3D"DROP"				# Default policy of the chains

# Including the nice colored Tags
=2E /etc/rc.status

########################################################
# set kernel switches
echo Setting kernel switches ...

# activate IP-Forwarding
echo "1" > /proc/sys/net/ipv4/ip_forward

# do for each NIC
for IF in $LAN_IFACE $INET_IFACE $DMZ_IFACE ; do
# Activate source routing
	echo "1" > /proc/sys/net/ipv4/conf/$IF/rp_filter
# switch off accept_redirects
	echo "0" > /proc/sys/net/ipv4/conf/$IF/accept_redirects
# don't accept BOOTP-packets
	echo "0" > /proc/sys/net/ipv4/conf/$IF/bootp_relay
# log packets with impossible ip-addresses
done
# einige andere Einstellungen, nachzulesen=20
unter /usr/src/linux/Documentation/networking/ip-sysctl.txt
echo "5" > /proc/sys/net/ipv4/icmp_destunreach_rate
echo "5" > /proc/sys/net/ipv4/icmp_echoreply_rate
echo "5" > /proc/sys/net/ipv4/icmp_paramprob_rate
echo "10" > /proc/sys/net/ipv4/icmp_timeexceed_rate

echo $rc_done_up

# Ok, let's start

# Cleaning stuff, setting policies and creating new chains

echo Flushing rules

$IPTABLES -F
$IPTABLES -t nat -F
$IPTABLES -X

echo $rc_done_up

echo Setting policies to $CHAIN_POLICY

$IPTABLES -P INPUT $CHAIN_POLICY
$IPTABLES -P OUTPUT $CHAIN_POLICY
$IPTABLES -P FORWARD $CHAIN_POLICY

echo $rc_done_up

echo "Adding chains:"

# Chain all_allowed:
# Just for routing pourposes between LAN and the rest of the world

echo "Setting up all_allowed(ALL)..."

$IPTABLES -N all_allowed
$IPTABLES -A all_allowed -j ACCEPT

# Chain destroy:
# Drops every packet that has the misfortune to be sent through

echo "Setting up destroy(ALL)..."

$IPTABLES -N destroy
$IPTABLES -A destroy -j DROP
echo $rc_done_up

# Chain logging:
# This Chain logs tcp, udp and imcp separate (in case of "-debug") and call=
s=20
the chain destroy
# that means everything sent in here will be dropped

echo "           logging(TCP,UDP,IMCP)..."
$IPTABLES -N logging
if test "$1" =3D "-debug"; then
        $IPTABLES -A logging -P TCP -m log --log-prefix "logging TCP DENY:"
        $IPTABLES -A logging -p UDP -m log --log-prefix "logging UDP DENY:"
        $IPTABLES -A logging -p ICMP -m log --log-prefix "logging ICMP DENY=
:"
fi
$IPTABLES -A logging -j destroy
echo $rc_done_up


# Chain tcp_allowed:=20
# - TCP packets with SYN flag are accepted
# - TCP connections, that are related or established are accepted.
# This chain is ment to be used to regulate the flow of packets from the=20
OUTSIDE to the DMZ

echo "           tcp_allowed(TCP)..."
$IPTABLES -N tcp_allowed
$IPTABLES -A tcp_allowed -p TCP --syn -m state --state NEW -j ACCEPT
$IPTABLES -A tcp_allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACC=
EPT
$IPTABLES -A tcp_allowed -p TCP -j logging
echo $rc_done_up

# Chain udp_allowed:
# - All UDP packets will be accepted

echo "           udp_allowed(UDP)..."
$IPTABLES -N udp_allowed
$IPTABLES -A udp_allowed -p UDP -m state --state NEW,ESTABLISHED,RELATED -j=
=20
ACCEPT
$IPTABLES -A udp_allowed -p UDP -j logging
echo $rc_done_up

#Chain limiting:
# Limits the amount of answered IMCP packets of 3/s to prevent DOS attack

echo "           limiting(IMCP)"
$IPTABLES -N limiting
$IPTABLES -A limiting -p ICMP -s 0/0 -m limit --limit 3/second --limit-burs=
t 3=20
=2D-icmp-type 0 -j ACCEPT
$IPTABLES -A limiting -p ICMP -s 0/0 -m limit --limit 3/second --limit-burs=
t 3=20
=2D-icmp-type 3 -j ACCEPT
$IPTABLES -A limiting -p ICMP -s 0/0 -m limit --limit 3/second --limit-burs=
t 3=20
=2D-icmp-type 11 -j ACCEPT
$IPTABLES -A limiting -p ICMP -s 0/0 -m limit --limit 3/second --limit-burs=
t 3=20
=2D-icmp-type 8 -j ACCEPT
$IPTABLES -A limiting -p ICMP -j logging
echo $rc_done_up

# Setting up NAT (POSTROUTING) from internal Internet to external Internet =
and=20
DMZ and Internet
# That means: Everything going out to the Inet Interface gets the IP of the=
=20
=46irewall on the Internet side
# Everything that come out on the DMZ Interface gets the IP from the Firewa=
ll=20
on the DMZ side

echo "Setting up NAT (POSTROUTING) between DMZ, internal- and internet..."
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to $FW_INET_IP
echo $rc_done_up

# Setting up NAT (PREROUTING) including DROP of some spoofed packets

echo "- Dropping possibly spoofed packets in NAT (PREROUTING)..."
# packets from our internal networks and some other predefined networks can=
not=20
reach the outside of the firewall with their internal adresses. So all=20
packets with these IP adresses will be dropped
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 192.168.0.0/16 -j DROP
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 10.0.0.0/8 -j DROP
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 172.16.0.0/12 -j DROP
# Packets with the IP of the firewall are not allowed to enter via the=20
Internetinterface.=20
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s $FW_INET_IP -j DROP
# Packets with the IP of the internal LAN will not enter from the outside
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s $LAN_IP -j DROP
# Packets with the IP of the DMZ will not enter from the outside
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s $DMZ_IP -j DROP
echo $rc_done_up

echo "- Starting NAT (PREROUTING) $HTTP_IP to DMZ"
echo "    icmp..."
$IPTABLES -t nat -A PREROUTING -p ICMP -i $INET_IFACE -d $HTTP_IP -j DNAT=20
=2D-to-destination $DMZ_HTTP_IP
echo $rc_done_up

echo "    http..."
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP_IP --dport 80=
 -j=20
DNAT --to-destination $DMZ_HTTP_IP
echo $rc_done_up

echo "    https..."
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP_IP --dport 44=
3=20
=2Dj DNAT --to-destination $DMZ_HTTP_IP
echo $rc_done_up

echo "    smtp..."
#$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP_IP --dport 2=
5=20
=2Dj DNAT --to-destination $DMZ_HTTP_IP #MvB
echo $rc_unused

echo "    ftp..."
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP_IP --dport 20=
 -j=20
DNAT --to-destination $DMZ_FTP_IP #MvB
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP_IP --dport 21=
 -j=20
DNAT --to-destination $DMZ_FTP_IP #MvB
echo $rc_done_up

# there's the question if this is really necessary... with more time i have=
 to=20
try commenting theses two lines out :)
echo "    Upper Ports for TCP..."
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP_IP --dport=20
1023:65535 -j DNAT --to-destination $DMZ_FTP_IP  #MvB
echo $rc_done_up
echo "    Upper Ports for UDP..."
$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $HTTP_IP --dport=20
1023:65535 -j DNAT --to-destination $DMZ_HTTP_IP  #MvB
echo $rc_done_up

# Setting up the FORWARD chain

# packets, that are NEW but have no SYN bit set, will be destroyed

echo Setting up forward chain:
echo "- Drop illegal packets"
$IPTABLES -A FORWARD -p tcp ! --syn -m state --state NEW -j logging
echo $rc_done_up

# Allow time synchronization between LRZ and HTTP server
echo "- Time synchronisation between HTTP server and LRZ Timeserver"
$IPTABLES -A FORWARD -p TCP -i $DMZ_IFACE -o $INET_IFACE --dport 123 -d=20
$LRZ_TIME_SERVER -j tcp_allowed=20
echo $rc_done_up

# Accept only established or related connections
# Allow FTP=20
# smtp
# dns
echo "- Setting up forwarding of protocols and ports"
echo "    smtp..."
$IPTABLES -A FORWARD -p TCP --dport 25 -j tcp_allowed
echo $rc_done_up

echo "    dns..."
$IPTABLES -A FORWARD -p UDP -i $DMZ_IFACE -o $INET_IFACE --dport 53 -m stat=
e=20
=2D-state NEW,ESTABLISHED,RELATED  -j udp_allowed
$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE --sport 53 --dport=
=20
1023:65535 -j udp_allowed
echo $rc_done_up

echo "    Forward established and related packets (TCP) to internet..."
$IPTABLES -A FORWARD -p TCP -i $DMZ_IFACE -o $INET_IFACE -m state --state=20
ESTABLISHED,RELATED -j tcp_allowed
echo $rc_done_up

echo "    Forward established and related packets (TCP) to DMZ..."
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -m state --state=20
ESTABLISHED,RELATED -j tcp_allowed
echo $rc_done_up

echo "    ftp..."
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_FTP_IP=20
=2D-dport 20 -j tcp_allowed
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_FTP_IP=20
=2D-dport 21 -j tcp_allowed
echo $rc_done_up

echo "    http..."
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_IP=20
=2D-dport 80 -j tcp_allowed
echo $rc_done_up

echo "    https..."
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_IP=20
=2D-dport 443 -j tcp_allowed
echo $rc_done_up

echo "    icmp..."
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_IP -=
j=20
limiting=20
echo $rc_done_up

# Nun zu unserem LAN=20

echo "Playing normal router between our LAN and DMZ."
echo "Only new incoming connections will be blocked..."
$IPTABLES -A FORWARD -i $LAN_IFACE -j all_allowed
$IPTABLES -A FORWARD -o $LAN_IFACE -m state --state ESTABLISHED,RELATED -j=
=20
all_allowed
echo $rc_done_up

echo "The Rest can be logged"
$IPTABLES -A FORWARD -j logging
echo $rc_done_up

echo --------
echo End of NAT and FORWARD chains
echo --------

echo "Setting up local INPUT chain:"
echo "- Throwing away bad packets..."
$IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW -j logging
echo $rc_done_up

echo "- allowing imcp packets from LAN to firewall..."
$IPTABLES -A INPUT -p ICMP -i $LAN_IFACE -j limiting
echo $rc_done_up

echo "- ssh to firewall from LAN..."
$IPTABLES -A INPUT -p TCP --dport ssh -i $LAN_IFACE -d $LAN_IP -m state=20
=2D-state NEW -j tcp_allowed
echo $rc_done_up

echo "- allowing requests to the broadcast adress..."
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -d $LAN_BCAST_ADRESS -j all_allowed
echo $rc_done_up

echo "- from localhost interface to localhost IP..."
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -d $LO_IP -j all_allowed
echo $rc_done_up

echo "Setting up the OUTPUT chain:"
echo "- Throwing away bad packets..."
$IPTABLES -A OUTPUT -p tcp ! --syn -m state --state NEW -j logging
echo $rc_done_up

echo "- ssh the other way round (from firewall to LAN)"
$IPTABLES -A OUTPUT -p TCP -s $FW_LAN_IP -o $LAN_IFACE -m state --state=20
ESTABLISHED,RELATED -j tcp_allowed
echo $rc_done_up

echo "- from localhost interface to localhost IP..."
$IPTABLES -A OUTPUT -p ALL -o $LO_IFACE -d $LO_IP -j all_allowed
echo $rc_done_up

