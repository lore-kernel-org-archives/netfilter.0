From: "Leonardo Santagostini" <lsantagostini@celletech.com.ar>
Subject: Fine and well designed ASCII art and my FW script
Date: Thu, 23 Oct 2003 11:04:31 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001f01c3996e$94f01480$1e32a8c0@celletech.com.ar>
References: <Pine.LNX.4.51.0310161843410.2162@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.51.0310161843410.2162@dns.toxicfilms.tv>
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
To: netfilter@lists.netfilter.org

Sorry by bothering us, 

but i can not see de main app from the lan side, here comes an More
Explained ASCII art and the Script that im using.

Yours
Leonardo


        -------------
       |200.43.193.xx| Web Page here have a link that points to an app
at 200.68.69.xxx:15000
        -------------
             | ----------- Any Web client from Internet can acces to web
page at 
             |/            200.43.193.xx which calls an app located at
200.43.193.xx:80
            ---
           | I |
            ---
             |
             | -----------200.68.69.xxx:15000 points to 192.168.0.1:80
             |/
      ---------------
     | 200.68.69.xxx |
      ---------------
             | \___________ Lan IP 192.168.0.254
             |
             |------------------   --------- LAN Client pointing to web
page
             |                  | /          at 200.43.193.xx and the
web page 
    -------------         -------------      pointing to an app at
200.68.69.xxx:15000
   | 192.168.0.1 |       | 192.168.0.x |     Can not see the app called
from 200.43.193.xx
    -------------         -------------


And heres comes the script

#!/bin/sh

# Defino Variables
INET_IP="200.68.69.xxx"
INET_IFACE="eth0"
INET_BROADCAST="200.68.69.xxx"
LAN_IP="192.168.0.254"
LAN_IP_RANGE="192.168.0.0/16"
LAN_IFACE="eth1"
LO_IFACE="lo"
LO_IP="127.0.0.1"
IPTABLES="/sbin/iptables"
LOG="/tmp/log_firewall"
FECHA=$(date -R)
DIRMAIL="me@mydomain.com, other@mydomain.com" 
SBJT="Log del Script del Firewall del dia $FECHA"

echo "# Probando los modulos ..." >> $LOG
# Pruebo los modulos
/sbin/depmod -a  >> $LOG
/sbin/modprobe ip_tables >> $LOG
/sbin/modprobe ip_conntrack >> $LOG
/sbin/modprobe iptable_filter >> $LOG
/sbin/modprobe iptable_mangle >> $LOG
/sbin/modprobe iptable_nat >> $LOG
/sbin/modprobe ipt_LOG >> $LOG
/sbin/modprobe ipt_limit >> $LOG
/sbin/modprobe ipt_state >> $LOG
/sbin/modprobe ipt_owner >> $LOG
/sbin/modprobe ipt_REJECT >> $LOG
/sbin/modprobe ipt_MASQUERADE >> $LOG
/sbin/modprobe ip_conntrack_ftp >> $LOG
/sbin/modprobe ip_conntrack_irc >> $LOG
/sbin/modprobe ip_nat_ftp >> $LOG
/sbin/modprobe ip_nat_irc >> $LOG
echo "# Modulos probados" >> $LOG

# Activo Forwarding
echo "# Activando Forwarding..." >> $LOG
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "# Forwarding activado" >> $LOG

# Flusheo Reglas
echo "# Flusheando Reglas..." >> $LOG
$IPTABLES -F INPUT >> $LOG
$IPTABLES -F OUTPUT >> $LOG
$IPTABLES -F FORWARD >> $LOG
$IPTABLES -F -t nat >> $LOG
$IPTABLES -F allowed >> $LOG
$IPTABLES -F tcp_packets >> $LOG
$IPTABLES -F udp_packets >> $LOG
$IPTABLES -F icmp_packets >> $LOG
$IPTABLES -F bad_tcp_packets >> $LOG
echo "# Reglas flusheadas" >> $LOG

# Defino Politicas
echo "# Definiendo nuevas politicas..." >> $LOG
$IPTABLES -P INPUT DROP >> $LOG
$IPTABLES -P OUTPUT DROP >> $LOG
$IPTABLES -P FORWARD ACCEPT >> $LOG
echo "# Nuevas politicas definidas" >> $LOG

# Borro Reglas
echo "# Borro reglas creadas..." >> $LOG
$IPTABLES -X allowed >> $LOG
$IPTABLES -X tcp_packets >> $LOG
$IPTABLES -X udp_packets >> $LOG
$IPTABLES -X icmp_packets >> $LOG
$IPTABLES -X bad_tcp_packets >> $LOG
echo "# Reglas Borradas." >> $LOG

# Creo nuevas reglas
echo "# Creo nuevas reglas..." >> $LOG
$IPTABLES -N allowed >> $LOG
$IPTABLES -N tcp_packets >> $LOG
$IPTABLES -N udp_packets >> $LOG
$IPTABLES -N icmp_packets >> $LOG
$IPTABLES -N bad_tcp_packets >> $LOG
echo "# Nuevas reglas creadas." >> $LOG

# Creo regla de paquetes tcp con flags defectuosos
echo "# Creando regla de paquetes tcp con flags defectuosos..." >> $LOG 
$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK -m state
--state NEW -j REJECT --reject-with tcp-reset >> $LOG 
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG
--log-prefix "Nueva sin SYN: " >> $LOG 
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP
>> $LOG 
echo "# Regla creada con exito." >> $LOG

# Appendeo a la cadena que los paquetes tengan relacion o sea una
conexion establecida echo "
# Appendeo a la cadena que los paquetes tengan relacion o sea una
conexion establecida..." >> $LOG 
$IPTABLES -A allowed -p TCP --syn -j ACCEPT >> $LOG $IPTABLES -A allowed
-p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT >> $LOG 
$IPTABLES -A allowed -p TCP -j DROP >> $LOG 
echo "# Cracion de regla OK" >> $LOG

# Permito los siguientes puertos TCP con conexiones establecidas echo "
# Permito los siguientes puertos TCP con conexiones establecidas..." >>
$LOG 
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed >> $LOG 
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j allowed >> $LOG 
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 25 -j allowed >> $LOG 
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 110 -j allowed >> $LOG 
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 8080 -j allowed >> $LOG 
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 113 -j allowed >> $LOG 
$IPTABLES -A tcp_packets -p tcp -s 0/0 --dport 53 -j allowed >> $LOG 
echo "# Regla creada con exito." >> $LOG

# Acepto resolucion de DNS
echo "# Creo regla para resolucion de DNS..." >> $LOG
$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 53 -j ACCEPT
>> $LOG 
#$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 123 -j ACCEPT

#$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 2074 -j
ACCEPT 
#$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 4000 -j
ACCEPT 
echo "# Regla creada con exito." >> $LOG

# Dropeo NetBios desde Internet
echo "# Dropeo NetBios de Internet" >> $LOG
$IPTABLES -A udp_packets -p UDP -i $INET_IFACE -d $INET_BROADCAST
--destination-port 135:139 -j DROP >> $LOG 
echo "# Regla creada con exito" >> $LOG 

# Dropeo DHCP de Internet 
echo "# Dropeo DHCP desde Internet" >> $LOG 
$IPTABLES -A udp_packets -p UDP -i $INET_IFACE -d 255.255.255.255
--destination-port 67:68 -j DROP >> $LOG 
echo "# Regla creada con exito" >> $LOG

# Acepto "Echo Request" y "Echo Reply"
echo "# Acepto Echo Request y Echo Reply" >> $LOG
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT >> $LOG

$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT >>
$LOG 
echo "# Regla creada con exito" >> $LOG

# Tablita Input
# Acepto / Dropeo explicitamente los puertos dados
echo "# Apendeo reglitas a cadena INPUT..." >> $LOG
$IPTABLES -A INPUT -p TCP -s 0/0 --dport 25 -j ACCEPT >> $LOG 
$IPTABLES -A INPUT -p TCP -s 0/0 --dport 22 -j ACCEPT >> $LOG 
$IPTABLES -A INPUT -p TCP -s 0/0 --dport 80 -j ACCEPT >> $LOG 
$IPTABLES -A INPUT -p TCP -s 0/0 --dport 1723 -j ACCEPT >> $LOG 
$IPTABLES -A INPUT -p tcp -j bad_tcp_packets >> $LOG 
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT >>
$LOG 
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT >> $LOG 
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN_IP -j ACCEPT >> $LOG 
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET_IP -j ACCEPT >> $LOG 
$IPTABLES -A INPUT -p UDP -i $LAN_IFACE --dport 67 --sport 68 -j ACCEPT
>> $LOG 
$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state
ESTABLISHED,RELATED -j ACCEPT >> $LOG 
$IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets >> $LOG 
$IPTABLES -A INPUT -p UDP -i $INET_IFACE -j udp_packets >> $LOG 
$IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j icmp_packets >> $LOG 
$IPTABLES -A INPUT -i $INET_IFACE -d 224.0.0.0/8 -j DROP >> $LOG 
$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG
--log-level DEBUG --log-prefix "IpT Input muerto: " >> $LOG echo "
# Regla creada con exito." >> $LOG 

# Regla usada para admitir input por la VPN 
echo "# Permito INPUT por la VPN..." >> $LOG 
$IPTABLES -A INPUT -i ppp0 -j ACCEPT >> $LOG 
echo "# Regla creada con exito." >> $LOG 

# Regla usada para admitir trafico del commdriver 
echo "# Regla para aceptar trafico de CommDriver" >> $LOG 
$IPTABLES -A INPUT -p tcp -s 0/0 --dport 6500 -j ACCEPT >> $LOG 
echo "# Regla creada con exito." >> $LOG 

# Reglas usadas para SSH 
echo "# Reglas usadas para SSH" >> $LOG 
$IPTABLES -A INPUT -p tcp -s 0/0 --destination-port 22 -j DROP >> $LOG 
$IPTABLES -A INPUT -p tcp -s 200.43.193.xx --destination-port 22 -j
ACCEPT >> $LOG 
$IPTABLES -A INPUT -p tcp -s 200.43.193.xx -j ACCEPT >> $LOG 
$IPTABLES -A INPUT -p tcp --dport 22 -j LOG >> $LOG 
$IPTABLES -A INPUT -p tcp --dport 22 -j DROP >> $LOG 
$IPTABLES -A OUTPUT -p tcp -d 200.43.193.xx --dport 22 -j ACCEPT >> $LOG

echo "# Reglas creadas con exito." >> $LOG

# Para el Apache
if [ -f apache ]; then
    source apache
fi

# Ips de rehazo
if [ -f ip_rech ]; then
    source ip_rech
fi

# Tablita Forward
echo "# Reglas tabla FORWARD..."  >> $LOG
$IPTABLES -A FORWARD -p tcp -j bad_tcp_packets >> $LOG 
$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT >> $LOG 
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT >>
$LOG 
$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG
--log-level DEBUG --log-prefix "IpT Forward Muerto: " >> $LOG 
echo "# Regla creada con exito." >> $LOG

# Aca permito el forward de la VPN 
echo "# Regla para admitir trafico de VPN" >> $LOG
$IPTABLES -A FORWARD -p all -i ppp0 -j ACCEPT >> $LOG
$IPTABLES -A FORWARD -p all -o ppp0 -j ACCEPT >> $LOG
$IPTABLES -A FORWARD -i ppp0 -j ACCEPT >> $LOG
$IPTABLES -A FORWARD -o ppp0 -j ACCEPT >> $LOG
echo "# Regla creada con exito." >> $LOG

# Tablita Output
echo "# Reglas tabla OUTPUT..."  >> $LOG
$IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets >> $LOG
$IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT >> $LOG 
$IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT >> $LOG 
$IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT >> $LOG 
$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG
--log-level DEBUG --log-prefix "IpT Output muerto: " >> $LOG 
$IPTABLES -A OUTPUT -o ppp0 -j ACCEPT >> $LOG echo "
# Regla creada con exito." >> $LOG

# Aca hago el enmascaramiento de la LAN
echo "# Regla de enmascaramiento de la LAN..."  >> $LOG 
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source
$INET_IP >> $LOG echo "
# Regla creada con exito." >> $LOG

# Forwarding para probar el commdriver de ggarcia
#$IPTABLES -t nat -A PREROUTING -p tcp -i eth0 --dport 6500 -j DNAT --to
192.168.0.133:6500 >> $LOG 
#$IPTABLES -t nat -A PREROUTING -p tcp -i eth0 --dport 6500 -j DNAT --to
192.168.0.76:6500 >> $LOG 
$IPTABLES -t nat -A PREROUTING -p tcp -i eth0 --dport 15000 -j DNAT --to
192.168.0.1:80 >> $LOG

cat $LOG | mail -s "$SBJT" $DIRMAIL

rm -f $LOG


