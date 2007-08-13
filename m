From: Klaus Wacker <klaus_gr_W_kl_Acker@web.de>
Subject: iptables /nat and route
Date: Mon, 13 Aug 2007 10:58:09 +0200
Message-ID: <1549989276@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi, it seems it is a simple task, but can't get it going.
I want have a couple of private machines accessing a public one  (and othe=
r way around) through a router/gateway
At the moment I do not care about ports (one to one is enough for me), jus=
t try to get a ping through in both directions including a change of sourc=
e and destination ip
The default gateways address of the public machine I did set to OUTIP  res=
pectively INIP for internal machine.=20
Here is my setup:

echo #rc.my.iptables

####network######
#given IP (not yet DHCP)
PUP=5FIP=3D"192.168.10.99"

#internal devices (might be a range)
NET=5FIP1=3D"192.168.9.1"

####router#######
OUT=5FINFC=3D"eth0"
IN=5FINFC=3D"eth2"
INIP=3D"192.168.9.200"
OUTIP=3D"192.168.10.200"


### iptables #####
##for incoming from puplic ###
iptables -t nat   -A PREROUTING -i $IN=5FINFC -s $PUP=5FIP -d $INIP -j DNAT --=
to $NET=5FIP1
iptables -t filter -A FORWARD -s $PUP=5FIP -d $NET=5FIP1 -j ACCEPT

###return way ###=20
iptables -t nat   -A POSTROUTING -d $PUP=5FIP -s $NET=5FIP1 -j SNAT  --to $INI=
P
#(have tried without next line)
iptables -t filter -A FORWARD -s $NET=5FIP1 -d $PUP=5FIP -j ACCEPT


## keep things going, (have tried without)###
iptables -A FORWARD -i eth0  -o eth2  -m state --state RELATED,ESTABLISHED=
 -j ACCEPT
iptables -A FORWARD -i eth2  -o eth0  -m state --state RELATED,ESTABLISHED=
 -j ACCEPT
=20

It does not work in any direction. I am wondering it may have something to=
 do with my route settings:


Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use If=
ace
default         192.168.10.1    255.255.255.0   UG    0      0        0 et=
h0
default         192.168.9.1     255.255.255.0   UG    0      0        0 et=
h2
192.168.10.0    *               255.255.255.0   U     0      0        0 et=
h0
192.168.9.0     *               255.255.255.0   U     0      0        0 et=
h2
default         127.0.0.0       0.0.0.0         UG    0      0        0 lo=

=20

Cheers
Klaus


=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
Jetzt neu! Sch=FCtzen Sie Ihren PC mit McAfee und WEB.DE. 3 Monate
kostenlos testen. http://www.pc-sicherheit.web.de/startseite/=3Fmc=3D022220


