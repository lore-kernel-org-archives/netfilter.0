From: "Diego Ramos V." <diegorvdebian@gmail.com>
Subject: please, what is the mistake????????
Date: Fri, 19 Dec 2008 15:16:37 -0500
Message-ID: <afce84120812191216n2cffc43dwb873b640dc45d1fe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=uSOAZryDrfiG6owSNn23JSOhrZ6nyOb6/3Z24rH2dnk=;
        b=PSH4xcSv2curfUx0j8SaSMGPGBRjL+3lw7Q/6tdksInEkV2AJNZi+CP5ehmKQweqPt
         fgNSrFBu+16WRhKYNcDO5y+YWwpZyEGgXeBsJM64ju9bdGnNGI5gRb5dFBJHyj0g0wnO
         /l2978ajMTdslV1wEi2zQeKT2PMeUI/BoX09k=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi everyone, please I need  your help, I'm new at using Linux and iptab=
les
I'm doing a simulation such as "honeypots" to protect web and mail
servers, my project looks so,  ans it is composed:
A  web and mail server host on Centos5 (IP 192.168.22.21), it has no
problem; A 2nd host Debian 4.0 where I run a web and mail server on
UML(tap0 192.168.0.20) with fedora7 filesystem (ip 192.168.0.30)
without problem, a NIC (IP 192.168.22.22)
to connect Centos5server), finally another NIC (IP 192.168.240.22) to
simulate attacks on web mail sever on UML honeypot.
Project Honeynet suggests a control data with IPTABLES, my firewall is
going to be Debian4.0 host to protect Centos5 server, as well as UML
honeypot, but I've not been able to set iptables, I used   Oskar
Andreasson  guide  translated into spanish (because I'm ecuadorian if
someone knows spanish I would thank), and used the next script, which
is adjusted my Project:
#############################################
#!/bin/sh

# 1. Opciones de Configuraci=F3n.
#
iptables -F
iptables -X
iptables -Z
#
# 1.1 Configuraci=F3n de Internet.
#
INET_IP=3D"192.168.240.0/24"
INET_IFACE=3D"eth0"
#

# 1.2 Configuraci=F3n de la Red Honeypot
#
HON_MAIL_IP=3D"192.168.0.30"
HON_HTTP_IP=3D"192.168.0.30"
HON_DNS_IP=3D"192.168.0.20"
HON_IP=3D"192.168.0.20"
HON_IFACE=3D"tap0"
#
# 1.3 Configuraci=F3n DMZ. SERVIDORES
#
ser_MAIL_IP=3D"192.168.22.21"
ser_HTTP_IP=3D"192.168.22.21"
ser_DNS_IP=3D"192.168.22.21"
ser_IP=3D"192.168.22.22"
ser_IFACE=3D"eth1"
#
# 1.4 Configuraci=F3n del host local.
#
LO_IFACE=3D"lo"
LO_IP=3D"127.0.0.1"
#
# 1.5 Configuraci=F3n de IPTables.
#
IPTABLES=3D"/sbin/iptables"
#

# 2. Carga de m=F3dulos.
#
#
# Necesario para la carga inicial de m=F3dulos.
#
/sbin/depmod -a
#
# 2.1 M=F3dulos requeridos.
#
/sbin/modprobe  ip_tables
/sbin/modprobe  ip_conntrack
/sbin/modprobe  iptable_filter
/sbin/modprobe  iptable_mangle
/sbin/modprobe  iptable_nat
/sbin/modprobe  ipt_LOG
/sbin/modprobe  ipt_limit
/sbin/modprobe  ipt_state
#
# 2.2 M=F3dulos no-requeridos.
#
#/sbin/modprobe ipt_owner
#/sbin/modprobe ipt_REJECT
#/sbin/modprobe ipt_MASQUERADE
#/sbin/modprobe ip_conntrack_ftp
#/sbin/modprobe ip_conntrack_irc
#/sbin/modprobe ip_nat_ftp
#/sbin/modprobe ip_nat_irc
#######################################################################=
####
#
# 3. Configuraci=F3n de /proc.
#
#
# 3.1 Configuraci=F3n requerida de proc.
#
echo "1" > /proc/sys/net/ipv4/ip_forward
#
# 3.2 Configuraci=F3n no-requerida de proc.
#
#echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter
#echo "1" > /proc/sys/net/ipv4/conf/all/proxy_arp
#echo "1" > /proc/sys/net/ipv4/ip_dynaddr
#######################################################################=
####
#
# 4. Configuraci=F3n de las reglas.
#
######
# 4.1 Tabla Filter.
#
# 4.1.1 Establecimiento de pol=EDticas.
#
$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD ACCEPT
#
# 4.1.2 Creaci=F3n de cadenas de usuario.
#
# Creaci=F3n de una cadena para paquetes TCP incorrectos.
#
$IPTABLES -N bad_tcp_packets
#####################
#
# Creaci=F3n de cadenas separadas para los paquetes ICMP, TCP y UDP.
#
$IPTABLES -N allowed
$IPTABLES -N icmp_packets
#
# 4.1.3 Creaci=F3n de contenido en las cadenas de usuario.
#
#
# Cadena bad_tcp_packets.
#
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG=
 \
--log-level DEBUG --log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DRO=
P
#
# Cadena de "permitidos".
#
$IPTABLES -A allowed -p TCP --syn -j ACCEPT
$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACC=
EPT
$IPTABLES -A allowed -p TCP -j DROP
#
# Reglas ICMP.
#
# Changed rules totally
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT
#
# 4.1.4 Cadena INPUT.
#
# Paquetes TCP incorrectos que no deseamos.
#
$IPTABLES -A INPUT -p tcp -j bad_tcp_packets
#
# Paquetes desde Internet hacia este equipo.
#
$IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j icmp_packets
#
# Paquetes desde la red local (LAN), DMZ o el host local.
#############
#

$IPTABLES -A INPUT -p ALL -i $ser_IFACE -d $ser_IP -j ACCEPT
#
#
$IPTABLES -A INPUT -p ALL -i $HON_IFACE -d $HON_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $HON_IFACE -d $HON_DNS_IP -j ACCEPT
#$IPTABLES -A INPUT -p ALL -i $HON_IFACE -d $HON_BROADCAST_ADDRESS -j A=
CCEPT
#
# Desde la interfaz del host local hacia la IP del host local.
#
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $HON_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $ser_IP -j ACCEPT
#
# Regla especial para peticiones DHCP desde la red local, que de otra f=
orma
# no ser=EDan gestionadas correctamente.
#
#$IPTABLES -A INPUT -p UDP -i $LAN_IFACE --dport 67 --sport 68 -j ACCEP=
T
#
# Todos los paquetes que han establecido una conexi=F3n y todos los que
# dependen de =E9llos, provenientes de Internet hacia el cortafuegos.
#
$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state ESTABLISHED,RELA=
TED \
-j ACCEPT
#
##############################3
$IPTABLES -A INPUT -p TCP -i $INET_IFACE -d $HON_DNS_IP \
--dport 53 -j allowed
$IPTABLES -A INPUT -p UDP -i $INET_IFACE  -d $HON_DNS_IP \
--dport 53 -j ACCEPT
############################################
# Registra paquetes extra=F1os que no concuerdan con lo anterior.
#
$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT INPUT packet died: "
#
# 4.1.5 Cadena FORWARD.
#
#
# Paquetes TCP incorrectos que no queremos.
#
$IPTABLES -A FORWARD -p tcp -j bad_tcp_packets
#
# Secci=F3n DMZ.
#
# Reglas generales.
#
$IPTABLES -A FORWARD -i $ser_IFACE -o $INET_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -o $ser_IFACE -m state \
--state ESTABLISHED,RELATED -j ACCEPT
#$IPTABLES -A FORWARD -i $HON_IFACE -o $ser_IFACE -j ACCEPT
#$IPTABLES -A FORWARD -i $ser_IFACE -o $HON_IFACE -m state \
#--state ESTABLISHED,RELATED -j ACCEPT
#
# Servidor HTTP.
#
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $ser_IFACE -d $ser_HTTP_I=
P \
--dport 80 -j allowed

$IPTABLES -A FORWARD -p TCP -i $ser_IFACE -o $INET_IFACE -d $INET_IFACE=
 \
--sport 80 -j allowed

$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $ser_IFACE -d $ser_HTTP_=
IP \
-j icmp_packets
#
# Servidor DNS.
#
#################
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $ser_IFACE -d $ser_DNS_IP=
 \
--dport 53 -j allowed
$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $ser_IFACE -d $ser_DNS_IP=
 \
--dport 53 -j ACCEPT
$IPTABLES -A FORWARD -p UDP -i $ser_IFACE -o $INET_IFACE -d $INET_IFACE=
 \
--sport 53 -j ACCEPT

#SERVIDOR CORREO

$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $ser_IFACE -d $ser_MAIL_I=
P \
--dport 25 -j allowed

$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $ser_IFACE -d $ser_MAIL_I=
P \
--dport 143 -j allowed

$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $ser_IFACE -d $ser_MAIL_I=
P \
--dport 110 -j allowed
#
# Secci=F3n HON (red local).

#
# Reglas generales.
#
$IPTABLES -A FORWARD -i $HON_IFACE -o $INET_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -o $HON_IFACE -m state \
--state ESTABLISHED,RELATED -j ACCEPT
#$IPTABLES -A FORWARD -i $LAN_IFACE -o $DMZ_IFACE -j ACCEPT
#$IPTABLES -A FORWARD -i $DMZ_IFACE -o $LAN_IFACE -m state \
#--state ESTABLISHED,RELATED -j ACCEPT
#
# Servidor HTTP.
#
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $HON_IFACE -d $HON_HTTP_I=
P \
--dport 80 -j allowed
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $HON_IFACE -d $HON_HTTP_=
IP \
-j icmp_packets
#
# Servidor DNS.
#
#SERVIDOR CORREO

$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $HON_IFACE -d $HON_MAIL_I=
P \
--dport 25 -j allowed

$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $HON_IFACE -d $HON_MAIL_I=
P \
--dport 143 -j allowed

$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $HON_IFACE -d $HON_MAIL_I=
P \
--dport 110 -j allowed

#
# 4.1.6 Cadena OUTPUT.
#
#
# Paquetes TCP incorrectos que no queremos.
#
$IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets
#
# Reglas especiales de la cadena OUTPUT para decidir qu=E9 direcciones =
IP
# est=E1n permitidas.
#
$IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $HON_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $ser_IP -j ACCEPT
#
# Registra paquetes extra=F1os que no concuerdan con lo anterior.
#
$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT OUTPUT packet died: "
######
But when I use a windows host (IP 192.168.240.23 simulate internet)
and I request the local page on the servers, and I can't obtain any
reply from servers,  in the system logs I read :
##########################
Dec 18 19:12:53 project kernel: IPT INPUT packet died: IN=3Deth0 OUT=3D
MAC=3D SRC=3D192.168.240.22 DST=3D192.168.240.255 LEN=3D96 TOS=3D0x00 P=
REC=3D0x00
TTL=3D64 ID=3D0 DF PROTO=3DUDP SPT=3D137 DPT=3D137 LEN=3D76
Dec 18 17:58:04 project kernel: IPT INPUT packet died: IN=3Deth0 OUT=3D
MAC=3Dff:ff:ff:ff:ff:ff:00:21:91:22:1d:1a:08:00 SRC=3D192.168.240.23
DST=3D192.168.240.255 LEN=3D78 TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D61=
5 PROTO=3DUDP
SPT=3D137 DPT=3D137 LEN=3D58
########################
and I can't set iptables and filter the packets, please help me, and I
configured SNORt to capture data,  but while iptables doesn't
function, I can't prove it.
Neither The mail Server or web bserver reply
when It is established, I want to simulate attacks from a IP
192.168.240.0/24 I want to use Nessus, do you think it is a good
option to simulate attacks on web mail servers? or there is another
alternative? such as scripts, programs

Greetings
Diego Ramos V.
