From: "Aziz Sasmaz" <aziz@teknolist.com>
Subject: adsl modem and LAN
Date: Fri, 7 Nov 2003 14:20:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004e01c3a529$989d8c90$47741769@jazzy>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_004B_01C3A53A.4EE347F0"
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

------=_NextPart_000_004B_01C3A53A.4EE347F0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



Hi,

I have changed my firewall checkpoint to IPTABLES but i have some sort =
of problems..

I have an ADSL router.. My network is like below


TELECOM --  ( 212.174.55.172 ) ADSL_ROUTER ( 10.0.0.2 ) -- (10.0.0.15 ) =
GATEWAY ( 192.168.0.6 ) -- SWITCH - (192.168.0.0/24) LAN


I have a =20
                cvs server at 192.168.0.222 =20
                https server at 192.168.0.111

I can succesfully connect to my LAN from outside for instance at home =
when i type https://212.174.55.172  it  works... and i can also use cvs =
from home.. The line for this in my script is;
iptables -A PREROUTING -t nat -p tcp -d 10.0.0.15 --dport 443 -j DNAT =
--to 192.168.0.222:443
iptables -A PREROUTING -t nat -p tcp -d 10.0.0.15 --dport 2401 -j DNAT =
--to 192.168.0.222:2401

I can not connect to my LAN using my real ip ( 212.174.55.172 ) when i =
am in my LAN.
I want when i type in my explorer https://212.174.55.172  i can see the =
site.. I dont want to type the https servers LAN IP
when i am in MY LAN..

what should i do to see the https site when I use my real ip ( =
212.174.55.172  )  in my LAN...


Thank you all for any help...


------=_NextPart_000_004B_01C3A53A.4EE347F0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have changed my firewall checkpoint =
to IPTABLES=20
but i have some sort of problems..</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have an ADSL router.. My network is =
like=20
below</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>TELECOM --&nbsp; (&nbsp;212.174.55.172 =
)=20
ADSL_ROUTER (&nbsp;10.0.0.2 ) -- (10.0.0.15 ) GATEWAY ( 192.168.0.6 ) -- =
SWITCH=20
- (192.168.0.0/24) LAN</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I&nbsp;have a&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; cvs server at 192.168.0.222=20
&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;=20
https server at 192.168.0.111</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I can succesfully connect to my LAN =
from outside=20
for instance at home when i type <A=20
href=3D"https://212.174.55.172">https://212.174.55.172</A>&nbsp; =
it&nbsp;=20
works...&nbsp;and i can also use cvs from home..&nbsp;The line for =
this&nbsp;in=20
my script is;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A PREROUTING -t nat -p tcp=20
-d&nbsp;10.0.0.15 --dport&nbsp;443 -j DNAT --to =
192.168.0.222:443</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>iptables -A PREROUTING -t nat -p tcp=20
-d&nbsp;10.0.0.15 --dport 2401 -j DNAT --to=20
192.168.0.222:2401</FONT></DIV></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I can not connect to my LAN using my =
real ip (=20
212.174.55.172&nbsp;) when i am in my LAN.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I want when i type&nbsp;in my explorer =
<A=20
href=3D"https://212.174.55.172">https://212.174.55.172</A>&nbsp; i can =
see the=20
site.. I dont want to type the https servers LAN IP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>when i am in MY LAN..</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>what should i do&nbsp;to see the https =
site when I=20
use my real ip (&nbsp;212.174.55.172&nbsp; )&nbsp; in my =
LAN...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thank you all for any =
help...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_004B_01C3A53A.4EE347F0--


