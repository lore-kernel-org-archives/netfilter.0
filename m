From: root <root@khemir.net>
Subject: Nat port forwarding, Tired of poking around, need serious help from serious guys
Date: Mon, 9 Sep 2002 23:24:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209092324.11891.root@khemir.net>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_BSW66H4YYWW326ABG6RJ"
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


--------------Boundary-00=_BSW66H4YYWW326ABG6RJ
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

!! warning, this mail is quite long and I don't want to waist your time. =
Still=20
I think it can be read within 5-10 mn and is not too borring!!

First of all please send answers to the list or to nkh@cpen.com.=20
nadim@khemir.net is the one server that I can't get to run! yet!)

I'll do my best to explain the problem and its seting in detail so please=
 send=20
exact answers, and keep your thoughts if you are not sure. IMHO when I se=
e=20
the number of messages out there, I think this problem must be answer onc=
e=20
and for all.

History:
This is a test setup:

-Local network with 2 machines, the firewall and a test machine
fix IP adress through bonet.se at khemir.net for the firewall

Layout:
-one firewall running linux 2.4.18-3 on a pII with iptables version 1.2.5=
 ip=20
at khemir.net 2 nic.

following modules load OK:
 /sbin/modprobe ip_tables
 /sbin/modprobe ip_conntrack
 /sbin/modprobe iptable_filter
 /sbin/modprobe iptable_mangle
 /sbin/modprobe iptable_nat
 /sbin/modprobe ipt_LOG # has this something to do with problem 2?
 /sbin/modprobe ipt_limit
 /sbin/modprobe ipt_state


( iptables config file can be found attached and is a shell script so ple=
ase=20
don'r run it before you go through it as it might break your machine,....=
=20
it's derived from the example found on your web site, written by Oskar=20
Andreasson.)

-one linux 2.4.18-3 running ipchains on local ip  192.168.1.3 with 2 test=
=20
users running qmail.

************
Problem 1:
************
- I can't send mail TO my net
- I can't telnet khemir.net 25

How did I try to fix it:
- I read all I could find on the net and on your web site all this in 3=20
languages
- I read the FAQ
- I read the archives
- I run all the commands I could find in the diffrent documents (an uncre=
dible=20
amount of different ways to do the same thing and still many rules were=20
refused by iptables because of incompatible options or not recognized=20
switches)

Some tests I ran:
-surf the internet from the local computer to test masquerading -> OK
-send mail from the local machine to the rest of the world -> OK
-send mail localy -> OK
- telnet to the local machine port 25 from the Firewall(FW) -> not good w=
hen=20
the firewall on the local machine is on, OK when it's off. all test excep=
t=20
this one are with firewall on local machine down
- ssh to FW -> OK

! had send mail still installed on th FW, remove it too

Where did I run the tests from:
- send mail from my job -> bounce
- ssh to the FW from my job-> OK
- telnet to port 25 from job to local machine (that is after it should ha=
ve=20
been forwarded by FW) -> no connection
- same tests from another computer on the net -> same results
- mail from hotmail.com (see there is a use for hotmail.com) -> bounce

! remember that I can send mail outwards and the SMTP server is respondin=
g=20
when I telnet it from the FW.

How do I port forward:=20

from iptables -L -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere             as17-3-2.ld.bonet.setcp dpt:smtp=
=20
to:192.168.1.3:25

### as17-3-2.ld.bonet.se is the same as khemir.net !=20

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  anywhere             anywhere           to:217.215.19=
3.214

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

from my rules:
 # SMTP server
 SMTP_SERVER_IP=3D"192.168.1.3" # on local machine
 SMTP_SERVER_PORT=3D"25"

 # allow connection on port, quite verbose but copied it from the example
 $IPTABLES -A tcp_packets -i $INET_IFACE -p tcp -s 0.0.0.0/0 -d $INET_IP/=
32=20
--destination-port $SMTP_SERVER_PORT -j ACCEPT

 # now ip and port forward
 $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p tcp -d $INET_IP --dport=
=20
$SMTP_SERVER_PORT -j DNAT --to-destination $SMTP_SERVER_IP:$SMTP_SERVER_P=
ORT

I did a bunch of other tests and all fail. My guess is that I am doing=20
something wrong but what?

All the rules seem right and all the rules are found on iptables -L, see=20
output of iptables -L, -L -t nat that are send as an attachement

An extra information:
if I nsllokup my ip adress I get name=3D as17-3-2-ld.bonet.se
if I nslookup khemir.net I get my ip adress.

I don't know if this important but I wonder how it can be?

Type of help needed:
please pinpoint where I just was too ignorant to do things right.
Anything that is not clear enough? something else I should run and show t=
he=20
output of?

I am a basic user (2 weeks using linux) so anything you want me to do sho=
uld=20
be clearly explained (and hopefully other will profit of your explainatio=
ns)


************
Problem 2:
************
Logging of the errors found by the FW rules are logged on the console!!!

a/ I don't get why it's logged to my console

the rule matched is:  $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m stat=
e=20
--state NEW -j LOG  --log-prefix "New not syn:".=20

here is the error (one of them):

New not syn: IN=3Deth0 OUT=3Deth1 SRC=3D192.168.1.3 DST=3D 64.176.251.148=
 LEN=3D52=20
TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D63862 DF PROTO=3DTCP SPT=3D32797 DPT=
=3D80 WINDOW=3D6432=20
RES=3D0x00 ACK FIN URGP=3D0

Now where is this comming from ??
OK local machine, bu who generates it

I know where it is going to, whois 64.176.251.148:
n/a
   po box 3061
   florence, Oregon 97439
   US

   Domain Name: KJKPRODUCTIONS.ORG

   Administrative Contact:
        kacey donston kadk@starband.net
        na
        po box 3061
        florence, OR 97439
        US
        Phone: 5419978141
        Fax:
   Technical Contact:
        Tech Support support@linuxwebhost.com
        Linuxwebhost.com
        10 E. Baltimore St.
        Baltimore, Md 21202
        US
        Phone: 410.234.3300
        Fax:

I can't figure why this is happenig and why it logged on the console.

I could DROP these packages instead of logging them when they are generat=
ed in=20
the lan but still it is frustrating to know these error are generated=20
continuously (I'd guess by a programmer that sends to a closed socket) an=
d=20
why does my box try to connect to a host I know nothing about?

Note tha these error can also report other ports like 128.105.7.11, ....


Thanks a lot in advance.

Nadim (soon @khemir.net ;-)











--------------Boundary-00=_BSW66H4YYWW326ABG6RJ
Content-Type: text/plain;
  charset="us-ascii";
  name="iptables-L-L-tnat"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="iptables-L-L-tnat"

Chain INPUT (policy DROP)
target     prot opt source               destination         
bad_tcp_packets  tcp  --  anywhere             anywhere           
ACCEPT     all  --  192.168.1.0/24       anywhere           
ACCEPT     all  --  fw_local             anywhere           
ACCEPT     all  --  192.168.1.1          anywhere           
ACCEPT     all  --  as17-3-2.ld.bonet.se  anywhere           
ACCEPT     all  --  anywhere             192.168.1.255      
ACCEPT     all  --  anywhere             as17-3-2.ld.bonet.sestate RELATED,ESTABLISHED 
tcp_packets  tcp  --  anywhere             anywhere           
udpincoming_packets  udp  --  anywhere             anywhere           
icmp_packets  icmp --  anywhere             anywhere           
LOG        all  --  anywhere             anywhere           limit: avg 3/min burst 3 LOG level debug prefix `IPT INPUT packet died: ' 

Chain FORWARD (policy DROP)
target     prot opt source               destination         
bad_tcp_packets  tcp  --  anywhere             anywhere           
ACCEPT     all  --  anywhere             anywhere           
ACCEPT     all  --  anywhere             anywhere           state RELATED,ESTABLISHED 
LOG        all  --  anywhere             anywhere           limit: avg 3/min burst 3 LOG level debug prefix `IPT FORWARD packet died: ' 

Chain OUTPUT (policy DROP)
target     prot opt source               destination         
bad_tcp_packets  tcp  --  anywhere             anywhere           
ACCEPT     all  --  fw_local             anywhere           
ACCEPT     all  --  192.168.1.1          anywhere           
ACCEPT     all  --  as17-3-2.ld.bonet.se  anywhere           
LOG        all  --  anywhere             anywhere           limit: avg 3/min burst 3 LOG level debug prefix `IPT OUTPUT packet died: ' 

Chain allowed (0 references)
target     prot opt source               destination         
ACCEPT     tcp  --  anywhere             anywhere           tcp flags:SYN,RST,ACK/SYN 
ACCEPT     tcp  --  anywhere             anywhere           state RELATED,ESTABLISHED 
DROP       tcp  --  anywhere             anywhere           

Chain bad_tcp_packets (3 references)
target     prot opt source               destination         
LOG        tcp  --  anywhere             anywhere           tcp flags:!SYN,RST,ACK/SYN state NEW LOG level warning prefix `New not syn:' 
DROP       tcp  --  anywhere             anywhere           tcp flags:!SYN,RST,ACK/SYN state NEW 

Chain icmp_packets (1 references)
target     prot opt source               destination         
ACCEPT     icmp --  anywhere             anywhere           icmp echo-request 
ACCEPT     icmp --  anywhere             anywhere           icmp time-exceeded 

Chain tcp_packets (1 references)
target     prot opt source               destination         
ACCEPT     tcp  --  anywhere             as17-3-2.ld.bonet.setcp dpt:smtp 

Chain udpincoming_packets (1 references)
target     prot opt source               destination         
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         
DNAT       tcp  --  anywhere             as17-3-2.ld.bonet.setcp dpt:smtp to:192.168.1.3:25 

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
SNAT       all  --  anywhere             anywhere           to:217.215.193.214 

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

--------------Boundary-00=_BSW66H4YYWW326ABG6RJ
Content-Type: application/x-shellscript;
  name="rc.firewall.iptables"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="rc.firewall.iptables"

#!/bin/sh
 #
 # rc.firewall - Initial SIMPLE IP Firewall script for Linux 2.4.x and iptables
 #
 # Copyright (C) 2001  Oskar Andreasson <bluefluxATkoffeinDOTnet>
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
 # the Free Software Foundation; version 2 of the License.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
 # along with this program or from the site that you downloaded it
 # from; if not, write to the Free Software Foundation, Inc., 59 Temple
 # Place, Suite 330, Boston, MA  02111-1307   USA
 #


# this script was downloaded from : http://www.iptables.org/documentation/tutorials/blueflux/iptables-tutorial.html#AEN2969
# a good explaination can be found there

# I, Nadim Khenir (nadim@khemir.net) have modified it to suit my particular needs

# if upgrading from ipchains, do:

# chkconfig --level 0123456 ipchains off
# service ipchains stop
# chkconfig --level 235 iptables on
# rename your /etc/rc.d/rc.firewall to /etc/rc.d/rc.firewall.ipchains
# copy this file to /etc/rc.d/rc.firewall
# chmod 755 /etc/rc.d/rc.firewall
#
# if ipptables -L doesn't work, reboot
# check again with iptables -L

 ###########################################################################
 #
 # 1. Configuration options.
 #

 #
 # 1.1 Internet Configuration.
 #

 INET_IP="217.215.193.214"
 INET_IFACE="eth1"

 #
 # 1.1.1 DHCP
 #

 #
 # 1.1.2 PPPoE
 #

 #
 # 1.2 Local Area Network configuration.
 #
 # your LAN's IP range and localhost IP. /24 means to only use the first 24
 # bits of the 32 bit IP adress. the same as netmask 255.255.255.0
 #

 LAN_IP="192.168.1.1"
 LAN_IP_RANGE="192.168.1.0/24"
 LAN_BCAST_ADRESS="192.168.1.255"
 LAN_IFACE="eth0"

 #
 # 1.3 DMZ Configuration.
 #

 #
 # 1.4 Localhost Configuration.
 #

 LO_IFACE="lo"
 LO_IP="127.0.0.1"

 #
 # 1.5 IPTables Configuration.
 #

 IPTABLES="/sbin/iptables"

 #
 # 1.6 Other Configuration.
 #

 ###########################################################################
 #
 # 2. Module loading.
 #

 #
 # Needed to initially load modules
 #

 /sbin/depmod -a

 #
 # 2.1 Required modules
 #

 /sbin/modprobe ip_tables
 /sbin/modprobe ip_conntrack
 /sbin/modprobe iptable_filter
 /sbin/modprobe iptable_mangle
 /sbin/modprobe iptable_nat
 /sbin/modprobe ipt_LOG
 /sbin/modprobe ipt_limit
 /sbin/modprobe ipt_state

 #
 # 2.2 Non-Required modules
 #

 #/sbin/modprobe ipt_owner
 #/sbin/modprobe ipt_REJECT
 #/sbin/modprobe ipt_MASQUERADE
 #/sbin/modprobe ip_conntrack_ftp
 #/sbin/modprobe ip_conntrack_irc

 ###########################################################################
 #
 # 3. /proc set up.
 #

 #
 # 3.1 Required proc configuration
 #

 echo "1" > /proc/sys/net/ipv4/ip_forward

 #
 # 3.2 Non-Required proc configuration
 #

 #echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter
 #echo "1" > /proc/sys/net/ipv4/conf/all/proxy_arp
 #echo "1" > /proc/sys/net/ipv4/ip_dynaddr

 ###########################################################################
 #
 # 4. rules set up.
 #

 ######
 # 4.1 Filter table
 #

 #
 # 4.1.1 Set policies
 #

 $IPTABLES -P INPUT DROP
 $IPTABLES -P OUTPUT DROP
 $IPTABLES -P FORWARD DROP

 $IPTABLES -t nat -F
 $IPTABLES -t nat -P PREROUTING ACCEPT

 #
 # 4.1.2 Create userspecified chains
 #

 #
 # Create chain for bad tcp packets
 #

 $IPTABLES -N bad_tcp_packets

 #
 # Create separate chains for ICMP, TCP and UDP to traverse
 #

 $IPTABLES -N allowed
 $IPTABLES -N icmp_packets
 $IPTABLES -N tcp_packets
 $IPTABLES -N udpincoming_packets

 #
 # 4.1.3 Create content in userspecified chains
 #

 #
 # bad_tcp_packets chain
 #

 $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG  --log-prefix "New not syn:"
 $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

 #
 # allowed chain
 #

 $IPTABLES -A allowed -p TCP --syn -j ACCEPT
 $IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
 $IPTABLES -A allowed -p TCP -j DROP

 #
 # TCP rules
 #

# Selectively allow incomming tcp connection on the firewall
# if you host a service on another host than your firewall check bellow
# if the host that provides the service is not on your local trusted Lan but in a DMZ, chexk URL at top for more info on DMZ

# $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 21 -j allowed
# $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed
# $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j allowed
# $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 113 -j allowed

 #
 # UDP ports
 #

 #$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --destination-port 53 -j ACCEPT
 #$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --destination-port 123 -j ACCEPT
 
# speakfreely
#$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --destination-port 2074 -j ACCEPT


# ICQ
 #$IPTABLES -A udpincoming_packets -p UDP -s 0/0 --destination-port 4000 -j ACCEPT

 #
 # ICMP rules
 #

#ping
 $IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
#
#tracerout
 $IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT

 #
 # 4.1.4 INPUT chain
 #

 #
 # Bad TCP packets we don't want.
 #

 $IPTABLES -A INPUT -p tcp -j bad_tcp_packets

 #
 # Rules for special networks not part of the Internet
 #

 #Uncomment to drop port 137 netbios packets silently. We don't like
 #that netbios stuff, and it's #way too spammy with windows machines on
 #the network.
 #
 #$IPTABLES -A INPUT -p udp --sport 137 --dport 137 -j DROP


 $IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT
 $IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
 $IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN_IP -j ACCEPT
 $IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET_IP -j ACCEPT
 $IPTABLES -A INPUT -p ALL -i $LAN_IFACE -d $LAN_BCAST_ADRESS -j ACCEPT

 #
 # Rules for incoming packets from the internet.
 #

 $IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state ESTABLISHED,RELATED  -j ACCEPT
 $IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets
 $IPTABLES -A INPUT -p UDP -i $INET_IFACE -j udpincoming_packets
 $IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j icmp_packets

 #
 # Log weird packets that don't match the above.
 #

 $IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG  --log-level DEBUG --log-prefix "IPT INPUT packet died: "

 #
 # 4.1.5 FORWARD chain
 #

 #
 # Bad TCP packets we don't want
 #

 $IPTABLES -A FORWARD -p tcp -j bad_tcp_packets

 #
 # Accept the packets we actually want to forward
 #

 $IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
 $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

 #
 # Log weird packets that don't match the above.
 #

 $IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG  --log-level DEBUG --log-prefix "IPT FORWARD packet died: "

 #
 # 4.1.6 OUTPUT chain
 #

 #
 # Bad TCP packets we don't want.
 #

 $IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets

 #
 # Special OUTPUT rules to decide which IP's to allow.
 #

 $IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
 $IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
 $IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT

 #
 # Log weird packets that don't match the above.
 #

 $IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG  --log-level DEBUG --log-prefix "IPT OUTPUT packet died: "

 ######
 # 4.2 nat table
 #

 #
 # 4.2.1 Set policies
 #

 #
 # 4.2.2 Create user specified chains
 #

 #
 # 4.2.3 Create content in user specified chains
 #

 #
 # 4.2.4 PREROUTING chain
 #

 # SMTP server
 SMTP_SERVER_IP="192.168.1.3"
 SMTP_SERVER_PORT="25"

 # allow connection on port
 $IPTABLES -A tcp_packets -i $INET_IFACE -p tcp -s 0.0.0.0/0 -d $INET_IP/32 --destination-port $SMTP_SERVER_PORT -j ACCEPT
 
 # now ip and port forward
 $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p tcp -d $INET_IP --dport $SMTP_SERVER_PORT -j DNAT --to-destination $SMTP_SERVER_IP:$SMTP_SERVER_PORT

 # above  redirection works only from the internet!

 # Allow access  from private lan
 #$IPTABLES -t nat -A POSTROUTING --dst $SMTP_SERVER_IP --destination-port $SMTP_SERVER_PORT -j SNAT --to-source $LAN_IP

 # Allow access from the firewall
 # $IPTABLES -t nat -A OUTPUT --dst $INET_IP --destination-port $SMTP_SERVER_PORT -j DNAT --to-destination $SMTP_SERVER_IP

 #
 # 4.2.5 POSTROUTING chain
 #

 #
 # Enable simple IP Forwarding and Network Address Translation, kind of maquerading
 #

 $IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP

 #
 # 4.2.6 OUTPUT chain
 #

 ######
 # 4.3 mangle table
 #

 #
 # 4.3.1 Set policies
 #

 #
 # 4.3.2 Create user specified chains
 #

 #
 # 4.3.3 Create content in user specified chains
 #

 #
 # 4.3.4 PREROUTING chain
 #

 #
 # 4.3.5 INPUT chain
 #

 #
 # 4.3.6 FORWARD chain
 #

 #
 # 4.3.7 OUTPUT chain
 #

 #
 # 4.3.8 POSTROUTING chain
 #

# Create syn-flood chain for detecting
# Denial of Service attacks
#iptables -t nat -N syn-flood

# Limit 12 connections per second (burst to 24)
# iptables -t nat -A syn-flood -m limit --limit 12/s --limit-burst 24 -j RETURN
# iptables -t nat -A syn-flood -j DROPLOG



--------------Boundary-00=_BSW66H4YYWW326ABG6RJ--

