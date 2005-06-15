From: =?iso-8859-1?Q?Gonz=E1lez_Sandoval_Luis_Rolando?= <lgonzalezsa@ice.go.cr>
Subject: NAT  ONE-TO-ONE or FULL NAT
Date: Wed, 15 Jun 2005 09:06:30 -0600
Message-ID: <963D966FFE3FA84FA239605E9E0297FC02CE868C@SPEMEN08.icetel.ice>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I'm looking information about one to one NAT and his configuration whit =
IPTABLES v1.2.7a.=20
=20
My requirements are:
1.	Map IP address for the segment 10.129.41.0/24 for an IP address of =
192.168.20.0/24
=20
My firewall machine has three NIC:
1.	NIC eth0 for the segment 10.129.41.0/24
2.	NIC eth1 for the segment 192.168.20/24
3.	NIC eth2 for the segment 10.149.50.0/22
=20
=20
Please if someone can help me, I appreciate that... I'm reading Firewall =
Linux book, chapter seven, I research in the web, but I failed in my =
script.
If you can guide me about my requirement, thanks
=20
=20
I'm using the follow iptables script:
=20
#!/bin/bash
IPTABLES=3D/usr/sbin/iptables
=20
echo "Cargando Modulos Espere..."
=20
/sbin/depmod -a
=20
=20
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
=20
echo "Modulos ARRIBA"
=20
=20
=20
echo "IP Forward habilitado"
=20
echo "1" > /proc/sys/net/ipv4/ip_forward
=20
=20
#$IPTABLES -P INPUT DROP
                #Politica por defecto del INPUT   ---> DROP
#$IPTABLES -P FORWARD DROP
                #Politica por defecto del VALID_IO ---> DROP
#$IPTABLES -P OUTPUT DROP
                #Politica por defecto del OUTPUT  ---> DROP
=20
$IPTABLES -t nat -P PREROUTING  ACCEPT
$IPTABLES -t nat -P OUTPUT      ACCEPT
$IPTABLES -t nat -P POSTROUTING ACCEPT
=20
=20
$IPTABLES --flush
$IPTABLES --flush
$IPTABLES -t nat --flush
=20
$IPTABLES --delete-chain
=20
echo "Politica por defecto arriba"
=20
$IPTABLES -A INPUT  -i lo -j ACCEPT
                #A la interfaz de loopback se permite todo
$IPTABLES -A OUTPUT -o lo -j ACCEPT
                #A la interfaz de loopback se permite todo
=20
#LISTA DE DIRECCIONES AUTORIZADAS PARA ENTRAR A LA RED PROTEGIDA
$IPTABLES -A FORWARD -s 10.129.41.123       -m state --state NEW -j =
ACCEPT
$IPTABLES -A INPUT   -s 10.129.41.123       -m state --state NEW -j =
ACCEPT
$IPTABLES -A FORWARD -s 10.129.48.43        -m state --state NEW -j =
ACCEPT
$IPTABLES -A INPUT   -s 10.129.48.43        -m state --state NEW -j =
ACCEPT
=20
=20
#NAT 1:1
$IPTABLES -t nat -A POSTROUTING -o eth0 -s 192.168.20.183/32 -j SNAT =
--to 10.129.41.242
$IPTABLES -t nat -A PREROUTING -i eth1 -d 10.129.41.242/32 -j DNAT --to =
192.168.20.183
=20
# Allow forwarding to each of the servers configured for 1:1 NAT
# (For connections originating from the Internet. Notice how you
# use the real IP addresses here)
=20
$IPTABLES  -A FORWARD -p tcp -i eth0 -o eth1 -d 192.168.20.183 \
    -m state --state NEW -j ACCEPT
=20
# Allow forwarding for all New and Established SNAT connections
# originating on the home network AND already established
# DNAT connections
=20
$IPTABLES -A FORWARD -t filter -o eth0 -m state \
         --state NEW,ESTABLISHED,RELATED -j ACCEPT
=20
# Allow forwarding for all 1:1 NAT connections originating on
# the Internet that have already passed through the NEW forwarding
# statements above
=20
$IPTABLES -A FORWARD -t filter -i eth0 -m state \
         --state ESTABLISHED,RELATED -j ACCEPT
=20
=20
=20
Ing. Luis Gonz=E1lez Sandoval
Ingenier=EDa de Sistemas - Cx UEN GRM
Tel. 2838030
LGonzalezSa@ice.go.cr
=20
=20
