From: "Francois Peyron" <mailings@peyron.nom.fr>
Subject: Does it look better plz ?
Date: Wed, 12 Jun 2002 00:32:46 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <HCEEIHCIBILHEDFLFOKFGEOBCIAA.mailings@peyron.nom.fr>
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
To: netfilter <netfilter@lists.samba.org>

Dear all,

Please find a new release of my iptables script.
I thank you sincerely all the guys who answered my uqestion last times, I
have now two others:
where do I put this rules:
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

And why can't I reach the mail server (internal ip: 10.0.0.12) from outside
with this script ?
this is a tcpdump of the connection (assuming 1.2.3.4 is the official ip
address of the mail server)

[root@gate /usr]# tcpdump -i eth1:1 |  grep smtp
tcpdump: listening on eth1:1
20:21:06.470000 dyn-212-129-44-75.ppp.tiscali.fr.10666 > 1.2.3.4.smtp: S
826430586:826430586(0) win 16384 <mss 1400,nop,nop,sackOK> (DF)
20:21:06.470000 1.2.3.4.smtp > dyn-212-129-44-75.ppp.tiscali.fr.10666: R
0:0(0) ack 826430587 win 0 (DF)
20:21:07.350000 dyn-212-129-44-75.ppp.tiscali.fr.10667 > 1.2.3.4.smtp: S
826430586:826430586(0) win 16384 <mss 1400,nop,nop,sackOK> (DF)
20:21:07.350000 1.2.3.4.smtp > dyn-212-129-44-75.ppp.tiscali.fr.10667: R
0:0(0) ack 826430587 win 0 (DF)
20:21:08.140000 dyn-212-129-44-75.ppp.tiscali.fr.10668 > 1.2.3.4.smtp: S
826430586:826430586(0) win 16384 <mss 1400,nop,nop,sackOK> (DF)
20:21:08.140000 1.2.3.4.smtp > dyn-212-129-44-75.ppp.tiscali.fr.10668: R
0:0(0) ack 826430587 win 0 (DF)



# Configuration firewall

# Variables
############################################################################
###
# Locale
LO_IFACE="lo"
# Internet
NET_IFACE="eth1"
IP_NET="official ip on the net"
WEB_NET="another one official ip on the net"
MAIL_NET="another one"
NUX_NET="another one"
# Intranet
TRA_IFACE="eth0"
IP_TRA="192.168.1.1"
TRA_LAN="192.168.1.0/24"
# Dmz
DMZ_IFACE="eth2"
IP_DMZ="10.0.0.1"
DMZ_LAN="10.0.0.1/8"
WEB_LAN="10.0.0.10"
MAIL_LAN="10.0.0.12"
NUX_LAN="10.0.0.13"

# Creation des sub interface pour les machines hebergees en DMZ
############################################################################
###
#ifconfig eth1:0 $WEB_NET netmask 255.255.255.248 broadcast *bc address*
ifconfig eth1:1 $MAIL_NET netmask 255.255.255.248 broadcast *bc address*
#ifconfig eth1:2 $NUX_NET netmask 255.255.255.248 broadcast *bc address*

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
# Permet au kernel de forwarder IP
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
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Creation des tables
############################################################################
###
# Table ICMP
#iptables -N ICMP
# Table "log et jette"
#iptables -N LOGDROP
# Table Intranet vers Internet
iptables -N TRA_NET
# Table Internet vers Intranet
iptables -N NET_TRA
# Table Intranet vers Dmz
#iptables -N TRA_DMZ
# Table Dmz vers Intranet
#iptables -N DMZ_TRA
# Table Internet vers Dmz
iptables -N NET_DMZ
# Table Dmz vers Internet
iptables -N DMZ_NET
# Table client SSH vers Firewall
#iptables -N SSH_FW

# Acces en SSH au fw a partir de l'ext
############################################################################
###
#iptables -A SSH_FW -p tcp --dport ssh -j ACCEPT
#iptables -A SSH_FW -p udp --dport ssh -j ACCEPT

# Regles de la table ICMP
############################################################################
###
#iptables -A ICMP -p icmp --icmp-type destination-unreachable -j ACCEPT
#iptables -A ICMP -p icmp --icmp-type source-quench -j ACCEPT
#iptables -A ICMP -p icmp --icmp-type time-exceed -j ACCEPT
#iptables -A ICMP -p icmp --icmp-type echo-request -j ACCEPT
#iptables -A ICMP -p icmp --icmp-type echo-reply -j ACCEPT
#iptables -A ICMP -m limit --limit 15/minute -j LOG --log-prefix
Firewall_icmp:
#iptables -A ICMP -j DROP

# Regles de la table LOGDROP
############################################################################
###
#iptables -A LOGDROP -m limit --limit 15/minute -j LOG --log-prefix
Firewall:
#iptables -A LOGDROP -j DROP

# Regles de la table TRA_NET
############################################################################
###
#iptables -A TRA_NET -p icmp -j ICMP
iptables -A TRA_NET -p tcp --dport smtp -j ACCEPT #smtp
iptables -A TRA_NET -p tcp --dport pop3 -j ACCEPT #pop3
iptables -A TRA_NET -p tcp --dport http -j ACCEPT #http
iptables -A TRA_NET -p tcp --dport https -j ACCEPT #https
iptables -A TRA_NET -p tcp --dport ftp -j ACCEPT #ftp
iptables -A TRA_NET -p tcp --dport ftp-data -j ACCEPT #ftp-data
iptables -A TRA_NET -p tcp --dport domain -j ACCEPT #dns
iptables -A TRA_NET -p udp --dport domain -j ACCEPT #dns

# Regles de la table NET_TRA
############################################################################
###
# Regles "Log et drop"
#iptables -A NET_TRA -p tcp --tcp-flags ALL FIN,URG,PSH -j LOGDROP
#iptables -A NET_TRA -p tcp --tcp-flags ALL ALL -j LOGDROP
#iptables -A NET_TRA -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j LOGDROP
#iptables -A NET_TRA -p tcp --tcp-flags ALL NONE -j LOGDROP
#iptables -A NET_TRA -p tcp --tcp-flags SYN,RST SYN,RST -j LOGDROP
#iptables -A NET_TRA -p tcp --tcp-flags SYN,FIN SYN,FIN -j LOGDROP
#iptables -A NET_TRA -p icmp -j LOGDROP

# Regles de la table TRA_DMZ
############################################################################
###

# Regles de la table DMZ_TRA
############################################################################
###

# Regles de la table NET_DMZ
############################################################################
###
iptables -A NET_DMZ -p tcp -d $MAIL_LAN --dport smtp -j ACCEPT #smtp
iptables -A NET_DMZ -p tcp -d $MAIL_LAN --dport pop3 -j ACCEPT #pop3
iptables -A NET_DMZ -p tcp -d $MAIL_LAN --dport http -j ACCEPT #http
iptables -A NET_DMZ -p tcp -d $MAIL_LAN --dport https -j ACCEPT #https
iptables -A NET_DMZ -p tcp -d $MAIL_LAN --dport 8080 -j ACCEPT #8080
iptables -A NET_DMZ -p tcp -d $MAIL_LAN --dport 8082 -j ACCEPT #8082
iptables -A NET_DMZ -p tcp -d $MAIL_LAN --dport 8083 -j ACCEPT #8083

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
iptables -t nat -A PREROUTING -i $NET_IFACE -p tcp -d $MAIL_NET --dport
smtp -j DNAT --to $MAIL_LAN
iptables -t nat -A PREROUTING -i $NET_IFACE -p tcp -d $MAIL_NET --dport
pop3 -j DNAT --to $MAIL_LAN
iptables -t nat -A PREROUTING -i $NET_IFACE -p tcp -d $MAIL_NET --dport
http -j DNAT --to $MAIL_LAN
iptables -t nat -A PREROUTING -i $NET_IFACE -p tcp -d $MAIL_NET --dport
https -j DNAT --to $MAIL_LAN
iptables -t nat -A PREROUTING -i $NET_IFACE -p tcp -d $MAIL_NET --dport
8080 -j DNAT --to $MAIL_LAN
iptables -t nat -A PREROUTING -i $NET_IFACE -p tcp -d $MAIL_NET --dport
8082 -j DNAT --to $MAIL_LAN
iptables -t nat -A PREROUTING -i $NET_IFACE -p tcp -d $MAIL_NET --dport
8083 -j DNAT --to $MAIL_LAN

# Sauts entre tables
############################################################################
###
# Saut vers la table SSH_FW
#iptables -A INPUT -s *another ip* -d $IP_NET -i $NET_IFACE -j SSH_FW
# Saut vers la table TRA_NET
iptables -A FORWARD -s $TRA_LAN -i $TRA_IFACE -j TRA_NET
# Saut vers la table NET_TRA
iptables -A FORWARD -d $TRA_LAN -i $NET_IFACE -j NET_TRA
# Saut vers la table TRA_DMZ
#iptables -A FORWARD -s $TRA_LAN -i $TRA_IFACE -j TRA_DMZ
# Saut vers la table DMZ_TRA
#iptables -A FORWARD -s $DMZ_LAN -i $DMZ_IFACE -j DMZ_TRA
# Saut vers la table NET_DMZ
iptables -A FORWARD -d $DMZ_LAN -i $NET_IFACE -j NET_DMZ
# Saut vers la table DMZ_NET
iptables -A FORWARD -s $DMZ_LAN -i $DMZ_IFACE -j DMZ_NET

# Acceptation des paquets relies
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Remove des regles bloquantes
############################################################################
###
#iptables -A FORWARD -j DROP



Thanx,

Francois


