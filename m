From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: SNAT for a firewall machine
Date: Sun, 3 Aug 2003 10:28:06 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDEMKKNJDLAJDPNDPCDDMEDHNFAA.georgev@citadelcomputer.com.au>
References: <1059868386.29439.7.camel@nerv.unicauca.edu.co>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1059868386.29439.7.camel@nerv.unicauca.edu.co>
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
To: Ulises Hernandez Pino <ulises@unicauca.edu.co>, netfilter@lists.netfilter.org

Firstly why not get rid of the router (if possible, makes thing simpler).
Can you not give your internal machines private IPs and MAQSUERADE that
instead of live IPs. It's a waste to put live IPs only to SNAT them to the
firewalls ext IP anyway.

If you can't get rid of the router for some reason, you can do what I've
done and given 2 of the external IPs to the router and firewall so they see
each other as live IPs, then in the router router all hosts to the firewall
(or add all external IPs to the external NIC of the firewall using
iproute2).

Then you can use a proper/standard network structure and do whatever you
like with the firewall.

ie.

|
|
|
203.xx.10.126
ROUTER
203.yy.11.253
|
|
203.yy.11.254 (203.yy.11.253,203.yy.11.252,203.yy.11.251)
FIREWALL
192.168.150.254
|
|
192.168.150.1-153 (workstations)

this way you can keep your router and use the firewall for VPN which NAT
breaks.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Ulises
Hernandez Pino
Sent: Sunday, August 03, 2003 9:53 AM
To: netfilter@lists.netfilter.org
Subject: SNAT for a firewall machine



Hi... I have a problem with the implementation of a firewall. The
firewall machine isconnected to router by an interface and a LAN
(computer with real IP) by anotherinterface.

The router had IP 192.168.150.1 and the firewall machine had IP
192.168.150.2 with mask 255.255.255.252. The other interface of firewall
(side of my LAN) had a real IP (200.13.51.71), this IP is the gateway
for the machines with real IP in my LAN. I made this to make aprivate
bridge (router + firewall machine) between Internet and my LAN, and not
to use more real IP.

I don't have problem with the forward connection in the machine
firewall. My problem this when I'm wanted toconnect to Internet from the
firewall machine, because theconnections are make with IP 192.168.150.2
(interface withconnection to router) an not with the real IP.

I had tried use SNAT (with the next script) but I follow without being
able to me to connect.


#!/bin/bash

# Variables de la Interfaz de Red Externa
EXT_IP="192.168.150.2"
EXT_IFACE="eth1"

# Variables de la Interfaz de Red Interna con Direccion Real
INT_IP=" 200.13.51.71"
INT_IFACE="eth0"

# Variables de Iptables
IPTABLES="/sbin/iptables"

# Carga de Modulos requeridos por Iptables
/sbin/depmod -a
/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_ftp
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_state
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_nat

# Elimina todas las reglas, acdemas y contadores en cero
$IPTABLES -F
$IPTABLES -t nat -F
$IPTABLES -X
$IPTABLES -t nat -X
$IPTABLES -Z
$IPTABLES -t nat -Z

# Establece las directivas por defecto para la tabla filter
$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT
$IPTABLES -t nat -A POSTROUTING -o $EXT_IFACE -s $EXT_IP -j SNAT
--to-source $INT_IP


Please, what I must make to connect me to Internet from firewall
machine?



Ulises Hernandez
Red de Datos - Universidad del Cauca






