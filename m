From: "Michael Hudin" <hudin@zoetrope.com>
Subject: Internal machines can't resolve external addresses
Date: Tue, 11 Jun 2002 20:00:01 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <001d01c211bd$413cf400$054da8c0@rita>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001A_01C21182.926A0EC0"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_001A_01C21182.926A0EC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Machines in the outside world, can view my websites fine, but whenever I =
try to go to one of them from a machine on my internal network behind =
the firewall, neither the domain name nor the IP will resolve.  I also =
have the same problem with my mail server and have to use the internal =
address of the mail server.  I am going to guess that the best solution =
to this is to run some kind of local DNS server on the inside of the =
firewall which resolves all my sites internally, but since I don't have =
a server at my disposal for it, is there some way around this?  I had =
the POSTROUTING MASQ line on and that did allow the internal machines to =
resolve, but it also hid the originating address for any outside =
machine, thus creating a security disaster.

-michael

*nat
:PREROUTING ACCEPT [241:88600]
:POSTROUTING ACCEPT [0:9862]
:OUTPUT ACCEPT [68:4275]
-A PREROUTING -d 10.10.10.252 -p tcp -m tcp --dport 110 -j DNAT =
--to-destination 192.168.77.2
-A PREROUTING -d 10.10.10.252 -p tcp -m tcp --dport 25 -j DNAT =
--to-destination 192.168.77.2
-A PREROUTING -d 10.10.10.251 -p tcp -m tcp --dport 80 -j DNAT =
--to-destination 192.168.77.2
-A PREROUTING -d 10.10.10.250 -p tcp -m tcp --dport 80 -j DNAT =
--to-destination 192.168.77.2
-A PREROUTING -d 10.10.10.250 -p tcp -m tcp --dport 22 -j DNAT =
--to-destination 192.168.77.2
-A POSTROUTING -o eth0 -j SNAT --to-source 10.10.10.254
#-A POSTROUTING -o eth1 -j MASQUERADE
COMMIT

*mangle
:PREROUTING ACCEPT [18365:3221456]
:INPUT ACCEPT [10886:760348]
:FORWARD ACCEPT [7269:2438049]
:OUTPUT ACCEPT [8009:752540]
:POSTROUTING ACCEPT [15177:3182145]
COMMIT

*filter
:INPUT ACCEPT [0:229546]
:FORWARD ACCEPT [363:1553786]
:OUTPUT ACCEPT [2:619341]
-A INPUT -p udp -m udp --sport 500 --dport 500 -j ACCEPT
-A INPUT -p tcp -j ACCEPT
-A INPUT -p esp -j ACCEPT
-A INPUT -p ah -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A FORWARD -i eth1 -j ACCEPT
-A FORWARD -i eth0 -o eth1 -p tcp -m tcp --dport 110 -m state --state =
NEW,RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i eth0 -o eth1 -p tcp -m tcp --dport 25 -m state --state =
NEW,RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i eth0 -o eth1 -p tcp -m tcp --dport 80 -m state --state =
NEW,RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i eth0 -o eth1 -p tcp -m tcp --dport 22 -m state --state =
NEW,RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -p udp -m udp --sport 500 --dport 500 -j ACCEPT
-A OUTPUT -p tcp -j ACCEPT
-A OUTPUT -p esp -j ACCEPT
-A OUTPUT -p ah -j ACCEPT
-A OUTPUT -o lo -j ACCEPT
COMMIT


------=_NextPart_000_001A_01C21182.926A0EC0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>Machines in the outside world, can view =
my websites=20
fine, but whenever I try to go to one of them from a machine on my =
internal=20
network behind the firewall, neither the domain name nor the IP will=20
resolve.&nbsp; I also have the same problem with my mail server and have =
to use=20
the internal address of the mail server.&nbsp; I am going to guess that =
the best=20
solution to this is to run some kind of local DNS server on the inside =
of the=20
firewall which resolves all my sites internally, but since I don't have =
a server=20
at my disposal for it, is there some way around this?&nbsp; I had the=20
POSTROUTING MASQ line on and that did allow the internal machines to =
resolve,=20
but it also hid the originating address for any outside machine, thus =
creating a=20
security disaster.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>-michael</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>*nat<BR>:PREROUTING ACCEPT=20
[241:88600]<BR>:POSTROUTING ACCEPT [0:9862]<BR>:OUTPUT ACCEPT =
[68:4275]<BR>-A=20
PREROUTING -d 10.10.10.252 -p tcp -m tcp --dport 110 -j DNAT =
--to-destination=20
192.168.77.2<BR>-A PREROUTING -d 10.10.10.252 -p tcp -m tcp --dport 25 =
-j DNAT=20
--to-destination 192.168.77.2<BR>-A PREROUTING -d 10.10.10.251 -p tcp -m =
tcp=20
--dport 80 -j DNAT --to-destination 192.168.77.2<BR>-A PREROUTING -d=20
10.10.10.250 -p tcp -m tcp --dport 80 -j DNAT --to-destination=20
192.168.77.2<BR>-A PREROUTING -d 10.10.10.250 -p tcp -m tcp --dport 22 =
-j DNAT=20
--to-destination 192.168.77.2<BR>-A POSTROUTING -o eth0 -j SNAT =
--to-source=20
10.10.10.254<BR>#-A POSTROUTING -o eth1 -j =
MASQUERADE<BR>COMMIT</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>*mangle<BR>:PREROUTING ACCEPT=20
[18365:3221456]<BR>:INPUT ACCEPT [10886:760348]<BR>:FORWARD ACCEPT=20
[7269:2438049]<BR>:OUTPUT ACCEPT [8009:752540]<BR>:POSTROUTING ACCEPT=20
[15177:3182145]<BR>COMMIT</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>*filter<BR>:INPUT ACCEPT =
[0:229546]<BR>:FORWARD=20
ACCEPT [363:1553786]<BR>:OUTPUT ACCEPT [2:619341]<BR>-A INPUT -p udp -m =
udp=20
--sport 500 --dport 500 -j ACCEPT<BR>-A INPUT -p tcp -j ACCEPT<BR>-A =
INPUT -p=20
esp -j ACCEPT<BR>-A INPUT -p ah -j ACCEPT<BR>-A INPUT -i lo -j =
ACCEPT<BR>-A=20
FORWARD -i eth1 -j ACCEPT<BR>-A FORWARD -i eth0 -o eth1 -p tcp -m tcp =
--dport=20
110 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT<BR>-A FORWARD -i =
eth0 -o=20
eth1 -p tcp -m tcp --dport 25 -m state --state NEW,RELATED,ESTABLISHED =
-j=20
ACCEPT<BR>-A FORWARD -i eth0 -o eth1 -p tcp -m tcp --dport 80 -m state =
--state=20
NEW,RELATED,ESTABLISHED -j ACCEPT<BR>-A FORWARD -i eth0 -o eth1 -p tcp =
-m tcp=20
--dport 22 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT<BR>-A =
OUTPUT -p=20
udp -m udp --sport 500 --dport 500 -j ACCEPT<BR>-A OUTPUT -p tcp -j =
ACCEPT<BR>-A=20
OUTPUT -p esp -j ACCEPT<BR>-A OUTPUT -p ah -j ACCEPT<BR>-A OUTPUT -o lo =
-j=20
ACCEPT<BR>COMMIT<BR></FONT></DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_001A_01C21182.926A0EC0--


