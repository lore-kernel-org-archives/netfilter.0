From: MOUDARIR Mohamed <moudarir@Richbond.ma>
Subject: RE: mail server problem
Date: Mon, 10 Nov 2003 14:43:47 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <14C5057BC852D611BAC400E0299AA10F2045D0@MAILSERV>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3A799.0C26A540"
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
To: Roberto Rossi <roberto.rossi@smc.it>, netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C3A799.0C26A540
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

May be you should also add this rule :
iptables -A FORWARD -p TCP -i eth0 -o eth1 -d 10.1.1.2 --dport 25 -j =
allowed
eth1 is your NIC connected to your private LAN network is 10.1.0.0/16.

-----Message d'origine-----
De : Roberto Rossi [mailto:roberto.rossi@smc.it]
Envoy=E9 : vendredi 7 novembre 2003 15:10
=C0 : netfilter@lists.netfilter.org
Objet : mail server problem



Hello all,
=20
I've a range of 30 public internet addresses to manage starting, say, =
from
213.25.24.0 to 213.25.24.31 netmask of course 255.255.255.224.
=20
My firewall (Red Hat 9.0, latest kernel) public IP is 213.25.24.30 the
router address is 213.25.24.1 and the LAN network is 10.1.0.0/16.
=20
I've an internal mail server, say, 10.1.1.2 which I would like to see =
from
the outside as 213.25.24.3, one IP of my range.
=20
Except DNS registration, what are the correct steps to make this =
possible?
=20
I just set this rule on my firewall:
iptables -t nat -A PREROUTING -p tcp -i eth0 -d 213.25.24.3 --dport 25 =
-j
DNAT --to 10.1.1.2:25

but I guess it's not enough because it's not working.
=20
A help is really appreciated, thanks in advance.
=20
Roberto - Italy   =20


------_=_NextPart_001_01C3A799.0C26A540
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 5.00.3809.1800" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2><FONT color=3D#0000ff><FONT face=3DArial><SPAN=20
class=3D687272614-10112003>May be you should also add this rule=20
:</SPAN></FONT></FONT></FONT></DIV>
<DIV><FONT color=3D#0000ff face=3DArial size=3D2><SPAN=20
class=3D687272614-10112003>iptables -A FORWARD -p TCP -i eth0 -o eth1 =
-d 10.1.1.2=20
--dport 25 -j allowed<BR></SPAN></FONT><FONT face=3DTahoma><FONT =
size=3D2><SPAN=20
class=3D687272614-10112003><FONT color=3D#0000ff face=3DArial>eth1 is =
your NIC=20
connected to your private LAN network is=20
10.1.0.0/16.</FONT></SPAN></FONT></FONT></DIV>
<DIV><FONT face=3DTahoma><FONT size=3D2><BR>-----Message=20
d'origine-----<BR><B>De&nbsp;:</B> Roberto Rossi=20
[mailto:roberto.rossi@smc.it]<BR><B>Envoy=E9&nbsp;:</B> vendredi 7 =
novembre 2003=20
15:10<BR><B>=C0&nbsp;:</B> =
netfilter@lists.netfilter.org<BR><B>Objet&nbsp;:</B>=20
mail server problem<BR><BR></DIV></FONT>
<BLOCKQUOTE style=3D"MARGIN-RIGHT: 0px"></FONT>
  <DIV><FONT face=3DVerdana size=3D2>Hello all,</FONT></DIV>
  <DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DVerdana size=3D2>I've a range of 30 public internet =
addresses to=20
  manage starting, say, from 213.25.24.0 to 213.25.24.31 netmask of =
course=20
  255.255.255.224.</FONT></DIV>
  <DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DVerdana size=3D2>My firewall (Red Hat 9.0, latest=20
  kernel)&nbsp;public IP is 213.25.24.30 the router address=20
  is&nbsp;213.25.24.1&nbsp;and the LAN network is =
10.1.0.0/16.</FONT></DIV>
  <DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DVerdana size=3D2>I've an internal mail server, say, =
10.1.1.2=20
  which I would like to see from the outside&nbsp;as 213.25.24.3, one =
IP of my=20
  range.</FONT></DIV>
  <DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DVerdana size=3D2>Except DNS registration, what are =
the correct=20
  steps to make this possible?</FONT></DIV>
  <DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DVerdana size=3D2>I just set this rule on my=20
  firewall:</FONT></DIV>
  <DIV><FONT face=3DVerdana size=3D2>iptables -t nat -A PREROUTING -p =
tcp -i eth0 -d=20
  213.25.24.3 --dport 25 -j DNAT --to 10.1.1.2:25<BR></FONT></DIV>
  <DIV><FONT face=3DVerdana size=3D2>but I guess it's not enough =
because it's not=20
  working.</DIV></FONT>
  <DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DVerdana size=3D2>A help is really appreciated, =
thanks in=20
  advance.</FONT></DIV>
  <DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DVerdana size=3D2>Roberto - Italy&nbsp;&nbsp;&nbsp;=20
</FONT></DIV></BLOCKQUOTE></BODY></HTML>

------_=_NextPart_001_01C3A799.0C26A540--

