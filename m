From: "Francois Peyron" <maillings@peyron.nom.fr>
Subject: Needing some help to check iptables configuration
Date: Wed, 29 May 2002 00:52:21 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <HCEEIHCIBILHEDFLFOKFKEEFCIAA.maillings@peyron.nom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi there,

I did setup a classical linux firewall box with two private ip segment, one
for the intranet(192.168.1.0/24), the other one for dmz (10.0.0.0/8).

Please find my firewall scripts (i ve deleted ip addresses for security
purpose but it's not very important to understand, isn't it ? Sorry for the
french comments, nobody is perfect :) ):
_______________________________________________________________________
# Configuration firewall

# Variables
############################################################################
###
# Locale
LO_IFACE="lo"
# Internet
NET_IFACE="eth1"
IP_NET="*ip address of the box*"
# Intranet
TRA_IFACE="eth0"
IP_TRA="192.168.1.1"
TRA_LAN="192.168.1.0/24"
# Dmz
DMZ_IFACE="eth2"
IP_DMZ="10.0.0.1"
DMZ_LAN="10.0.0.1/8"

# Nettoyage des tables existantes
############################################################################
###
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X

# Permet le mode ftp passif
############################################################################
###
/sbin/insmod -s ip_conntrack_ftp
/sbin/insmod -s ip_nat_ftp

# Options systemes
############################################################################
###
# Activation de la NAT
echo 1 > /proc/sys/net/ipv4/ip_forward
# Bloque les echo ICMP
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
# Le firewall ne repond plus au ping et les traceroute ne sont plus routes
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all
# Empeche le routage des paquets pre-routes
echo 1 > /proc/sys/net/ipv4/conf/all/accept_source_route
# Protege de l'ip-spoofing
echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
# log les paquets portant des adresses impossibles
echo 1 > /proc/sys/net/ipv4/conf/$NET_IFACE/log_martians

# Blocage de tous les paquets pour le temps de la configuration
# (sauf loopback)
############################################################################
###
iptables -A INPUT -i ! $LO_IFACE -j DROP
iptables -A OUTPUT -j DROP
iptables -A FORWARD -j DROP

# Creation des tables
############################################################################
###
# Table ICMP
iptables -N ICMP
# Table "log et jette"
iptables -N LOGDROP
# Table Intranet vers Internet
iptables -N TRA_NET
# Table Internet vers Intranet
iptables -N NET_TRA
# Table Intranet vers Dmz
iptables -N TRA_DMZ
# Table Dmz vers Intranet
iptables -N DMZ_TRA
# Table Internet vers Dmz
iptables -N NET_DMZ
# Table Dmz vers Internet
iptables -N DMZ_NET
# Table client SSH vers Firewall
iptables -N SSH_FW

# Acces en SSH au fw a partir de l'ext
############################################################################
###
iptables -A SSH_FW -p tcp --dport ssh -j ACCEPT
iptables -A SSH_FW -p udp --dport ssh -j ACCEPT

# Regles de la table ICMP
############################################################################
###
iptables -A ICMP -p icmp --icmp-type destination-unreachable -j ACCEPT
iptables -A ICMP -p icmp --icmp-type source-quench -j ACCEPT
iptables -A ICMP -p icmp --icmp-type time-exceed -j ACCEPT
iptables -A ICMP -p icmp --icmp-type echo-request -j ACCEPT
iptables -A ICMP -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A ICMP -m limit --limit 15/minute -j LOG --log-prefix
Firewall_icmp:
iptables -A ICMP -j DROP

# Regles de la table LOGDROP
############################################################################
###
iptables -A LOGDROP -m limit --limit 15/minute -j LOG --log-prefix Firewall:
iptables -A LOGDROP -j DROP

# Regles de la table TRA_NET
############################################################################
###
iptables -A TRA_NET -p icmp -j ICMP
iptables -A TRA_NET -p tcp --dport smtp -j ACCEPT #smtp
iptables -A TRA_NET -p tcp --dport pop3 -j ACCEPT #pop3
iptables -A TRA_NET -p tcp --dport http -j ACCEPT #http
iptables -A TRA_NET -p udp --dport http -j ACCEPT #http
iptables -A TRA_NET -p tcp --dport https -j ACCEPT #https
iptables -A TRA_NET -p udp --dport https -j ACCEPT #https
iptables -A TRA_NET -p tcp --dport ftp -j ACCEPT #ftp
iptables -A TRA_NET -p udp --dport ftp -j ACCEPT #ftp
iptables -A TRA_NET -p tcp --dport ftp-data -j ACCEPT #ftp-data
iptables -A TRA_NET -p udp --dport ftp-data -j ACCEPT #ftp-data
iptables -A TRA_NET -p tcp --dport domain -j ACCEPT #dns
iptables -A TRA_NET -p udp --dport domain -j ACCEPT #dns

# Regles de la table NET_TRA
############################################################################
###
# Regles "Log et drop"
iptables -A NET_TRA -p tcp --tcp-flags ALL FIN,URG,PSH -j LOGDROP
iptables -A NET_TRA -p tcp --tcp-flags ALL ALL -j LOGDROP
iptables -A NET_TRA -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j LOGDROP
iptables -A NET_TRA -p tcp --tcp-flags ALL NONE -j LOGDROP
iptables -A NET_TRA -p tcp --tcp-flags SYN,RST SYN,RST -j LOGDROP
iptables -A NET_TRA -p tcp --tcp-flags SYN,FIN SYN,FIN -j LOGDROP
iptables -A NET_TRA -p icmp -j LOGDROP

# Regles de la table TRA_DMZ
############################################################################
###

# Regles de la table DMZ_TRA
############################################################################
###

# Regles de la table NET_DMZ
############################################################################
###

# Regles de la table DMZ_NET
############################################################################
###

# NAT
############################################################################
###
# Activation de la NAT sortante
iptables -t nat -A POSTROUTING -s $TRA_LAN -o $NET_IFACE -j SNAT --to
$IP_NET
iptables -t nat -A POSTROUTING -s $DMZ_LAN -o $NET_IFACE -j SNAT --to
$IP_NET
# Activation de la NAT entrante

# Sauts entre tables
############################################################################
###
# Saut vers la table SSH_FW
iptables -A FORWARD -s *ip adress allowed to connect* -d $IP_NET -i
$NET_IFACE -j SSH_FW
# Saut vers la table TRA_NET
iptables -A FORWARD -s $TRA_LAN -i $TRA_IFACE -j TRA_NET
# Saut vers la table NET_TRA
iptables -A FORWARD -d $TRA_LAN -i $NET_IFACE -j NET_TRA
# Saut vers la table TRA_DMZ
iptables -A FORWARD -s $TRA_LAN -i $TRA_IFACE -j TRA_DMZ
# Saut vers la table DMZ_TRA
iptables -A FORWARD -s $DMZ_LAN -i $DMZ_IFACE -j DMZ_TRA
# Saut vers la table NET_DMZ
iptables -A FORWARD -d $DMZ_LAN -i $NET_IFACE -j NET_DMZ
# Saut vers la table DMZ_NET
iptables -A FORWARD -s $DMZ_LAN -i $DMZ_IFACE -j DMZ_NET

# Acceptation des paquets relies
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Remove des regles bloquantes
############################################################################
###
iptables -D INPUT 1
iptables -D FORWARD 1
iptables -D OUTPUT 1

iptables -A FORWARD -j DROP
______________________________________________________________________

Not all the tables are written but no matter, what I need is to connect to
this box using sshd.
The problem I've got is that I can connect on this box with ssh but from
whatever the ip is ...
It's quite annoying, I guess you understand :)
I'm not sure the other parameters are right for what I need ...

Please find the result of an 'iptables -L' command:
______________________________________________________________________
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
SSH_FW     all  --  *one ip on the internet*  *my public ip*
TRA_NET    all  --  192.168.1.0/24       anywhere
NET_TRA    all  --  anywhere             192.168.1.0/24
TRA_DMZ    all  --  192.168.1.0/24       anywhere
DMZ_TRA    all  --  10.0.0.0/8           anywhere
NET_DMZ    all  --  anywhere             10.0.0.0/8
DMZ_NET    all  --  10.0.0.0/8           anywhere
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED
DROP       all  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain DMZ_NET (1 references)
target     prot opt source               destination

Chain DMZ_TRA (1 references)
target     prot opt source               destination

Chain ICMP (1 references)
target     prot opt source               destination
ACCEPT     icmp --  anywhere             anywhere           icmp
destination-unreachable
ACCEPT     icmp --  anywhere             anywhere           icmp
source-quench
ACCEPT     icmp --  anywhere             anywhere           icmp
time-exceeded
ACCEPT     icmp --  anywhere             anywhere           icmp
echo-request
ACCEPT     icmp --  anywhere             anywhere           icmp echo-reply
LOG        all  --  anywhere             anywhere           limit: avg
15/min burst 5 LOG level warning prefix `Firewall_icmp:'
DROP       all  --  anywhere             anywhere

Chain LOGDROP (7 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere           limit: avg
15/min burst 5 LOG level warning prefix `Firewall:'
DROP       all  --  anywhere             anywhere

Chain NET_DMZ (1 references)
target     prot opt source               destination

Chain NET_TRA (1 references)
target     prot opt source               destination
LOGDROP    tcp  --  anywhere             anywhere           tcp
flags:FIN,SYN,RST,PSH,ACK,URG/FIN,PSH,URG
LOGDROP    tcp  --  anywhere             anywhere           tcp
flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,PSH,ACK,URG
LOGDROP    tcp  --  anywhere             anywhere           tcp
flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,ACK,URG
LOGDROP    tcp  --  anywhere             anywhere           tcp
flags:FIN,SYN,RST,PSH,ACK,URG/NONE
LOGDROP    tcp  --  anywhere             anywhere           tcp
flags:SYN,RST/SYN,RST
LOGDROP    tcp  --  anywhere             anywhere           tcp
flags:FIN,SYN/FIN,SYN
LOGDROP    icmp --  anywhere             anywhere

Chain SSH_FW (1 references)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ssh
ACCEPT     udp  --  anywhere             anywhere           udp dpt:ssh

Chain TRA_DMZ (1 references)
target     prot opt source               destination

Chain TRA_NET (1 references)
target     prot opt source               destination
ICMP       icmp --  anywhere             anywhere
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:smtp
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:pop3
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:http
ACCEPT     udp  --  anywhere             anywhere           udp dpt:http
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:https
ACCEPT     udp  --  anywhere             anywhere           udp dpt:https
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ftp
ACCEPT     udp  --  anywhere             anywhere           udp dpt:ftp
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ftp-data
ACCEPT     udp  --  anywhere             anywhere           udp dpt:ftp-data
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:domain
ACCEPT     udp  --  anywhere             anywhere           udp dpt:domain
___________________________________________________________________________

I didn't manage to find what's wrong ...
any help would be appreciated :)
Regards
Francois


