From: "=?iso-8859-1?Q?kmc@tiscali.fr?=" <kmc@tiscali.fr>
Subject: =?iso-8859-1?Q?mail_server_acces_pb?=
Date: Fri, 23 Apr 2004 00:17:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HWLF8W$9F9583659D96FB958291928238874B93@tiscali.fr>
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?netfilter?= <netfilter@lists.netfilter.org>

i have a 2 machines network in workgroup. One LINUX connected to INTERNET=
 through ADSL AND A LAPTOP/XP that can't access to my ISP mail server wit=
h message:=0D=0A"can't find pop server's name pop.libertysurf.fr"=0D=0Aan=
d then=0D=0A"your mail server closed the connection=0D=0A=0D=0ACould this=
 be related to my netfilter? Here is my iptables definition:=0D=0A=0D=0A#=
!/bin/sh=0D=0A# /etc/network/if-pre-up.d/iptables-start.sh=0D=0Aiptables =
-F=0D=0Aiptables -t nat -F=0D=0Aiptables -P INPUT DROP=0D=0Aiptables -P F=
ORWARD ACCEPT=0D=0Aiptables -P OUTPUT ACCEPT=0D=0A=0D=0Aiptables -A INPUT=
 -i lo -j ACCEPT=0D=0Aiptables -A INPUT -i eth0 -j ACCEPT   #kmc permet l=
'acc=E8s r=E9seau local=0D=0Aiptables -A INPUT -p icmp -j ACCEPT=0D=0Aipt=
ables -A INPUT -p igmp -j ACCEPT=0D=0Aiptables -A INPUT -m state --state =
RELATED,ESTABLISHED -j ACCEPT=0D=0Aiptables -A INPUT -p tcp --dport 22 -j=
 ACCEPT=0D=0Aiptables -A INPUT -p tcp --dport 25 -j ACCEPT=0D=0Aiptables =
-A INPUT -p tcp --dport 80 -j ACCEPT=0D=0Aiptables -A INPUT -p tcp --dpor=
t 631 -j ACCEPT=0D=0Aiptables -A INPUT -p tcp --dport 139 -j ACCEPT=0D=0A=
iptables -A INPUT -p udp --dport 139 -j ACCEPT=0D=0Aiptables -A INPUT -p =
udp --dport 177 -j ACCEPT=0D=0Aiptables -A INPUT -p tcp --dport 6001 -j A=
CCEPT=0D=0Aiptables -A INPUT -p udp --dport 1234 -j ACCEPT=0D=0Aiptables =
-A INPUT -p udp -d 224.2.127.254 --dport 9875 -j ACCEPT=0D=0Aiptables -A =
INPUT -j REJECT=0D=0Aiptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE=
=0D=0Aiptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS -o eth=
1 --clamp-mss-to-pmtu=0D=0Aiptables -t nat -A PREROUTING -i eth1 -p tcp -=
-dport 80 -j DNAT --to-destination 192.168.0.5:80=0D=0A=0D=0AThanks for h=
elp=0D=0A =0D=0A=0D=0A=0D=0A=0D=0A******ADSL Tiscali, le Haut d=E9bit au =
meilleur prix ******=0D=0AAvec Tiscali, profitez de l'ADSL au meilleur pr=
ix partout en France !=0D=0APour profiter de cette offre exceptionnelle, =
cliquez ici : http://register.tiscali.fr/adsl=0D=0ASous r=E9serve d'=E9li=
gibilit=E9 =E0 l'ADSL.=0D=0A=0D=0A=0A=0A******ADSL Tiscali, le Haut d=E9b=
it au meilleur prix ******=0AAvec Tiscali, profitez de l'ADSL au meilleur=
 prix partout en France !=0APour profiter de cette offre exceptionnelle, =
cliquez ici : http://register.tiscali.fr/adsl=0ASous r=E9serve d'=E9ligib=
ilit=E9 =E0 l'ADSL.=0A


