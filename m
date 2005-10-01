From: "Guillermo Javier Nardoni" <gjnardoni@yahoo.com.ar>
Subject: I gave up.-...-.-.-.- :'(
Date: Sat, 1 Oct 2005 11:05:19 -0300
Message-ID: <007101c5c691$2c6f81f0$5b00a8c0@ripst>
Reply-To: Guillermo Javier Nardoni <gjnardoni@yahoo.com.ar>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0215680957=="
Return-path: <lartc-bounces@mailman.ds9a.nl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Subscribe: <http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
Mime-version: 1.0
Sender: lartc-bounces@mailman.ds9a.nl
Errors-To: lartc-bounces@mailman.ds9a.nl
To: lartc@mailman.ds9a.nl, netfilter@lists.netfilter.org, fb-gral@freebaires.org.ar

This is a multi-part message in MIME format.

--===============0215680957==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_006E_01C5C678.02B48F90"

This is a multi-part message in MIME format.

------=_NextPart_000_006E_01C5C678.02B48F90
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Actually i gave up, i tried and tried and tried so many times, upgrading =
software falling back to an old version=20
but it didn't work, that's it.
i can't do work together tc with iptables and iproute2
when i mark a packet with iptables tc doesn't recognize them so it falls =
at the default leaf of the tc's tree

what i like is to mark packets depending on their ip (the one who make a =
connetion into de linux (gateway) box) and port.

i'll transcript my script because i really don't know what to do.

p.d. so, what i like to do is just simple, i guess; everything comes =
from eth1 and goes to eth1 (lan users to linux box services) must be =
shapped by ipaddres + port (dport i guess INPUT/OUTPUT CHAIN?)
and everything comes from ETH1 goes to ETH0 (Internet Access i guess =
PREROUTING/POSTROUTING/FORWARD chain) MUST BE SHAPPED BY PORT + =
IPADDRESS

i have this situation on the linux server:

eth0: (Out to internet)
eth1: (LAN)

configutarion: eth0 (network 200.123.166.72, broadcast: 200.123.166.79; =
(ip range: 200.123.166.73-77)
eth0 ip: 200.123.166.73
eth0: gw: 200.123.166.78
eth0: netmask: 255.255.255.248
eth dns1: 200.123.166.73
eth0 dns2: 200.123.166.74

configuration: eth1 (network 172.16.0.0 broadcast: 172.16.0.255 (ip =
range: 172.16.0.1-254)
eth1 ip: 172.16.0.1
eth1: gw: (none)
eth1: netmask: 255.255.0.0
eth1: dns1: 200.123.166.73
eth1: dns2: 200.123.166.74

LINUX BOX SERVING THIS SERVICES: HTTP (PORT 80) SMTP (PORT 25) POP3 =
(PORT 110) SSH (PORT 22) FTP (PORT 20-21) SMB FS (PORT 136-139) IRC =
(PORT 6667)

CONFIGURATION OF TC:

tc=3D/sbin/tc
iptables=3D/sbin/iptables

echo "Building tc Classes"
IFACE=3D"eth0 eth1"

for i in $IFACE;do
$tc qdisc add dev $i root handle 1: htb default 10

$tc class add dev $i parent 1: classid 1:1 htb rate 2048mbit=20

$tc class add dev $i parent 1:1 classid 1:10 htb rate 10kbit ceil =
128kbit quantum 1514
$tc class add dev $i parent 1:1 classid 1:20 htb rate 10kbit ceil =
256kbit quantum 1514 =20
$tc class add dev $i parent 1:1 classid 1:30 htb rate 10kbit ceil =
512kbit quantum 1514 =20
$tc class add dev $i parent 1:1 classid 1:40 htb rate 10kbit ceil =
1024bit quantum 1514 =20
$tc class add dev $i parent 1:1 classid 1:50 htb rate 10kbit ceil =
2048bit quantum 1514 =20

$tc class add dev $i parent 1:1 classid 1:60 htb rate 10kbit ceil =
256kbit quantum 1514 # USED FOR HTTP/IRC
$tc class add dev $i parent 1:1 classid 1:70 htb rate 10kbit ceil =
128kbit quantum 1514 # USED FOR EMAIL (SMTP/POP3)


$tc qdisc add dev $i parent 1:10 handle 10: sfq perturb 10
$tc qdisc add dev $i parent 1:20 handle 20: sfq perturb 10
$tc qdisc add dev $i parent 1:30 handle 30: sfq perturb 10
$tc qdisc add dev $i parent 1:40 handle 40: sfq perturb 10
$tc qdisc add dev $i parent 1:50 handle 50: sfq perturb 10

$tc qdisc add dev $i parent 1:60 handle 60: sfq perturb 10
$tc qdisc add dev $i parent 1:70 handle 70: sfq perturb 10

$tc filter add dev $i parent 1:0 protocol ip prio 0 handle 10 fw flowid =
1:10
$tc filter add dev $i parent 1:0 protocol ip prio 0 handle 20 fw flowid =
1:20
$tc filter add dev $i parent 1:0 protocol ip prio 0 handle 30 fw flowid =
1:30
$tc filter add dev $i parent 1:0 protocol ip prio 0 handle 40 fw flowid =
1:40
$tc filter add dev $i parent 1:0 protocol ip prio 0 handle 50 fw flowid =
1:50
$tc filter add dev $i parent 1:0 protocol ip prio 0 handle 60 fw flowid =
1:60
$tc filter add dev $i parent 1:0 protocol ip prio 0 handle 70 fw flowid =
1:70



PORTS=3D"80 6667 20 21"
#ANY IP MUST BE SHAPPED BY THESE PORTS TO THE 1:60 LEAF
for i in $PORTS;do
    $iptables -t mangle -A INPUT -i eth1 -s 172.16.0.0/16 -p tcp --dport =
$i -j MARK --set-mark 60
    $iptables -t mangle -A INPUT -i eth1 -s 172.16.0.0/16 -p udp --dport =
$i -j MARK --set-mark 60

    $iptables -t mangle -A OUTPUT -o eth1 -d 172.16.0.0/16 -p tcp =
--dport $i -j MARK --set-mark 60
    $iptables -t mangle -A OUTPUT -o eth1 -d 172.16.0.0/16 -p udp =
--dport $i -j MARK --set-mark 60

    $iptables -t mangle -A INPUT -i eth0 -d 200.123.166.72/30 -p tcp =
--dport $i -j MARK --set-mark 60
    $iptables -t mangle -A INPUT -i eth0 -d 200.123.166.72/30 -p udp =
--dport $i -j MARK --set-mark 60

    $iptables -t mangle -A OUTPUT -o eth0 -d 200.123.166.72/30 -p tcp =
--dport $i -j MARK --set-mark 60
    $iptables -t mangle -A OUTPUT -o eth0 -d 200.123.166.72/30 -p udp =
--dport $i -j MARK --set-mark 60
done

SOOOOOOOOOOOOOOOOOO WHAT AM I DOING WRONG, COUSE EVERY TRAFFIC COMMING =
OR GOING JUST FALLS ON 1:10 (DEFAULT LEAF)

This is an extract from the script, so it show you the LOCAL PROCESS of =
information not PREROUTING

PLEASE HELPPPPPPPPP ME I DON'T KNOW WHAT TO DO AND MY SYSTEM IS GOING =
DOWN FASTER.-

MY CONFIGURATION IS:
ip utility, iproute2-ss050330
tc utility, iproute2-ss050330
iptables v1.3.3
kernel: 2.6.13
patch applied for kernel and iproute and iptables (esfq + wrr)
heeeeeeeeeeeeeeeelp


thank you so much=20
Guillermo from Argentina



------=_NextPart_000_006E_01C5C678.02B48F90
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Actually i gave up, i tried and tried =
and tried so=20
many times, upgrading software falling back to an old version =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>but it didn't work, that's =
it.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>i can't do work together tc with =
iptables and=20
iproute2</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>when i mark a packet with iptables tc =
doesn't=20
recognize them so it falls at the default leaf of the tc's =
tree</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>what i like is to mark packets =
depending on their=20
ip (the one who make a connetion into de linux (gateway) box) and=20
port.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>i'll transcript my script because i =
really don't=20
know what to do.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>p.d. so, what i like to do is just =
simple, i guess;=20
everything comes from eth1 and goes to eth1&nbsp;(lan users to linux box =

services) must be shapped by ipaddres + port (dport i guess INPUT/OUTPUT =

CHAIN?)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>and everything comes from ETH1 goes to =
ETH0=20
(Internet Access i guess PREROUTING/POSTROUTING/FORWARD chain) MUST BE =
SHAPPED=20
BY PORT + IPADDRESS</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>i have this situation on the linux=20
server:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>eth0: (Out to internet)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth1: (LAN)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>configutarion: eth0 (network =
200.123.166.72,=20
broadcast: 200.123.166.79; (ip range: 200.123.166.73-77)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth0 ip: 200.123.166.73</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth0: gw: 200.123.166.78</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth0: netmask: =
255.255.255.248</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth dns1: 200.123.166.73</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth0 dns2: 200.123.166.74</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>configuration: eth1 (network 172.16.0.0 =
broadcast:=20
172.16.0.255 (ip range: 172.16.0.1-254)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth1 ip: 172.16.0.1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth1: gw: (none)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth1: netmask: 255.255.0.0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth1: dns1: 200.123.166.73</FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>eth1: dns2: 200.123.166.74</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>LINUX BOX SERVING THIS SERVICES: HTTP =
(PORT 80)=20
SMTP (PORT 25) POP3 (PORT 110) SSH (PORT 22) FTP (PORT 20-21) SMB FS =
(PORT=20
136-139) IRC (PORT 6667)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>CONFIGURATION OF TC:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><FONT=20
size=3D3>tc=3D/sbin/tc<BR>iptables=3D/sbin/iptables</FONT></FONT></DIV><F=
ONT=20
face=3DArial size=3D2><FONT size=3D3></FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT =
size=3D3></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>echo "Building tc=20
Classes"<BR>IFACE=3D"eth0 eth1"<BR></FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>for i in=20
$IFACE;do<BR></FONT></FONT><FONT face=3DArial size=3D2><FONT =
size=3D3>$tc qdisc add=20
dev $i root handle 1: htb default 10<BR><BR>$tc class add dev $i parent =
1:=20
classid 1:1 htb rate 2048mbit <BR><BR>$tc class add dev $i parent 1:1 =
classid=20
1:10 htb rate 10kbit ceil 128kbit quantum 1514<BR>$tc class add dev $i =
parent=20
1:1 classid 1:20 htb rate 10kbit ceil 256kbit quantum 1514&nbsp; <BR>$tc =
class=20
add dev $i parent 1:1 classid 1:30 htb rate 10kbit ceil 512kbit quantum=20
1514&nbsp; <BR>$tc class add dev $i parent 1:1 classid 1:40 htb rate =
10kbit ceil=20
1024bit quantum 1514&nbsp; <BR>$tc class add dev $i parent 1:1 classid =
1:50 htb=20
rate 10kbit ceil 2048bit quantum 1514&nbsp; <BR></FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>$tc class add dev $i =
parent 1:1=20
classid 1:60 htb rate 10kbit ceil 256kbit quantum 1514 # USED FOR=20
HTTP/IRC</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>$tc class add dev $i =
parent 1:1=20
classid 1:70 htb rate 10kbit ceil 128kbit quantum 1514 # USED FOR EMAIL=20
(SMTP/POP3)<BR><BR><BR>$tc qdisc add dev $i parent 1:10 handle 10: sfq =
perturb=20
10<BR>$tc qdisc add dev $i parent 1:20 handle 20: sfq perturb 10<BR>$tc =
qdisc=20
add dev $i parent 1:30 handle 30: sfq perturb 10<BR>$tc qdisc add dev $i =
parent=20
1:40 handle 40: sfq perturb 10<BR>$tc qdisc add dev $i parent 1:50 =
handle 50:=20
sfq perturb 10<BR></FONT></FONT><FONT face=3DArial size=3D2><FONT=20
size=3D3></FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>$tc qdisc add dev $i =
parent 1:60=20
handle 60: sfq perturb 10<BR>$tc qdisc add dev $i parent 1:70 handle 70: =
sfq=20
perturb 10<BR></FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>$tc filter add dev $i =
parent 1:0=20
protocol ip prio 0 handle 10 fw flowid 1:10</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>$tc filter add dev $i =
parent 1:0=20
protocol ip prio 0 handle 20 fw flowid 1:20</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>$tc filter add dev $i =
parent 1:0=20
protocol ip prio 0 handle 30 fw flowid 1:30</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>$tc filter add dev $i =
parent 1:0=20
protocol ip prio 0 handle 40 fw flowid 1:40</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>$tc filter add dev $i =
parent 1:0=20
protocol ip prio 0 handle 50 fw flowid 1:50</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>$tc filter add dev $i =
parent 1:0=20
protocol ip prio 0 handle 60 fw flowid 1:60</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3>$tc filter add dev $i =
parent 1:0=20
protocol ip prio 0 handle 70 fw flowid 1:70</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3><FONT=20
size=3D2></FONT>&nbsp;</DIV></FONT></FONT></DIV></FONT></FONT></DIV></FON=
T></FONT></DIV></FONT></FONT></DIV></FONT></FONT></DIV></FONT></FONT></DI=
V></FONT></FONT>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3><FONT=20
size=3D2></FONT></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D3><FONT =
size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>PORTS=3D"80 6667 20 21"</FONT></DIV>
<DIV><FONT size=3D2>#ANY IP MUST BE SHAPPED BY THESE PORTS TO THE 1:60=20
LEAF</FONT></DIV>
<DIV><FONT size=3D2>for i in $PORTS;do</FONT></DIV>
<DIV><FONT size=3D2>&nbsp;&nbsp;&nbsp; $iptables -t mangle -A INPUT -i=20
eth1&nbsp;-s 172.16.0.0/16 -p tcp&nbsp;--dport $i -j MARK --set-mark=20
60</FONT></DIV>
<DIV>
<DIV><FONT size=3D2>&nbsp;&nbsp;&nbsp; $iptables -t mangle -A INPUT -i=20
eth1&nbsp;-s 172.16.0.0/16 -p udp&nbsp;--dport $i -j MARK --set-mark=20
60</FONT></DIV></DIV>
<DIV><FONT size=3D2>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>&nbsp;&nbsp;&nbsp; $iptables -t mangle =
-A&nbsp;OUTPUT -o=20
eth1&nbsp;-d 172.16.0.0/16 -p tcp&nbsp;--dport $i -j MARK --set-mark=20
60</FONT></DIV>
<DIV>
<DIV><FONT size=3D2>&nbsp;&nbsp;&nbsp; $iptables -t mangle =
-A&nbsp;OUTPUT -o=20
eth1&nbsp;-d 172.16.0.0/16 -p udp&nbsp;--dport $i -j MARK --set-mark=20
60</FONT></DIV></DIV></FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV>
<DIV><FONT size=3D2>&nbsp;&nbsp;&nbsp; $iptables -t mangle -A INPUT -i=20
eth0&nbsp;-d 200.123.166.72/30 -p tcp&nbsp;--dport $i -j MARK --set-mark =

60</FONT></DIV>
<DIV>
<DIV><FONT size=3D2>&nbsp;&nbsp;&nbsp; $iptables -t mangle -A INPUT -i=20
eth0&nbsp;-d 200.123.166.72/30 -p udp&nbsp;--dport $i -j MARK --set-mark =

60</FONT></DIV></DIV>
<DIV><FONT size=3D2>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>&nbsp;&nbsp;&nbsp; $iptables -t mangle =
-A&nbsp;OUTPUT -o=20
eth0&nbsp;-d 200.123.166.72/30 -p tcp&nbsp;--dport $i -j MARK --set-mark =

60</FONT></DIV>
<DIV>
<DIV><FONT size=3D2>&nbsp;&nbsp;&nbsp; $iptables -t mangle =
-A&nbsp;OUTPUT -o=20
eth0&nbsp;-d 200.123.166.72/30 -p udp&nbsp;--dport $i -j MARK --set-mark =

60</FONT></DIV></DIV></FONT></DIV></FONT><FONT size=3D2></FONT></DIV>
<DIV><FONT size=3D2>done</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>SOOOOOOOOOOOOOOOOOO WHAT AM I DOING WRONG, COUSE EVERY TRAFFIC =
COMMING OR=20
GOING JUST FALLS ON 1:10 (DEFAULT LEAF)</DIV>
<DIV>&nbsp;</DIV>
<DIV>This is an extract from the script, so it show you the LOCAL =
PROCESS of=20
information not PREROUTING</DIV>
<DIV>&nbsp;</DIV>
<DIV>PLEASE HELPPPPPPPPP ME I DON'T KNOW WHAT TO DO AND MY SYSTEM IS =
GOING DOWN=20
FASTER.-</DIV>
<DIV>&nbsp;</DIV>
<DIV>MY CONFIGURATION IS:</DIV>
<DIV>ip utility, iproute2-ss050330</DIV>
<DIV>tc utility, iproute2-ss050330<BR>iptables v1.3.3</DIV>
<DIV>kernel: 2.6.13</DIV>
<DIV>patch applied for kernel and iproute and iptables (esfq + =
wrr)</DIV>
<DIV>heeeeeeeeeeeeeeeelp</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>thank you so much </DIV>
<DIV>Guillermo from Argentina</DIV>
<DIV><BR><BR>&nbsp;</DIV></FONT></BODY></HTML>

------=_NextPart_000_006E_01C5C678.02B48F90--


--===============0215680957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
LARTC mailing list
LARTC@mailman.ds9a.nl
http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc

--===============0215680957==--

