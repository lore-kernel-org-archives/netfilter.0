From: "caricand.jean-michel" <caricand.jean-michel@wanadoo.fr>
Subject: Iptables seens doesn't understand network address not in class A, B or C
Date: Tue, 9 Jul 2002 07:03:57 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <001e01c22706$08aae620$0103a8c0@pc21>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001B_01C22716.CBAD6F20"
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

C'est un message de format MIME en plusieurs parties.

------=_NextPart_000_001B_01C22716.CBAD6F20
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have a local network with 10.0.2.0 address and 255.255.254.0 netmask.=20

My firewall have IP 10.0.2.130 on eth0.=20
My station have IP 10.0.2.2.

I configure my firewall for drop the ping from the station with 1 rules =
:

# iptables -A INPUT -i eth0 -s 10.0.2.2 -p icmp -j DROP=20

When I ping the firewall from my station (ping 10.0.2.130) , I receive =
an response from the serveur=20

Why ?

What is the problem ? My netmask ?

If i modify my netmask to 255.0.0.0 on firewall and my station, the ping =
doesn't work. Normal !

Iptables don't understand network address not in class A, B or C=20

HELP ME !!!



------=_NextPart_000_001B_01C22716.CBAD6F20
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4807.2300" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial>I have a local network with 10.0.2.0 address and =

255.255.254.0 netmask. </FONT></DIV>
<DIV><FONT face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial>My firewall have IP 10.0.2.130 on eth0. =
<BR></FONT><FONT=20
face=3DArial><FONT size=3D2>My station have IP =
10.0.2.2.</FONT></FONT></DIV><FONT=20
face=3DArial><FONT size=3D2></FONT>
<DIV><BR>I configure my firewall for drop the ping from the station with =
1 rules=20
:<BR><BR># iptables -A INPUT -i eth0 -s 10.0.2.2 -p icmp -j DROP =
<BR><BR>When I=20
ping the firewall from my station (ping 10.0.2.130) , I&nbsp;receive an =
response=20
from the serveur <BR></DIV>
<DIV>Why ?</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>What is the problem ? My netmask ?</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>If i modify my netmask to 255.0.0.0 on firewall and =
my=20
station, the ping doesn't work. Normal !</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Iptables don't understand network address not in =
class A, B or=20
C</FONT>&nbsp;</DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>HELP ME !!!</FONT></DIV>
<DIV><BR></DIV></FONT></BODY></HTML>

------=_NextPart_000_001B_01C22716.CBAD6F20--


