From: Unknown <unknown@unknown.invalid>
Subject: New poster seeks critique of first attempt.
Date: Mon, 13 Feb 2006 01:48:24 -0600
Message-ID: <43F039C8.3090609@tcqinternet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
From: john <jcmalc@tcqinternet>
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

Hi Folks,

This is my first attempt at writing a firewall with Iptables.  This sure 
ain't COBOL.

I would appreciate any criticisms or suggestions for improvements.  The 
firewall has been tested on Islack 1.2.
It seems to perform well on test at grc and pcflank.



Peace,

John





if [ "$1" = "start" ]; then

   IPTABLES="usr/sbin/iptables"

INTERNET="ppp"
LOOPBACK_INTERFACE="lo"
#IPADDR="my.ip.address"
#MY_ISP="208.12.112.2:208.12.112.3"
#SUBNET_BASE="my.subnet.network"
#SUBNET_BROADCAST="my.subnet.bcast"
CLASS_A="127.0.0.0/8"
CLASS_B="172.16.0.0/12"
CLASS_C="192.168.0.0/16"
CLASS_D_MULTICAST="224.0.0.0/4"
CLASS_E_RESERVED_NET="240.0.0.0/5"
BROADCAST_SRC="0.0.0.0"
BROADCAST_DEST="255.255.255.255"
PRIVPORTS="0:1023"
UNPRIVPORTS="1024:65535"
CONNECTION_TRACKING="1"
NAMESERVER="208.12.112.2"
INTERNET="ppp"
NFS_PORT="2049"
LOCKD_PORT="4045"

IDENTPORT113="Y"
WWWPORT80="Y"
PROXY8080="Y"
PROXY8008="N"
EMAILOUTPORT25="Y"
POPPORT110="Y"
USENETPORT119="N"
IMAPPORT143="N"
SSHOUT="N"
SSLPORT443="y"
WHOISPORT43="N"
FTPPORT20="Y"
FTPPORT21="Y"
SSHPORT22="N"
SMTPPORT25="Y"
REALAUDIO="N"
PASSIVEFTP="Y"

$IPTABLES        -P INPUT       DROP
$IPTABLES        -P OUTPUT      DROP
$IPTABLES        -P FORWARD     DROP

   # Firewall initialization, remove everything, start with clean tables
 $IPTABLES -F      # remove all rules
 $IPTABLES -t nat -F      # remove all rules
 $IPTABLES -t mangle -F     # delete all user-defined chains
 $IPTABLES -X      # delete all user-defined chains
 $IPTABLES -t nat -X      # remove all rules
 $IPTABLES -t mangle -X     # delete all user-defined chains

#enable broadcast echo protection
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

#Disable Source Routed pacccckets
for f in /proc/sys/net/ipv4/conf/*/accept_source_route; do
   echo 1 > $f
done

#Enable TCP SYN Cookie Protection
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

#Disable ICMP redirect Acceptance
for f in /proc/sys/net/ipv4/conf/*/accept_redirects; do
   echo 0 > f$
done

# Don't Send Redirect Messges
for f in /proc/sys/net/ipv4/conf/*/send_redirects; do
  echo 1 > $f
done

# Drop Spoofed Packets coming in on an interface, which, if replied to,
# would result in the reply goingout a different interface.
for f in /proc/sys/net/ipv4/conf/*/rp_filter; do
  echo 1 > f$
done

# Log packets with impossible addresses
for f in /proc/sys/net/ipv4/conf/*/log_martians; do
  echo 1 > $f
done


# Set up our logging and packet 'executing' chains
$IPTABLES -N logdrop2
$IPTABLES -A logdrop2 -j LOG --log-prefix "DROPPED " --log-level 4 
--log-ip-options --log-tcp-options --log-tcp-sequence
$IPTABLES -A logdrop2 -j DROP
$IPTABLES -N logdrop
$IPTABLES -A logdrop -m limit --limit 1/second --limit-burst 10 -j logdrop2
$IPTABLES -A logdrop -m limit --limit 2/minute --limit-burst 1 -j LOG 
--log-prefix "LIMITED " --log-level 4
$IPTABLES -A logdrop -j DROP
$IPTABLES -N logreject2
$IPTABLES -A logreject2 -j LOG --log-prefix "REJECTED " --log-level 4 
--log-ip-options --log-tcp-options --log-tcp-sequence
$IPTABLES -A logreject2 -p tcp -j REJECT --reject-with tcp-reset
$IPTABLES -A logreject2 -p udp -j REJECT --reject-with icmp-port-unreachable
$IPTABLES -A logreject2 -j DROP
$IPTABLES -N logreject
$IPTABLES -A logreject -m limit --limit 1/second --limit-burst 10 -j 
logreject2
$IPTABLES -A logreject -m limit --limit 2/minute --limit-burst 1 -j LOG 
--log-prefix "LIMITED " --log-level 4
$IPTABLES -A logreject -p tcp -j REJECT --reject-with tcp-reset
$IPTABLES -A logreject -p udp -j REJECT --reject-with icmp-port-unreachable
$IPTABLES -A logreject -j DROP
$IPTABLES -N logaborted2
$IPTABLES -A logaborted2 -j LOG --log-prefix "ABORTED " --log-level 4 
--log-ip-options --log-tcp-options --log-tcp-sequence
$IPTABLES -A logaborted2 -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -N logaborted
$IPTABLES -A logaborted -m limit --limit 1/second --limit-burst 10 -j 
logaborted2
$IPTABLES -A logaborted -m limit --limit 2/minute --limit-burst 1 -j LOG 
--log-prefix "LIMITED " --log-level 4

   # allow everything for loop device
   $IPTABLES -A INPUT -i lo -j ACCEPT
   $IPTABLES -A OUTPUT -j ACCEPT

$IPTABLES        -P INPUT       DROP
$IPTABLES        -P OUTPUT      DROP
$IPTABLES        -P FORWARD     DROP

#portscan detector
        $IPTABLES -N PORTSCAN
        #portscan detection module
        # NMAP FIN/URG/PSH
        $IPTABLES -A INPUT -i all -p tcp --tcp-flags ALL FIN,URG,PSH -m 
recent --set -j PORTSCAN
        $IPTABLES -A FORWARD -i all -p tcp --tcp-flags ALL FIN,URG,PSH 
-m recent --set -j PORTSCAN
        # SYN/RST
        $IPTABLES -A INPUT -i all -p tcp --tcp-flags SYN,RST SYN,RST -m 
recent --set -j PORTSCAN
        $IPTABLES -A FORWARD -i all -p tcp --tcp-flags SYN,RST SYN,RST 
-m recent --set -j PORTSCAN
        # SYN/FIN -- Scan(probably)
        $IPTABLES -A INPUT -i all -p tcp --tcp-flags SYN,FIN SYN,FIN -m 
recent --set -j PORTSCAN
        $IPTABLES -A FORWARD -i all -p tcp --tcp-flags SYN,FIN SYN,FIN 
-m recent --set -j PORTSCAN
        # NMAP FIN Stealth
        $IPTABLES -A INPUT -i all -p tcp --tcp-flags ALL FIN -m recent 
--set -j PORTSCAN
        $IPTABLES -A FORWARD -i all -p tcp --tcp-flags ALL FIN -m recent 
--set -j PORTSCAN
        # ALL/ALL Scan
        $IPTABLES -A INPUT -i all -p tcp --tcp-flags ALL ALL -m recent 
--set -j PORTSCAN
        $IPTABLES -A FORWARD -i all -p tcp --tcp-flags ALL ALL -m recent 
--set -j PORTSCAN
        # NMAP Null Scan
        $IPTABLES -A INPUT -i all -p tcp --tcp-flags ALL NONE -m recent 
--set -j PORTSCAN
        $IPTABLES -A FORWARD -i all -p tcp --tcp-flags ALL NONE -m 
recent --set -j PORTSCAN
        #XMAS
        $IPTABLES -A INPUT -i all -p tcp  --tcp-flags ALL 
URG,ACK,PSH,RST,SYN,FIN -m recent --set -j PORTSCAN
        $IPTABLES -A FORWARD -i all -p tcp  --tcp-flags ALL 
URG,ACK,PSH,RST,SYN,FIN -m recent --set -j PORTSCAN
        $IPTABLES -A PORTSCAN  -m limit --limit 1/second -j LOG  
--log-level info --log-prefix "PORTSCAN -- SHUN "  --log-tcp-sequence  
--log-tcp-options  --log-ip-options
        $IPTABLES -A PORTSCAN -j DROP

# Drop packets with bad tcp flags
        $IPTABLES -N BAD_FLAGS
        $IPTABLES -A INPUT -p tcp --tcp-option 64 -m recent --set -j 
BAD_FLAGS
        $IPTABLES -A INPUT -p tcp --tcp-option 128 -m recent --set -j 
BAD_FLAGS
        $IPTABLES -A BAD_FLAGS  -m limit --limit 1/second -j LOG  
--log-level info --log-prefix "BAD_FLAGS -- SHUN "  --log-tcp-sequence  
--log-tcp-options  --log-ip-options
        $IPTABLES -A BAD_FLAGS -j DROP

# Drop packets that are too small Note:
$IPTABLES -N SMALL
$IPTABLES -A INPUT -p udp -m length --length 0:27 -m recent --set -j SMALL
$IPTABLES -A INPUT -p tcp -m length --length 0:39 -m recent --set -j SMALL
$IPTABLES -A INPUT -p icmp -m length --length 0:27 -m recent --set -j SMALL
$IPTABLES -A INPUT -p 30 -m length --length 0:31 -m recent --set -j SMALL
$IPTABLES -A INPUT -p 47 -m length --length 0:39 -m recent --set -j SMALL
$IPTABLES -A INPUT -p 50 -m length --length 0:49 -m recent --set -j SMALL
$IPTABLES -A INPUT -p 51 -m length --length 0:35 -m recent --set -j SMALL
$IPTABLES -A INPUT -m length --length 0:19 -m recent --set -j SMALL
$IPTABLES -A SMALL -m limit --limit 1/second -j LOG  --log-level info 
--log-prefix "SMALL -- SHUN "  --log-tcp-sequence  --log-tcp-options  
--log-ip-options
$IPTABLES -A SMALL -j DROP

# Reject all BOGUS packets
$IPTABLES -N BOGUS
$IPTABLES -t filter -p all -A INPUT -m conntrack --ctstate INVALID -j BOGUS
$IPTABLES -t filter -p all -A OUTPUT -m conntrack --ctstate INVALID -j BOGUS
$IPTABLES -t filter -p all -A FORWARD -m conntrack --ctstate INVALID -j 
BOGUS
#$IPTABLES -A BOGUS -m limit --limit 1/second -j LOG  --log-level info 
--log-prefix "INVALID PACKET -- DROP "  --log-tcp-sequence  
--log-tcp-options  --log-ip-options
$IPTABLES -A BOGUS -j REJECT

#Enforce SYN only connections on NEW connections
$IPTABLES -A INPUT -p tcp  ! --syn -m conntrack --ctstate NEW -j LOG 
--log-prefix "New not syn:"
$IPTABLES -A INPUT -p tcp ! --syn -m conntrack --ctstate NEW -j DROP
$IPTABLES -A FORWARD -p tcp  ! --syn -m conntrack --ctstate NEW -j LOG 
--log-prefix "New not syn:"
$IPTABLES -A FORWARD -p tcp ! --syn -m conntrack --ctstate NEW -j DROP

# Drop packets to "odd" ports
$IPTABLES -N ODDPORTS
$IPTABLES -A INPUT -p udp --sport 2:21 -m recent --set  -j ODDPORTS
$IPTABLES -A INPUT -p udp --dport 2:21 -m recent --set  -j ODDPORTS
$IPTABLES -A INPUT -p tcp --dport 0 -m recent --set -j ODDPORTS
$IPTABLES -A INPUT -p tcp --sport 0 -m recent --set -j ODDPORTS
$IPTABLES -A FORWARD -i eth+ -p udp --dport 2:21 -m recent --set  -j 
ODDPORTS
$IPTABLES -A FORWARD -i eth+ -p tcp --dport 0 -m recent --set -j ODDPORTS
$IPTABLES -A FORWARD -i eth+ -p tcp --sport 0 -m recent --set -j ODDPORTS
$IPTABLES -A ODDPORTS -m limit --limit 1/second -j LOG  --log-level info 
--log-prefix "ODDPORTS -- SHUN "  --log-tcp-sequence  --log-tcp-options  
--log-ip-options
$IPTABLES -A ODDPORTS -j DROP

#
#refuse packets claiming to be from a Class_A private network.
$IPTABLES -A INPUT -i INTERNET -s $CLASS_A -j DROP

#refuse packets claiming to be from a Class_B private network.
$IPTABLES -A INPUT -i INTERNET -s $CLASS_B -j DROP

#refuse packets claiming to be from a Class_C private network.
$IPTABLES -A INPUT -i INTERNET -s $CLASS_C -j DROP

#Refuse Class E reserved IP
$IPTABLES -A INPUT -i INTERNET -s $CLASS_D_MULTICAST -j DROP

#Refuse Class D multicast address
$IPTABLES -A INPUT -s $CLASS_E_RESERVED_NET -j DROP

#refuse malformed broadcacst packets
$IPTABLES -A INPUT -i $INTERNET -s $BROADCAST_DEST -j LOG
$IPTABLES -A INPUT -i $INTERNET -s $BROADCAST_DEST -j DROP

$IPTABLES -A INPUT -i $INTERNET -d $BROADCAST_DEST -j LOG
$IPTABLES -A INPUT -i $INTERNET -d $BROADCAST_DEST -j DROP

#Refuse addresses defined as reserved by the IANA
$IPTABLES -A INPUT -i INTERNET -s 0.0.0.0/8 -j DROP
$IPTABLES -A INPUT -i INTERNET -s 169.254.0.0/16 -j DROP
$IPTABLES -A INPUT -i INTERNET -s 192.0.2.0/24 -j DROP



COMBLOCK="0:1 13 98 111 137:139 161:162 445 1214 1999 2049 3049 4329 
6346 3128 8000 8 12345 65535"
TCPBLOCK="$COMBLOCK 98 512:515 1080 2000 3128 6000:6063"
UDPBLOCK="$COMBLOCK 161:162 520 123 517:518 1427 4045 9000"

echo -n "FW: Blocking attacks to TCP port "
for i in $TCPBLOCK;
do
  echo -n "$i "
  $IPTABLES -A INPUT   -p tcp --dport $i  -j DROP
  $IPTABLES -A OUTPUT  -p tcp --dport $i  -j DROP
  $IPTABLES -A FORWARD -p tcp --dport $i  -j DROP
done
echo ""

echo -n "FW: Blocking attacks to UDP port "
for i in $UDPBLOCK;
do
  echo -n "$i "
  $IPTABLES -A INPUT   -p udp --dport $i  -j DROP
  $IPTABLES -A OUTPUT  -p udp --dport $i  -j DROP
  $IPTABLES -A FORWARD -p udp --dport $i  -j DROP
done
echo ""


   # allow DNS in all directions
  $IPTABLES -A OUTPUT -p tcp --sport 0:65535 -d $NAMESERVER --dport 
53:53 -j ACCEPT
  $IPTABLES -A INPUT -p tcp ! --syn -s $NAMESERVER --sport 53:53 --dport 
0:65535 -j ACCEPT

# Detect aborted TCP connections.
$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -p tcp 
--tcp-flags RST RST -j logaborted

   # Allow previously established connections
$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

   $IPTABLES -A INPUT -m state --state INVALID -j LOG --log-prefix 
"INVALID input: "
   $IPTABLES -A INPUT -m state --state INVALID -j DROP

   $IPTABLES -A OUTPUT -m state --state INVALID -j LOG --log-prefix 
"INVALID output: "
   $IPTABLES -A OUTPUT -m state --state INVALID -j DROP

# Allow certain critical ICMP types
$IPTABLES -A INPUT -p icmp --icmp-type destination-unreachable -j 
ACCEPT  # Dest unreachable
$IPTABLES -A OUTPUT -p icmp --icmp-type destination-unreachable -j 
ACCEPT # Dest unreachable
$IPTABLES -A FORWARD -p icmp --icmp-type destination-unreachable -j 
ACCEPT &> /dev/null  # Dest unreachable
$IPTABLES -A INPUT -p icmp --icmp-type time-exceeded -j 
ACCEPT            # Time exceeded
$IPTABLES -A OUTPUT -p icmp --icmp-type time-exceeded -j 
ACCEPT           # Time exceeded
$IPTABLES -A FORWARD -p icmp --icmp-type time-exceeded -j ACCEPT &> 
/dev/null # Time exceeded
$IPTABLES -A INPUT -p icmp --icmp-type parameter-problem -j 
ACCEPT        # Parameter Problem
$IPTABLES -A OUTPUT -p icmp --icmp-type parameter-problem -j 
ACCEPT       # Parameter Problem
$IPTABLES -A FORWARD -p icmp --icmp-type parameter-problem -j ACCEPT &> 
/dev/null # Parameter Problem

$IPTABLES -A INPUT --fragment -p icmp  -j LOG --log-prefix "Fragmented 
IMCP: "
$IPTABLES -A INPUT --fragment -p icmp  -j DROP

 # www port 80
if [ "$WWWPORT80" = "Y" ]; then
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
80:80 -m state --state NEW -j ACCEPT
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
80:80 -m state --state ESTABLISHED,RELATED -j ACCEPT
  $IPTABLES -A INPUT -p tcp ! --syn -s $NAMESERVER --sport 80:80 --dport 
1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT
fi

# PROXY8080
if [ "$PROXY8080" = "Y" ]; then
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
8080:8080 -m state --state NEW -j ACCEPT
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
8080:8080 -m state --state ESTABLISHED,RELATED -j ACCEPT
  $IPTABLES -A INPUT -p tcp ! --syn -s $NAMESERVER --sport 8080:8080 
--dport 1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT
fi

# Proxy8008
if [ "$PROXY8008" = "Y" ]; then
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
8008:8008 -m state --state NEW -j ACCEPT
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
8008:8008 -m state --state ESTABLISHED,RELATED -j ACCEPT
  $IPTABLES -A INPUT -p tcp ! --syn -s $NAMESERVER --sport 8008:8008 
--dport 1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT
fi

# ftpPort20
if [ "$FTPPORT20" = "Y" ]; then
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
20:20 -m state --state NEW -j ACCEPT
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
20:20 -m state --state ESTABLISHED,RELATED -j ACCEPT
  $IPTABLES -A INPUT -p tcp ! --syn -s $NAMESERVER --sport 20:20 --dport 
1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT
fi

# ftpPort21
if [ "$FTPPORT21" = "Y" ]; then
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
21:21 -m state --state NEW -j ACCEPT
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
21:21 -m state --state ESTABLISHED,RELATED -j ACCEPT
  $IPTABLES -A INPUT -p tcp ! --syn -s $NAMESERVER --sport 21:21 --dport 
1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT
fi

# sshPort22
if [ "$SSHPORT22" = "Y" ]; then
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
20:20 -m state --state NEW -j ACCEPT
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
20:20 -m state --state ESTABLISHED,RELATED -j ACCEPT
  $IPTABLES -A INPUT -p tcp ! --syn -s $NAMESERVER --sport 20:20 --dport 
1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT
fi

# Passive ftp
if [ "$PASSIVEFTP" = "Y" ]; then
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
1024:65535 -m state --state NEW -j ACCEPT
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT
  $IPTABLES -A INPUT -p tcp ! --syn -s $NAMESERVER --sport 1024:65535 
--dport 1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT
fi

# smtpPort25
 if [ "$SMTPPORT25" = "Y" ]; then
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
21:21 -m state --state NEW -j ACCEPT
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
21:21 -m state --state ESTABLISHED,RELATED -j ACCEPT
  $IPTABLES -A INPUT -p tcp ! --syn -s $NAMESERVER --sport 21:21 --dport 
1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT
fi

# WhisPort43
if [ "$WHOISPORT43" = "Y" ]; then
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
43:43 -m state --state NEW -j ACCEPT
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
43:43 -m state --state ESTABLISHED,RELATED -j ACCEPT
  $IPTABLES -A INPUT -p tcp ! --syn -s $NAMESERVER --sport 43:43 --dport 
1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT
fi

# POPport110
if [ "$POPPORT110" = "Y" ]; then
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
110:110 -m state --state NEW -j ACCEPT
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
110:110 -m state --state ESTABLISHED,RELATED -j ACCEPT
  $IPTABLES -A INPUT -p tcp ! --syn -s $NAMESERVER --sport 110:110 
--dport 1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT
fi

# identport113
if [ "$IDENTPORT113" = "Y" ]; then
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
113:113 -m state --state NEW -j ACCEPT
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
113:113 -m state --state ESTABLISHED,RELATED -j ACCEPT
  $IPTABLES -A INPUT -p tcp ! --syn -s $NAMESERVER --sport 113:113 
--dport 1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT
fi

# useNetPort119
if [ "$USENETPORT119" = "Y" ]; then
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
119:119 -m state --state NEW -j ACCEPT
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
119:119 -m state --state ESTABLISHED,RELATED -j ACCEPT
  $IPTABLES -A INPUT -p tcp ! --syn -s $NAMESERVER --sport 119:119 
--dport 1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT
fi

# ImapPort143
if [ "$IMAPPORT143" = "Y" ]; then
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
143:143 -m state --state NEW -j ACCEPT
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
143:143 -m state --state ESTABLISHED,RELATED -j ACCEPT
  $IPTABLES -A INPUT -p tcp ! --syn -s $NAMESERVER --sport 143:143 
--dport 1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT
fi

# SSLport443
if [ "$SSLPORT443" = "Y" ]; then
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
443:443 -m state --state NEW -j ACCEPT
  $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 -d $NAMESERVER --dport 
443:443 -m state --state ESTABLISHED,RELATED -j ACCEPT
  $IPTABLES -A INPUT -p tcp ! --syn -s $NAMESERVER --sport 443:443 
--dport 1024:65535 -m state --state ESTABLISHED,RELATED -j ACCEPT
fi


   # Create a chain for logging all dropped packets
   $IPTABLES -N LOG_DROP
#  $IPTABLES -A LOG_DROP -j LOG --log-prefix "Attack log: "
   $IPTABLES -A LOG_DROP -j DROP

   $IPTABLES -A INPUT -j LOG_DROP    # drop all incomming
   $IPTABLES -A FORWARD -j LOG_DROP  # drop all forwarded

elif [ "$1" = "stop" ]; then
   iptables -F
   iptables -X
   iptables -P OUTPUT ACCEPT
   iptables -P FORWARD ACCEPT
   iptables -P INPUT ACCEPT

elif [ "$1" = "status" ]; then
   iptables -L -v

else
   echo "usage: $0 start|stop|status"
fi


