From: "Voltaire Pascual" <voltaire@voltaire.servebeer.com>
Subject: Help :  IPTABLES RULE - VPN
Date: Tue, 13 May 2003 10:52:42 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007d01c318fa$b9b6a030$fe00a8c0@expi>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_007A_01C3193D.C7707000"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_007A_01C3193D.C7707000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

RePOST: I can connect to the VPN server but cannot see the machines =
inside the network. What could that iptables rule that will fix this =
problem. Ive been getting nutz for a week now. Below is my config. =
Thanks in advance.


ppp0 (212.x.x.x) =3D external=20
eth0 (192.168.0.10) =3D internal

"/etc/sysctl.conf"
net.ipv4.ip_forward =3D 1
net.ipv4.conf.eth0.proxy_arp =3D 1
net.ipv4.conf.ppp0.proxy_arp =3D 1

"/etc/pptpd.conf"
option /etc/ppp/options.pptpd
localip 192.168.0.10
remoteip 192.168.0.180-200

"/etc/options.pptpd"
lock
proxyarp
auth
mppe-40
mppe-128
mppe-stateless
require-chapms-v2
ms-dns 212.x.x.x

"ifconfig (VPN client is connected)

eth0      Link encap:Ethernet  HWaddr 00:40:D0:09:83:6F
          inet addr:192.168.0.10  Bcast:192.168.0.255  =
Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:2668464 errors:0 dropped:0 overruns:0 frame:33275
          TX packets:2625866 errors:0 dropped:0 overruns:1 carrier:32449
          collisions:642248 txqueuelen:100
          RX bytes:1595216335 (1521.3 Mb)  TX bytes:1493286813 (1424.1 =
Mb)
          Interrupt:9

ppp0      Link encap:Point-to-Point Protocol
          inet addr:212.163.247.186  P-t-P:212.163.246.1  =
Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1492  Metric:1
          RX packets:813205 errors:0 dropped:0 overruns:0 frame:0
          TX packets:636523 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:914836962 (872.4 Mb)  TX bytes:38925195 (37.1 Mb)

*** (VPN USER HERE)
ppp1      Link encap:Point-to-Point Protocol
          inet addr:192.168.0.10  P-t-P:192.168.0.181  =
Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1400  Metric:1
          RX packets:222 errors:0 dropped:0 overruns:0 frame:0
          TX packets:164 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:24343 (23.7 Kb)  TX bytes:110428 (107.8 Kb)


note: VPN client can ping the server (192.168.0.10) but cannot ping =
other machines inside the network.

IPTABLES RULE:

*nat
:PREROUTING ACCEPT [39:3502]
:POSTROUTING ACCEPT [3:214]
:OUTPUT ACCEPT [7:481]
-A POSTROUTING -o ppp0 -s 192.168.0.0/24 -j MASQUERADE
COMMIT

*mangle
:PREROUTING ACCEPT [1030:102381]
:INPUT ACCEPT [1008469:89426463]
:FORWARD ACCEPT [348448:207542782]
:OUTPUT ACCEPT [650:99903]
:POSTROUTING ACCEPT [407443:221658748]
COMMIT

*filter
:INPUT DROP [6:240]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]
:bad_packets - [0:0]
:bad_tcp_packets - [0:0]
:icmp_packets - [0:0]
:tcp_inbound - [0:0]
:tcp_outbound - [0:0]
:udp_inbound - [0:0]
:udp_outbound - [0:0]
-A INPUT -i lo -j ACCEPT
-A INPUT -j bad_packets
-A INPUT -s 192.168.0.0/24 -i eth0 -j ACCEPT
-A INPUT -s 192.168.0.0/24 -i ppp+ -j ACCEPT
-A INPUT -i eth0 -p udp -m udp --sport 68 --dport 67 -j ACCEPT
-A INPUT -i ppp0 -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -i ppp0 -p tcp -j tcp_inbound
-A INPUT -i ppp0 -p udp -j udp_inbound
-A INPUT -i ppp0 -p icmp -j icmp_packets
-A INPUT -d 255.255.255.255 -j DROP
-A INPUT -m limit --limit 3/min --limit-burst 3 -j LOG --log-prefix =
"INPUT packet died: "
-A FORWARD -s 192.168.0.0/24 -i eth0 -j ACCEPT
-A FORWARD -s 192.168.0.0/24 -i ppp+ -j ACCEPT
-A FORWARD -s 192.168.0.0/24 -i eth0 -p tcp -j tcp_outbound
-A FORWARD -s 192.168.0.0/24 -i eth0 -p udp -j udp_outbound
-A FORWARD -i ppp+ -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -m limit --limit 3/min --limit-burst 3 -j LOG --log-prefix =
"FORWARD packet died: "
-A OUTPUT -p icmp -m state --state INVALID -j DROP
-A OUTPUT -s 127.0.0.1 -j ACCEPT
-A OUTPUT -o lo -j ACCEPT
-A OUTPUT -s 192.168.0.0/24 -j ACCEPT
-A OUTPUT -o eth0 -j ACCEPT
-A OUTPUT -o ppp+ -j ACCEPT
-A OUTPUT -m limit --limit 3/min --limit-burst 3 -j LOG --log-prefix =
"OUTPUT packet died: "
-A bad_packets -m state --state INVALID -j LOG --log-prefix "Invalid =
packet:"
-A bad_packets -m state --state INVALID -j DROP
-A bad_packets -p tcp -j bad_tcp_packets
-A bad_packets -j RETURN
-A bad_tcp_packets -i eth0 -p tcp -j RETURN
-A bad_tcp_packets -p tcp -m tcp ! --tcp-flags SYN,RST,ACK SYN -m state =
--state NEW -j LOG --log-prefix "New not syn:"
-A bad_tcp_packets -p tcp -m tcp ! --tcp-flags SYN,RST,ACK SYN -m state =
--state NEW -j DROP
-A bad_tcp_packets -p tcp -j RETURN
-A icmp_packets -p icmp -m icmp --icmp-type 11 -j ACCEPT
-A icmp_packets -p icmp -j RETURN
-A tcp_inbound -p tcp -m tcp --dport 22 -j ACCEPT
-A tcp_inbound -p tcp -j RETURN
-A tcp_outbound -p tcp -j ACCEPT
-A udp_inbound -p udp -j RETURN
-A udp_outbound -p udp -j ACCEPT
COMMIT


------=_NextPart_000_007A_01C3193D.C7707000
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2719.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><STRONG>RePOST:</STRONG> I can connect to the VPN server but cannot =
see the=20
machines inside the network. What could that iptables rule that will fix =
this=20
problem. Ive been getting nutz for a week now. Below is my config. =
Thanks in=20
advance.</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>ppp0 (212.x.x.x)&nbsp;=3D external </DIV>
<DIV>eth0 (192.168.0.10) =3D internal</DIV>
<DIV>&nbsp;</DIV>
<DIV><STRONG>"/etc/sysctl.conf"</STRONG></DIV>
<DIV>net.ipv4.ip_forward =3D 1</DIV>
<DIV>net.ipv4.conf.eth0.proxy_arp =3D 1</DIV>
<DIV>net.ipv4.conf.ppp0.proxy_arp =3D 1</DIV>
<DIV>&nbsp;</DIV>
<DIV><STRONG>"/etc/pptpd.conf"</STRONG></DIV>
<DIV>option /etc/ppp/options.pptpd<BR>localip 192.168.0.10<BR>remoteip=20
192.168.0.180-200</DIV>
<DIV>&nbsp;</DIV>
<DIV><STRONG>"/etc/options.pptpd"</STRONG></DIV>
<DIV>lock<BR>proxyarp<BR>auth<BR>mppe-40<BR>mppe-128<BR>mppe-stateless<BR=
>require-chapms-v2<BR>ms-dns=20
212.x.x.x</DIV>
<DIV>&nbsp;</DIV>
<DIV><STRONG>"ifconfig (VPN client is connected)</STRONG></DIV>
<DIV>&nbsp;</DIV>
<DIV>eth0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Link encap:Ethernet&nbsp; HWaddr =

00:40:D0:09:83:6F<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; inet=20
addr:192.168.0.10&nbsp; Bcast:192.168.0.255&nbsp;=20
Mask:255.255.255.0<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; UP=20
BROADCAST RUNNING MULTICAST&nbsp; MTU:1500&nbsp;=20
Metric:1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RX=20
packets:2668464 errors:0 dropped:0 overruns:0=20
frame:33275<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TX =

packets:2625866 errors:0 dropped:0 overruns:1=20
carrier:32449<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
collisions:642248=20
txqueuelen:100<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
RX=20
bytes:1595216335 (1521.3 Mb)&nbsp; TX bytes:1493286813 (1424.1=20
Mb)<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Interrupt:9</DIV>
<DIV>&nbsp;</DIV>
<DIV>ppp0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Link encap:Point-to-Point=20
Protocol<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inet=20
addr:212.163.247.186&nbsp; P-t-P:212.163.246.1&nbsp;=20
Mask:255.255.255.255<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
UP POINTOPOINT RUNNING NOARP MULTICAST&nbsp; MTU:1492&nbsp;=20
Metric:1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RX=20
packets:813205 errors:0 dropped:0 overruns:0=20
frame:0<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TX=20
packets:636523 errors:0 dropped:0 overruns:0=20
carrier:0<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
collisions:0=20
txqueuelen:3<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
RX=20
bytes:914836962 (872.4 Mb)&nbsp; TX bytes:38925195 (37.1 Mb)</DIV>
<DIV>&nbsp;</DIV>
<DIV><STRONG><FONT color=3D#ff0000>*** (VPN USER =
HERE)</FONT></STRONG></DIV>
<DIV><STRONG><FONT color=3D#ff0000>ppp1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Link=20
encap:Point-to-Point=20
Protocol<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inet=20
addr:192.168.0.10&nbsp; P-t-P:192.168.0.181&nbsp;=20
Mask:255.255.255.255<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
UP POINTOPOINT RUNNING NOARP MULTICAST&nbsp; MTU:1400&nbsp;=20
Metric:1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RX=20
packets:222 errors:0 dropped:0 overruns:0=20
frame:0<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TX =
packets:164=20
errors:0 dropped:0 overruns:0=20
carrier:0<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
collisions:0=20
txqueuelen:3<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
RX=20
bytes:24343 (23.7 Kb)&nbsp; TX bytes:110428 (107.8 =
Kb)<BR></FONT></STRONG></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#ff0000><STRONG>note: VPN client can ping the server=20
(192.168.0.10) but cannot ping other machines inside the=20
network.</STRONG></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><STRONG>IPTABLES RULE:</STRONG></DIV>
<DIV>&nbsp;</DIV>
<DIV>*nat<BR>:PREROUTING ACCEPT [39:3502]<BR>:POSTROUTING ACCEPT=20
[3:214]<BR>:OUTPUT ACCEPT [7:481]<BR>-A POSTROUTING -o ppp0 -s =
192.168.0.0/24 -j=20
MASQUERADE<BR>COMMIT</DIV>
<DIV><BR>*mangle<BR>:PREROUTING ACCEPT [1030:102381]<BR>:INPUT ACCEPT=20
[1008469:89426463]<BR>:FORWARD ACCEPT [348448:207542782]<BR>:OUTPUT =
ACCEPT=20
[650:99903]<BR>:POSTROUTING ACCEPT [407443:221658748]<BR>COMMIT</DIV>
<DIV><BR>*filter<BR>:INPUT DROP [6:240]<BR>:FORWARD DROP =
[0:0]<BR>:OUTPUT DROP=20
[0:0]<BR>:bad_packets - [0:0]<BR>:bad_tcp_packets - =
[0:0]<BR>:icmp_packets -=20
[0:0]<BR>:tcp_inbound - [0:0]<BR>:tcp_outbound - [0:0]<BR>:udp_inbound - =

[0:0]<BR>:udp_outbound - [0:0]<BR>-A INPUT -i lo -j ACCEPT<BR>-A INPUT =
-j=20
bad_packets<BR>-A INPUT -s 192.168.0.0/24 -i eth0 -j ACCEPT<BR>-A INPUT =
-s=20
192.168.0.0/24 -i ppp+ -j ACCEPT<BR>-A INPUT -i eth0 -p udp -m udp =
--sport 68=20
--dport 67 -j ACCEPT<BR>-A INPUT -i ppp0 -m state --state =
RELATED,ESTABLISHED -j=20
ACCEPT<BR>-A INPUT -i ppp0 -p tcp -j tcp_inbound<BR>-A INPUT -i ppp0 -p =
udp -j=20
udp_inbound<BR>-A INPUT -i ppp0 -p icmp -j icmp_packets<BR>-A INPUT -d=20
255.255.255.255 -j DROP<BR>-A INPUT -m limit --limit 3/min --limit-burst =
3 -j=20
LOG --log-prefix "INPUT packet died: "<BR>-A FORWARD -s 192.168.0.0/24 =
-i eth0=20
-j ACCEPT<BR>-A FORWARD -s 192.168.0.0/24 -i ppp+ -j ACCEPT<BR>-A =
FORWARD -s=20
192.168.0.0/24 -i eth0 -p tcp -j tcp_outbound<BR>-A FORWARD -s =
192.168.0.0/24 -i=20
eth0 -p udp -j udp_outbound<BR>-A FORWARD -i ppp+ -m state --state=20
RELATED,ESTABLISHED -j ACCEPT<BR>-A FORWARD -m limit --limit 3/min =
--limit-burst=20
3 -j LOG --log-prefix "FORWARD packet died: "<BR>-A OUTPUT -p icmp -m =
state=20
--state INVALID -j DROP<BR>-A OUTPUT -s 127.0.0.1 -j ACCEPT<BR>-A OUTPUT =
-o lo=20
-j ACCEPT<BR>-A OUTPUT -s 192.168.0.0/24 -j ACCEPT<BR>-A OUTPUT -o eth0 =
-j=20
ACCEPT<BR>-A OUTPUT -o ppp+ -j ACCEPT<BR>-A OUTPUT -m limit --limit =
3/min=20
--limit-burst 3 -j LOG --log-prefix "OUTPUT packet died: "<BR>-A =
bad_packets -m=20
state --state INVALID -j LOG --log-prefix "Invalid packet:"<BR>-A =
bad_packets -m=20
state --state INVALID -j DROP<BR>-A bad_packets -p tcp -j =
bad_tcp_packets<BR>-A=20
bad_packets -j RETURN<BR>-A bad_tcp_packets -i eth0 -p tcp -j =
RETURN<BR>-A=20
bad_tcp_packets -p tcp -m tcp ! --tcp-flags SYN,RST,ACK SYN -m state =
--state NEW=20
-j LOG --log-prefix "New not syn:"<BR>-A bad_tcp_packets -p tcp -m tcp ! =

--tcp-flags SYN,RST,ACK SYN -m state --state NEW -j DROP<BR>-A =
bad_tcp_packets=20
-p tcp -j RETURN<BR>-A icmp_packets -p icmp -m icmp --icmp-type 11 -j=20
ACCEPT<BR>-A icmp_packets -p icmp -j RETURN<BR>-A tcp_inbound -p tcp -m =
tcp=20
--dport 22 -j ACCEPT<BR>-A tcp_inbound -p tcp -j RETURN<BR>-A =
tcp_outbound -p=20
tcp -j ACCEPT<BR>-A udp_inbound -p udp -j RETURN<BR>-A udp_outbound -p =
udp -j=20
ACCEPT<BR>COMMIT<BR></DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_007A_01C3193D.C7707000--


