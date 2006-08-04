From: "Vlad Janicek" <vladjanicek@gmail.com>
Subject: Blocking ip addresses and regulating bandwidth
Date: Fri, 4 Aug 2006 17:11:39 -0400
Message-ID: <96bc76cf0608041411k6c610c44mcb351a9ebfedfce3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hey there,

I have a linux router using netfilter. I've been using it for years
now and now I'm starting to have a problem. I want to block some IPs
for excess of traffic. I've been using this

iptables -I FORWARD 1 -s 192.168.0.187 -j DROP

and that IP it's still connected to the internet. It's there anything
wrong there? also, what would be the best way to restrict bandwith to
users with netfilter?? is there any gui or web interface for that??

This is my iptable script. Thanks a lot for your help

Vlad


#Cargando las reglas de firewall
#cargando modulos
modprobe ip_conntrack_ftp
modprobe ip_conntrack_irc
modprobe iptable_nat
modprobe ip_nat_ftp
echo "Borrando posibles reglas anteriores..."

IPTABLES="/sbin/iptables"
$IPTABLES -P INPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -t nat -P PREROUTING ACCEPT
$IPTABLES -t nat -P POSTROUTING ACCEPT
$IPTABLES -t nat -P OUTPUT ACCEPT
$IPTABLES -t mangle -P PREROUTING ACCEPT
$IPTABLES -t mangle -P OUTPUT ACCEPT
$IPTABLES -F
$IPTABLES -t nat -F
$IPTABLES -t mangle -F
$IPTABLES -X
$IPTABLES -t nat -X
$IPTABLES -t mangle -X

echo "Habilitando politicas de negacion total de paquetes"

iptables -P FORWARD DROP
iptables -P INPUT DROP

echo "Reglas para paquetes de entrada y salida"
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

#iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
#iptables -A INPUT -p tcp -s mygmaildomain.fake --dport 3000 -j ACCEPT
#iptables -A INPUT -p tcp --dport 25 -j ACCEPT
#iptables -A INPUT -p tcp --dport 143 -j ACCEPT
#iptables -A INPUT -p tcp --dport 80 -j ACCEPT
#iptables -A INPUT -p tcp --dport 110 -j ACCEPT

#Para dejar el acceso total al servidor desde adentro
iptables -A INPUT -i eth1 -s 192.168.0.0/22 -j ACCEPT

#para el redireccionamiento

echo 0 > /proc/sys/net/ipv4/ip_forward

#cadenas forward para acceso a internet

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT


#Bloqueo limewire
iptables -A FORWARD -p tcp --dport 6346 -j DROP
iptables -A FORWARD -p udp --dport 6346 -j DROP
iptables -A FORWARD -p tcp --dport 6345 -j DROP
iptables -A FORWARD -p udp --dport 6345 -j DROP

##
##
##Redireccionamiento de paquetes a servidores internos
##
##
##
#WebServer interno
iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 80 -j ACCEPT
iptables -t nat -A PREROUTING -d 192.168.74.2 -p tcp --dport 80 \
    -j DNAT --to-destination 192.168.0.2:80

#ftp a netfinity
iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 21 -j ACCEPT
iptables -t nat -A PREROUTING -d 192.168.74.2 -p tcp --dport 21 \
    -j DNAT --to-destination 192.168.0.2:21

#correo
iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 25 -j ACCEPT
iptables -t nat -A PREROUTING -d 192.168.74.2 -p tcp --dport 25 \
    -j DNAT --to-destination 192.168.0.2:25

#pop
iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 110 -j ACCEPT
iptables -t nat -A PREROUTING -d 192.168.74.2 -p tcp --dport 110 \
    -j DNAT --to-destination 192.168.0.2:110

#imap
iptables -A FORWARD -d 192.168.0.2 -p tcp --dport 143 -j ACCEPT
iptables -t nat -A PREROUTING -d 192.168.74.2 -p tcp --dport 143 \
    -j DNAT --to-destination 192.168.0.2:143


##
##
##Acceso a clientes y servidores
##
##
##

#cadena de acceso directo a internet

#reenvio de paquetes para permitir el acceso del servidor Netfinity
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

#usuarios bloqueados
iptables -I FORWARD 1 -d 192.168.0.187 -j DROP

echo 1 > /proc/sys/net/ipv4/ip_forward

