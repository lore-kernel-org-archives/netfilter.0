From: "pepillo" <pepillo4@terra.es>
Subject: Fw: Problem with iptables -A FORWARD -j DROP
Date: Wed, 19 Feb 2003 14:18:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003901c2d819$6f33e850$04000059@INFORMATICA>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0036_01C2D821.CE8C5960"
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

------=_NextPart_000_0036_01C2D821.CE8C5960
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello, I'm installing a bridge-firewall an all is OK, but whe I deny all =
the 'FORWARD' traffic this rule deny all the traffic included the =
'ACCEPT' rules. Mi Kernel is 2.4.18
and i installed itables 1.2.5-3. My script is:

iptables -F FORWARD
iptables -F INPUT
iptables -F OUTPUT

iptables -A FORWARD -p icmp -s 89.0.0.0/24 -d 89.0.0.55/32 -j ACCEPT

iptables -A FORWARD -j DROP



If I quit the las line it's all OK, if I deny 'ping' it's OK, but if I =
put the last line all ping are deny.

Can somebody help me. I'm sorry for mu poor English.

Gabriel.
------=_NextPart_000_0036_01C2D821.CE8C5960
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV style=3D"FONT: 10pt arial">
<DIV><FONT face=3DArial size=3D2>Hello, I'm installing a bridge-firewall =
an all is=20
OK, but whe I deny all the 'FORWARD' traffic this rule deny all the =
traffic=20
included the 'ACCEPT' rules. Mi Kernel is 2.4.18</FONT></DIV></DIV>
<DIV><FONT face=3DArial size=3D2>and i installed itables&nbsp;1.2.5-3. =
My script=20
is:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -F FORWARD</FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>iptables -F INPUT</FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>iptables -F OUTPUT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A FORWARD -p icmp -s =
89.0.0.0/24 -d=20
89.0.0.55/32 -j ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A FORWARD -j =
DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>If I quit the las line it's all OK, if =
I deny=20
'ping' it's OK, but if I put the last line all ping are =
deny.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Can somebody help me. I'm sorry for mu =
poor=20
English.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial =
size=3D2>Gabriel.</FONT></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_0036_01C2D821.CE8C5960--


