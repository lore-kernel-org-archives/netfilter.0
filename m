From: "davidnorman@ntlworld.com" <davidnorman@ntlworld.com>
Subject: redirecting traffic through firewall problem
Date: Wed, 19 Mar 2003 04:23:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <244640-22003331992321632@M2W069.mail2web.com>
Reply-To: davidnorman@ntlworld.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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


Hi hope anybody can help, I have been working on the following problem for=

six days=2E

my mail goal here is to=20

1) setup a firewall that enables internet access from the internal LAN
2) redirect inbound http and smtp traffic from the external network to web=

servers and mail servers on the lan

for security I will say here that the external subnet is 192=2E168=2E1=2E*=
 eth1
the internal network will be described here as 192=2E168=2E0=2E* eth0

The firewall is assigned to 192=2E168=2E1=2E33
with three extra ips that are aliased to the same card using ->

ip addr add 192=2E168=2E1=2E34/27 broadcast 255=2E255=2E255=2E224 dev eth1=

ip addr add 192=2E168=2E1=2E35/27 broadcast 255=2E255=2E255=2E224 dev eth1=

ip addr add 192=2E168=2E1=2E36/27 broadcast 255=2E255=2E255=2E224 dev eth1=


inbound mail to the company is sent to 192=2E168=2E1=2E34 from the isp's s=
mart
mail host
and redirected to 192=2E168=2E0=2E7 redhat linux 7=2E3 mail server running=
 sendmail

the company hosts two web sites on the LAN redhat 7=2E3 linux apache web
server=2E
the addresses below are aliased on that server for the web traffic
192=2E168=2E0=2E220 website 1
192=2E168=2E0=2E221 website 2

The problem --->

<x=2Ex=2Ex=2Ex> =3D some public address on the internet

Test from internet to external web ip and onto redhat linux apache web
server=2E
Iptraf reports that packets come in from browser on <x=2Ex=2Ex=2Ex> and hi=
t
external aliased ip=2E
Firewall then forwards the connection onto LAN web server, running iptraf
on that box
shows the connection comming in with TCP flags SYN and imediately the
connection shows=20
closed and reset=2E

Tue Mar 18 15:52:46 2003; ******** IP traffic monitor started ********

Tue Mar 18 15:52:50 2003; TCP; eth1; 48 bytes; from <x=2Ex=2Ex=2Ex>:1062 t=
o
192=2E168=2E1=2E35:http; first packet (SYN)
Tue Mar 18 15:52:50 2003; TCP; eth0; 48 bytes; from <x=2Ex=2Ex=2Ex>:1062 t=
o
192=2E168=2E0=2E220:http; first packet (SYN)


BUT STRANGE --->

I fired up a w2k box and installed the win32 version of apache server and
configured it to listen on the same aliases ip as the redhat linux lan web=

server box ( switched this off of course ) and something different=20
happens=2E Using the same internet client, the web page shows in the clien=
ts
browser, with no problems=2E IPtraf reports a little more=2E

Tue Mar 18 15:53:26 2003; TCP; eth1; 48 bytes; from <x=2Ex=2Ex=2Ex>:1063 t=
o
192=2E168=2E1=2E35:http; first packet (SYN)
Tue Mar 18 15:53:26 2003; TCP; eth0; 48 bytes; from <x=2Ex=2Ex=2Ex>:1063 t=
o
192=2E168=2E0=2E220:http; first packet (SYN)
Tue Mar 18 15:53:26 2003; TCP; eth0; 48 bytes; from 192=2E168=2E0=2E220:ht=
tp to
<x=2Ex=2Ex=2Ex>:1063; first packet (SYN)
Tue Mar 18 15:53:26 2003; TCP; eth1; 48 bytes; from 192=2E168=2E1=2E35:htt=
p to
<x=2Ex=2Ex=2Ex>:1063; first packet (SYN)

(note similar test done with the smtp forwarding, connections gained to II=
S
smtp server but not sendmail)

The network setup between the test w2k server on the lan and redhat linux
7=2E3 web server are identical=2E

I have run out of ideas as to where the problem lies, am I missing
something in my iptables rules ?

Basically I am getting no connectivity from the external net to LAN when
trying to access lan web server or=20
lan mail server=2E ( although testing using a w2k box running apache and I=
IS
smtp works )

The are no problems with internet access from the LAN through firewall

any help most appreciated


copy of my script enclosed below, I have cut out the INPUT and OUTPUT
chains to cut down on size of email

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

#!/bin/sh
#
#

=2E /etc/init=2Ed/functions

if [ ! -x /sbin/iptables ]; then
        exit 0
fi

start() {

INET_IP=3D"192=2E168=2E1=2E33"
INET_IFACE=3D"eth1"
INET_MAIL_IP=3D"192=2E168=2E1=2E34"

LAN_IP=3D"192=2E168=2E0=2E9"
LAN_IP_RANGE=3D"192=2E168=2E0=2E0/24"
LAN_BCAST_ADDRESS=3D"192=2E168=2E0=2E255"
LAN_IFACE=3D"eth0"

LAN_VNC_IP=3D"192=2E168=2E0=2E15"
LAN_MAIL_IP=3D"192=2E168=2E0=2E7"

LO_IP=3D"127=2E0=2E0=2E1"
LO_IFACE=3D"lo"

######################################################
# Load all required IPTables modules
#

#
# Needed to initially load modules
#
/sbin/depmod -a

#
# Adds some iptables targets like LOG, REJECT and MASQUARADE=2E
#
/sbin/modprobe ipt_LOG
#/sbin/modprobe ipt_REJECT
#/sbin/modprobe ipt_MASQUERADE

/sbin/modprobe ip_tables
/sbin/modprobe iptable_filter
/sbin/modprobe ip_conntrack

#
# Support for owner matching
#
#/sbin/modprobe ipt_owner

#
# Support for connection tracking of FTP and IRC=2E
#
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_ftp
#/sbin/modprobe ip_conntrack_irc


#
# Set network sysctl options
#

#Enable forwarding in kernel
echo 1 > /proc/sys/net/ipv4/ip_forward

#Disabling IP Spoofing attacks=2E
echo 2 > /proc/sys/net/ipv4/conf/all/rp_filter

#Don't respond to broadcast pings (Smurf-Amplifier-Protection)
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

#Block source routing
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route

#Kill timestamps
echo 0 > /proc/sys/net/ipv4/tcp_timestamps

#Enable SYN Cookies
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

#Kill accept redirects
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects

#Enable send redirects
#echo 0 > /proc/sys/net/ipv4/conf/eth0/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/eth1/send_redirects

#Enable bad error message protection
echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

#Log martians (packets with impossible addresses)
#echo 1 > /proc/sys/net/ipv4/conf/all/log_martians

#Set out local port range
echo "32768 61000" > /proc/sys/net/ipv4/ip_local_port_range

#Reduce DoS'ing ability by reducing timeouts
echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout
echo 2400 > /proc/sys/net/ipv4/tcp_keepalive_time
echo 0 > /proc/sys/net/ipv4/tcp_window_scaling
echo 0 > /proc/sys/net/ipv4/tcp_sack


######################################################
#
# Set default policies for the INPUT, FORWARD and OUTPUT chains
#

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

#
# Take care of bad TCP packets that we don't want
#

iptables -N bad_tcp_packets
iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG
--log-prefix "New not syn:"
iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

#
# Do some checks for obviously spoofed IPs
#

iptables -A bad_tcp_packets -i $INET_IFACE -s 172=2E16=2E0=2E0/12 -j DROP
iptables -A bad_tcp_packets -i $INET_IFACE -s 10=2E0=2E0=2E0/8 -j DROP

######################################################
#
# Create separate chains for ICMP, TCP and UDP to traverse
#

iptables -N allowed
iptables -N icmp_packets
iptables -N tcp_packets
iptables -N udpincoming_packets

#
# The allowed chain for TCP connections
#

iptables -A allowed -p TCP --syn -j ACCEPT
iptables -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A allowed -p TCP -j DROP

#
# ICMP rules
#

iptables -A icmp_packets -p ICMP --icmp-type 8 -j ACCEPT
iptables -A icmp_packets -p ICMP --icmp-type 11 -j ACCEPT

#
# TCP rules
#

iptables -A tcp_packets -p TCP --dport ssh -j allowed

#
# UDP ports
#

iptables -A udpincoming_packets -p UDP -s 0/0 --source-port domain -j ACCE=
PT
iptables -A udpincoming_packets -p UDP -s 0/0 --source-port ntp -j ACCEPT


######################################################
# POSTROUTING chain
#
# Enable IP SNAT for all internal networks
#

iptables -A POSTROUTING -t nat -o $INET_IFACE -j SNAT --to-source $INET_IP=



######################################################
# PREROUTING chain
#
# DNAT http(s) for web server
#

iptables -A PREROUTING -t nat -i $INET_IFACE -p tcp -d 192=2E168=2E1=2E35 =
--dport
http -j DNAT --to-dest 192=2E168=2E0=2E220
iptables -A PREROUTING -t nat -i $INET_IFACE -p tcp -d 192=2E168=2E1=2E36 =
--dport
http -j DNAT --to-dest 192=2E168=2E0=2E221

#
# DNAT SMTP to mail filter server on LAN
#

iptables -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $INET_MAIL_IP
--dport smtp -j DNAT --to-dest $LAN_MAIL_IP

#
# DNAT VNC to pc on lan
#

#iptables -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $INET_IP --dport
5900 -j DNAT --to-dest $LAN_VNC_IP


######################################################
# FORWARD chain
#
# Bad TCP packets we don't want
#


iptables -A FORWARD -p tcp -j bad_tcp_packets


#
# LAN HTTP server
#

iptables -A FORWARD -i $INET_IFACE -o $LAN_IFACE -p tcp -d 192=2E168=2E0=2E=
220
--dport http -j allowed
iptables -A FORWARD -i $INET_IFACE -o $LAN_IFACE -p tcp -d 192=2E168=2E0=2E=
221
--dport http -j allowed

iptables -A FORWARD -p ICMP -i $INET_IFACE -o $LAN_IFACE -d 192=2E168=2E0=2E=
220
-j icmp_packets
iptables -A FORWARD -p ICMP -i $INET_IFACE -o $LAN_IFACE -d 192=2E168=2E0=2E=
221
-j icmp_packets

#
# LAN Mail server
#

iptables -A FORWARD -p TCP -i $INET_IFACE -o $LAN_IFACE -d $LAN_MAIL_IP
--dport smtp -j ACCEPT
iptables -A FORWARD -p ICMP -i $INET_IFACE -o $LAN_IFACE -d $LAN_MAIL_IP -=
j
icmp_packets

#
# LAN VNC server
#

#iptables -A FORWARD -p TCP -i $INET_IFACE -o $LAN_IFACE -d $LAN_VNC_IP
--dport 5900 -j ACCEPT

#
# LAN section
#

iptables -A FORWARD -i $LAN_IFACE -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

#
# Logging
#

iptables -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG
--log-level DEBUG --log-prefix "IPT FORWARD packet died: "


--------------------------------------------------------------------
mail2web - Check your email from the web at
http://mail2web=2Ecom/ =2E



