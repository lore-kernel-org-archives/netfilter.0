From: "Dan Egli" <dan@shortcircuit.dyndns.org>
Subject: Re: Bad Filter Set?
Date: Sat, 9 Nov 2002 09:43:33 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008f01c2880f$2d2f5980$d900a8c0@yamatto>
References: <004701c2867f$f176d2a0$d900a8c0@yamatto> <20021109144114.JEWN21275.mta07-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

As Requested: Firewall Rule Set:
#!/bin/bash

# # first make sure the modules are loaded. ip_conntrack_ftp should load

# them all

modprobe ip_conntrack_ftp

# setup variables

INET="64.122.31.38"

EXTNET="64.122.31.36"

EXTBCST="64.122.31.39"

PRIVNET="192.168.0.2"

USERCHAINS=" EXT-input EXT-output \

tcp-state-flags connection-tracking \

source-address-check destination-address-check \

local-dns-server-query remote-dns-server-responce \

local-tcp-client-request remote-tcp-server-responce \

remote-tcp-client-request local-tcp-server-responce \

local-udp-client-request remote-udp-server-responce \

remote-udp-client-responce \

EXT-icmp-out EXT-icmp-in \

EXT-log-in EXT-log-out \

log-tcp-state "

PRIV="0:1023"

UNPRIV="1024:65535"

BCAST_SRC="0.0.0.0"

BCAST_DEST="255.255.255.255"

CLASS_A="10.0.0.0/24"

CLASS_B="172.16.0.0/16"

CLASS_C="192.168.0.0/16"

CLASS_D="224.0.0.0/4"

CLASS_E="240.0.0.0/5"

LOOPBACK="127.0.0.0/8"

TRACE_SRC_PORTS="32769:65535"

TRACE_DEST_PORTS="33434:33523"

# Setup kernel based protection measures

# no echo broadcasts

echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

# no source routed packets

for f in /proc/sys/net/ipv4/conf/*/accept_source_route; do

echo 0 > $f

done

# TCP SYN cookie protection

echo 1 > /proc/sys/net/ipv4/tcp_syncookies

# no ICMP redirects

for f in /proc/sys/net/ipv4/conf/*/accept_redirects; do

echo 0 > $f

done

# no redirect messages FROM US

for f in /proc/sys/net/ipv4/conf/*/send_redirects; do

echo 0 > $f

done

# loose spoofed packets

for f in /proc/sys/net/ipv4/conf/*/rp_filter; do

echo 0 > $f

done

# log packets with invalid addresses

for f in /proc/sys/net/ipv4/conf/*/log_martians; do

echo 1 > $f

done

# next, flush the tables

/sbin/iptables --flush

/sbin/iptables -t nat --flush

/sbin/iptables -t mangle --flush

# traffic on loopback interface is fine.

/sbin/iptables -A INPUT -i lo -j ACCEPT

/sbin/iptables -A OUTPUT -o lo -j ACCEPT

/sbin/iptables -A INPUT -i eth0 -j ACCEPT

/sbin/iptables -A OUTPUT -o eth0 -j ACCEPT

# /sbin/iptables -A INPUT -i eth1 -j DROP

# /sbin/iptables -A OUTPUT -o eth1 -j DROP

# at this point we have a wide open firewall

# default policy is reject packets

/sbin/iptables -t nat --policy PREROUTING ACCEPT

/sbin/iptables -t nat --policy OUTPUT ACCEPT

/sbin/iptables -t nat --policy POSTROUTING ACCEPT

/sbin/iptables -t mangle --policy PREROUTING ACCEPT

/sbin/iptables -t mangle --policy OUTPUT ACCEPT

# remove any existing user defined chains

/sbin/iptables --delete-chain

/sbin/iptables -t nat --delete-chain

/sbin/iptables -t mangle --delete-chain

# create the chains we need.

for i in $USERCHAINS; do

/sbin/iptables -N $i

done

# dns queries

/sbin/iptables -A OUTPUT -p udp --sport 53 -j ACCEPT

/sbin/iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

/sbin/iptables -A INPUT -p udp --dport 53 -j ACCEPT

/sbin/iptables -A INPUT -p udp --sport 53 -j ACCEPT

# dns queries over TCP

/sbin/iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT

/sbin/iptables -A OUTPUT -p tcp --sport 53 -j ACCEPT

/sbin/iptables -A INPUT -p tcp --sport 53 -j ACCEPT

/sbin/iptables -A INPUT -p tcp --dport 53 -j ACCEPT

# eventually forward dns queries to specific servers and close this down

# some

#local tcp client, remote server

/sbin/iptables -A EXT-output -p tcp --sport $UNPRIV -j
local-tcp-client-request

/sbin/iptables -A EXT-input -p tcp ! --syn --dport $UNPRIV -j
remote-tcp-server-responce

#local tcp client chains

/sbin/iptables -A local-tcp-client-request -p tcp --dport 22 --syn -m
state --state NEW -j ACCEPT

/sbin/iptables -A remote-tcp-server-responce -p tcp ! --syn --dport 22 -j
ACCEPT

#http/https/ftp controls

/sbin/iptables -A local-tcp-client-request -p tcp -m multiport \

--destination-port 80,443,21 --syn -m state --state NEW -j ACCEPT

/sbin/iptables -A local-tcp-client-request -p tcp -m
multiport --destination-port 80,443,21 -j ACCEPT

/sbin/iptables -A remote-tcp-server-responce -p tcp -m
multiport --source-port 80,443,21 -j ACCEPT

# pop clients

/sbin/iptables -A local-tcp-client-request -p tcp -d $INET --dport
110 --syn -m state \

--state NEW -j ACCEPT

#/sbin/iptables -A local-tcp-client-request -p tcp -d $PRIVNET --dport
110 --syn -m state \

# --state NEW -j ACCEPT

/sbin/iptables -A local-tcp-client-request -p tcp -d $INET --dport 110 -j
ACCEPT

#/sbin/iptables -A local-tcp-client-request -p tcp -d $PRIVNET --dport
110 -j ACCEPT

#/sbin/iptables -A remote-tcp-server-responce -p tcp ! --syn -s
$PRIVNET --sport 110 \

# -j ACCEPT

/sbin/iptables -A remote-tcp-server-responce -p tcp ! --syn -s $INET --sport
110 \

-j ACCEPT

#smtp mail

/sbin/iptables -A local-tcp-client-request -p tcp --dport 25 --syn -m state
\

--state NEW -j ACCEPT

/sbin/iptables -A local-tcp-client-request -p tcp --dport 25 -j ACCEPT

/sbin/iptables -A remote-tcp-server-responce -p tcp ! --syn --sport 25 -j
ACCEPT

#Usenet / NNTP

/sbin/iptables -A local-tcp-client-request -p tcp --dport 119 --syn -m state
\

--state NEW -j ACCEPT

/sbin/iptables -A local-tcp-client-request -p tcp --dport 119 -j ACCEPT

/sbin/iptables -A remote-tcp-server-responce -p tcp ! --syn --sport 119 -j
ACCEPT

#ftp passive mode data channel connection

/sbin/iptables -A local-tcp-client-request -p tcp --dport $UNPRIV --syn -m
state --state NEW -j ACCEPT

/sbin/iptables -A local-tcp-client-request -p tcp --dport $UNPRIV -j ACCEPT

/sbin/iptables -A remote-tcp-server-responce -p tcp ! --syn --sport
$UNPRIV -j ACCEPT

# TCP querys from outside world to us

/sbin/iptables -A EXT-input -p tcp --sport $UNPRIV -j
remote-tcp-client-request

/sbin/iptables -A EXT-output -p tcp --dport $UNPRIV -j
local-tcp-server-responce

# kludge for incoming FTP data channel from remote servers

# using PORT mode instead of PASV mode.

/sbin/iptables -A EXT-input -p tcp --sport 20 --dport $UNPRIV -j ACCEPT

/sbin/iptables -A EXT-output -p tcp --sport $UNPRIV --dport 20 -j ACCEPT

# enable SSH channel

/sbin/iptables -A remote-tcp-client-request -p tcp --dport 22 -m
state --state NEW \

-j ACCEPT

/sbin/iptables -A remote-tcp-client-request -p tcp --dport 22 -j ACCEPT

/sbin/iptables -A local-tcp-server-responce -p tcp --sport 22 -j ACCEPT

# Local UDP client, Remote Server

/sbin/iptables -A EXT-output -p udp --sport $UNPRIV -j
local-udp-client-request

/sbin/iptables -A EXT-input -p udp --dport $UNPRIV -j
remote-udp-server-responce

# NTP

/sbin/iptables -A local-udp-client-request -p udp --dport 123 -m state \

--state NEW -j ACCEPT

/sbin/iptables -A local-udp-client-request -p udp --dport 123 -j ACCEPT

/sbin/iptables -A remote-udp-client-responce -p udp --sport 123 -j ACCEPT

# ICMP - Most traffic Disabled. But we need to allow certain types

# of messages through

/sbin/iptables -A EXT-input -p icmp -j EXT-icmp-in

/sbin/iptables -A EXT-output -p icmp -j EXT-icmp-out

# icmp firewall chain

#log and drop initial icmp fragments (i.e. we recieve part 4 but have not
recieved part 1)

/sbin/iptables -A EXT-icmp-in --fragment -j DROP

/sbin/iptables -A EXT-icmp-out --fragment -j LOG --log-prefix "Fragmemted
ICMP packet: "

/sbin/iptables -A EXT-icmp-out --fragment -j DROP

# state checking for ICMP

/sbin/iptables -A EXT-icmp-out -p icmp -m state --state NEW -j ACCEPT

/sbin/iptables -A EXT-icmp-out -p icmp --icmp-type echo-request -j ACCEPT

/sbin/iptables -A EXT-icmp-in -p icmp --icmp-type echo-reply -j ACCEPT

# allow inbound pings

/sbin/iptables -A EXT-icmp-in -p icmp --icmp-type echo-request -m
state --state NEW -j ACCEPT

/sbin/iptables -A EXT-icmp-in -p icmp --icmp-type echo-request -j ACCEPT

/sbin/iptables -A EXT-icmp-out -p icmp --icmp-type echo-reply -j ACCEPT

# We need to know destination unreachable, thats an icmp type

/sbin/iptables -A EXT-icmp-out -p icmp --icmp-type fragmentation-needed -j
ACCEPT

/sbin/iptables -A EXT-icmp-in -p icmp --icmp-type destination-unreachable -j
ACCEPT

# Paramater problem messages should also be accepted

/sbin/iptables -A EXT-icmp-in -p icmp --icmp-type parameter-problem -j
ACCEPT

/sbin/iptables -A EXT-icmp-out -p icmp --icmp-type parameter-problem -j
ACCEPT

# we also want to allow timeout messages for timeouts during routing

/sbin/iptables -A EXT-icmp-in -p icmp --icmp-type time-exceeded -j ACCEPT

/sbin/iptables -A EXT-icmp-out -p icmp --icmp-type time-exceeded -j ACCEPT

# and of course, we need to make notes of when we have been quenched, or
when we Quench

/sbin/iptables -A EXT-icmp-out -p icmp --icmp-type source-quench -j ACCEPT

/sbin/iptables -A EXT-icmp-in -p icmp --icmp-type source-quench -j ACCEPT

# Now, we want to log invalid TCP/IP State Flag combinations.

# We can NEVER have ALL flags cleared or set

/sbin/iptables -A tcp-state-flags -p tcp --tcp-flags ALL NONE -j
log-tcp-state

#SYN and FIN cannot co-exist

/sbin/iptables -A tcp-state-flags -p tcp --tcp-flags SYN,FIN SYN,FIN -j
log-tcp-state

#SYN and RST also cannot coexist

/sbin/iptables -A tcp-state-flags -p tcp --tcp-flags SYN,RST SYN,RST -j
log-tcp-state

#FIN+RST = INVALID

/sbin/iptables -A tcp-state-flags -p tcp --tcp-flags FIN,RST FIN,RST -j
log-tcp-state

# Fin only, no ACK = BAD!

/sbin/iptables -A tcp-state-flags -p tcp --tcp-flags ACK,FIN FIN -j
log-tcp-state

# PSH only, no ACK = BAD

/sbin/iptables -A tcp-state-flags -p tcp --tcp-flags ACK,PSH PSH -j
log-tcp-state

#URG only, no ACK = BAD

/sbin/iptables -A tcp-state-flags -p tcp --tcp-flags ACK,URG URG -j
log-tcp-state

#log and drop packets with a bad tcp state flag set

/sbin/iptables -A log-tcp-state -p tcp -j LOG --log-prefix "ILLEGAL TCP
STATE: " --log-ip-options --log-tcp-options

/sbin/iptables -A log-tcp-state -j DROP



#bypass rule filtering for ESTABLISHED exchanges. If we let it get started,
we should let it finish!

/sbin/iptables -A connection-tracking -m state --state
ESTABLISHED,RELATED -j ACCEPT

/sbin/iptables -A connection-tracking -m state --state INVALID -j
LOG --log-prefix "INVALID Packet: "

/sbin/iptables -A connection-tracking -m state --state INVALID -j DROP

#####################################

# refuse packets claiming to be from private networks unless they come in on
our local interface, eth0 and showing a Class C

# Private network address

/sbin/iptables -A source-address-check -s $CLASS_A -j DROP

/sbin/iptables -A source-address-check -s $CLASS_B -j DROP

/sbin/iptables -A source-address-check -s $CLASS_C -i ! eth0 -j DROP

/sbin/iptables -A source-address-check -s $CLASS_D -j DROP

/sbin/iptables -A source-address-check -s $CLASS_E -j DROP

/sbin/iptables -A source-address-check -s $LOOPBACK -j DROP

# kill broadcasts also

/sbin/iptables -A source-address-check -s 0.0.0.0/8 -j DROP

/sbin/iptables -A source-address-check -s 169.254.0.0/16 -j DROP

/sbin/iptables -A source-address-check -s 192.168.0.0/24

######################

# dest address checks

/sbin/iptables -A destination-address-check -d $BCAST_DEST -i ! eth0 -j DROP

/sbin/iptables -A destination-address-check -d $EXTBCST -j DROP

/sbin/iptables -A destination-address-check -d $EXTNET -j DROP

/sbin/iptables -A destination-address-check -p ! udp -d $CLASS_D -j DROP

#avoid ports subject to protocol and system administration problems

/sbin/iptables -A destination-address-check -p tcp -m
multiport --destination-port 2049,2000,1080,3128 --syn -j DROP

# unprivledged UDP ports for NFS and LOCKD

/sbin/iptables -A destination-address-check -p udp -m
multiport --destination-port 2049,4045 -j DROP

#logging rules prior to dropping by default policy of DROP

#icmp rules

/sbin/iptables -A EXT-log-in -p icmp --icmp-type ! echo-request -m limit -j
LOG

#tcp rules

#deny ports 0-19, and log it

/sbin/iptables -A EXT-log-in -p tcp --dport 0:19 -j LOG

#20-23 are used by valid services

/sbin/iptables -A EXT-log-in -p tcp --dport 24 -j LOG

#25 = SMTP, Valid


/sbin/iptables -A EXT-log-in -p tcp --dport 26:79 -j LOG

#finger was disallowed, WWW is allowed

/sbin/iptables -A EXT-log-in -p tcp --dport 81:109 -j LOG

# 110 = Pop3 - Still in use on some systems

/sbin/iptables -A EXT-log-in -p tcp --dport 112:136 -j LOG

# we BETTER allow NetBIOS

/sbin/iptables -A EXT-log-in -p tcp --dport 140:142 -j LOG

# imap is allowed!

/sbin/iptables -A EXT-log-in -p tcp --dport 144:442 -j LOG

#443 = Https! We need it!

/sbin/iptables -A EXT-log-in -p tcp --dport 444:65535 -j LOG



#udp Rules

#no services before 111

/sbin/iptables -A EXT-log-in -p udp --dport 0:110 -j LOG

#sunrpc we want

/sbin/iptables -A EXT-log-in -p udp --dport 112:160 -j LOG

#keep snmp incase we ever use it

/sbin/iptables -A EXT-log-in -p udp --dport 163:634 -j LOG

#keep NFS, Skip PCAnywhere!

/sbin/iptables -A EXT-log-in -p udp --dport 636:31336 -j LOG

#skip TraceRoute's default ports

/sbin/iptables -A EXT-log-in -p udp --sport $TRACE_SRC_PORTS --dport
$TRACE_DEST_PORTS -j LOG

# skip the rest!

/sbin/iptables -A EXT-log-in -p udp --dport 33434:65535

#outgoing packets

#don't log rejected outbound ICMP destination-unreachable packets

/sbin/iptables -A EXT-log-out -p icmp --icmp-type destination-unreachable -j
DROP

# Log & Drop the rest

/sbin/iptables -A EXT-log-out -j LOG



############################################################################
##################

# Ok. Now we need to install the chains we built into the default INPUT and
OUTPUT chains



# if TCP, check for common stealth scan TCP state pattens

/sbin/iptables -A INPUT -p tcp -j tcp-state-flags

/sbin/iptables -A OUTPUT -p tcp -j tcp-state-flags

#bypass firewall filgers for established exchanges

/sbin/iptables -A INPUT -j connection-tracking

/sbin/iptables -A OUTPUT -j connection-tracking



#test for illegal source and destinations addresses in inbound packets

/sbin/iptables -A INPUT -p ! tcp -j source-address-check

/sbin/iptables -A INPUT -p tcp --syn -j source-address-check

/sbin/iptables -A INPUT -j destination-address-check

#test for illegal destination addresses in outbound packets

/sbin/iptables -A OUTPUT -j destination-address-check

#begin standard firewall tests for packets addressed to this host

/sbin/iptables -A INPUT -i eth1 -d $INET -j EXT-input

#multicast traffic

/sbin/iptables -A INPUT -i eth1 -p udp -d $CLASS_D -j ACCEPT

/sbin/iptables -A OUTPUT -o eth1 -p udp -d $CLASS_D -j ACCEPT

#begin standard firewall tests for packets sent from this host

#source address spoofing by this host is not allowed due to the test on

#the source address in this rule

/sbin/iptables -A OUTPUT -o eth1 -s $INET -j EXT-output

#log anything of interest that fell through,

# before the default policy drops the packet

/sbin/iptables -A INPUT -j EXT-log-in

/sbin/iptables -A OUTPUT -j EXT-log-out

#firewall is now initialized

exit 0




----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, November 09, 2002 7:41 AM
Subject: Re: Bad Filter Set?


> On Thursday 07 November 2002 5:05 pm, Dan Egli wrote:
>
> > I'm a bit lost here, so hopefully someone can work with me on this. I
> > created a firewall script that is intended to  block most attempts for
> > access to the system, while allowing certain protocols (i.e. http,
Telet,
> > ftp, ssh, etc..) to go through. It also needs to do Masquerading.
> >
> > P.S. I edited the file on a WinXP machine so it's in DOS text format.
Sorry
> > folks.
>
> I can't open the attachment.   Amusing enough when I save it and ask
'file'
> what format it is, I get the response:
> fwscript: MPEG 1.0 layer 3 audio stream data,  40 kBit/s layer 2 audio
stream
> data,  48 kBit/s, 44.1 kHz, stereo
>
> (I assume you didn't read out loud your firewall rules and record them in
> audio format :-)
>
> Please repost your ruleset in the body of the email.
>
> Thanks,
>
> Antony.
>
> --
>
> There are two possible outcomes.
>
> If the result confirms the hypothesis, then you've made a measurement.
> If the result is contrary to the hypothesis, then you've made a discovery.
>
>  - Enrico Fermi
>
>


