From: "Brian French" <bfrench@imageworksstudio.com>
Subject: RE: Trouble with router and iptables
Date: Fri, 14 Jan 2005 11:57:49 -0500
Message-ID: <KJEGIFLIAAKLNBMJNOIJOEHKECAA.bfrench@imageworksstudio.com>
References: <20050114163647.GA26324@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050114163647.GA26324@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

imagestream routers
www.imagestream.com


ok thank you sooo much for your help.
based on what you have said below, i have rewritten it.
could you please look it over.
thank you soo much for your help.
i'm just a novice forced to do this because i happen to be a developer.


#!/bin/sh
############################################################################
###
# This is iptables, if you need help see:
#
# http://support.imagestream.com/
#
############################################################################
###

echo -n "Setting up firewalling rules..."

############################################################################
###
# Set the variables for this script
#
# Any line with the comment '# BMF' was added by Brian
#
############################################################################
###

# Change this subnet to correspond to your private
# ethernet subnet.  Home will use 192.168.1.0/24 and
# Office will use 192.168.0.0/24.
PRIVATE=192.168.0.0/24

# Loopback address
LOOP=127.0.0.1

# External interface
EXT=Serial0
EXTIP=200.200.200.200
# Interlan interface
INT=Ethernet0
INTIP=192.168.0.1

############################################################################
###
# Flushing all rules.
#
# Do not uncomment these lines unless you have NAT rules that require them.
#
############################################################################
###
#modprobe ip_nat_ftp
#modprobe ip_nat_irc

# flush all previous rulesets
iptables -F
############################################################################
###
# Do not uncomment this line unless you have NAT rules below.
#
############################################################################
###
iptables -F -t nat

# Set default policies
iptables -P OUTPUT ACCEPT # BMF
iptables -P INPUT DROP    # BMF
iptables -P FORWARD DROP  # BMF

# Keep state of connections from local machine and private subnets
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Anything coming from the Internet should have a real Internet address
iptables -A FORWARD -i $EXT -s 192.168.0.0/16 -j DROP # BMF
iptables -A FORWARD -i $EXT -s 172.16.0.0/12 -j DROP  # BMF
iptables -A FORWARD -i $EXT -s 10.0.0.0/8 -j DROP     # BMF
iptables -A INPUT -i $EXT -s 192.168.0.0/16 -j DROP   # BMF
iptables -A INPUT -i $EXT -s 172.16.0.0/12 -j DROP    # BMF
iptables -A INPUT -i $EXT -s 10.0.0.0/8 -j DROP       # BMF

# Allow local loopback
iptables -A INPUT -i lo -j ACCEPT

# Allow packets from private subnets
iptables -A INPUT -i $INT -j ACCEPT
iptables -A FORWARD -i $INT -j ACCEPT

############################################################################
###
# If you have NAT rules and get a "ip_conntrack: table full, dropping
packet."#
# message in your kernel message log (dmesg), increase the maximum number of
#
# connections that can be tracked by uncommenting the line below
#
# Each connection uses ~ 350 bytes of memory.  16384 = 5.7 MB
#
############################################################################
###
#echo 16384 > /proc/sys/net/ipv4/ip_conntrack_max

############################################################################
###
# Use this line to masquerade for the 172.16 class B network as 1.2.3.4.
#
############################################################################
###
#iptables -t nat -A POSTROUTING -s 172.16.0.0/16 -j SNAT --to 1.2.3.4

iptables -t nat -A POSTROUTING -o $EXT -j MASQUERADE

########################################################
# Additional firewall rules sensible for most networks #
########################################################
#---- Drop all MSBlaster-type worms with ICMP scans of 92 bytes
#---- For the lowest CPU usage, try this rule before using
#---- the limit rules below
iptables -A FORWARD -p icmp -m length --length 92 -j DROP

#---- Allow all good icmp traffic through the router
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type destination-unreachable -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type source-quench -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type time-exceeded -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type parameter-problem -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type echo-request -j ACCEPT
#---- Limit inbound echo-request to 5 per second inbound from gateway
#---- Limit outbound echo-request to 10 per second outbound to each gateway
#---- XXXX is the border interface on the router (e.g. "Serial0" or
"Serial3.1")
#---- This helps limit the effect of ICMP scans from worms, etc.
iptables -A FORWARD -i $EXT -m limit --limit 10/s --limit-burst 10 -p
icmp --icmp-type echo-request -j ACCEPT
iptables -A FORWARD -o $EXT -m limit --limit 5/s --limit-burst 30 -p
icmp --icmp-type echo-request -j ACCEPT

#---- Drop any icmp traffic over the limits specified above
iptables -A FORWARD -p icmp -j DROP

#---- Block common worm traffic coming in via External interfaces
#---- where "XXXX" is your Internet gateway interface
iptables -A FORWARD -j DROP -i $EXT -p tcp --dport 135:139
iptables -A FORWARD -j DROP -i $EXT -p udp --dport 135:139
iptables -A FORWARD -j DROP -i $EXT -p tcp --dport 445
iptables -A FORWARD -j DROP -i $EXT -p udp --dport 445
iptables -A FORWARD -j DROP -i $EXT -p udp --dport 995:999
iptables -A FORWARD -j DROP -o $EXT -p udp --dport 8998

#---- Block access to backdoor on system infected by W32.Novarg.A@mm Worm
iptables -A FORWARD -p tcp --dport 3127:3149 -j DROP

#################################################
#
# below is not part of the origional file.
# added by Brian French 10.22.2004
#
#################################################


## Allow connection from Brians home to his work computer
iptables -t nat -A PREROUTING -p tcp -i $EXT \
        --dport 3389 -s 200.200.200.90 --sport 1024:65535 -j DNAT --to
192.168.0.250:3389
iptables -A FORWARD -p tcp -i $EXT \
        -o $INT -d 192.168.0.250 --dport 3389 -s 200.200.200.90 --sport
1024:65535 -m state --state NEW -j ACCEPT

## Allow rheanna to connect to her computer
iptables -t nat -A PREROUTING -p tcp -i $EXT \
        --dport 3389 -s 200.200.200.53 --sport 1024:65535 -j DNAT --to
192.168.0.210:3389
iptables -A FORWARD -p tcp -i $EXT \
        -o $INT -d 192.168.0.210 --dport 3389 -s 200.200.200.53 --sport
1024:65535 -m state --state NEW -j ACCEPT

## Allow Brian to SSH to the fileserver
iptables -t nat -A PREROUTING -p tcp -i $EXT \
        --dport 22 -s 200.200.200.90 --sport 1024:65535 -j DNAT --to
192.168.0.2:22
iptables -A FORWARD -p tcp -i $EXT \
        -o $INT -d 192.168.0.2 --dport 222 -s 200.200.200.90 --sport
1024:65535 -m state --state NEW -j ACCEPT

# iptables -A FORWARD -t filter -i $INT -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
# iptables -A FORWARD -t filter -i $EXT -m state  --state
ESTABLISHED,RELATED -j ACCEPT

# Allow ssh (can be disabled)
iptables -A INPUT -p tcp --dport ssh -j ACCEPT

# Block outgoing NetBios (if you have windows machines running
# on the private subnet).  This will not affect any NetBios
# traffic that flows over the VPN tunnel, but it will stop
# local windows machines from broadcasting themselves to
# the internet.
iptables -A FORWARD -p tcp --sport 137:139 -o $EXT -j DROP
iptables -A FORWARD -p udp --sport 137:139 -o $EXT -j DROP
iptables -A OUTPUT -p tcp --sport 137:139 -o $EXT -j DROP
iptables -A OUTPUT -p udp --sport 137:139 -o $EXT -j DROP

# Allow incoming OpenVPN packets
# Duplicate the line below for each
# OpenVPN tunnel, changing --dport n
# to match the OpenVPN UDP port.
#
# In OpenVPN, the port number is
# controlled by the --port n option.
# If you put this option in the config
# file, you can remove the leading '--'
#
# If you taking the stateful firewall
# approach (see the OpenVPN HOWTO),
# then comment out the line below.

iptables -A INPUT -p udp --dport 5000 -j ACCEPT

# Allow packets from TUN/TAP devices.
# When OpenVPN is run in a secure mode,
# it will authenticate packets prior
# to their arriving on a tun or tap
# interface.  Therefore, it is not
# necessary to add any filters here,
# unless you want to restrict the
# type of packets which can flow over
# the tunnel.

iptables -A INPUT -i tun+ -j ACCEPT
iptables -A FORWARD -i tun+ -j ACCEPT
iptables -A INPUT -i tap+ -j ACCEPT
iptables -A FORWARD -i tap+ -j ACCEPT


# Keep state of connections from local machine and private subnets
iptables -A OUTPUT -m state --state NEW -o $EXT -j ACCEPT
iptables -A FORWARD -m state --state NEW -o $EXT -j ACCEPT

# iptables -A FORWARD -i $INT -m state --state NEW,ESTABLISHED,RELATED -j
ACCEPT
# iptables -A FORWARD -i $EXT -m state  --state ESTABLISHED,RELATED -j
ACCEPT


############################################################################
#################

Again thank you for your help!



-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Jason
Opperisano
Sent: Friday, January 14, 2005 11:37 AM
To: netfilter@lists.netfilter.org
Subject: Re: Trouble with router and iptables


On Fri, Jan 14, 2005 at 11:05:54AM -0500, Brian French wrote:
> # External interface
> EXT=Serial0
> EXTIP=200.200.200.10
> # Internal interface
> INT=Ethernet0
> INTIP=192.168.0.1

i must be waaaaaaaay out of the loop...what linux distro/kernel are you
running that uses device names "Serial0" and "Ethernet0"

>
############################################################################
> ###
> # Flushing all rules.
> #
> # Do not uncomment these lines unless you have NAT rules that require
them.
> #
>
############################################################################
> ###
> #modprobe ip_nat_ftp
> #modprobe ip_nat_irc
>
> # flush all previous rulesets
> iptables -F
>
############################################################################
> ###
> # Do not uncomment this line unless you have NAT rules below.
> #
>
############################################################################
> ###
> iptables -F -t nat
>
> # Set default policies
> iptables -P OUTPUT ACCEPT # BMF
> iptables -P INPUT DROP    # BMF
> iptables -P FORWARD DROP  # BMF
>
> # Prevent external packets from using loopback addr
> iptables -A INPUT -i $EXT -s $LOOP -j DROP    # BMF
> iptables -A FORWARD -i $EXT -s $LOOP -j DROP  # BMF
> iptables -A INPUT -i $EXT -d $LOOP -j DROP    # BMF
> iptables -A FORWARD -i $EXT -d $LOOP -j DROP  # BMF

stylistic--the linux routing code does this for you.  since you're not
logging these packets--the drops are unnecessary.

> # Anything coming from the Internet should have a real Internet address
> iptables -A FORWARD -i $EXT -s 192.168.0.0/16 -j DROP # BMF
> iptables -A FORWARD -i $EXT -s 172.16.0.0/12 -j DROP  # BMF
> iptables -A FORWARD -i $EXT -s 10.0.0.0/8 -j DROP     # BMF
> iptables -A INPUT -i $EXT -s 192.168.0.0/16 -j DROP   # BMF
> iptables -A INPUT -i $EXT -s 172.16.0.0/12 -j DROP    # BMF
> iptables -A INPUT -i $EXT -s 10.0.0.0/8 -j DROP       # BMF
>
> # Allow local loopback
> iptables -A INPUT -s $LOOP -j ACCEPT  # BMF
> iptables -A INPUT -d $LOOP -j ACCEPT  # BMF

personally--i would change these to:

  iptables -A INPUT -i lo -j ACCEPT

> iptables -t nat -A POSTROUTING -o $EXT -j MASQUERADE

if you have a static IP--use "-j SNAT --to-source $EXTIP" instead of
MASQUERADE.

<-- snip icmp stuff -->

> #---- Block common worm traffic coming in via External interfaces
> #---- where "XXXX" is your Internet gateway interface
> iptables -A FORWARD -j DROP -i $EXT -p tcp --dport 135:139
> iptables -A FORWARD -j DROP -i $EXT -p udp --dport 135:139
> iptables -A FORWARD -j DROP -i $EXT -p tcp --dport 444
> iptables -A FORWARD -j DROP -i $EXT -p udp --dport 444

you sure you don't mean "--dport 445" there?

> ## Since i was unable to get openvpn to work here

openvpn is good stuff--sorry to hear it didn't work out for you.

<-- snip RDP port-forwarding stuff -->

> ## Allow Brian to SSH to the fileserver
> iptables -t nat -A PREROUTING -p tcp -i $EXT \
>         --dport 222 -s 200.200.200.90 --sport 1024:65535 -j DNAT --to
> 192.168.0.2:22
> iptables -A FORWARD -p tcp -i $EXT \
>         -o $INT -d 192.168.0.2 --dport 222 -s 200.200.200.90 --sport
> 1024:65535 -m state --state NEW -j ACCEPT

the reason this doesn't work is because the dport in the FORWARD rule
needs to be 22, not 222.

> iptables -A FORWARD -t filter -i $INT -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -t filter -i $EXT -m state  --state
> ESTABLISHED,RELATED -j ACCEPT

ok...

> # Allow services such as www and ssh (can be disabled)
> iptables -A INPUT -p tcp --dport ssh -j ACCEPT
>
> # Block outgoing NetBios (if you have windows machines running
> # on the private subnet).  This will not affect any NetBios
> # traffic that flows over the VPN tunnel, but it will stop
> # local windows machines from broadcasting themselves to
> # the internet.
> iptables -A FORWARD -p tcp --sport 137:139 -o $EXT -j DROP
> iptables -A FORWARD -p udp --sport 137:139 -o $EXT -j DROP

you do realize it too late for these rules, right?  you already accepted
all NEW packets in FORWARD arriving on $INT--so a machine on the inside
can send all the tcp/udp 137:139 it wants.

> iptables -A OUTPUT -p tcp --sport 137:139 -o $EXT -j DROP
> iptables -A OUTPUT -p udp --sport 137:139 -o $EXT -j DROP

<-- snip openvpn stuff -->

> # Allow packets from private subnets
> iptables -A INPUT -i $INT -j ACCEPT
> iptables -A FORWARD -i $INT -j ACCEPT

again--this FORWARD rule seems redundant, as you've already done this
above.

> # Keep state of connections from local machine and private subnets
> iptables -A OUTPUT -m state --state NEW -o $EXT -j ACCEPT
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -m state --state NEW -o $EXT -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

stylistic--i normally put all my "-m state --state ESTABLISHED,RELATED"
rules as the first rule in each chain, as those are the ones that match
the bulk of your traffic.

as for the random, per-computer drops--i dunno.

-j

--
"Mmmm...free goo."
        --The Simpsons




