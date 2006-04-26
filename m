From: "Tom Hurst" <thomasinaz@gmail.com>
Subject: unwanted rule showing in various chains
Date: Wed, 26 Apr 2006 12:37:45 -0700
Message-ID: <3cea46bd0604261237h18efa3ebr989526a378d29876@mail.gmail.com>
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

Hello,

I'm having some trouble setting up my tables the way I would like
them. What I'm trying to do is;

1) allow ssh into the router on the $WAN interface
2) allow vnc in to various internal machines
3) allow http, https, ftp, and dns (to the ISP Name Servers) out in a
statefull manor from all internal PC's
4) allow ssh from the router to select internal PC's
5) block everything else.

I believe it to be almost complete but there are rules in various
places to "ACCEPT all from anywhere" and I dont know whats

causing them.

Any help would be greatly appreciated.

Thank you,
Tom

##################################################
iptables -L

Chain INPUT (policy DROP)
target     prot opt source               destination
DROP       all  --  anywhere             anywhere            state INVALID
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED
DROP       tcp  --  anywhere             anywhere            tcp
option=3D!2 flags:SYN/SYN
input_rule  all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
DROP       udp  --  anywhere             anywhere
DROP       icmp --  anywhere             anywhere
DROP       gre  --  anywhere             anywhere
DROP       all  --  anywhere             anywhere

Chain FORWARD (policy DROP)
target     prot opt source               destination
DROP       all  --  anywhere             anywhere            state INVALID
TCPMSS     tcp  --  anywhere             anywhere            tcp
flags:SYN,RST/SYN TCPMSS clamp to PMTU
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED
forwarding_rule  all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere

Chain OUTPUT (policy DROP)
target     prot opt source               destination
DROP       all  --  anywhere             anywhere            state INVALID
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED
output_rule  all  --  anywhere             anywhere
DROP       icmp --  anywhere             anywhere
DROP       gre  --  anywhere             anywhere
DROP       udp  --  anywhere             anywhere
DROP       all  --  anywhere             anywhere

Chain forwarding_rule (1 references)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             192.168.5.170       tcp dpt:5900

Chain input_rule (1 references)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:22
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:5900
DROP       icmp -f  anywhere             anywhere
DROP       icmp --  anywhere             anywhere            icmp echo-requ=
est
ACCEPT     icmp --  anywhere             anywhere            icmp time-exce=
eded

Chain output_rule (1 references)
target     prot opt source               destination
ACCEPT     udp  --  (ISP DNS Server)     anywhere            udp
spt:53 state NEW,ESTABLISHED
ACCEPT     udp  --  (ISP DNS Server)     anywhere            udp
spt:53 state NEW,ESTABLISHED
ACCEPT     tcp  --  anywhere             anywhere            tcp
dpt:80 state NEW,ESTABLISHED
ACCEPT     tcp  --  anywhere             anywhere            tcp
dpt:443 state NEW,ESTABLISHED

##################################################
/etc/init.d/S45firewall

#!/bin/sh

## Please make changes in /etc/firewall.user

. /etc/functions.sh
WAN=3D$(nvram get wan_ifname)
LAN=3D$(nvram get lan_ifname)

## CLEAR TABLES
for T in filter nat; do
  iptables -t $T -F
  iptables -t $T -X
done

iptables -N input_rule
iptables -N output_rule
iptables -N forwarding_rule

iptables -t nat -N prerouting_rule
iptables -t nat -N postrouting_rule

### INPUT
###  (connections with the router as destination)

  # base case
  iptables -P INPUT DROP
  iptables -A INPUT -m state --state INVALID -j DROP
  iptables -A INPUT -p tcp --tcp-flags SYN SYN --tcp-option \! 2 -j  DROP

  #
  # insert accept rule or to jump to new accept-check table here
  #
  iptables -A INPUT -j input_rule

  # allow
  iptables -A INPUT -i \! $WAN  -j ACCEPT       # allow from lan/wifi inter=
faces
  iptables -A INPUT -p icmp     -j DROP         # allow ICMP
  iptables -A INPUT -p gre      -j DROP         # allow GRE

  # reject (what to do with anything not allowed earlier)
  iptables -A INPUT -p tcp -j DROP
  iptables -A INPUT -j DROP

iptables -P INPUT DROP

### OUTPUT
### (connections with the router as source)
# base case
  iptables -P OUTPUT DROP
  iptables -A OUTPUT -m state --state INVALID -j DROP

  #
  # insert accept rule or to jump to new accept-check table here
  #
  iptables -A OUTPUT -j output_rule

  # reject (what to do with anything not allowed earlier)
  iptables -A OUTPUT -p tcp -j DROP
  iptables -A OUTPUT -j DROP

iptables -P OUTPUT DROP

### FORWARDING
### (connections routed through the router)

  # base case
  iptables -P FORWARD DROP
  iptables -A FORWARD -m state --state INVALID -j DROP
  iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
--clamp-mss-to-pmtu
  iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

  #
  # insert accept rule or to jump to new accept-check table here
  #
  iptables -A FORWARD -j forwarding_rule

  # allow
  iptables -A FORWARD -i br0 -o br0 -j ACCEPT
  iptables -A FORWARD -i $LAN -o $WAN -j ACCEPT

  # reject (what to do with anything not allowed earlier)
  # uses the default -P DROP

iptables -P FORWARD DROP

### MASQ
  iptables -t nat -A PREROUTING -j prerouting_rule
  iptables -t nat -A POSTROUTING -j postrouting_rule
  iptables -t nat -A POSTROUTING -o $WAN -j MASQUERADE

######################################################
USER RULES /etc/firewall

WAN=3D$(nvram get wan_ifname)
LAN=3D$(nvram get lan_ifname)
WIFI=3D$(nvram get wifi_ifname)

iptables -F input_rule
iptables -F output_rule
iptables -F forwarding_rule
iptables -t nat -F prerouting_rule
iptables -t nat -F postrouting_rule

######PREROUTING#######

#Allow SSH on the WAN interface
iptables -t nat -A prerouting_rule -i $WAN -p tcp --dport 22 -j ACCEPT

#Allow VNC on WAN interface
iptables -t nat -A prerouting_rule -i $WAN -p tcp --dport 5900 -j ACCEPT

#QOS For FTP
iptables -A prerouting_rule -t mangle -p tcp --sport 21 -j TOS
--set-tos Minimize-Delay
iptables -A prerouting_rule -t mangle -p tcp --sport 20 -j TOS
--set-tos Maximize-Throughput

#VNC
iptables -t nat -A prerouting_rule -i $WAN -p tcp --dport 5900 -j DNAT
--to (Internal PC):5900

#######INPUT#######
#######(connections with the router as destination)

#Allow SSH on the WAN interface
iptables  -A input_rule -i $WAN -p tcp --dport 22 -j ACCEPT

#Allow VNC on WAN interface
iptables -A input_rule -i $WAN -p tcp --dport 5900 -j ACCEPT

# Allow all LAN traffic to router"
#iptables -A input_rule -i br0 -s $LAN -m state --state NEW -j ACCEPT

# icmp_packets
#
# This chain is for inbound (from the Internet) icmp packets only.
# Type 8 (Echo Request) is not accepted by default
# Enable it if you want remote hosts to be able to reach you.
# 11 (Time Exceeded) is the only one accepted
# that would not already be covered by the established
# connection rule.  Applied to INPUT on the external interface.
#
# Note that the stateful settings allow replies to ICMP packets.
# These rules allow new packets of the specified types.

# ICMP packets should fit in a Layer 2 frame, thus they should
# never be fragmented.  Fragmented ICMP packets are a typical sign
# of a denial of service attack.
iptables -A input_rule -i $WAN --fragment -p ICMP -j DROP

# By default, however, drop pings without logging. Blaster
# and other worms have infected systems blasting pings.
# Comment the line below if you want pings logged, but it
# will likely fill your logs.
iptables -A input_rule -i $WAN -p ICMP -s 0/0 --icmp-type 8 -j DROP

# Time Exceeded
iptables -A input_rule -i $WAN -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT

#Default INPUT Drop
#iptables -P INPUT DROP

#######OUTPUT#######
#######(connections with the router as source)

#########TEST##############
#Allow DNS
iptables -A output_rule --source (ISP DNS Server) -p udp --source-port
53 -m state --state NEW,ESTABLISHED -j ACCEPT

iptables -A output_rule --source (ISP DNS Server) -p udp --source-port
53 -m state --state NEW,ESTABLISHED -j ACCEPT

## http
iptables -A output_rule -o $WAN -p tcp --dport 80 -m state --state
NEW,ESTABLISHED -j ACCEPT

## https
iptables -A output_rule -o $WAN -p tcp --dport 443 -m state --state
NEW,ESTABLISHED -j ACCEPT
#########TEST##############

#######FORWARDING#######
#######(connections routed thru the router)

#VNC
iptables -A forwarding_rule -i $WAN -p tcp --dport 5900 -d (Internal
PC) -j ACCEPT

#Default FORWARD Drop
#iptables -P FORWARD DROP

