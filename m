From: "Michael Hudin" <hudin@zoetrope.com>
Subject: Outgoing SMTP Mystery
Date: Tue, 4 Jun 2002 15:18:46 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <013601c20c15$cba57520$52cfd3cf@michael>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0133_01C20BDB.1F141B70"
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

------=_NextPart_000_0133_01C20BDB.1F141B70
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Okay, so I've gotten everything running fine in my tables as far as =
HTTP, SSH and POP go, but I'm having a problem with SMTP (I have a qmail =
server).  I can send SMTP out just fine, but no other server can send it =
in for some reason.  It would appear in the logs that it is forwarding =
fine, but it is still not allowing connections on port 25.  My setup is =
Public Interface: eth0 - 10.10.10.254 Private Interface eth1 - =
192.168.77.1  My firewall also serves as a gateway for the private LAN =
and a VPN server running FreeSWAN.  The MX records are set up to point =
at 10.10.10.252 as the mail server and as you can see below, that is =
indeed forwarding (or at least it should be).  I've always assumed that =
the numbers in the brackets were port allowances and that may be my =
problem, but if they were, I wouldn't be able to get to SSH and HTTP. =
Also, if anyone has any security suggestions, since I just cobbled this =
together to get it working, they wouldn't fall on deaf ears.

Here are my tables:

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
-A POSTROUTING -o eth1 -j SNAT --to-source 10.10.10.254
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





Michael Hudin
Sentinel Systems Support
www.zoetrope.com

------=_NextPart_000_0133_01C20BDB.1F141B70
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
<DIV><FONT face=3DArial size=3D2>Okay, so I've gotten everything running =
fine in my=20
tables as far as HTTP, SSH and POP go, but I'm having a problem with =
SMTP (I=20
have a qmail server).&nbsp; I can send SMTP out just fine, but no other =
server=20
can send it in for some reason.&nbsp; It would appear in the logs that =
it is=20
forwarding fine, but it is still not allowing connections on port =
25.&nbsp; My=20
setup is Public Interface: eth0 - 10.10.10.254 Private Interface eth1 -=20
192.168.77.1&nbsp; My firewall also serves as a gateway for the private =
LAN and=20
a VPN server running FreeSWAN.&nbsp; The MX records are set up to point =
at=20
10.10.10.252 as the mail server and as you can see below, that is indeed =

forwarding (or at least it should be).&nbsp; I've always assumed that =
the=20
numbers in the brackets were port allowances and that may be my problem, =
but=20
if&nbsp;they were, I wouldn't be able to get to SSH and&nbsp;HTTP. Also, =
if=20
anyone has any security suggestions, since I just cobbled this together =
to get=20
it working, they wouldn't fall on deaf ears.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here are my tables:</FONT></DIV>
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
10.10.10.254<BR>-A POSTROUTING -o eth1 -j SNAT --to-source=20
10.10.10.254<BR>COMMIT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>*mangle<BR>:PREROUTING ACCEPT=20
[18365:3221456]<BR>:INPUT ACCEPT [10886:760348]<BR>:FORWARD ACCEPT=20
[7269:2438049]<BR>:OUTPUT ACCEPT [8009:752540]<BR>:POSTROUTING ACCEPT=20
[15177:3182145]<BR>COMMIT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
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
ACCEPT<BR>COMMIT<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Michael Hudin<BR>Sentinel Systems =
Support<BR><A=20
href=3D"http://www.zoetrope.com">www.zoetrope.com</A></FONT></DIV></BODY>=
</HTML>

------=_NextPart_000_0133_01C20BDB.1F141B70--


