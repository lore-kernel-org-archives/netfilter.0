From: shore@sapo.pt
Subject: Cisco VPN Client + Cisco 800 + Firewall
Date: Thu, 21 Oct 2004 20:01:15 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098385275.7ic0vxrrb5hc@mail.sapo.pt>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,

I don't know how to start, so I'll just start by showing how my network is
build:


=09=09Internet
=09=09    |
=09=09    |
=09=09Cisco(800)(dsl modem/router)
=09=09192.168.10.254
=09=09    |
=09=09    |
=09=09192.168.10.1(eth0)
=09=09Firewall
=09=09192.168.0.50(eht1)
=09=09    |
=09=09    |
=09=09LAN 192.168.0.0/24


The Cisco is controled by the ISP, so I can't change any configuration on it=
,
only if I ask them to. The Firewall is running squid also.

The ISP configured the Cisco modem/router to accept VPN connections from the
internet with Cisco VPN client, and to attribute them a 10.0.0.0/8 range ip.
The problem is I can't access the LAN from the VPN clients. I'm not an iptab=
les
master, but i've already searched everywhere for a solution and could't find
one. Mostly, I think, because I didn't want to get rid of my Firewall script=
,
it is doing a nice job so far.

Thanks

Here goes the script:

# IPTABLES Firewall v 0.86
# by shadow999@firemail.de
#
# Small parts from http://members.optusnet.com.au/~technion/

#!/bin/sh

# This is the location of the iptables command
IPTABLES=3D"/usr/sbin/iptables"
IFCONFIG=3D"/sbin/ifconfig"
ROUTE=3D"/sbin/route"


case "$1" in
   stop)
      echo "Shutting down firewall..."
      $IPTABLES -F
      $IPTABLES -F -t mangle
      $IPTABLES -F -t nat
      $IPTABLES -X
      $IPTABLES -X -t mangle
      $IPTABLES -X -t nat

      $IPTABLES -P INPUT ACCEPT
      $IPTABLES -P OUTPUT ACCEPT
      $IPTABLES -P FORWARD ACCEPT
      echo "...done"
      ;;
   status)
      echo $"Table: filter"
      iptables --list
      echo $"Table: nat"
      iptables -t nat --list
      echo $"Table: mangle"
      iptables -t mangle --list
      ;;
   restart|reload)
      $0 stop
      $0 start
      ;;
   start)
    echo "Starting Firewall..."
    echo ""


##--------------------------Begin Firewall---------------------------------#=
#


#----Default-Interfaces-----#

## Default external interface (used, if EXTIF isn't specified on command lin=
e)
DEFAULT_EXTIF=3D"ppp0"

## Default internal interface (used, if INTIF isn't specified on command lin=
e)
DEFAULT_INTIF=3D"eth0"


#----Special Variables-----#

# IP Mask for all IP addresses
UNIVERSE=3D"0.0.0.0/0"

# Specification of the high unprivileged IP ports.
UNPRIVPORTS=3D"1024:65535"

# Specification of X Window System (TCP) ports.
XWINPORTS=3D"6000:6063"

# Ports for IRC-Connection-Tracking
IRCPORTS=3D"6665,6666,6667,6668,6669,7000"


#-----Port-Forwarding Variables-----#

#For port-forwarding to an internal host, define a variable with the appropr=
iate
#internal IP-Address here and take a look at the port-forwarding sections in=
 the
FORWARD +
#PREROUTING-chain:

#These are examples, uncomment to activate

#IP for forwarded Battlecom-traffic
#BATTLECOMIP=3D"192.168.0.5"

#IP for forwarded traffic
#HTTPIP=3D"192.168.0.254"
#CAM_IP=3D"192.168.0.19"
#SIGAPSSHIP=3D"192.168.0.30"


#----Flood Variables-----#

# Overall Limit for TCP-SYN-Flood detection
TCPSYNLIMIT=3D"5/s"
# Burst Limit for TCP-SYN-Flood detection
TCPSYNLIMITBURST=3D"10"

# Overall Limit for Loggging in Logging-Chains
LOGLIMIT=3D"2/s"
# Burst Limit for Logging in Logging-Chains
LOGLIMITBURST=3D"10"

# Overall Limit for Ping-Flood-Detection
PINGLIMIT=3D"5/s"
# Burst Limit for Ping-Flood-Detection
PINGLIMITBURST=3D"10"



#----Automatically determine infos about involved interfaces-----#

### External Interface:

## Get external interface from command-line
## If no interface is specified then set $DEFAULT_EXTIF as EXTIF
if [ "x$2" !=3D "x" ]; then
   EXTIF=3D$2
else
   EXTIF=3D$DEFAULT_EXTIF
fi
echo External Interface: $EXTIF

## Determine external IP
EXTIP=3D"`$IFCONFIG $EXTIF | grep inet | cut -d : -f 2 | cut -d \  -f 1`"
  if [ "$EXTIP" =3D '' ]; then
     echo "Aborting: Unable to determine the IP-address of $EXTIF !"
     exit 1
  fi
echo External IP: $EXTIP

## Determine external gateway
EXTGW=3D`$ROUTE -n | grep -A 4 UG | awk '{ print $2}'`
echo Default GW: $EXTGW


echo " --- "


### Internal Interface:

## Get internal interface from command-line
## If no interface is specified then set $DEFAULT_INTIF as INTIF
if [ "x$3" !=3D "x" ]; then
   INTIF=3D$3
else
   INTIF=3D$DEFAULT_INTIF
fi
echo Internal Interface: $INTIF

## Determine internal IP
INTIP=3D"`$IFCONFIG $INTIF | grep inet | cut -d : -f 2 | cut -d \  -f 1`"
  if [ "$INTIP" =3D '' ]; then
     echo "Aborting: Unable to determine the IP-address of $INTIF !"
     exit 1
  fi
echo Internal IP: $INTIP

## Determine internal netmask
INTMASK=3D"255.255.0.0"
echo Internal Netmask: $INTMASK

## Determine network address of the internal network
INTLAN=3D$INTIP'/'$INTMASK
echo Internal LAN: $INTLAN

echo ""


#----Load IPTABLES-modules-----#


#Insert modules- should be done automatically if needed

#If the IRC-modules are available, uncomment them below

echo "Loading IPTABLES modules"

dmesg -n 1 #Kill copyright display on module load
/sbin/modprobe ip_tables
/sbin/modprobe iptable_filter
/sbin/modprobe ip_conntrack
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_ftp
#/sbin/modprobe ip_conntrack_irc ports=3D$IRCPORTS
#/sbin/modprobe ip_nat_irc ports=3D$IRCPORTS
dmesg -n 6

echo " --- "


#----Clear/Reset all chains-----#

#Clear all IPTABLES-chains

#Flush everything, start from scratch
$IPTABLES -F
$IPTABLES -F -t mangle
$IPTABLES -F -t nat
$IPTABLES -X
$IPTABLES -X -t mangle
$IPTABLES -X -t nat

#Set default policies to DROP
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP


#----Set network sysctl options-----#


echo "Setting sysctl options"

#Enable forwarding in kernel
echo 1 > /proc/sys/net/ipv4/ip_forward

#Disabling IP Spoofing attacks.
echo 2 > /proc/sys/net/ipv4/conf/all/rp_filter

#Don't respond to broadcast pings (Smurf-Amplifier-Protection)
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

#Block source routing
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route

#Kill timestamps
echo 0 > /proc/sys/net/ipv4/tcp_timestamps

#Enable SYN Cookies
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

#Kill redirects
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects

#Enable bad error message protection
echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

#Log martians (packets with impossible addresses)
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians

#Set out local port range
echo "32768 61000" > /proc/sys/net/ipv4/ip_local_port_range

#Reduce DoS'ing ability by reducing timeouts
echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout
echo 2400 > /proc/sys/net/ipv4/tcp_keepalive_time
echo 0 > /proc/sys/net/ipv4/tcp_window_scaling
echo 0 > /proc/sys/net/ipv4/tcp_sack


echo " --- "

echo "Creating user-chains"



#----Create logging chains-----#

##These are the logging-chains. They all have a certain limit of log-entries=
/sec
to prevent log-flooding
##The syslog-entries will be fireparse-compatible (see http://www.fireparse.=
com)

#Invalid packets (not ESTABLISHED,RELATED or NEW)
=09$IPTABLES -N LINVALID
=09$IPTABLES -A LINVALID -m limit --limit $LOGLIMIT --limit-burst $LOGLIMITB=
URST
-j LOG --log-prefix "fp=3DINVALID:1 a=3DDROP "
=09$IPTABLES -A LINVALID -j DROP

#TCP-Packets with one ore more bad flags
=09$IPTABLES -N LBADFLAG
=09$IPTABLES -A LBADFLAG -m limit --limit $LOGLIMIT --limit-burst $LOGLIMITB=
URST
-j LOG --log-prefix "fp=3DBADFLAG:1 a=3DDROP "
=09$IPTABLES -A LBADFLAG -j DROP

#Logging of connection attempts on special ports (Trojan portscans, special
services, etc.)
=09$IPTABLES -N LSPECIALPORT
=09$IPTABLES -A LSPECIALPORT -m limit --limit $LOGLIMIT --limit-burst
$LOGLIMITBURST -j LOG --log-prefix "fp=3DSPECIALPORT:1 a=3DDROP "
=09$IPTABLES -A LSPECIALPORT -j DROP

#Logging of possible TCP-SYN-Floods
=09$IPTABLES -N LSYNFLOOD
=09$IPTABLES -A LSYNFLOOD -m limit --limit $LOGLIMIT --limit-burst $LOGLIMIT=
BURST
-j LOG --log-prefix "fp=3DSYNFLOOD:1 a=3DDROP "
=09$IPTABLES -A LSYNFLOOD -j DROP

#Logging of possible Ping-Floods
=09$IPTABLES -N LPINGFLOOD
=09$IPTABLES -A LPINGFLOOD -m limit --limit $LOGLIMIT --limit-burst $LOGLIMI=
TBURST
-j LOG --log-prefix "fp=3DPINGFLOOD:1 a=3DDROP "
=09$IPTABLES -A LPINGFLOOD -j DROP


#All other dropped packets
=09$IPTABLES -N LDROP
=09$IPTABLES -A LDROP -p tcp -m limit --limit $LOGLIMIT --limit-burst
$LOGLIMITBURST -j LOG --log-prefix "fp=3DTCP:1 a=3DDROP "
=09$IPTABLES -A LDROP -p udp -m limit --limit $LOGLIMIT --limit-burst
$LOGLIMITBURST -j LOG --log-prefix "fp=3DUDP:2 a=3DDROP "
=09$IPTABLES -A LDROP -p icmp -m limit --limit $LOGLIMIT --limit-burst
$LOGLIMITBURST -j LOG --log-prefix "fp=3DICMP:3 a=3DDROP "
=09$IPTABLES -A LDROP -f -m limit --limit $LOGLIMIT --limit-burst $LOGLIMITB=
URST
-j LOG --log-prefix "fp=3DFRAGMENT:4 a=3DDROP "
=09$IPTABLES -A LDROP -j DROP

#All other rejected packets
=09$IPTABLES -N LREJECT
=09$IPTABLES -A LREJECT -p tcp -m limit --limit $LOGLIMIT --limit-burst
$LOGLIMITBURST -j LOG --log-prefix "fp=3DTCP:1 a=3DREJECT "
=09$IPTABLES -A LREJECT -p udp -m limit --limit $LOGLIMIT --limit-burst
$LOGLIMITBURST -j LOG --log-prefix "fp=3DUDP:2 a=3DREJECT "
=09$IPTABLES -A LREJECT -p icmp -m limit --limit $LOGLIMIT --limit-burst
$LOGLIMITBURST -j LOG --log-prefix "fp=3DICMP:3 a=3DREJECT "
=09$IPTABLES -A LREJECT -f -m limit --limit $LOGLIMIT --limit-burst $LOGLIMI=
TBURST
-j LOG --log-prefix "fp=3DFRAGMENT:4 a=3DREJECT "
=09$IPTABLES -A LREJECT -p tcp -j REJECT --reject-with tcp-reset
=09$IPTABLES -A LREJECT -p udp -j REJECT --reject-with icmp-port-unreachable
=09$IPTABLES -A LREJECT -j REJECT



#----Create Accept-Chains-----#


#TCPACCEPT - Check for SYN-Floods before letting TCP-Packets in

=09$IPTABLES -N TCPACCEPT
=09$IPTABLES -A TCPACCEPT -p tcp --syn -m limit --limit $TCPSYNLIMIT --limit=
-burst
$TCPSYNLIMITBURST -j ACCEPT
=09$IPTABLES -A TCPACCEPT -p tcp --syn -j LSYNFLOOD
=09$IPTABLES -A TCPACCEPT -p tcp ! --syn -j ACCEPT


#----Create special User-Chains-----#


#CHECKBADFLAG - Kill any Inbound/Outbound TCP-Packets with impossible
flag-combinations (Some port-scanners use these, eg. nmap Xmas,Null,etc.-sca=
n)

=09$IPTABLES -N CHECKBADFLAG
=09$IPTABLES -A CHECKBADFLAG -p tcp --tcp-flags ALL FIN,URG,PSH -j LBADFLAG
=09$IPTABLES -A CHECKBADFLAG -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j
LBADFLAG
=09$IPTABLES -A CHECKBADFLAG -p tcp --tcp-flags ALL ALL -j LBADFLAG
=09$IPTABLES -A CHECKBADFLAG -p tcp --tcp-flags ALL NONE -j LBADFLAG
=09$IPTABLES -A CHECKBADFLAG -p tcp --tcp-flags SYN,RST SYN,RST -j LBADFLAG
=09$IPTABLES -A CHECKBADFLAG -p tcp --tcp-flags SYN,FIN SYN,FIN -j LBADFLAG



#FILTERING FOR SPECIAL PORTS


=09#Inbound/Outbound SILENTDROPS/REJECTS (Things we don't want in our Logs)

=09=09#SMB-Traffic
=09=09$IPTABLES -N SMB

=09=09$IPTABLES -A SMB -p tcp --dport 137 -j DROP
=09=09$IPTABLES -A SMB -p tcp --dport 138 -j DROP
=09=09$IPTABLES -A SMB -p tcp --dport 139 -j DROP
=09=09$IPTABLES -A SMB -p tcp --dport 445 -j DROP
=09=09$IPTABLES -A SMB -p udp --dport 137 -j DROP
=09=09$IPTABLES -A SMB -p udp --dport 138 -j DROP
=09=09$IPTABLES -A SMB -p udp --dport 139 -j DROP
=09=09$IPTABLES -A SMB -p udp --dport 445 -j DROP

=09#Inbound Special Ports

=09=09$IPTABLES -N SPECIALPORTS

=09=09#Deepthroat Scan
  =09=09$IPTABLES -A SPECIALPORTS -p  tcp --dport 6670 -j LSPECIALPORT

  =09=09#Subseven Scan
  =09=09$IPTABLES -A SPECIALPORTS -p tcp --dport 1243 -j LSPECIALPORT
                $IPTABLES -A SPECIALPORTS -p udp --dport 1243 -j LSPECIALPOR=
T
                $IPTABLES -A SPECIALPORTS -p tcp --dport 27374 -j LSPECIALPO=
RT
                $IPTABLES -A SPECIALPORTS -p udp --dport 27374 -j LSPECIALPO=
RT
  =09=09$IPTABLES -A SPECIALPORTS -p tcp --dport 6711:6713 -j LSPECIALPORT

  =09=09#Netbus Scan
  =09=09$IPTABLES -A SPECIALPORTS -p tcp --dport 12345:12346 -j LSPECIALPORT
  =09=09$IPTABLES -A SPECIALPORTS -p tcp --dport 20034 -j LSPECIALPORT

  =09=09#Back Orifice scan
  =09=09$IPTABLES -A SPECIALPORTS -p udp --dport 31337:31338 -j LSPECIALPORT

  =09=09#X-Win
  =09=09$IPTABLES -A SPECIALPORTS -p tcp --dport $XWINPORTS  -j LSPECIALPORT

=09=09#Hack'a'Tack 2000
=09=09$IPTABLES -A SPECIALPORTS -p udp --dport 28431 -j LSPECIALPORT



#ICMP/TRACEROUTE FILTERING


=09#Inbound ICMP/Traceroute

=09=09$IPTABLES -N ICMPINBOUND

=09=09#Ping Flood protection. Accept $PINGLIMIT echo-requests/sec, rest will=
 be
logged/dropped
  =09=09$IPTABLES -A ICMPINBOUND -p icmp --icmp-type echo-request -m limit -=
-limit
$PINGLIMIT --limit-burst $PINGLIMITBURST -j ACCEPT
  =09=09#
  =09=09$IPTABLES -A ICMPINBOUND -p icmp --icmp-type echo-request -j LPINGFL=
OOD

  =09=09#Block ICMP-Redirects (Should already be catched by sysctl-options, =
if
enabled)
  =09=09$IPTABLES -A ICMPINBOUND -p icmp --icmp-type redirect -j LDROP

  =09=09#Block ICMP-Timestamp (Should already be catched by sysctl-options, =
if
enabled)
  =09=09$IPTABLES -A ICMPINBOUND -p icmp --icmp-type timestamp-request -j LD=
ROP
  =09=09$IPTABLES -A ICMPINBOUND -p icmp --icmp-type timestamp-reply -j LDRO=
P

  =09=09#Block ICMP-address-mask (can help to prevent OS-fingerprinting)
  =09=09$IPTABLES -A ICMPINBOUND -p icmp --icmp-type address-mask-request -j=
 LDROP
  =09=09$IPTABLES -A ICMPINBOUND -p icmp --icmp-type address-mask-reply -j L=
DROP


  =09=09#Allow all other ICMP in
  =09=09$IPTABLES -A ICMPINBOUND -p icmp -j ACCEPT




=09#Outbound ICMP/Traceroute

=09=09$IPTABLES -N ICMPOUTBOUND

=09=09#Block ICMP-Redirects (Should already be catched by sysctl-options, if
enabled)
  =09=09$IPTABLES -A ICMPOUTBOUND -p icmp --icmp-type redirect -j LDROP

  =09=09#Block ICMP-TTL-Expired
=09=09#MS Traceroute (MS uses ICMP instead of UDp for tracert)
=09=09$IPTABLES -A ICMPOUTBOUND -p icmp --icmp-type ttl-zero-during-transit =
-j LDROP
  =09=09$IPTABLES -A ICMPOUTBOUND -p icmp --icmp-type ttl-zero-during-reasse=
mbly -j
LDROP

  =09=09#Block ICMP-Parameter-Problem
  =09=09$IPTABLES -A ICMPOUTBOUND -p icmp --icmp-type parameter-problem -j L=
DROP

  =09=09#Block ICMP-Timestamp (Should already be catched by sysctl-options, =
if
enabled)
  =09=09$IPTABLES -A ICMPOUTBOUND -p icmp --icmp-type timestamp-request -j L=
DROP
  =09=09$IPTABLES -A ICMPOUTBOUND -p icmp --icmp-type timestamp-reply -j LDR=
OP

  =09=09#Block ICMP-address-mask (can help to prevent OS-fingerprinting)
  =09=09$IPTABLES -A ICMPOUTBOUND -p icmp --icmp-type address-mask-request -=
j LDROP
  =09=09$IPTABLES -A ICMPOUTBOUND -p icmp --icmp-type address-mask-reply -j =
LDROP


  =09=09##Accept all other ICMP going out
  =09=09$IPTABLES -A ICMPOUTBOUND -p icmp -j ACCEPT



#----End User-Chains-----#



echo " --- "


#----Start Ruleset-----#

echo "Implementing firewall rules..."


#################
## INPUT-Chain ## (everything that is addressed to the firewall itself)
#################


##GENERAL Filtering

  # Kill INVALID packets (not ESTABLISHED, RELATED or NEW)
  $IPTABLES -A INPUT -m state --state INVALID -j LINVALID

  # Check TCP-Packets for Bad Flags
  $IPTABLES -A INPUT -p tcp -j CHECKBADFLAG


##Packets FROM FIREWALL-BOX ITSELF

  #Local IF
  $IPTABLES -A INPUT -i lo -j ACCEPT
  #
  #Kill connections to the local interface from the outside world (--> Shoul=
d be
already catched by kernel/rp_filter)
  $IPTABLES -A INPUT -d 127.0.0.0/8 -j LREJECT


##Packets FROM INTERNAL NET


 ##Allow unlimited traffic from internal network using legit addresses to
firewall-box
 ##If protection from the internal interface is needed, alter it

  $IPTABLES -A INPUT -i $INTIF -s $INTLAN -j ACCEPT

  #Kill anything from outside claiming to be from internal network
(Address-Spoofing --> Should be already catched by rp_filter)
  $IPTABLES -A INPUT -s $INTLAN -j LREJECT



##Packets FROM EXTERNAL NET


 ##ICMP & Traceroute filtering

  #Filter ICMP
  #$IPTABLES -A INPUT -i $EXTIF -p icmp -j ICMPINBOUND

  #Block UDP-Traceroute
  $IPTABLES -A INPUT -p udp --dport 33434:33523 -j LDROP


 ##Silent Drops/Rejects (Things we don't want in our logs)

  #Drop all SMB-Traffic
  $IPTABLES -A INPUT -i $EXTIF -j SMB

  #Silently reject Ident (Don't DROP ident, because of possible delays when
establishing an outbound connection)
  $IPTABLES -A INPUT -i $EXTIF -p tcp --dport 113 -j REJECT --reject-with
tcp-reset


 ##Public services running ON FIREWALL-BOX (comment out to activate):

  # ftp-data
  #$IPTABLES -A INPUT -i $EXTIF -p tcp  --dport 20 -j TCPACCEPT

  # ftp
  #$IPTABLES -A INPUT -i $EXTIF -p tcp  --dport 21 -j TCPACCEPT

  # ssh
  #$IPTABLES -A INPUT -i $EXTIF -p tcp --dport 22 -j TCPACCEPT

  #telnet
  #$IPTABLES -A INPUT -i $EXTIF -p tcp --dport 23 -j TCPACCEPT

  # smtp
  #$IPTABLES -A INPUT -i $EXTIF -p tcp --dport 25 -j TCPACCEPT

  # DNS
  #$IPTABLES -A INPUT -i $EXTIF -p tcp --dport 53 -j TCPACCEPT
  #$IPTABLES -A INPUT -i $EXTIF -p udp --dport 53 -j ACCEPT

  # http
  #$IPTABLES -A INPUT -i $EXTIF -p tcp --dport 80 -j TCPACCEPT

  # https
  #$IPTABLES -A INPUT -i $EXTIF -p tcp --dport 443 -j TCPACCEPT

  # POP-3
  #$IPTABLES -A INPUT -i $EXTIF -p tcp --dport 110 -j TCPACCEPT



 ##Separate logging of special portscans/connection attempts

  #$IPTABLES -A INPUT -i $EXTIF -j SPECIALPORTS



 ##Allow ESTABLISHED/RELATED connections in

  $IPTABLES -A INPUT -i $EXTIF -m state --state ESTABLISHED -j ACCEPT
  $IPTABLES -A INPUT -i $EXTIF -p tcp --dport $UNPRIVPORTS -m state --state
RELATED -j TCPACCEPT
  $IPTABLES -A INPUT -i $EXTIF -p udp --dport $UNPRIVPORTS -m state --state
RELATED -j ACCEPT


 ##Catch all rule
  $IPTABLES -A INPUT -j LDROP





##################
## Output-Chain ## (everything that comes directly from the Firewall-Box)
##################



##Packets TO FIREWALL-BOX ITSELF

  #Local IF
  $IPTABLES -A OUTPUT -o lo -j ACCEPT


##Packets TO INTERNAL NET

  #Allow unlimited traffic to internal network using legit addresses
  $IPTABLES -A OUTPUT -o $INTIF -d $INTLAN -j ACCEPT



##Packets TO EXTERNAL NET


 ##ICMP & Traceroute

  $IPTABLES -A OUTPUT -o $EXTIF -p icmp -j ICMPOUTBOUND



 ##Silent Drops/Rejects (Things we don't want in our logs)

  #SMB
  $IPTABLES -A OUTPUT -o $EXTIF -j SMB

  #Ident
  $IPTABLES -A OUTPUT -o $EXTIF -p tcp --sport 113 -j REJECT --reject-with
tcp-reset



 ##Public services running ON FIREWALL-BOX (comment out to activate):

  # ftp-data
  #$IPTABLES -A OUTPUT -o $EXTIF -p tcp  --sport 20 -j ACCEPT

  # ftp
  #$IPTABLES -A OUTPUT -o $EXTIF -p tcp  --sport 21 -j ACCEPT

  # ssh
  $IPTABLES -A OUTPUT -o $EXTIF -p tcp --sport 22 -m state --state ESTABLISH=
ED
-j ACCEPT

  #telnet
  #$IPTABLES -A OUTPUT -o $EXTIF -p tcp --sport 23 -m state --state ESTABLIS=
HED
-j ACCEPT

  # smtp
  #$IPTABLES -A OUTPUT -o $EXTIF -p tcp --sport 25 -m state --state ESTABLIS=
HED
-j ACCEPT

  # DNS
  #$IPTABLES -A OUTPUT -o $EXTIF -p tcp --sport 53 -j ACCEPT
  #$IPTABLES -A OUTPUT -o $EXTIF -p udp --sport 53 -j ACCEPT

  # http
  #$IPTABLES -A OUTPUT -o $EXTIF -p tcp --sport 80 -m state --state ESTABLIS=
HED
-j ACCEPT

  # https
  #$IPTABLES -A OUTPUT -o $EXTIF -p tcp --sport 443 -m state --state ESTABLI=
SHED
-j ACCEPT

  # POP-3
  #$IPTABLES -A OUTPUT -o $EXTIF -p tcp --sport 110 -m state --state ESTABLI=
SHED
-j ACCEPT


 ##Accept all tcp/udp traffic on unprivileged ports going out

  $IPTABLES -A OUTPUT -o $EXTIF -s $EXTIP -p tcp --sport $UNPRIVPORTS -j ACC=
EPT
  $IPTABLES -A OUTPUT -o $EXTIF -s $EXTIP -p udp --sport $UNPRIVPORTS -j ACC=
EPT



##Catch all rule

$IPTABLES -A OUTPUT -j LDROP




####################
## FORWARD-Chain  ## (everything that passes the firewall)
####################


##GENERAL Filtering

  #Kill invalid packets (not ESTABLISHED, RELATED or NEW)
  $IPTABLES -A FORWARD -m state --state INVALID -j LINVALID

  # Check TCP-Packets for Bad Flags
  $IPTABLES -A FORWARD -p tcp -j CHECKBADFLAG


##Filtering FROM INTERNAL NET


  ##Silent Drops/Rejects (Things we don't want in our logs)

   #SMB
   $IPTABLES -A FORWARD -o $EXTIF -j SMB


  ##Special Drops/Rejects
   # - To be done -


  ##Filter for some Trojans communicating to outside
   # - To be done -


  ##Port-Forwarding from Ports < 1024 [outbound] (--> Also see chain PREROUT=
ING)

   #HTTP-Forwarding
   #$IPTABLES -A FORWARD -o $EXTIF -s $HTTPIP -p tcp --sport 80 -j ACCEPT

  ## MOSTRA TUDO
  #$IPTABLES -A FORWARD -m limit --limit $LOGLIMIT --limit-burst $LOGLIMITBU=
RST
-j LOG --log-prefix "fp=3DFORWARD:1 a=3DOK "


  ##Allow all other forwarding (from Ports > 1024) from Internal Net to Exte=
rnal
Net
  $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -s $INTLAN -p tcp --sport
$UNPRIVPORTS -j ACCEPT
  $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -s $INTLAN -p udp --sport
$UNPRIVPORTS -j ACCEPT
  $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -s $INTLAN -p icmp -j ACCEPT



##Filtering FROM EXTERNAL NET


  ##Silent Drops/Rejects (Things we don't want in our logs)

   #SMB
   $IPTABLES -A FORWARD -i $EXTIF -j SMB


  ##Allow replies coming in
  $IPTABLES -A FORWARD -i $EXTIF -m state --state ESTABLISHED -j ACCEPT
  $IPTABLES -A FORWARD -i $EXTIF -p tcp --dport $UNPRIVPORTS -m state --stat=
e
RELATED -j TCPACCEPT
  $IPTABLES -A FORWARD -i $EXTIF -p udp --dport $UNPRIVPORTS -m state --stat=
e
RELATED -j ACCEPT
  $IPTABLES -A FORWARD -i $EXTIF -p icmp -m state --state RELATED -j ACCEPT


##Port-Forwarding [inbound] (--> Also see chain PREROUTING)

  #HTTP-Forwarding
  #$IPTABLES -A FORWARD -i $EXTIF -p tcp -d $HTTPIP --dport 80 -j ACCEPT

  #Battlecom-Forwarding
  #$IPTABLES -A FORWARD -p tcp --dport 2300:2400 -i $EXTIF -d $BATTLECOMIP -=
j
ACCEPT
  #$IPTABLES -A FORWARD -p udp --dport 2300:2400 -i $EXTIF -d $BATTLECOMIP -=
j
ACCEPT
  #$IPTABLES -A FORWARD -p tcp --dport 47624 -i $EXTIF -d $BATTLECOMIP -j AC=
CEPT

  #$IPTABLES -A FORWARD -p tcp --dport 8022 -i $EXTIF -d $SIGAPSSHIP -j ACCE=
PT



##Catch all rule/Deny every other forwarding

$IPTABLES -A FORWARD -j LDROP




################
## PREROUTING ##
################

##Port-Forwarding (--> Also see chain FORWARD)

  ##HTTP
  #$IPTABLES -A PREROUTING -t nat -i $EXTIF -p tcp -d $EXTIP --dport 80 -j D=
NAT
--to $HTTPIP


##**************** ADICIONADO POR MIM!! (REDIRECT DO SQUID)

 $IPTABLES -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-p=
orts
8080
 $IPTABLES -A OUTPUT -j ACCEPT -m state --state NEW -o eth0 -p tcp --dport 8=
0

##********************************************************************

  ##Battlecom
  #$IPTABLES -t nat -A PREROUTING -d $EXTIP -p tcp --destination-port 2300:2=
400
-i $EXTIF -j DNAT --to $BATTLECOMIP
  #$IPTABLES -t nat -A PREROUTING -d $EXTIP -p udp --destination-port 2300:2=
400
-i $EXTIF -j DNAT --to $BATTLECOMIP
  #$IPTABLES -t nat -A PREROUTING -d $EXTIP -p tcp --destination-port 47624 =
-i
$EXTIF -j DNAT --to $BATTLECOMIP:47624


  # $IPTABLES -t nat -A PREROUTING -d $EXTIP -p tcp --destination-port 8022 =
-i
$EXTIF -j DNAT --to $SIGAPSSHIP:22



###################
##  POSTROUTING  ##
###################

  #Masquerade from Internal Net to External Net
  $IPTABLES -A POSTROUTING -t nat -o $EXTIF -j MASQUERADE



#------End Ruleset------#

echo "...done"
echo ""


echo "--> IPTABLES firewall loaded/activated <--"


##--------------------------------End
Firewall---------------------------------##



   ;;
   *)
      echo "Usage: firewall (start|stop|restart|status) EXTIF INTIF"
      exit 1
esac

exit 0






O SAPO j=E1 est=E1 livre de v=EDrus com a Panda Software, fique voc=EA tamb=
=E9m!
Clique em: http://antivirus.sapo.pt

