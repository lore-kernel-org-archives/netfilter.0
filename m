From: Steve Comfort <steve@4Dllc.com>
Subject: Very newB questions
Date: Thu, 24 Jun 2004 14:33:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40DACA0E.7050808@4Dllc.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080603070003010009040408"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------080603070003010009040408
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi gents,

About all I've done so far is cross-compile iptables for an XScale ARM 
based system. And of course read the FAQ a few times, but its still 
pretty much Greek to me :) I found the attached script which seemed like 
a good place to start.

Running it produces the output below :

iptables v1.2.: can't initialize iptables table `ACC': Table does not 
exist (do you need to run insmod. Perhaps iptables or your kernel needs 
to be upgraded.
iptables v1.2.: can't initialize iptables table `ACC': Table does not exist
iptables v1.2.: can't initialize iptables table `ACC': Table does not 
exist .
iptables v1.2.: Can't use -N with -A

Try `iptables -h' or 'iptables --help' for more information.
/sbin/firewall: -A: command not found

As far as I know, the kernel has been compiled with ip filtering turned 
on (I can send the options that I've checked if this would help?).

Question 1:  What is table ACC? Perhaps ACCEPT truncated (for some 
unknown reason) ?

Question 2: If I want to start off by writing my own extremely simple 
tables, where should these be stored, or is there a way to tell iptables 
where to look for them?

Running iptables -L -v, produces the following :

Chain INPU (policy DROP 0 packets, 0 bytes
 pkts  byte targ       prot opt                sour                 destinat

    0     0 ACCE            --                 anywhere             anywhere

    0     0 DROP       icmp --                 anywhere             anywhere

   52  4744 ACCE            --  ixp1           192.168.200.         anywhere

    0     0 RETU            --                 anywhere             anywhere


Chain FORW (policy DROP 0 packets, 0 bytes
 pkts  byte targ       prot opt                sour                 destinat

    0     0 DROP       icmp --                 anywhere             anywhere


Chain OUTP (policy DROP 14 packets, 8600 bytes
 pkts  byte targ       prot opt                sour                 destinat

    0     0 ACCE            --                 anywhere             anywhere

    0     0 DROP       icmp --                 anywhere             anywhere

   30  4168 ACCE            --         ixp1    anywhere             
192.168.200.

    0     0 RETU            --                 anywhere             anywhere

It seems the table names are being truncated here to 4 characters ??

Best regards
Steve Comfort



--------------080603070003010009040408
Content-Type: text/plain;
 name="firewall"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="firewall"

#!/bin/sh
#
# Incoming                   /     \          Outgoing
#          -->[Routing ]--->|FORWARD|------->
#             [Decision]     \_____/        ^
#                  |                        |
#                  v                      ____
#                 ___                    /    \
#                /   \                  |OUTPUT|
#               |INPUT|                  \____/
#                \___/                      ^
#                  |                        |
#                  `----> Local Process ----'

# lan interface
iface=ixp1

# lan network
network=192.168.200.0/24

# path to iptables
ipt=/sbin/iptables

##############
## Defaults ##
##############

for i in filter nat mangle; do
	# flush all tables
	$ipt -t $i -F

	# zero counters
	$ipt -t $i -Z

	# delete user-defined chains
	$ipt -t $i -X
done

# default policy
$ipt -P INPUT DROP
$ipt -P OUTPUT DROP
$ipt -P FORWARD DROP

##############
## Loopback ##
##############
$ipt -A INPUT -i lo -j ACCEPT
$ipt -A OUTPUT -o lo -j ACCEPT

##########
## ICMP ##
##########

# we allow all ICMP types, but only at a reasonable rate so
# that we don't get flooded.

for i in INPUT OUTPUT FORWARD; do
	# accept up to 100 unfragmented icmp packets per second
	$ipt -A $i -p icmp ! -f -m limit --limit 100/second -j ACCEPT

	# drop any other icmp packets
	$ipt -A $i -p icmp -j DROP
done

##################################
## Traffic to/from the firewall ##
##################################

# this can come before all the other stuff because we're very
# paranoid regarding traffic destined/originating from ourselves.

# allow traffic to/from the lan
$ipt -A INPUT -i $iface -s $network -j ACCEPT
$ipt -A OUTPUT -o $iface -d $network -j ACCEPT

# allow traffic originating from pris
$ipt -A INPUT -i ! $iface -m state --state ESTABLISHED,RELATED -j ACCEPT
$ipt -A OUTPUT -o ! $iface -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

for i in INPUT OUTPUT; do
	# we're done here
	$ipt -A $i -j RETURN
done

#########################
## Traffic to/from LAN ##
#########################

# allow all traffic originating from us
$ipt -A FORWARD -i $iface -s $network -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
$ipt -A FORWARD -o $iface -d $network -m state --state ESTABLISHED,RELATED -j ACCEPT


# allow ssh, ident, smtp, http, https from anywhere
#for i in 22 110 113 25 80 443 3128; do
#   $ipt -A FORWARD -i ! $iface -d $network -p tcp --destination-port $i --syn -m state --state NEW -j ACCEPT
#	$ipt -A FORWARD -i ! $iface -d $network -p tcp --destination-port $i -m state --state ESTABLISHED,RELATED -j ACCEPT
#	$ipt -A FORWARD -o $iface -s $network -p tcp --source-port $i -m state --state ESTABLISHED,RELATED -j ACCEPT
#done

--------------080603070003010009040408--


