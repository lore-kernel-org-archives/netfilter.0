From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: Syntax/NAT OUTPUT
Date: Wed, 10 Jul 2002 07:58:57 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA289@JUPITER>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C22793.D3065AC0"
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
To: 'Tim' <twr@bellsouth.net>, iptables-list <netfilter@lists.samba.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C22793.D3065AC0
Content-Type: text/plain;
	charset="iso-8859-1"

As Anthony says it passed straight through via FOWARD chain..
 
Refer to this page for the diagram.. this helped me understand the way the
packet traverse the rules immensely..
 
http://iptables-tutorial.haringstad.com/iptables-tutorial.html#TRAVERSINGOFT
ABLES
<http://iptables-tutorial.haringstad.com/iptables-tutorial.html#TRAVERSINGOF
TABLES> 
 

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au <http://www.citadelcomputer.com.au/> 

-----Original Message-----
From: Tim [mailto:twr@bellsouth.net]
Sent: Wednesday, 10 July 2002 9:00 AM
To: iptables-list
Subject: Syntax/NAT OUTPUT


Scenario: router eth0 to Fwall 192.168.2.2
               Fwall eth0 from router 192.168.2.1
               Fwall eth1 from DMZ 172.16.1.1  
               Fwall eth2 from LAN 192.168.1.1
 
My understanding of concepts of filtering and nat
 
Pinging from the router eth0 thu Fwall eth2 to LAN, it first goes through
PREROUTING nat table then the filter INPUT----this the path it takes to get
to any box in the LAN .....yes ?
 
To get a reply from this ping it must go thru the NAT OUTPUT then filter
OUTPUT.....this is my understanding of the return path for this ping from
the router eth0.....is this correct so far ? If so what would be the syntax
for the NAT OUTPUT in order to get and echo-reply. This is the portion of
the script for my NAT configuration.
 
Mind, ppl, I just started leaning this........any suggestion will most
certainly be welcomed and appreciated...TIA...
  

--snip--

## PREROUTING ##
iptables -A PREROUTING -t nat -s 192.168.2.0/24 -d 192.168.1.0/24 -j DNAT
--to 192.168.1.0
## POSTROUTING ##
iptables -A POSTROUTING -t nat -s 192.168.1.0/24 -d 192.168.2.0/24 -j SNAT
--to 192.168.2.0
#
## NAT OUTPUT ##
iptables -A OUTPUT -t nat -s 192.168.1.0/24 -d 192.168.2.0/24 -j ACCEPT
## It looks like this is where the problems is at, syntax ?? ##
#
#
## FORWARD traffic between INTERNAL and DMZ
iptables -A FORWARD -p icmp --icmp-type echo-request -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type echo-reply -j ACCEPT
## This should enable me to forward ping request and replies 
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT        ##
universally.....yes...??##
#
## INPUT manage traffic coming into this box ##
#iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i eth2 -p icmp -j ACCEPT
iptables -A INPUT -i eth0 -p icmp -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i eth0 -s 192.168.2.2 -d 192.168.1.0/24 -p icmp -j ACCEPT
## I configured this in order to ping the eth0 on the router ##
#
## and it works fine.....this is where it stops, it has no way ## 
## OUTPUT manage traffic going out of this box ##
## to reply to this packet hence forth my dilemma ##  
#iptables -A OUTPUT -o eth2 -s 192.168.1.0/24 -p icmp --icmp-type
echo-request -j ACCEPT
#iptables -A OUTPUT -o eth2 -s 192.168.1.0/24 -p icmp --icmp-type echo-reply
-j ACCEPT
#iptables -A OUTPUT -o eth1 -s 172.16.1.0/24 -p icmp --icmp-type
echo-request -j ACCEPT
#iptables -A OUTPUT -o eth1 -s 172.16.1.0/24 -p icmp --icmp-type echo-reply
-j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o eth0 -s 192.168.1.0/24 -j ACCEPT

--snip--

---
Tim Rodriguez -- Mia/Fla.
Network Security Student
---
I prefer to be a dreamer 
  among the humblest,
with visions to be realized,
than a lord among those without
  dreams and desires.


 

 


 

 
 

------_=_NextPart_001_01C22793.D3065AC0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><SPAN class=3D788555721-09072002><FONT face=3DArial =
color=3D#0000ff size=3D2>As=20
Anthony says it passed straight through via FOWARD =
chain..</FONT></SPAN></DIV>
<DIV><SPAN class=3D788555721-09072002><FONT face=3DArial =
color=3D#0000ff=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D788555721-09072002><FONT face=3DArial =
color=3D#0000ff size=3D2>Refer=20
to this page for the diagram.. this helped me understand the way the =
packet=20
traverse the rules immensely..</FONT></SPAN></DIV>
<DIV><SPAN class=3D788555721-09072002><FONT face=3DArial =
color=3D#0000ff=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D788555721-09072002><FONT face=3DArial =
color=3D#0000ff size=3D2><A=20
href=3D"http://iptables-tutorial.haringstad.com/iptables-tutorial.html#T=
RAVERSINGOFTABLES">http://iptables-tutorial.haringstad.com/iptables-tuto=
rial.html#TRAVERSINGOFTABLES</A></FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<P><FONT size=3D2>thanks,<BR>George Vieira<BR>Systems =
Manager<BR>Citadel Computer=20
Systems P/L<BR><A href=3D"http://www.citadelcomputer.com.au/"=20
target=3D_blank>http://www.citadelcomputer.com.au</A></FONT></P>
<DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
size=3D2>-----Original Message-----<BR><B>From:</B> Tim=20
[mailto:twr@bellsouth.net]<BR><B>Sent:</B> Wednesday, 10 July 2002 9:00 =

AM<BR><B>To:</B> iptables-list<BR><B>Subject:</B> Syntax/NAT=20
OUTPUT<BR><BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Scenario: router&nbsp;eth0 to Fwall=20
192.168.2.2</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Fwall eth0 from router=20
192.168.2.1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Fwall eth1 from DMZ 172.16.1.1=20
&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;Fwall=20
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
NAT OUTPUT then filter OUTPUT.....this is my understanding of the =
return path=20
for this ping from the router eth0.....is this correct so far ? If so =
what would=20
be the syntax for the NAT OUTPUT in order to get and echo-reply. This =
is the=20
portion of the script for my NAT configuration.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Mind, ppl, I just started leaning =
this........any=20
suggestion will most certainly be welcomed and =
appreciated...TIA...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;=20
<P class=3DMsoPlainText><FONT size=3D2><SPAN=20
style=3D"FONT-SIZE: 9pt; mso-bidi-font-size: 10.0pt; =
mso-fareast-font-family: 'MS Mincho'">--snip--</SPAN></FONT></P>
<P class=3DMsoPlainText><SPAN=20
style=3D"FONT-SIZE: 9pt; mso-bidi-font-size: 10.0pt; =
mso-fareast-font-family: 'MS Mincho'">##=20
PREROUTING ##<BR>iptables -A PREROUTING -t nat -s 192.168.2.0/24 -d=20
192.168.1.0/24 -j DNAT --to 192.168.1.0<BR>## POSTROUTING =
##<BR>iptables -A=20
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
ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; ## I configured this in order to ping =
the eth0 on=20
the router ##</SPAN><SPAN=20
style=3D"FONT-SIZE: 9pt; mso-bidi-font-size: 10.0pt; =
mso-fareast-font-family: 'MS =
Mincho'"><BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;##=20
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
mso-fareast-font-family: 'MS =
Mincho'"><BR>&nbsp;</P></SPAN></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C22793.D3065AC0--

