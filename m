From: "Gonzalez, Federico" <fgonzalez@goyaike.com>
Subject: Filtering problem
Date: Tue, 22 Jul 2003 15:58:27 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F1D8953.48E7720@goyaike.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hello all,

   I have just installed the IPTABLES 1.2.8 on linux red hat 7.2,
Kernel 2.4.21. Everything works fine except for one problem:

I have a firewall as the entrance point to my network, it has two
interfaces eth0 pointing to the internet, static IP and eth1 pointig to
the internal network.

the following URL http://www.mycompany.com points to the firewall IP
port 80, it is DNATed to the 10.0.0.9:80, and it's working fine.

when i try tp access the webserver from a PC in the internal network
using the http://www.mycompany.com url , it doesnt work because the
firewall receives the request and forward it to the webserver DNATing
the packet, but the webserver sees the request comming not from the
firewall but from a PC in the internal network, so it sends the response
to that PC and when that PC receives the response (the ACK to the SYN)
it drops the packet because it didn't send a SYN to that machine.

I tried to SNAT the packet in the postrounting but it is not working.

Any idea about can i do ?

Thanks in advance.

My script is :

IPTABLES=/sbin/iptables
#IPTABLES=/usr/local/sbin/iptables
DEPMOD=/sbin/depmod
MODPROBE=/sbin/modprobe


EXTIF="eth0"
INTIF="eth1"
EXTIP="200.X.X.X"
INTIP="10.0.0.11"

echo "   External Interface:  $EXTIF"
echo "   Internal Interface:  $INTIF"

$DEPMOD -a

$MODPROBE ip_tables

echo -en "ip_conntrack, "
$MODPROBE ip_conntrack

echo -en "iptable_nat, "
$MODPROBE iptable_nat

echo -e "   Done loading modules.\n"

echo "   Enabling forwarding.."
echo "1" > /proc/sys/net/ipv4/ip_forward

#Direcciones IP
EXCHANGE="10.0.0.2"
PROXY="10.0.0.6"
WEBSERVER="10.0.0.9"
PC_FGONZA="10.0.0.30"

echo "   Clearing any existing rules and setting default policy.."
$IPTABLES -P INPUT DROP
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT DROP
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F

#Habilito el Logging

#Libero la interface interna
$IPTABLES -A INPUT  -i lo -j ACCEPT
$IPTABLES -A OUTPUT -o lo -j ACCEPT

#Habilito el ping
$IPTABLES -A INPUT   -p icmp -j ACCEPT
$IPTABLES -A OUTPUT  -p icmp -j ACCEPT
$IPTABLES -A FORWARD -p icmp -j ACCEPT

#Habilito Salir desde esta maquina
$IPTABLES -A OUTPUT -o $INTIF -s $INTIP -d 10.0.0.0/24 -j ACCEPT
$IPTABLES -A OUTPUT -o $INTIF -s $EXTIP -d 10.0.0.0/24 -j ACCEPT

$IPTABLES -A INPUT -i $INTIF -d $INTIP -j ACCEPT

echo "Habilito el servicio Telnet desde la red interna"
$IPTABLES -A INPUT -i $INTIF -p tcp --dport 23 -j ACCEPT
$IPTABLES -A OUTPUT -o $INTIF -m state --state ESTABLISHED,RELATED -j
ACCEPT

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A FORWARD -i $INTIF -o $INTIF -j ACCEPT

#Salida directa a Inet.
OUTIP="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
\
26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41"
for i in $OUTIP
do
  $IPTABLES -A FORWARD -i $INTIF -s 10.0.0.$i -j ACCEPT
done

echo "  Blocking invalid ICMP packets "
$IPTABLES -A INPUT   -i $EXTIF -m state -p icmp --state INVALID -j DROP
$IPTABLES -A FORWARD -i $EXTIF -m state -p icmp --state INVALID -j DROP
$IPTABLES -A OUTPUT  -o $EXTIF -m state -p icmp --state INVALID -j DROP
$IPTABLES -A FORWARD -o $EXTIF -m state -p icmp --state INVALID -j DROP

echo " Anti spoofing "

$IPTABLES -A INPUT -i $EXTIF -s 10.0.0.0/8  -j DROP
$IPTABLES -A INPUT -i $EXTIF -s 127.0.0.0/8 -j DROP

echo "   Enabling SNAT (MASQUERADE) functionality on $EXTIF"

$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP

#F.Gonzalez
$IPTABLES -A FORWARD -m state --state NEW -d $PC_FGONZA -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 8080 \
          -j DNAT --to $PC_FGONZA:80

$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 8000 \
          -j DNAT --to $PC_FGONZA:8080

#Web server
$IPTABLES -A FORWARD -m state --state NEW -d $WEBSERVER -j ACCEPT
#  WWW
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 80 \
          -j DNAT --to $WEBSERVER:80
# HTTPS

$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 443 \
          -j DNAT --to $WEBSERVER:443

#Mail server
$IPTABLES -A FORWARD -m state --state NEW -d $EXCHANGE -j ACCEPT
#  SMTP
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 25 \
          -j DNAT --to $EXCHANGE:25
#  IMAP
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 143 \
          -j DNAT --to $EXCHANGE:143
#  POP3
$IPTABLES -A PREROUTING -t nat -p tcp -d $EXTIP --dport 110 \
          -j DNAT --to $EXCHANGE:110


$IPTABLES -A PREROUTING -t nat -p udp -d $EXTIP --dport 7000 \
          -j DNAT --to 10.0.0.4:27960

$IPTABLES -A INPUT   -j DROP
$IPTABLES -A OUTPUT  -j DROP
$IPTABLES -A FORWARD -j DROP


