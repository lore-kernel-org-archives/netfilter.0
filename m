From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Subject: RE: pop3 and dns
Date: Wed, 5 May 2004 12:58:19 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22386C3FEB012449238672E38ED61E706C2D6@overlord.overturemedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>


> These look fine as they are, however you will need a rule to=20
> allow the reply=20
> packets, and perhaps one to SNAT your Internet-bound packets=20
> if you are using=20
> private addresses on your network.

Oh... How do I do that? Can you give me a sample rule?


> Questions:
> 1. Can clients access anything by IP address rather than hostname?
> 2. Do any other services work, such as web browsing (assuming=20
> you have rules=20
> to allow other servies)?

Clients cannot access anything except web browsing through the Squid =
proxy.

>=20
> Suggestions:
> 1. Describe your network setup to us.
> 2. Show us all your netfilter rules.


We have public ips on the outside while we have private ips on the =
inside doing nat through iptables and not through the router as we do =
not have control of the router.

For example,

202.78.90.166 <-> iptables <-> 192.168.247.11
202.78.90.166 <-> iptables <-> 192.168.247.12

For web browsing I have squid proxy. So normally, clients do not have to =
resolve domain names as squid proxy does it for them. Now I need to =
allow clients to resolve domain names to be able to retrieve pop3 from =
their other mail servers.

Thanks again!


Cheers,

fritz <www.mesedilla.com>
---
+ Basta Ikaw Lord


FIREWALL.SH
#!/bin/bash
#
# IP Firewall script for iptables
#
# Copyright (C) 2003-2004  Fritz Mesedilla <fritz@mesedilla.com>
#



#########################################################################=
######
#
# Local Settings
#

IPTABLES=3D"/sbin/iptables"





#########################################################################=
######
#
# Load Modules
#

echo "Loading kernel modules..."

#/sbin/depmod -a

/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_state
/sbin/modprobe ipt_MASQUERADE

#/sbin/modprobe ipt_owner
#/sbin/modprobe ipt_REJECT
#/sbin/modprobe ipt_mark
#/sbin/modprobe ipt_tcpmss
#/sbin/modprobe multiport
#/sbin/modprobe ipt_unclean
#/sbin/modprobe ip_nat_ftp
#/sbin/modprobe ip_conntrack_ftp
#/sbin/modprobe ip_conntrack_irc





#########################################################################=
######
#
# Kernel Parameter Configuration
#

echo "Kernel configuration..."


###### Required to enable IPv4 forwarding. =
####################################
echo "1" > /proc/sys/net/ipv4/ip_forward


###### This enables SYN flood protection. =
#####################################
echo "1" > /proc/sys/net/ipv4/tcp_syncookies


###### Spoof protection =
#######################################################
echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter


###### Prevents smurfs and similar DoS nasty attacks. =
#########################
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts


###### Stops "190.200.1.11 sent an invalid ICMP error to a broadcast." =
########
echo "1" > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses


###### Turn off ECN =
###########################################################
echo "0" > /proc/sys/net/ipv4/tcp_ecn





#########################################################################=
######
#
# Flush Any Existing Rules or Chains
#

echo "Flushing Tables..."


###### Reset Default Policies =
#################################################
$IPTABLES -F INPUT
$IPTABLES -F FORWARD
$IPTABLES -F OUTPUT

$IPTABLES -t nat -F

$IPTABLES -t nat -F POSTROUTING
$IPTABLES -t nat -F PREROUTING
$IPTABLES -t nat -F OUTPUT
$IPTABLES -F

echo "Firewall completely flushed!  Now running with no firewall."





#########################################################################=
######
#
# Filter Table
#
#########################################################################=
######


##### Set Default Policies =
####################################################

$IPTABLES -P INPUT DROP
$IPTABLES -P FORWARD DROP
$IPTABLES -P OUTPUT ACCEPT




#########################################################################=
######
#
# Anti-DoS Chain
#

echo "Processing Anti-DoS chain..."


###### Syn-flood chain =
#######################################################
$IPTABLES -N syn-flood
$IPTABLES -A syn-flood -i eth0 -m limit --limit 75/s --limit-burst 100 =
-j RETURN
$IPTABLES -A syn-flood -i eth1 -j RETURN
$IPTABLES -A syn-flood -j LOG --log-prefix "SYN-FLOOD: "
$IPTABLES -A syn-flood -j DROP

$IPTABLES -A INPUT -i eth0 -p tcp --syn -j syn-flood
$IPTABLES -A INPUT -i eth1 -p tcp --syn -j syn-flood




#########################################################################=
######
#
# Notes
# 192.168.247.xxx - firewall private ip addresses
# 192.167.220.xxx - clients private ip addresses
#
# 202.138.128.xxx - public ip addresses
#




#########################################################################=
######
#
# INPUT Chain
#

echo "Processing INPUT chain..."


###### Allow established connection =
###########################################
$IPTABLES -A INPUT -p ALL -m state --state ESTABLISHED,RELATED -j ACCEPT


###### Port 80 Incoming - Web Server =
##########################################
$IPTABLES -A INPUT -p tcp -d 192.168.247.231 --dport 80 -j ACCEPT
$IPTABLES -A INPUT -p tcp -d 192.168.247.232 --dport 80 -j ACCEPT

$IPTABLES -A INPUT -p tcp -d 192.168.247.205 --dport 80 -j ACCEPT
$IPTABLES -A INPUT -p tcp -d 192.168.247.206 --dport 80 -j ACCEPT


###### Port 22 Incoming - SSH =
#################################################
$IPTABLES -A INPUT -p tcp --dport 22 -j ACCEPT
#$IPTABLES -A INPUT -p tcp -s 192.167.220.21 --dport 22 -j ACCEPT
#$IPTABLES -A INPUT -p tcp -s 202.138.128.44 --dport 22 -j ACCEPT


###### Port 25 from internet to mail.overturemedia.com =
########################
$IPTABLES -A INPUT -p tcp -i eth0 -d 192.168.247.230 --dport 25 -j =
ACCEPT
$IPTABLES -A INPUT -p tcp -i eth0 -d 192.168.247.204 --dport 25 -j =
ACCEPT


###### Port 25 from overlord.overturemedia.com to linux relay =
#################
$IPTABLES -A INPUT -p tcp -i eth1 -d 192.167.220.101 -s 192.167.220.102 =
--dport 25 -j ACCEPT


###### Port 123 time server =
####################################################
$IPTABLES -A INPUT -p tcp -m tcp -s 192.167.220.102 --dport 123 --syn -j =
ACCEPT
$IPTABLES -A INPUT -p udp -m udp -s 192.167.220.102 --dport 123 -j =
ACCEPT


###### Port 137:139 - fritz/mark/samba =
########################################
$IPTABLES -A INPUT -p tcp -s 192.167.220.21 --dport 137:139 -j ACCEPT
$IPTABLES -A INPUT -p tcp -s 192.167.220.24 --dport 137:139 -j ACCEPT
$IPTABLES -A INPUT -p tcp -s 192.167.220.102 --dport 137:139 -j ACCEPT
$IPTABLES -A INPUT -p tcp -s 192.167.220.103 --dport 137:139 -j ACCEPT

$IPTABLES -A INPUT -p udp -s 192.167.220.21 --dport 137:139 -j ACCEPT
$IPTABLES -A INPUT -p udp -s 192.167.220.24 --dport 137:139 -j ACCEPT
$IPTABLES -A INPUT -p udp -s 192.167.220.102 --dport 137:139 -j ACCEPT
$IPTABLES -A INPUT -p udp -s 192.167.220.103 --dport 137:139 -j ACCEPT

$IPTABLES -A INPUT -p udp -s 192.167.220.102 --sport 137:139 -j ACCEPT
$IPTABLES -A INPUT -p udp -s 192.167.220.103 --sport 137:139 -j ACCEPT


###### Port 3128 incoming =
#####################################################
$IPTABLES -A INPUT -p tcp -i eth1 -s 192.167.220.21 --dport 3128 -j =
ACCEPT
$IPTABLES -A INPUT -p tcp -i eth1 -s 192.167.220.22 --dport 3128 -j =
ACCEPT
$IPTABLES -A INPUT -p tcp -i eth1 -s 192.167.220.23 --dport 3128 -j =
ACCEPT
$IPTABLES -A INPUT -p tcp -i eth1 -s 192.167.220.24 --dport 3128 -j =
ACCEPT
$IPTABLES -A INPUT -p tcp -i eth1 -s 192.167.220.25 --dport 3128 -j =
ACCEPT
$IPTABLES -A INPUT -p tcp -i eth1 -s 192.167.220.26 --dport 3128 -j =
ACCEPT
$IPTABLES -A INPUT -p tcp -i eth1 -s 192.167.220.102 --dport 3128 -j =
ACCEPT
$IPTABLES -A INPUT -p tcp -i eth1 -s 192.167.220.103 --dport 3128 -j =
ACCEPT
$IPTABLES -A INPUT -p tcp -i eth1 -s 192.167.220.104 --dport 3128 -j =
ACCEPT
$IPTABLES -A INPUT -p tcp -i eth1 -s 192.167.220.105 --dport 3128 -j =
ACCEPT


###### Port 8888 Incoming - fritz/Webmin =
##############################################
$IPTABLES -A INPUT -p tcp -i eth1 -s 192.167.220.21 --dport 8888 -j =
ACCEPT


###### Port 9200/9201 Incoming Wap Server =
#####################################
$IPTABLES -A INPUT -p udp -s 202.138.128.44 -d 192.168.247.206 --dport =
9200 -j ACCEPT
$IPTABLES -A INPUT -p udp -s 202.138.128.44 -d 192.168.247.206 --dport =
9201 -j ACCEPT


###### loopback interface =
#####################################################
$IPTABLES -A INPUT -i lo -p ALL -j ACCEPT

=20
###### drop everything else =
###################################################
#$IPTABLES -A INPUT -p ALL -s 0/0 -j LOG --log-level DEBUG --log-prefix =
"DROPPED: "
$IPTABLES -A INPUT -p ALL -s 0/0 -j DROP




#########################################################################=
######
#
# FORWARD Chain
#

echo "Processing FORWARD chain..."


###### dns =
####################################################################
$IPTABLES -A FORWARD -p tcp --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -p udp --dport 53 -j ACCEPT

$IPTABLES -A FORWARD -p tcp --dport 110 -j LOG --log-prefix "POP3:"
$IPTABLES -A FORWARD -p tcp --dport 110 -j ACCEPT



#########################################################################=
######
#
# OUTPUT Chain
#

echo "Processing OUTPUT chain..."

$IPTABLES -A OUTPUT -p tcp -j ACCEPT
$IPTABLES -A OUTPUT -p udp -j ACCEPT


###### loopback interface =
#####################################################
$IPTABLES -A OUTPUT -o lo -p ALL -j ACCEPT





#########################################################################=
######
#
# NAT Chain
#

echo "Processing NAT..."

###### Transparent Proxy =
######################################################
$IPTABLES -t nat -A PREROUTING -i eth1 -s 192.167.220.0/255.255.255.0 -p =
tcp --dport 80 -j REDIRECT --to-port 3128


###### Allow established connections =
##########################################
$IPTABLES -A FORWARD -p ALL -m state --state ESTABLISHED,RELATED -j =
ACCEPT



###### Development Server's Web Server NAT =
####################################
#
#


###### Visitor to Firewall to Server =
#########################################
$IPTABLES -t nat -A PREROUTING -p tcp -i eth0 -d 192.168.247.203 --dport =
80 -j DNAT --to 192.167.220.22
$IPTABLES -A FORWARD -p tcp -i eth0 -o eth1 -d 192.167.220.22 --dport 80 =
-j ACCEPT

###### Server Reply to Firewall to Visitor =
###################################
$IPTABLES -A FORWARD -p tcp -i eth1 -o eth0 -s 192.167.220.22 --sport 80 =
-j ACCEPT
$IPTABLES -t nat -A POSTROUTING -p tcp -o eth1 -d 192.167.220.22 --dport =
80 -j MASQUERADE



###### office static nats =
#####################################################
#
#


###### fritz - sql =
############################################################
$IPTABLES -A FORWARD -p tcp -i eth1 -o eth0 -s 192.167.220.21 -m =
multiport --dport 1433 -j ACCEPT
$IPTABLES -t nat -A POSTROUTING -p tcp -o eth0 -s 192.167.220.21 -m =
multiport --dport 1433 -j SNAT --to-source 192.168.247.11


###### jun - radmin,sql =
#######################################################
$IPTABLES -A FORWARD -p tcp -i eth1 -o eth0 -s 192.167.220.22 -m =
multiport --dport 4899,1433 -j ACCEPT
$IPTABLES -t nat -A POSTROUTING -p tcp -o eth0 -s 192.167.220.22 -m =
multiport --dport 4899,1433 -j SNAT --to-source 192.168.247.12



echo "IPTables firewall implemented."


#########################################################################=
######
#
# Routing Table
#

route add -net 202.138.159.0 gw 190.200.1.246 netmask 255.255.255.0
route add -net 192.168.247.0 gw 190.200.1.246 netmask 255.255.255.0


echo "Routing table to Local Peer implemented."

----------------------------------------------------------------------
This email and any files transmitted with it are confidential and
intended solely for the use of the individual or entity to whom they
are addressed. If you have received this email in error please notify
the sender immediately by e-mail and delete this e-mail from your
system. Please note that any views or opinions presented in this
email are solely those of the author and do not necessarily represent
those of the company. Finally, the recipient should check this email
and any attachments for the presence of viruses. The company accepts
no liability for any damage caused by any virus transmitted by this
email.=20

Overture Media, Inc.
Direct Line: (632) 635-4785
Trunkline:   (632) 631-8971 Local 146
Fax: (632) 637-2206
Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor. Ortigas Ave., =
Quezon City 1100


