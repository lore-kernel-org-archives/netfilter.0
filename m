From: "Daniel Arjona" <darjona@transito.gob.pa>
Subject: =?iso-8859-1?Q?CAN=B4T_DO_PING_TO_MY_ROUTER_WITH_MY_NETWORK_CLIENTS?=
Date: Mon, 1 Sep 2003 11:47:25 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006201c370a8$b91ae4f0$0221a0c0@DANIEL>
Reply-To: "Daniel Arjona" <darjona@transito.gob.pa>
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
To: netfilter@lists.netfilter.org

Hello cc:

I tried to do ping to my router and also i do the same to the ip address of
my dns servers and the both fails.  But the server (with iptables, mail,
squis, and others) doit everytihng.

What is happennig?  Maybe i have a setup error in my networks clients?

***********************
Hello:

I tried to configure an iptables firewall, but i can't.  I need cofigure
this to use FTP, Kazaa, Internet, ICQ and access the IMAP server of Netscape
with my Netscape Client.

Observations:
I have LRH 8.0 and iptables is in the my unique server with squid, qmail and
others.
My router is directly connected to the NIC of the server.
When i try to connect to any FTP Server, i recieve this message "I can't
resolve DNS name"
I can't do ping to any IP Address

PD:  Please see mi script and my outputs to the commands:
        iptables -L -n
        iptables -t nat -L


############################################################################
##
#!/bin/sh
# SCRIPT de IPTABLES
# Firewall entre red-local e internet con servicios abiertos de puerto
############################################################################

################################################  FLUSH de reglas
iptables -F
iptables -X
iptables -Z
iptables -t nat -F
####################################################### Cargo Variables
PRIVATE_NET=192.160.33.0/24
PRIVATE_NIC=eth1
PUBLIC_NIC=eth0
################################################### Establecemos politica
ACEPTAR por defecto
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
####################################################### INPUTS 143=IMAP,
25=SMTP, 110=POP3
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -s $PRIVATE_NET -i $PRIVATE_NIC -j ACCEPT
iptables -A INPUT -s 0.0.0.0/0 -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -s 0.0.0.0/0 -p tcp --dport 110 -j ACCEPT
###########################################################################
# FORWARDS
## FORWARD ACEPTED 80=HTTP, 143=IMAP, 53=DNS, 21=FTP, 1214=KAZAA
iptables -A FORWARD -s $PRIVATE_NET -i $PRIVATE_NIC -p tcp --dport 80 -j
ACCEPT
iptables -A FORWARD -s $PRIVATE_NET -i $PRIVATE_NIC -p tcp --dport 143 -j
ACCEPT
iptables -A FORWARD -s $PRIVATE_NET -i $PRIVATE_NIC -p tcp --dport 53 -j
ACCEPT
iptables -A FORWARD -s $PRIVATE_NET -i $PRIVATE_NIC -p udp --dport 53 -j
ACCEPT
iptables -A FORWARD -s $PRIVATE_NET -i $PRIVATE_NIC -p tcp --dport 21 -j
ACCEPT
iptables -A FORWARD -s $PRIVATE_NET -i $PRIVATE_NIC -p tcp --dport 1214 -j
ACCEPT
iptables -A FORWARD -s $PRIVATE_NET -i $PRIVATE_NIC -p tcp --dport 3128 -j
ACCEPT

## FORWARD DENIED
# iptables -A FORWARD -s $PRIVATE_NET -i $PRIVATE_NIC -j DROP
################################################################
ENMASCARAMIENTO
iptables -t nat -A POSTROUTING -s $PRIVATE_NET -o $PUBLIC_NIC -j  MASQUERADE
################################################################ HABILITAR
FORWARDING
echo 1 > /proc/sys/net/ipv4/ip_forward

############################################################### CERRAR
ACCESO A INDESEADOS
# iptables -A INPUT -s 0.0.0.0/0 -i $PUBLIC_NIC -p tcp --dport 1:1024 -j
DROP
# iptables -A INPUT -s 0.0.0.0/0 -i $PUBLIC_NIC -p udp --dport 1:1024 -j
DROP

## DENIED WEBMIN PORT ACCESS
# iptables -A INPUT -s 0.0.0.0/0 -i $PUBLIC_NIC -p tcp --dport 10000 -j DROP

service iptables save

# Fin del script


*************************************
[root@transito root]# iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  192.160.33.0/24      anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
 ******************************************

[root@transito root]# iptables -L -n

Chain INPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
ACCEPT     all  --  192.160.33.0/24      0.0.0.0/0
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:25
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          tcp dpt:110

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
ACCEPT     tcp  --  192.160.33.0/24      0.0.0.0/0          tcp dpt:80
ACCEPT     tcp  --  192.160.33.0/24      0.0.0.0/0          tcp dpt:143
ACCEPT     tcp  --  192.160.33.0/24      0.0.0.0/0          tcp dpt:53
ACCEPT     udp  --  192.160.33.0/24      0.0.0.0/0          udp dpt:53
ACCEPT     tcp  --  192.160.33.0/24      0.0.0.0/0          tcp dpt:21
ACCEPT     tcp  --  192.160.33.0/24      0.0.0.0/0          tcp dpt:1214

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination







Best regards,

DANIEL.



