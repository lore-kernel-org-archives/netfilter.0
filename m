From: J <josh2780@yahoo.com>
Subject: firewall accepting INPUT but blocking OUTPUT  ??
Date: Mon, 10 Nov 2003 06:48:49 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031110144849.38884.qmail@web41207.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

My host based firewall below is not working properly.
It is accepting incoming connections on ports 22,80,
and 443 correctly but it is not letting me get out
from the machine.  In other words, I can't telnet from
a shell to any port on another machine on my network,
or the web for that matter (i.e. 'telnet
www.google.com 80'  just hangs).  When I wipe the
rules everything works fine.

Can anyone help me out with this?  What am I doing
wrong?

I tried adding a rule:
$IPT -A OUT -m state --state NEW -j ACCEPT
but that still didn't work.

Thanks in advance for the help!

Firewall script is below...


#!/bin/sh

############################################################
# Load Kernel modules
############################################################

/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_REJECT
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_state
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_conntrack_irc

############################################################
# Assignments
############################################################

# Firewall host IP address
IP="216.227.79.121"

# Host lists for inbound services
PING=""
SSH="0.0.0.0/0"
WWW="0.0.0.0/0"
SWWW="0.0.0.0/0"

# Rate limits
SYNOPT="-m limit --limit 5/second --limit-burst 10"
LOGOPT="--log-level=3 -m limit --limit 1/second
--limit-burst 10"

BADIP="0.0.0.0/8 10.0.0.0/8 127.0.0.0/8 169.254.0.0/16
172.16.0.0/12 192.0.0/24 192.168.0.0/16 192.0.34.0/24
224.0.0.0/4 240.0.0.0/5 255.255.255.255"
SHUNIP=""
LO="127.0.0.1"
SSH="$SSH $LO"
WWW="$WWW $LO"
IPT=/sbin/iptables

############################################################
# Clear the existing firewall rules
############################################################

if [ ! -x $IPTABLES ]
then
  echo "firewall: can't execute $IPTABLES"
  exit 1
fi

$IPT -F                # Flush all chains
$IPT -X                # Delete all chains

for table in filter nat mangle
do
  $IPT -t $table -F    # Delete the table's rules
  $IPT -t $table -X    # Delete the table's chains
  $IPT -t $table -Z    # Zero the table's counters
done

$IPT -P INPUT   DROP   # Set default policy to DROP
$IPT -P OUTPUT  DROP   # Set default policy to DROP
$IPT -P FORWARD DROP   # Set default policy to DROP

############################################################
# Logging chain
############################################################

$IPT -N LDROP
#$IPT -A LDROP   -j LOG --log-prefix "IPT Drop:   "
$LOGOPT
$IPT -A LDROP   -j DROP

$IPT -N LBADIP
$IPT -A LBADIP  -p tcp --dport 137:139 -j DROP
$IPT -A LBADIP  -p udp --dport 137:139 -j DROP
#$IPT -A LBADIP  -j LOG --log-prefix "IPT BAD:   "
$LOGOPT
$IPT -A LBADIP  -j DROP

$IPT -N LSHUN
$IPT -A LSHUN   -j LOG --log-prefix "IPT Shun:   "
$LOGOPT
$IPT -A LSHUN   -j DROP

$IPT -N LFLOOD
$IPT -A LFLOOD  -j LOG --log-prefix "IPT Flood:  "
$LOGOPT
$IPT -A LFLOOD  -j DROP

$IPT -N LFLAGS
$IPT -A LFLAGS  -j LOG --log-prefix "IPT Flags:  "
$LOGOPT
$IPT -A LFLAGS  -j DROP

############################################################
# Bad IPs
############################################################

$IPT -N BADIP
for ip in $BADIP; do
  $IPT -A BADIP -s $ip -j LBADIP
  $IPT -A BADIP -d $ip -j LBADIP
done

############################################################
# Shunned Hosts
############################################################

$IPT -N SHUN
for ip in $SHUNIP; do
  $IPT -A SHUN -s $ip -j LSHUN
  $IPT -A SHUN -d $ip -j LSHUN
done

############################################################
# SYN Flood Protection
############################################################

$IPT -N FLOOD

# Following rule accepting datagram fires at limited
rate

$IPT -A FLOOD $SYNOPT -j RETURN
$IPT -A FLOOD         -j LFLOOD

############################################################
# TCP Flag Validation (TCP datagrams)
############################################################

$IPT -N FLAGS
$IPT -A FLAGS -p tcp --tcp-flags ACK,FIN FIN          
   -j LFLAGS
$IPT -A FLAGS -p tcp --tcp-flags ACK,PSH PSH          
   -j LFLAGS
$IPT -A FLAGS -p tcp --tcp-flags ACK,URG URG          
   -j LFLAGS
$IPT -A FLAGS -p tcp --tcp-flags FIN,RST FIN,RST      
   -j LFLAGS
$IPT -A FLAGS -p tcp --tcp-flags SYN,FIN SYN,FIN      
   -j LFLAGS
$IPT -A FLAGS -p tcp --tcp-flags SYN,RST SYN,RST      
   -j LFLAGS
$IPT -A FLAGS -p tcp --tcp-flags ALL ALL              
   -j LFLAGS
$IPT -A FLAGS -p tcp --tcp-flags ALL NONE             
   -j LFLAGS
$IPT -A FLAGS -p tcp --tcp-flags ALL FIN,PSH,URG      
   -j LFLAGS
$IPT -A FLAGS -p tcp --tcp-flags ALL SYN,FIN,PSH,URG  
   -j LFLAGS
$IPT -A FLAGS -p tcp --tcp-flags ALL
SYN,RST,ACK,FIN,URG  -j LFLAGS

# Remaining flag combinations considered valid

############################################################
# Input TCP/UDP
############################################################

$IPT -N IN
$IPT -A IN -m state --state INVALID             -j
DROP
$IPT -A IN -p tcp --syn                         -j
FLOOD
$IPT -A IN -p tcp                               -j
FLAGS
$IPT -A IN -m state --state ESTABLISHED,RELATED -j
ACCEPT
$IPT -A IN -s $IP                               -j
LDROP

# Accept new inbound connections

for sip in $SSH; do
  $IPT -A IN -p tcp -s $sip --dport 22 -m state
--state NEW -j ACCEPT
done

for sip in $WWW; do
  $IPT -A IN -p tcp -s $sip --dport 80 -m state
--state NEW -j ACCEPT
done

for sip in $SWWW; do
  $IPT -A IN -p tcp -s $sip --dport 443 -m state
--state NEW -j ACCEPT
done

# Reject AUTH requests
$IPT -A IN -p tcp --dport 113 -j REJECT --reject-with
tcp-reset

# Add additional rules accepting authorized traffic
here.
# Traffic not explicitly accepted will be logged and
dropped.



############################################################
# Output TCP/UDP
############################################################

$IPT -N OUT
$IPT -A OUT -p tcp                               -j
FLAGS
$IPT -A OUT -s ! $IP                             -j
LDROP
$IPT -A OUT -m state --state ESTABLISHED,RELATED -j
ACCEPT
#
# This firewall is configured to block outbound
connections by default.
# List what to accept:

# Accept new outbound connections

$IPT -A OUT -m state --state NEW -p tcp --dport  21 -j
ACCEPT   #ftp
$IPT -A OUT -m state --state NEW -p tcp --dport  22 -j
ACCEPT   #ssh
$IPT -A OUT -m state --state NEW -p tcp --dport  25 -j
ACCEPT   #smtp
$IPT -A OUT -m state --state NEW -p tcp --dport  43 -j
ACCEPT   #whois
$IPT -A OUT -m state --state NEW -p tcp --dport  53 -j
ACCEPT   #dns
$IPT -A OUT -m state --state NEW -p tcp --dport  80 -j
ACCEPT   #http
$IPT -A OUT -m state --state NEW -p tcp --dport 443 -j
ACCEPT   #https
$IPT -A OUT -m state --state NEW -p tcp --dport 873 -j
ACCEPT   #rsync

$IPT -A OUT -m state --state NEW -p udp --dport  53 -j
ACCEPT   #dns

# Add additional rules accepting authorized traffic
here.
# Traffic not explicitly accepted will be logged and
dropped.



############################################################
# Inbound ICMP messages
############################################################

$IPT -N IN_ICMP
for sip in $PING; do
  $IPT -A IN_ICMP -p icmp --icmp-type echo-request -s
$sip -d $IP -j ACCEPT
  $IPT -A IN_ICMP -p icmp --icmp-type echo-reply   -s
$sip -d $IP -j ACCEPT
done
$IPT -A IN_ICMP -p icmp --icmp-type
destination-unreachable -j ACCEPT
$IPT -A IN_ICMP -p icmp --icmp-type source-quench     
     -j ACCEPT
$IPT -A IN_ICMP -p icmp --icmp-type time-exceeded     
     -j ACCEPT
$IPT -A IN_ICMP -p icmp --icmp-type parameter-problem 
     -j ACCEPT

############################################################
# Outbound ICMP messages
############################################################

$IPT -N OUT_ICMP
for dip in $PING; do
  $IPT -A OUT_ICMP -p icmp --icmp-type echo-reply   -d
$dip -j ACCEPT
  $IPT -A OUT_ICMP -p icmp --icmp-type echo-request -d
$dip -j ACCEPT
done
$IPT -A OUT_ICMP -p icmp --icmp-type
destination-unreachable -j ACCEPT
$IPT -A OUT_ICMP -p icmp --icmp-type
fragmentation-needed    -j ACCEPT
$IPT -A OUT_ICMP -p icmp --icmp-type source-quench    
      -j ACCEPT
$IPT -A OUT_ICMP -p icmp --icmp-type parameter-problem
      -j ACCEPT

############################################################
# Rules for built-in chains
############################################################

$IPT -A INPUT -i lo       -j ACCEPT
$IPT -A INPUT             -j BADIP
$IPT -A INPUT             -j SHUN
$IPT -A INPUT -p ! icmp   -j IN
$IPT -A INPUT -p   icmp   -j IN_ICMP
$IPT -A INPUT             -j LDROP

$IPT -A OUTPUT -o lo      -j ACCEPT
$IPT -A OUTPUT            -j BADIP
$IPT -A OUTPUT            -j SHUN
$IPT -A OUTPUT -p ! icmp  -j OUT
$IPT -A OUTPUT -p   icmp  -j OUT_ICMP
$IPT -A OUTPUT            -j LDROP



__________________________________
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
http://antispam.yahoo.com/whatsnewfree

