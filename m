From: Matteo <matteo.king@libero.it>
Subject: Help for my script
Date: Sun, 23 Mar 2003 20:40:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303232040.06832.matteo.king@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org

hi all,
I write this script and i like to known your opinion abuot him!
######                         ####
###### Configurazione firewall ####
######                         ####

IPTABLES=3D"/sbin/iptables"
LOCALINTERFACE=3D"eth0"
INTERNETINTERFACE=3D"ppp0"
LOOPINTERFACE=3D"lo"
LOCALNET=3D192.168.0.0/255.255.255.0
LOOPBACK=3D127.0.0.1
PAZZEO=3D192.168.0.1
CHECCO=3D192.168.0.2

#------------------------------ codici escape colori
  RED=3D"\\033[1;31m"
  GREEN=3D"\\033[0;32m"
  WHITE=3D"\\033[0;39m"
  CYAN=3D"\\033[0;36m"
  BLUE=3D"\\033[1;34m"
  ORANGE=3D"\\033[0;33m"
  YELLOW=3D"\\033[1;33m"
  MAGENTA=3D"\\033[1;35m"

start(){

echo -n "Disattivazione del ip forward :"

echo 0 > /proc/sys/net/ipv4/ip_forward


echo -n "Flushing delle regole eventualmente presenti : "

 $IPTABLES -F INPUT > /dev/null
  $IPTABLES -F OUTPUT > /dev/null
  $IPTABLES -F FORWARD > /dev/null
  $IPTABLES -t nat -F > /dev/null
  $IPTABLES -t mangle -F > /dev/null



echo -n "Caricamento Moduli : "

#------------------------------ caricamento moduli necessari
  /sbin/modprobe ipt_LOG > /dev/null 2> /dev/null
  /sbin/modprobe ip_conntrack > /dev/null 2> /dev/null
  /sbin/modprobe ip_conntrack_ftp > /dev/null 2> /dev/null
  /sbin/modprobe ip_conntrack_irc > /dev/null 2> /dev/null
  /sbin/modprobe ipt_MASQUERADE > /dev/null 2> /dev/null
  /sbin/modprobe ipt_state > /dev/null 2> /dev/null
  /sbin/modprobe iptable_nat > /dev/null 2> /dev/null
  /sbin/modprobe ip_nat_ftp > /dev/null 2> /dev/null
  /sbin/modprobe ip_nat_irc > /dev/null 2> /dev/null


echo -n " Creazione catene di errore : "

# ----------------------------- definizione delle catene di errore
   $IPTABLES -N errore1
   $IPTABLES -A errore1 -j LOG --log-prefix "Tentativo di spoofing:"=20
--log-level info
   $IPTABLES -A errore1 -j DROP

echo -n " Esecuzione protezioni varie : "

#------------------------------ attivazione protezioni varie
=20

 echo -n "Attivazione Source Address Verification : "
  if [ -e /proc/sys/net/ipv4/conf/all/rp_filter ]; then
    for f in /proc/sys/net/ipv4/conf/*/rp_filter; do
      echo 1 > $f
    done
    echo -e "\t\t\t[ ${GREEN}OK ${WHITE}]"
  else
    echo -e "\t\t\t[ ${RED}NO ${WHITE}]"
    echo -n "SAV non disponibile, utilizzo di ipchains : "
    $IPTABLES -A input -s $LOOPBACK -i ! lo -j errore1
    echo -e "\t\t\t[ ${GREEN}OK ${WHITE}]"
  fi

  echo -n "Attivazione TCP SYN Cookie Protection : "
  if [ -e /proc/sys/net/ipv4/tcp_syncookies ]; then
    echo 1 >/proc/sys/net/ipv4/tcp_syncookies
    echo -e "\t\t\t[ ${GREEN}OK ${WHITE}]"
  else
    echo -e "\t\t\t[ ${RED}NO ${WHITE}]"
  fi

  echo -n "Attivazione del Forward dei pacchetti: "
  if [ /proc/sys/net/ipv4/ip_forward ]; then
    echo 1 >/proc/sys/net/ipv4/ip_forward
    echo -e "\t\t\t\t[ ${GREEN}OK ${WHITE}]"
  else
    echo -e "\t\t\t\t[ ${RED}NO ${WHITE}]"
  fi

  echo -n "Attivazione Broadcast Echo Protection : "
  if [ -e /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts ]; then
    echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
    echo -e "\t\t\t[ ${GREEN}OK ${WHITE}]"
  else
    echo -e "\t\t\t[ ${RED}NO ${WHITE}]"
  fi

  echo -n "Attivazione Bad Error Message Protection : "
  if [ -e /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses ]; then
    echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
    echo -e "\t\t\t[ ${GREEN}OK ${WHITE}]"
  else
    echo -e "\t\t\t[ ${RED}NO ${WHITE}]"
  fi

  echo -n "Disattivazione ICMP Redirect Acceptance : "
  if [ -e /proc/sys/net/ipv4/conf/all/accept_redirects ]; then
    for f in /proc/sys/net/ipv4/conf/*/accept_redirects; do
      echo 0 > $f
    done
    for f in /proc/sys/net/ipv4/conf/*/send_redirects; do
      echo 0 > $f
    done
    echo -e "\t\t\t[ ${GREEN}OK ${WHITE}]"
  else
    echo -e "\t\t\t[ ${RED}NO ${WHITE}]"
  fi

  echo -n "Disattivazione Source Routed Packets : "
  if [ -e /proc/sys/net/ipv4/conf/all/accept_source_route ]; then
    for f in /proc/sys/net/ipv4/conf/*/accept_source_route; do
      echo 0 > $f
    done
    echo -e "\t\t\t\t[ ${GREEN}OK ${WHITE}]"
  else
    echo -e "\t\t\t\t[ ${RED}NO ${WHITE}]"
  fi

  echo -n "Log pacchetti spoofed, source routed, redirected : "
  if [ -e /proc/sys/net/ipv4/conf/all/log_martians ]; then
    for f in /proc/sys/net/ipv4/conf/*/log_martians; do
      echo 1 > $f
    done
    echo -e "\t\t[ ${GREEN}OK ${WHITE}]"
  else
    echo -e "\t\t[ ${RED}NO ${WHITE}]"
  fi

# Se hai il Kernel 2.4 la congestione tcp deve essere disattivata, non
# tutti i supportano la ricezione della verifica di congestione.

  echo -n "Disattivazione notifica congestione tcp : "
  if [ -e /proc/sys/net/ipv4/tcp_ecn ]; then
    echo 0 > /proc/sys/net/ipv4/tcp_ecn
    echo -e "\t\t\t[ ${GREEN}OK ${WHITE}]"
  else
    echo -e "\t\t\t[ ${RED}NO ${WHITE}]"
  fi
# Dynamic IP users:
#
#   If you get your IP address dynamically from SLIP, PPP, or DHCP, enabl=
e=20
this following
#       option.  This enables dynamic-ip address hacking in IP MASQ, maki=
ng=20
the life=20
#       with Diald and similar programs much easier.
#
  echo -n "Attivazione IP Dynamical Address :"
  if [ -e /proc/sys/net/ipv4/ip_dynaddr ]; then
     echo "1" > /proc/sys/net/ipv4/ip_dynaddr
    echo -e "\t\t\t\t[ ${GREEN}OK ${WHITE}]"
  else
    echo -e "\t\t\t\t[ ${RED}NO ${WHITE}]"
  fi


# Enable the LooseUDP patch which some Internet-based games require
#
#  If you are trying to get an Internet game to work through your IP MASQ=
 box,
#  and you have set it up to the best of your ability without it working,=
 try
#  enabling this option (delete the "#" character).  This option is disab=
led
#  by default due to possible internal machine UDP port scanning
#  vunerabilities.
#
echo "1" > /proc/sys/net/ipv4/ip_nonlocal_bind

# Blocco i ping verso la mia macchina :

echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_all





echo -n " Caricamneto catene Prerouting e postrouting "

####################################################################
####################################################################
##              REGOLE CATENE DI PREROUTING/POSTROUTING           ##
####################################################################
####################################################################


## Invia i pacchetti diretti alla porta 80 verso il tuo proxy (trasparent=
e)
## squid
#  $IPTABLES -t nat -A PREROUTING -i $LOCALINTERFACE -p tcp -d ! $LOCALIP=
=20
--dport 80 -j REDIRECT --to-port 8080

## OTTIMIZZAZIONE PER ADSL

$IPTABLES -t mangle -A OUTPUT -o $INTERNETINTERFACE -p tcp --tcp-flags SY=
N,RST=20
SYN -j TCPMSS --clamp-mss-to-pmtu

## Ottimizzazioni varie

$IPTABLES -A PREROUTING -t mangle -p tcp --sport 20 -j TOS --set-tos=20
Maximize-Throughput
$IPTABLES -A PREROUTING -t mangle -p tcp --sport 22 -j TOS --set-tos=20
Minimize-Delay

## Mascheramento di ci che esce da eth1
  =20
$IPTABLES -t nat -A POSTROUTING -o $INTERNETINTERFACE -j MASQUERADE
  =20
##Abilitazione dei servizi interni

#$IPTABLES -t nat -A PREROUTING -p tcp -d pazzeo.no-ip.org --dport ftp -j=
 DNAT=20
--to 192.168.1.34:21
#$IPTABLES -t nat -A PREROUTING -p tcp -d pazzeo.no-ip.org --dport ftp-da=
ta -j=20
DNAT --to 192.168.1.34:20
#$IPTABLES -t nat -A PREROUTING -p tcp -i $INTERNETINTERFACE --dport 6699=
 -j=20
DNAT --to $CHECCO:6699=20
$IPTABLES -t nat -A PREROUTING -p tcp -i $INTERNETINTERFACE --dport 4661 =
-j=20
DNAT --to $PAZZEO:4661
$IPTABLES -t nat -A PREROUTING -p tcp -i $INTERNETINTERFACE --dport 4662 =
-j=20
DNAT --to $PAZZEO:4662


echo -n " Creazione catena in entrata :"

####################################################################
####################################################################
##                 REGOLE CATENE DI INPUT                         ##
####################################################################
####################################################################


$IPTABLES -P INPUT DROP

#Protezione contro il ping della morte

$IPTABLES -A INPUT -m limit --limit 1/s -j ACCEPT

# Permetti il traffico sull'interfaccia locale nella rete locale
#

$IPTABLES -A INPUT -p ALL -i $LOCALINTERFACE -s $LOCALNET -j ACCEPT
$IPTABLES -A INPUT -i lo -j ACCEPT
=20

echo -n " Creazione catena forward : "


####################################################################
####################################################################
##                 REGOLE CATENE DI FORWARD                       ##
####################################################################
####################################################################

$IPTABLES -P FORWARD DROP
$IPTABLES -N lanext
$IPTABLES -N extlan=20

$IPTABLES -A FORWARD -i $LOCALINTERFACE -o $INTERNETINTERFACE -j lanext
$IPTABLES -A FORWARD -i $LOOPINTERFACE -o $INTERNETINTERFACE -j lanext
$IPTABLES -A FORWARD -i $INTERNETINTERFACE -o $LOCALINTERFACE -j extlan

# logga prima di scartare il pacchetto
   =20
$IPTABLES -A FORWARD -j LOG --log-prefix "Pacchetto anomalo in forward:"=20
--log-level info


####################################################################
####################################################################
##                 REGOLE CATENE DI LANEXT                        ##
####################################################################
####################################################################

# accetta tutti i pacchetti uscenti dalla lan

$IPTABLES -A lanext -j ACCEPT
$IPTABLES -A lanext -m state --state NEW -j ACCEPT
$IPTABLES -A lanext -m state --state ESTABLISHED,RELATED -j ACCEPT


####################################################################
####################################################################
##                 REGOLE CATENE DI EXTLAN                        ##
####################################################################
####################################################################
 =20
$IPTABLES -N internet-icmp
$IPTABLES -N internet-tcp
$IPTABLES -N internet-udp
$IPTABLES -N bad_tcp_packets

# accetti pacchetti in entrata che appartengono a connessioni stabilite e=
=20
sincronizzate.
# qui aggiungerai anche eventuali servizi che vuoi rendere disponibili ag=
li=20
utenti da fuori.

$IPTABLES -A INPUT -m state --state NEW -j ACCEPT
$IPTABLES -A extlan -m state --state ESTABLISHED,RELATED -j ACCEPT

#Protocollo tcp

#Altre protezioni sul protocollo tcp

$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP
$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags ALL NONE -j DROP
$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags FIN FIN -j DROP


$IPTABLES -A extlan -p tcp --syn -j internet-tcp

#Protocollo igmp

$IPTABLES -A extlan -p igmp -j DROP

#Catene per i protocolli icmp e udp

$IPTABLES -A extlan -p icmp -j internet-icmp
$IPTABLES -A extlan -p udp -j internet-udp

#########################################################
## Filtraggio ICMP, sono permessi solo i tipi 0,3,8,11 ##
#########################################################

$IPTABLES -A internet-icmp -p icmp --icmp-type 0 -j ACCEPT
$IPTABLES -A internet-icmp -p icmp --icmp-type 3 -j ACCEPT
$IPTABLES -A internet-icmp -p icmp --icmp-type 8 -j ACCEPT
$IPTABLES -A internet-icmp -p icmp --icmp-type 11 -j ACCEPT

$IPTABLES -A internet-icmp -j LOG --log-prefix "ICMP non autorizzato:"

$IPTABLES -A internet-icmp -j DROP

#########################################################################
## Filtraggio TCP SYN                                                  ##
##                                                                     ##
## INSERIRE QUI EVENTUALI CATENE DI ACCEPT PER SERVIZI CHE DEVO ESSERE ##
## DISPONIBILI DALL'ESTERNO                                            ##=
 =20
#########################################################################
    =20
$IPTABLES -A internet-tcp -p tcp --dport 20 -j ACCEPT
$IPTABLES -A internet-tcp -p tcp --dport 80 -j REJECT
$IPTABLES -A internet-tcp -p tcp --dport 113 -j REJECT
$IPTABLES -A internet-tcp -p tcp --dport 119 -j ACCEPT
$IPTABLES -A internet-tcp -p tcp --dport 443 -j ACCEPT
$IPTABLES -A internet-tcp -p tcp --dport 4800 -j ACCEPT
$IPTABLES -A internet-tcp -p tcp --dport pop3 -j ACCEPT
$IPTABLES -A internet-tcp -p tcp --dport 4662 -j ACCEPT
$IPTABLES -A internet-tcp -p tcp --dport 4661 -j ACCEPT
$IPTABLES -A internet-tcp -p tcp --dport 21 -j ACCEPT
$IPTABLES -A internet-tcp -p tcp --dport 6699 -j ACCEPT
$IPTABLES -A internet-tcp -p tcp --dport 1000 -j REJECT
$IPTABLES -A internet-tcp -j LOG --log-prefix "Connessione TCP rifiutata:=
"
$IPTABLES -A internet-tcp -j DROP

######################
## Filtraggio UDP   ##
######################

$IPTABLES -A internet-udp -m state --state NEW -j ACCEPT

####################################################################
####################################################################
##                 REGOLE CATENE DI OUTPUT                        ##
####################################################################
####################################################################

$IPTABLES -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Errore di route, pacchetti inviati alla rete locale attraverso l'interf=
accia=20
esterna
#
    $IPTABLES -A OUTPUT -o $INTERNETINTERFACE -d $LOCALNET -j LOG --log-p=
refix=20
"Errore di Routing" --log-level info

# Pacchetti dall'inirizzo della rete locale verso l'esterno (masq overflo=
w per=20
es)
#
    $IPTABLES -A OUTPUT -o $INTERNETINTERFACE -s $LOCALNET -j LOG --log-p=
refix=20
"Masquerade Overflow" --log-level info

# logga prima di scartare il pacchetto
#
  $IPTABLES -A OUTPUT -j LOG --log-prefix "Pacchetto anomalo in uscita:"=20
--log-level info



echo -n " Riabilito l ip forward :"

echo 1 > /proc/sys/net/ipv4/ip_forward
}

#------------------------------ opzione stop dello script
stop() {
  echo "Disattivazione del Firewall in corso..."
  $IPTABLES -F
  $IPTABLES -X
  $IPTABLES -P INPUT ACCEPT
  $IPTABLES -P OUTPUT ACCEPT
  $IPTABLES -P FORWARD DROP
  $IPTABLES -t nat -F
  $IPTABLES -t mangle -F
  echo -n "Rimozione dei moduli necessari : "
  /sbin/rmmod ipt_LOG > /dev/null 2> /dev/null
  /sbin/rmmod ip_conntrack > /dev/null 2> /dev/null
  /sbin/rmmod ip_conntrack_ftp > /dev/null 2> /dev/null
  /sbin/rmmod ip_conntrack_irc > /dev/null 2> /dev/null
  /sbin/rmmod ipt_MASQUERADE > /dev/null 2> /dev/null
  /sbin/rmmod ipt_state > /dev/null 2> /dev/null
  /sbin/rmmod iptable_nat > /dev/null 2> /dev/null
  /sbin/rmmod ip_nat_ftp > /dev/null 2> /dev/null
  /sbin/rmmod ip_nat_irc > /dev/null 2> /dev/null
  echo -e "\t\t[ ${GREEN}OK ${WHITE}]"
  echo -n "Disattivazione IP forwarding : "
  echo 0 > /proc/sys/net/ipv4/ip_forward
  echo -e "\t\t\t\t\t[ ${GREEN}OK ${WHITE}]"
  echo -e "${YELLOW}ATTENZIONE: IL FIREWALL NON E' PIU' OPERATIVO${WHITE}=
"

}

#------------------------------ opzione status dello script
status() {
  echo "Impostazioni attuali del firewall : "
  echo -e "Indirizzo IP locale sull'interfaccia \
    ${YELLOW}$INTERFACE${WHITE} : ${RED}$INTERFACEIP${WHITE}"
  $IPTABLES --list
}

case "$1" in
  start)
        start
        ;;

  stop)
        stop
        ;;

  restart)
        # "restart" is really just "start" as this isn't a daemon,
        #  and "start" clears any pre-defined rules anyway.
        #  This is really only here to make those who expect it happy
        start
        ;;
  status)
        iptables -L -v
        ;;
  *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
=09;;
esac
exit 0

I have problem with loopbak (127.0.0.1) because the connection it's versy=
=20
slow!!

Thanks!!

