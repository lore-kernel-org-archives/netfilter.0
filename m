From: Dave Strydom <strydom.dave@gmail.com>
Subject: ftp conntrack - nat problem
Date: Tue, 8 Nov 2005 09:03:37 +0200
Message-ID: <fc38b710511072303w6144c3a7i3068e781c871799d@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hey :D

I have a firewall with a number of servers behind it (gentoo linux
servers with proftpd and a NT 2000 server)

Now from the internet side of things, when you try ftp files to these
servers using PASSIVE MODE (PASV) it does like 9 - 15 files and then
kicks out something like this:

=3D=3D=3D
213 223
    Remote file exist check: 'check_forged.php'.
    SIZE check_forged.php
550 check_forged.php: No such file or directory
    PASV
227 Entering Passive Mode (209,212,xxx,xxx,211,29).
    Opening data connection to 209.212.xxx.xxx Port: 54045
    STOR check_forged.php
0 Opening BINARY mode data connection for check_forged.php
    Timeout (20s).
    Active Help: http://www.smartftp.com/support/kb/index.php/74
    Client closed the connection.
    Transfer failed.
=3D=3D=3D

And just dies there.
Now if I use ACTIVE MODE (PORT) i get the same thing... my question is why?

Here is a copy of my firewall script:

---------------------------------------------------------------------------=
--
#!/bin/bash
# START DEFINE
###########################################

# Where Iptables is Located #
IPTABLES=3D"/sbin/iptables"

# Local Network #
LOCAL_NETWORK_IP_RANGE=3D"192.168.0.0/24"

# Loopback Interface #
LO_IP=3D" 127.0.0.1"

# Athena #
ATHENA_LO_IN_IP=3D"192.168.0.1"
ATHENA_LO_EXT_IP=3D"10.0.0.1"

# Hyperion #
HYPERION_LO_IP=3D" 192.168.0.246"

# External Interface IP's #
EXT_146_IP=3D"209.212.xxx.xxx"

# START RULES
########################################################

# SysCtl Rule Set #
echo "1" > /proc/sys/net/ipv4/ip_forward                        #
Advanced Router Packet Forward
echo "1" > /proc/sys/net/ipv4/conf/all/forwarding               #
Enable NAT Forwarding
echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter                #
Allow RP Filters
echo "0" > /proc/sys/net/ipv4/conf/all/send_redirects           #
Don't Send Redirections
echo "0" > /proc/sys/net/ipv4/conf/all/accept_redirects         #
Don't Accept Redirections
echo "1" > /proc/sys/net/ipv4/tcp_syncookies                    #
Prevent DOS Attacks
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts       #
Ignore Echo Requests


### Default Policies ###
$IPTABLES -P INPUT DROP
$IPTABLES -P FORWARD DROP
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -N bad_tcp_packets
$IPTABLES -N tcp_packets
$IPTABLES -N tcp_filtered_packets
$IPTABLES -N udp_packets
$IPTABLES -N icmp_packets
$IPTABLES -N rbl_packets
$IPTABLES -N tcp_allowed

### Accepting our servers INPUT RULES###
# Source Addressing #

$IPTABLES -A INPUT -p ALL -s $LO_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -s $LOCAL_NETWORK_IP_RANGE -j ACCEPT


# Destination Addressing #
$IPTABLES -A INPUT -p ALL -d $LOCAL_NETWORK_IP_RANGE  -m state --state
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -p ALL -d $EXT_146_IP -m state --state
ESTABLISHED,RELATED -j ACCEPT

### Accepting our servers OUTPUT RULES###
$IPTABLES -A OUTPUT -p ALL -s $LOCAL_NETWORK_IP_RANGE -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $EXT_146_IP -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT

### Linking the chains ###
$IPTABLES -A INPUT -p TCP -j tcp_filtered_packets
$IPTABLES -A INPUT -p TCP -j rbl_packets
$IPTABLES -A INPUT -p TCP -j tcp_packets
$IPTABLES -A INPUT -p UDP  -j udp_packets
$IPTABLES -A INPUT -p ICMP -j icmp_packets

### bad_tcp_packet chain ###

#$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK -m
state --state NEW -j REJECT --reject-with tcp-reset
#$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j
LOG --log-prefix "New not syn:"
#$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j ACCEPT


### Allow Chain ###

$IPTABLES -A tcp_allowed -p TCP --syn -j ACCEPT
$IPTABLES -A tcp_allowed -p TCP -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A tcp_allowed -p TCP -j DROP

### TCP Filtered Packets ###

### TCP tcp_allowed Packets ###
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 20 -j ACCEPT
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 21 -j ACCEPT
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 25 -j ACCEPT
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j ACCEPT
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 110 -j ACCEPT
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 443 -j ACCEPT
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 444 -j ACCEPT
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 10000 -j ACCEPT
$IPTABLES -A tcp_packets -p TCP -j DROP

### ICMP tcp_allowed Packets ###

$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 0 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 3 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -j DROP


# Hyperion #

$IPTABLES -A FORWARD -p TCP -s 0/0 -d $HYPERION_LO_IP --dport 20 -j ACCEPT
$IPTABLES -A FORWARD -p TCP -s 0/0 -d $HYPERION_LO_IP --dport 21 -j ACCEPT
$IPTABLES -A FORWARD -p TCP -s 0/0 -d $HYPERION_LO_IP --dport 80 -j ACCEPT
$IPTABLES -A FORWARD -p TCP -s 0/0 -d $HYPERION_LO_IP --dport 443 -j ACCEPT
$IPTABLES -A FORWARD -p TCP -s 0/0 -d $HYPERION_LO_IP --dport 444 -j ACCEPT
$IPTABLES -A FORWARD -p TCP -s 0/0 -d $HYPERION_LO_IP --dport 3306 -j ACCEP=
T
$IPTABLES -A FORWARD -p TCP -s $HYPERION_LO_IP -d 0/0 -j ACCEPT


# Default Rule #
$IPTABLES -A FORWARD -p TCP -j DROP

### Bad Output Packets ###
$IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $LOCAL_NETWORK_IP_RANGE -d 0/0 -j ACCEPT
$IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets

# END RULES
########################################################

# START NATTING
########################################################


### Drop Rootshell Connections ###
$IPTABLES -t nat -A PREROUTING -p tcp -i eth0 --dport 1524 -j DROP

### Forwarding to $HYPERION_LO_IP ###
$IPTABLES -t nat -A PREROUTING -d $EXT_146_IP -p tcp --dport 20 -j
DNAT --to-dest $HYPERION_LO_IP:20
$IPTABLES -t nat -A PREROUTING -d $EXT_146_IP -p tcp --dport 21 -j
DNAT --to-dest $HYPERION_LO_IP:21
$IPTABLES -t nat -A PREROUTING -d $EXT_146_IP -p tcp --dport 80 -j
DNAT --to-dest $HYPERION_LO_IP:80
$IPTABLES -t nat -A PREROUTING -d $EXT_146_IP -p tcp --dport 443 -j
DNAT --to-dest $HYPERION_LO_IP:443
$IPTABLES -t nat -A PREROUTING -d $EXT_146_IP -p tcp --dport 444 -j
DNAT --to-dest $HYPERION_LO_IP:444
$IPTABLES -t nat -A PREROUTING -d $EXT_146_IP -p tcp --dport 3306 -j
DNAT --to-dest $LINUXWEB1_LO_IP:3306

$IPTABLES -t nat -A POSTROUTING -s 192.168.0.0/24 -d 0/0 -j MASQUERADE


# END NATTING
########################################################

---------------------------------------------------------------------------=
--


ftp_conntrack and ip_nat_ftp is built into the kernel (from what i can
tell) (kernel-2.6.11)

What am I missing, because this is seriously starting to annoy me, i
cant find anything wrong, even if i setup a simple DNAT for ftp, with
no filtering or anything, it transfers a few files, and then bombs out
:(


thanks
Dave

