From: "Tim" <twr@bellsouth.net>
Subject: Syntax/NAT OUTPUT
Date: Tue, 9 Jul 2002 15:59:44 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <000801c2279c$6e2364f0$4fcf3cd0@nebuchadnezza>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C22761.A467EB20"
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
To: iptables-list <netfilter@lists.samba.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0005_01C22761.A467EB20
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Scenario: router eth0 to Fwall 192.168.2.2
               Fwall eth0 from router 192.168.2.1
               Fwall eth1 from DMZ 172.16.1.1 =20
               Fwall eth2 from LAN 192.168.1.1

My understanding of concepts of filtering and nat

Pinging from the router eth0 thu Fwall eth2 to LAN, it first goes =
through PREROUTING nat table then the filter INPUT----this the path it =
takes to get to any box in the LAN .....yes ?

To get a reply from this ping it must go thru the NAT OUTPUT then filter =
OUTPUT.....this is my understanding of the return path for this ping =
from the router eth0.....is this correct so far ? If so what would be =
the syntax for the NAT OUTPUT in order to get and echo-reply. This is =
the portion of the script for my NAT configuration.

Mind, ppl, I just started leaning this........any suggestion will most =
certainly be welcomed and appreciated...TIA...
=20
--snip--

## PREROUTING ##
iptables -A PREROUTING -t nat -s 192.168.2.0/24 -d 192.168.1.0/24 -j =
DNAT --to 192.168.1.0
## POSTROUTING ##
iptables -A POSTROUTING -t nat -s 192.168.1.0/24 -d 192.168.2.0/24 -j =
SNAT --to 192.168.2.0
#
## NAT OUTPUT ##
iptables -A OUTPUT -t nat -s 192.168.1.0/24 -d 192.168.2.0/24 -j ACCEPT  =
           ## It looks like this is where the problems is at, syntax ?? =
##
#
#
## FORWARD traffic between INTERNAL and DMZ
iptables -A FORWARD -p icmp --icmp-type echo-request -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type echo-reply -j ACCEPT             =
               ## This should enable me to forward ping request and =
replies=20
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT       =
 ## universally.....yes...??##
#
## INPUT manage traffic coming into this box ##
#iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i eth2 -p icmp -j ACCEPT
iptables -A INPUT -i eth0 -p icmp -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i eth0 -s 192.168.2.2 -d 192.168.1.0/24 -p icmp -j =
ACCEPT     ## I configured this in order to ping the eth0 on the router =
##
#                                                                        =
                                                                       =
## and it works fine.....this is where it stops, it has no way ##=20
## OUTPUT manage traffic going out of this box ##                        =
                              ## to reply to this packet hence forth my =
dilemma ## =20
#iptables -A OUTPUT -o eth2 -s 192.168.1.0/24 -p icmp --icmp-type =
echo-request -j ACCEPT
#iptables -A OUTPUT -o eth2 -s 192.168.1.0/24 -p icmp --icmp-type =
echo-reply -j ACCEPT
#iptables -A OUTPUT -o eth1 -s 172.16.1.0/24 -p icmp --icmp-type =
echo-request -j ACCEPT
#iptables -A OUTPUT -o eth1 -s 172.16.1.0/24 -p icmp --icmp-type =
echo-reply -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o eth0 -s 192.168.1.0/24 -j ACCEPT

--snip--

---
Tim Rodriguez -- Mia/Fla.
Network Security Student
---
I prefer to be a dreamer=20
  among the humblest,
with visions to be realized,
than a lord among those without
  dreams and desires.










=20

------=_NextPart_000_0005_01C22761.A467EB20
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3315.2870" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Scenario: router&nbsp;eth0 to Fwall=20
192.168.2.2</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Fwall eth0 from router=20
192.168.2.1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Fwall eth1 from DMZ 172.16.1.1=20
&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;Fwall=20
eth2 from LAN 192.168.1.1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>My understanding of concepts of =
filtering and=20
nat</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Pinging from the router eth0 thu Fwall =
eth2 to=20
LAN,&nbsp;it&nbsp;first goes through PREROUTING&nbsp;nat table then the =
filter=20
INPUT----this the path it takes to get to any box in the LAN .....yes=20
?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>To get a reply from this ping it must =
go thru the=20
NAT OUTPUT then filter OUTPUT.....this is my understanding of the return =
path=20
for this ping from the router eth0.....is this correct so far ? If so =
what would=20
be the syntax for the NAT OUTPUT in order to get and echo-reply. This is =
the=20
portion of the script for my NAT configuration.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Mind, ppl, I just started leaning =
this........any=20
suggestion will most certainly be welcomed and =
appreciated...TIA...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;
<P class=3DMsoPlainText><FONT size=3D2><SPAN=20
style=3D"FONT-SIZE: 9pt; mso-bidi-font-size: 10.0pt; =
mso-fareast-font-family: 'MS Mincho'">--snip--</SPAN></FONT></P>
<P class=3DMsoPlainText><SPAN=20
style=3D"FONT-SIZE: 9pt; mso-bidi-font-size: 10.0pt; =
mso-fareast-font-family: 'MS Mincho'">##=20
PREROUTING ##<BR>iptables -A PREROUTING -t nat -s 192.168.2.0/24 -d=20
192.168.1.0/24 -j DNAT --to 192.168.1.0<BR>## POSTROUTING ##<BR>iptables =
-A=20
POSTROUTING -t nat -s 192.168.1.0/24 -d 192.168.2.0/24 -j SNAT --to=20
192.168.2.0<BR>#<BR>## NAT OUTPUT ##<BR>iptables -A OUTPUT -t nat -s=20
192.168.1.0/24 -d 192.168.2.0/24 -j ACCEPT &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; ## It looks like this is where the problems is at, =
syntax ??=20
##<BR>#<BR>#<BR>## FORWARD traffic between INTERNAL and DMZ<BR>iptables =
-A=20
FORWARD -p icmp --icmp-type echo-request -j ACCEPT<BR>iptables -A =
FORWARD -p=20
icmp --icmp-type echo-reply -j ACCEPT&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; ## This should enable me to forward ping request and =
replies=20
<BR>iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j=20
ACCEPT&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ##=20
universally.....yes...??##<BR>#<BR>## INPUT manage traffic coming into =
this box=20
##<BR>#iptables -A INPUT -m state --state ESTABLISHED,RELATED -j=20
ACCEPT<BR>iptables -A INPUT -i eth2 -p icmp -j ACCEPT<BR>iptables -A =
INPUT -i=20
eth0 -p icmp -j ACCEPT<BR>iptables -A INPUT -i lo -j ACCEPT<BR>iptables =
-A INPUT=20
-i eth0 -s 192.168.2.2 -d 192.168.1.0/24 -p icmp -j=20
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; ## I configured this in order to ping the =
eth0 on=20
the router ##</SPAN><SPAN=20
style=3D"FONT-SIZE: 9pt; mso-bidi-font-size: 10.0pt; =
mso-fareast-font-family: 'MS =
Mincho'"><BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;##=20
and it works fine.....this is where it stops, it has no way ## <BR>## =
OUTPUT=20
manage traffic going out of this box ##&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;## =
to reply=20
to this packet hence forth my dilemma ##&nbsp; <BR>#iptables -A OUTPUT =
-o eth2=20
-s 192.168.1.0/24 -p icmp --icmp-type echo-request -j =
ACCEPT<BR>#iptables -A=20
OUTPUT -o eth2 -s 192.168.1.0/24 -p icmp --icmp-type echo-reply -j=20
ACCEPT<BR>#iptables -A OUTPUT -o eth1 -s 172.16.1.0/24 -p icmp =
--icmp-type=20
echo-request -j ACCEPT<BR>#iptables -A OUTPUT -o eth1 -s 172.16.1.0/24 =
-p icmp=20
--icmp-type echo-reply -j ACCEPT<BR>iptables -A OUTPUT -o lo -j=20
ACCEPT<BR>iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j=20
ACCEPT<BR>iptables -A OUTPUT -o eth0 -s 192.168.1.0/24 -j =
ACCEPT</SPAN></P>
<P class=3DMsoPlainText><SPAN=20
style=3D"FONT-SIZE: 9pt; mso-bidi-font-size: 10.0pt; =
mso-fareast-font-family: 'MS Mincho'">--snip--</SPAN></P>
<P class=3DMsoPlainText><SPAN=20
style=3D"FONT-SIZE: 9pt; mso-bidi-font-size: 10.0pt; =
mso-fareast-font-family: 'MS Mincho'">---<BR>Tim=20
Rodriguez -- Mia/Fla.<BR>Network Security Student<BR>---<BR>I prefer to =
be a=20
dreamer <BR>&nbsp; among the humblest,<BR>with visions to be =
realized,<BR>than a=20
lord among those without<BR>&nbsp; dreams and desires.</SPAN></P>
<P class=3DMsoPlainText><SPAN=20
style=3D"FONT-SIZE: 9pt; mso-bidi-font-size: 10.0pt; =
mso-fareast-font-family: 'MS Mincho'"><BR></SPAN>&nbsp;</P>
<P class=3DMsoPlainText>&nbsp;</P>
<P class=3DMsoPlainText><SPAN=20
style=3D"FONT-SIZE: 9pt; mso-bidi-font-size: 10.0pt; =
mso-fareast-font-family: 'MS Mincho'"><BR>&nbsp;</P></SPAN></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0005_01C22761.A467EB20--


