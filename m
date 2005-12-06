From: "Christophorus Laube" <bob.debianlists@gmx.de>
Subject: not working http forward
Date: Tue, 6 Dec 2005 12:53:15 +0100 (MET)
Message-ID: <13424.1133869995@www85.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi there,

I am connecting my LAN through an iptables firewall. I used the example
scripts from OpenVPN to set up my iptables rules (I know this is not the
OpenVPN list, but my problems are iptables related...). I now tried to add a
portforwarding of the http port from outside onto a machine in my LAN. But
it  does not work.
Do you have an idea what the solution is? Here is my script:

#!/bin/bash

# eth1 is connected to the internet.
# eth0 is connected to a private subnet.

# Loopback address
LOOP=3D127.0.0.1

FW=3D/usr/sbin/iptables

#some kernel parameters have to be set up
    /bin/echo "1" > /proc/sys/net/ipv4/ip_forward
    /bin/echo "1" > /proc/sys/net/ipv4/ip_dynaddr
    /bin/echo "1" > /proc/sys/net/ipv4/tcp_syncookies
    /bin/echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
    /bin/echo "0" > /proc/sys/net/ipv4/icmp_echo_ignore_all
    /bin/echo "0" > /proc/sys/net/ipv4/conf/all/rp_filter
    /bin/echo "0" > /proc/sys/net/ipv4/conf/all/accept_redirects
    /bin/echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route
    /bin/echo "0" > /proc/sys/net/ipv4/conf/all/bootp_relay
    /bin/echo "1" > /proc/sys/net/ipv4/conf/all/log_martians
echo Setting up kernel parameters   [OK]

#set everything to ACCEPT in order to not blow myself off the machine
$FW -P INPUT ACCEPT
$FW -P OUTPUT ACCEPT
$FW -P FORWARD ACCEPT
$FW -F
$FW -F -t nat
echo Delete old chains   [OK]

# temporarily block all traffic.
$FW -P OUTPUT DROP
$FW -P INPUT DROP
$FW -P FORWARD DROP
echo Temporarily block all traffic   [OK]

# Set default policies
$FW -P OUTPUT ACCEPT
$FW -P INPUT DROP
$FW -P FORWARD DROP
echo Setting default policies   [OK]

# Prevent external packets from using loopback addr
$FW -A INPUT -i eth1 -s $LOOP -j DROP
$FW -A FORWARD -i eth1 -s $LOOP -j DROP
$FW -A INPUT -i eth1 -d $LOOP -j DROP
$FW -A FORWARD -i eth1 -d $LOOP -j DROP
echo Prevent external packets from using loopback address   [OK]

# Anything coming from the Internet should have a real Internet address
$FW -A FORWARD -i eth1 -s 192.168.0.0/16 -j DROP
$FW -A FORWARD -i eth1 -s 172.16.0.0/12 -j DROP
$FW -A FORWARD -i eth1 -s 10.0.0.0/8 -j DROP
$FW -A INPUT -i eth1 -s 192.168.0.0/16 -j DROP
$FW -A INPUT -i eth1 -s 172.16.0.0/12 -j DROP
$FW -A INPUT -i eth1 -s 10.0.0.0/8 -j DROP
echo Assuring real address usage   [OK]

# dynamic mtu packet size adjustment
    $FW -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
--clamp-mss-to-pmtu
echo Setting up dynamic mtu packet size adjustment   [OK]

# Block outgoing NetBios=20
$FW -A FORWARD -p tcp --sport 137:139 -o eth1 -j DROP
$FW -A FORWARD -p udp --sport 137:139 -o eth1 -j DROP
$FW -A OUTPUT -p tcp --sport 137:139 -o eth1 -j DROP
$FW -A OUTPUT -p udp --sport 137:139 -o eth1 -j DROP
echo Blocking NetBios broadcasts into the internet   [OK]

# Check source address validity on packets going out to internet
$FW -A FORWARD -s ! $INTERNAL -i eth0 -j DROP
echo Assuring source address validity   [OK]

# Allow local loopback
$FW -A INPUT -s $LOOP -j ACCEPT
$FW -A INPUT -d $LOOP -j ACCEPT
echo Allowing local loopback   [OK]

# Allow incoming pings (can be disabled)
#$FW -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

# Allow services such as www and ssh (can be disabled)
#$FW -A INPUT -p tcp --dport http -j ACCEPT
#echo Allowing http requests   [OK]

$FW -A INPUT -p tcp --dport ssh -j ACCEPT
$FW -A OUTPUT -j ACCEPT -p tcp -s 0/0 --source-port ssh
$FW -A OUTPUT -j ACCEPT -p tcp -s 0/0 --destination-port ssh
echo Allowing SecureShell Protocol   [OK]

# DNS allowed to the whole world
$FW -A OUTPUT -p udp --sport 1024:65535 -d 0/0 --destination-port domain -j
ACCEPT
$FW -A OUTPUT -p tcp --sport 1024:65535 -d 0/0 --destination-port domain -j
ACCEPT
echo Allowing DNS queries from inside to everywhere outside   [OK]

# SMTP OUT allowed to the whole world
$FW -A OUTPUT -p udp --sport 1024:65535 -d 0/0 --destination-port smtp -j
ACCEPT
$FW -A OUTPUT -p tcp --sport 1024:65535 -d 0/0 --destination-port smtp -j
ACCEPT
echo Allowing SMTP from inside to everywhere outside   [OK]

$FW -A INPUT -i tun+ -j ACCEPT
$FW -A FORWARD -i tun+ -j ACCEPT
#disabling tap connections because we do not use tap
#$FW -A INPUT -i tap+ -j ACCEPT
#$FW -A FORWARD -i tap+ -j ACCEPT
echo Allowing access to tun/tap interface   [OK]

# Allow packets from private subnets
$FW -A INPUT -i eth0 -j ACCEPT
$FW -A FORWARD -i eth0 -j ACCEPT
echo Allowing internal subnet packages   [OK]

# Keep state of connections from local machine and private subnets
$FW -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -o eth1 -j ACCEPT
$FW -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$FW -A FORWARD -m state --state NEW,ESTABLISHED,RELATED -o eth1 -j ACCEPT
$FW -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
echo connection state keeping   [OK]

# Masquerade local subnet
$FW -t nat -A POSTROUTING -s $INTERNAL -o eth1 -j MASQUERADE
echo Masquerade local subnet   [OK]

# echo Portforwardings setzen
# $FW -t nat -A PREROUTING -p tcp -i eth1 --dport 80 -j DNAT --to
192.168.0.213:80

--=20
Lust, ein paar Euro nebenbei zu verdienen? Ohne Kosten, ohne Risiko!
Satte Provisionen f=FCr GMX Partner: http://www.gmx.net/de/go/partner

